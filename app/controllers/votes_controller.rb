class VotesController < ApplicationController
	before_action :require_signin
	before_action :set_idea

	def create
		@idea.votes.create!(user: current_user)
		redirect_to @idea, notice: "Glad you voted"
	end

	def destroy
		vote = current_user.votes.find(params[:id])
		vote.destroy

		redirect_to @idea
	end

	private
	def set_idea
		@idea = Idea.find(params[:idea_id])
	end
end
