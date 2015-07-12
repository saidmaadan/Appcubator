class IdeasController < ApplicationController
  before_action :require_signin, except: [:index, :show]
   before_action :correct_user, only: [:edit, :update]
  #before_action :correct_user, except: [:index, :show]
  before_action :require_admin, only: [:delete]

  def index
    @ideas = Idea.recent.page params[:page]
  end

  def show
    @idea = Idea.find(params[:id])
    @voters = @idea.voters
    if current_user
      @current_vote = current_user.votes.find_by(idea_id: @idea.id)
    end
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
    @ideas = Idea.recent.limit(4)
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
