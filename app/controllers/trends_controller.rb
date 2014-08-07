class TrendsController < ApplicationController
	before_action :require_signin, except: [:index, :show]
	before_action :require_admin, only: [:delete]

	def index
		@trends = Trend.recent.page params[:page]
	end

	def show
		@trend = Trend.find(params[:id])
	end

	def edit
		@trend = Trend.find(params[:id])
	end

	def update
		@trend = Trend.find(params[:id])
		if @trend.update(trend_params)
			flash[:notice] = "Successfully updated"
			redirect_to @trend
		else
			render :edit
		end
	end

	def new
		@trend = Trend.new
	end

	def create
		@trend = current_user.trends.build(trend_params)
		if @trend.save
			redirect_to @trend
		else
			render :new
		end
	end

	def destroy
		@trend = Trend.find(params[:id])
		@trend.destroy
		redirect_to @trends_url, alert: "Post has been deleted"
	end

	private

	def trend_params
		params.require(:trend).permit(:title, :content, :source_url, :user_id, :twitter_url, :upload)
	end

	def correct_user
		unless @trend = current_user.trends.find_by(id: params[:id])
			redirect_to @trends_url, alert: "Unauthorized access"
		end
	end
end