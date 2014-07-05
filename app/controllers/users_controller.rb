class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @abilities = @user.abilities
    @reviews = @user.reviews
    @checkins = @user.checkins
    @followed_projects = @user.followed_projects
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "You have successfully sign up!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Account successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, alert: "Account successfully deleted!"
  end

  private

  def user_params
    params.require(:user).
      permit(:name, :email, :username, :password, :password_confirmation, :about, :achievements, :powerpoint, :specialization, :location, :sex, :birthdate, :phone, :school, :work, :marital, :video, :github, :twitter, :linkedin, :dribbble, :codeeval, :degree, :start_year, :grad_year, :ability_ids => [])
  end

  def require_correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        redirect_to root_url
      end
    end
end
