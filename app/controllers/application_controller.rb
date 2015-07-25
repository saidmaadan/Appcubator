class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :expire_hsts
  
  private

  def require_signin
    unless current_user
      session[:intended_url] = request.url
      redirect_to new_session_url, alert: "Please sign in first!"
    end
  end

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def current_user?(user)
    current_user == user
  end
  helper_method :current_user?



  def correct_user
    @user = User.friendly.find(params[:id])
    unless current_user?(@user)
      redirect_to root_url
    end
  end

  def correct_user?
     #current_user == correct_user
     @correct_user == @user
  end
  helper_method :correct_user?


  def require_admin
    unless current_user_admin?
      redirect_to root_url, alert: "Unauthorized access!!"
    end
  end

  def current_user_admin?
   current_user && current_user.admin?
  end
  helper_method :current_user_admin?

  def expire_hsts
    response.headers["Strict-Transport-Security"] = 'max-age=0'
  end
end
