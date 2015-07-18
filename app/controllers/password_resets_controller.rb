class PasswordResetsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	user.send_password_reset if user
  	redirect_to new_session_path, :notice => "Email sent with password reset instructions."
  end

  def edit
  	@user = User.find_by_password_reset_token!(params[:id])
  end

  def update
	  @user = User.find_by_password_reset_token!(params[:id])
	  if @user.password_reset_sent_at < 2.hours.ago
	    redirect_to new_password_reset_path, :alert => "Password reset has expired."
	  elsif @user.update(user_params)
	    redirect_to new_session_path, :notice => "Password has been reset! You can log in with your new password."
	  else
	    render :edit
	  end
	end

	private

  def user_params
    params.require(:user).
      permit(:name, :email, :username, :password, :password_confirmation, :about, :achievements, :powerpoint, :specialization, :location, :sex, :birthdate, :phone, :school, :work, :marital, :video, :github, :twitter, :linkedin, :dribbble, :codeeval, :degree, :start_year, :grad_year, :provider, :uid, :oauth_token, :ability_ids => [])
  end
end
