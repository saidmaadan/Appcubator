class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      redirect_to @idea, notice: "Post successfully updated!"
    else
      render :edit
    end
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to @idea, notice: "Idea post successfully created!"
    else
      render :new
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to ideas_url, alert: "Idea post successfully deleted!"
  end

private

  def idea_params
    params.require(:idea).permit(:title, :description, :goal, :category, :market)
  end
end
