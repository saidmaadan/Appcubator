class PagesController < ApplicationController
  def home
  	@projects = Project.all.order("created_at DESC").limit(4)
  	 @ideas = Idea.recent.limit(2)
  	 @jobs = Job.all.limit(4)
  	 @trends = Trend.recent.limit(1)
  	 @user = User.new
  end
end
