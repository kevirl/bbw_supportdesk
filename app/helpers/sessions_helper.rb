module SessionsHelper
  
  # Logs in a user
  def log_in(user)
    session[:account_id] = user.id
  end
  
  # Returns current user
  def current_user
    @current_user ||= Account.find_by(id: session[:account_id])
  end
  
  # Check if user logged in
  def logged_in?
    !current_user.nil?
  end
  
  # Log user out
  def log_out
    session.delete(:account_id)
    @current_user = nil
  end

end