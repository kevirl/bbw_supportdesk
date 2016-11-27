class AccountsController < ApplicationController
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
      redirect_to contact_path
    else
      render 'new'
    end
  end
  
  private
  
    def user_params
      params.require(:account).permit(:fname, :lname, :email, :password, :password_confirmation, :phone)
    end
end

