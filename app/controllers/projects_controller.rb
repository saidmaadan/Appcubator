class ProjectsController < ApplicationController

  def index
    @projects = Project.recent
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
  @project = Project.find(params[:id])
  @project.update(project_params)
  redirect_to @project
end

def new
  @project =Project.new
end

def create
  @project = Project.new(project_params)
  @project.save
  redirect_to @project
end

def destroy
  @project = Project.find(params[:id])
  @project.destroy
  redirect_to projects_url
end

private

def project_params
  project_params = params.require(:project).permit(:name, :description, :looking_for, :teams, :target_amount, :github_link, :web_url, :image_file)
end

end
