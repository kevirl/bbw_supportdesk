class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = Account.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    log_in user
      redirect_to new_ticket_path
    else
      # Display error message
      flash.now[:danger] = 'Invalid email Id / Password'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
  
  def accInfo
    redirect_to current_user
  end
  
  
end