class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :correct_user, only: [:edit, :update]
  before_action :require_admin, only: [:delete]

  def index
    @users = User.search(params[:search]).page params[:page]
  end

  def show
    @user = User.friendly.find(params[:id])
    @abilities = @user.abilities
    @reviews = @user.reviews
    @checkins = @user.checkins
    @followed_projects = @user.followed_projects
    @voted_ideas = @user.voted_ideas
    @project =Project.new
    @projects = Project.all.order('created_at DESC').limit(1)
    @idea =Idea.new
    @ideas = Idea.all.order('created_at DESC').limit(2)
    @jobs = Job.all.order('created_at DESC').limit(2)
    @trends = Trend.all.order('created_at DESC').limit(1)
    @projects = @user.projects.order("created_at DESC").limit(4)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "You have successfully sign up!"
    else
      render :new
    end
  end

  def edit
    @user = User.friendly.find(params[:id])
  end

  def update
    @user = User.friendly.find(params[:id])
    if @user.update(user_params)
      redirect_to @user#, notice: "Account successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @user = User.friendly.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, alert: "Account successfully deleted!"
  end

  private

  def user_params
    params.require(:user).
      permit(:name, :email, :username, :password, :password_confirmation, :about, :achievements, :powerpoint, :specialization, :location, :sex, :birthdate, :phone, :school, :work, :marital, :video, :github, :twitter, :linkedin, :dribbble, :codeeval, :degree, :start_year, :grad_year, :provider, :uid, :oauth_token, :ability_ids => [])
  end

  # def require_correct_user
  #   @user = User.find(params[:id])
  #   unless current_user?(@user)
  #     redirect_to root_url
  #   end
  # end
end
