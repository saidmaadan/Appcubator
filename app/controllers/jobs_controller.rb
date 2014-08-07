class JobsController < ApplicationController
	before_action :require_signin, except: [:index, :show]
	before_action :require_admin, only: [:delete]

	def index
		@jobs = Job.recent.page params[:page]
	end

	def show
		@job = Job.find(params[:id])
	end

	def edit
		@job = Job.find(params[:id])
	end

	def update
		@job = Job.find(params[:id])
		if @job.update(job_params)
			flash[:notice]='Job updated successfully'
			redirect_to @job
		else
			render :edit
		end
	end

	def new
		@job = Job.new
	end

	def create
		@job = current_user.jobs.build(job_params)
		if @job.save
			redirect_to @job, notice: "Job successfully created!"
		else
			render :new
		end
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		redirect_to @jobs_url, alert: "Job has been deleted"
	end

	private

	def job_params
		params.require(:job).permit(:job_title, :job_details, :experience, :employment_type, :desire_skill, :location, :state, :country, :zip_code, :salary, :other_pay, :relocation, :required_travel, :company_name, :company_description, :website, :application_link, :key_responsibility, :industry, :company_size, :salary_rate, :user_id, :logo )
	end

	def correct_user
		unless @job = current_user.jobs.find_by(id: params[:id])
			redirect_to @jobs_url, alert: "Unauthorized access! Sign in or sign up to get in..."
		end
	end
end
