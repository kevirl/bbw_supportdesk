class AccountsController < ApplicationController
 # before_action :logged_in_account
  
  def show
    @user = Account.find(params[:id])
  end
  
  def new
    @user = Account.new
  end
  
  
  def index
    @user = Account.all
  end

  def create
    @user = Account.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to SupportDesk"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = Account.find(params[:id])
  end
  
  def update
    @user = Account.find(params[:id])
      if @user.update_attributes(user_params)
        #Successful Update
        redirect_to @user
      else
        render 'edit'
      end
  end
  
      
  def destroy
    Account.find(params[:id]).destroy
    flash[:success] = "Account Deleted"
    redirect_to home_path
  end
    
  
  private
  
    def user_params
      params.require(:account).permit(:fname, :lname, :email, :password, :password_confirmation, :phone)
    end
    
    # Before filters
    
    # Checks for logged in account
    def logged_in_account
      unless logged_in?
      flash[:danger] = "Please log in"
      redirect_to login_path
      end
    end
  
end

