class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  private

  def confirm_logged_in!
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(new_session_path)
    end
  end
end
