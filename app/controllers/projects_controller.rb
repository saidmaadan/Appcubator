class ProjectsController < ApplicationController
  before_action :require_signin, except: [:index, :show]
  #before_action :correct_user, except: [:index, :show]
  #before_action :require_admin, only: [:delete]

  def index
    @projects = Project.recent
  end

  def show
    @project = Project.find(params[:id])
    @followers = @project.followers
    if current_user
      @current_follow = current_user.follows.find_by(project_id: @project.id)
    end
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
  @project =Project.new
end

def create
  @project = Project.new(project_params)
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
  project_params = params.require(:project).permit(:name, :description, :looking_for, :teams, :target_amount, :github_link, :web_url, :screenshot)
end

end
