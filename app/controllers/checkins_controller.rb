class CheckinsController < ApplicationController
  before_action :set_idea

  def index
    @checkins = @idea.checkins
  end

  def new
    @checkin = @idea.checkins.new
  end

  def create
    @checkin = @idea.checkins.new(checkin_params)
    if @checkin.save
      redirect_to idea_checkins_path(@idea),
                    notice: "You are successfull check-in for this project!"
    else
      render :new
    end
  end

  private

  def checkin_params
    params.require(:checkin).permit(:name, :email, :skills, :experience, :position, :comment)
  end

  def set_idea
    @idea = Idea.find(params[:idea_id])
  end
end
