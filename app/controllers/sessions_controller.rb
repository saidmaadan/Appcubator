class SessionsController < ApplicationController

  def new
  end

  def create
     if user = User.authenticate(params[:email], params[:password])
      #session[:user_id] = user.id
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      flash[:notice] = "Welcome back, #{user.name}!"
      redirect_to (session[:intended_url] || user)
      session[:intended_url] = nil
    else
      flash.now[:alert] = "Invalid email/password combination!"
      render :new
    end
  end

  def destroy
    cookies.delete(:auth_token)
    # session[:user_id] = nil
    redirect_to root_url, notice: "You're now signed out!"
  end
end
