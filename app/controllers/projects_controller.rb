class ProjectsController < ApplicationController
  before_action :require_signin, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :delete]
  #before_action :correct_user, except: [:index, :show]
  before_action :require_admin, only: [:delete]

  def index
    @projects = Project.recent.page params[:page]
    # .paginate(page: params[:page], per_page: 4)
  end

  def show
    @review = Review.new
    @project = Project.find(params[:id])
    @followers = @project.followers
    if current_user
      @current_follow = current_user.follows.find_by(project_id: @project.id)
    end
    @review.project_id = @project_id
    @reviews = Review.where(project_id: @project.id).order("created_at DESC")

  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Project successfully updated!"
      redirect_to @project
    else
      render :edit
    end
  end

  def new
    @project = Project.new
    @projects = Project.recent.limit(3)
  end

  def create

    @project = current_user.projects.build(project_params)
    # @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: "Project successfully created!"
    else
      render :new
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url, alert: "Project successfully deleted!"
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :looking_for, :teams, :target_amount, :github_link, :web_url, :screenshot, :user_id)
  end

  def respond_with_project_or_redirect
    # If an old id or a numeric id was used to find the record, then
    # the request path will not match the post_path, and we should do
    # a 301 redirect that uses the current friendly id.
    if request.path != project_path(@project)
      return redirect_to @project, status: :moved_permanently
    else
      return respond_with @project
    end
  end

  def correct_user
    unless @project = current_user.projects.find_by(id: params[:id])
    redirect_to projects_url, alert: "Unauthorized access!!!!"
    end
  end

end
