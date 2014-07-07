class CheckinsController < ApplicationController
  before_action :require_signin
  before_action :set_idea

  def index
    @checkins = @idea.checkins
  end

  def new
    @checkin = @idea.checkins.new
  end

  def create
    @checkin = @idea.checkins.new(checkin_params)
    @checkin.user = current_user
    if @checkin.save
      redirect_to idea_path(@idea),
                    notice: "You are successfull check-in for this project!"
    else
      render :new
    end
  end

  def destroy
    @heckin = @idea.checkins.find(params[:id])
    @checkin.destroy
    redirect_to idea_path(@idea)#, notice: " You successfully check out of this project !"
  end

  private

  def checkin_params
    params.require(:checkin).permit(:skills, :experience, :position, :comment)
  end

  def set_idea
    @idea = Idea.find(params[:idea_id])
  end
end
