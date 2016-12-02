class AccountsController < ApplicationController
  before_action :logged_in_account, only: [:edit, :update]
  before_action :admin_account, only: [:index, :destroy]
  
  def show
    @user = Account.find(params[:id])
  end
  
  def new
    @user = Account.new
  end
  
  
  def index
    @user = Account.all
    
    #Search based on email
    if params[:search]
      # select the Account email which is a match for the search
      @user = Account.search(params[:search])
      @user = @user.order("created_at ASC")
    else
      @user = @user.order("created_at DESC")
    end
    
    #Search based on Account ID
    if params[:idsearch]
      # select the Account number which is a match for the search
      @user = Account.idsearch(params[:idsearch])
      @user = @user.order("created_at ASC")
    else
      @user = @user.order("created_at DESC")
    end
    
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
        flash[:success] = "Profile Updated"
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
      params.require(:account).permit(:fname, :lname, :email, :password, :password_confirmation, :phone, :admin)
    end
    
    def account_params
      params.require(:account).permit(:fname, :lname, :email, :phone)
    end
    
    # Before filters
    
    # Checks for logged in account
    def logged_in_account
      unless logged_in?
      store_location
      flash[:danger] = "Please log in"
      redirect_to login_path
      end
    end
    
    # Checks for admin user
    def admin_account
      redirect_to home_path unless current_user.admin?
    end
  
end

