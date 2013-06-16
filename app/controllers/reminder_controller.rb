class ReminderController < ApplicationController
	respond_to :json, :html
	before_filter  :authenticate_user!, :load
	skip_before_filter  :verify_authenticity_token

  # loads the current_user
  	def load
  		@user = current_user
  	end
	def create
		p "in createe"
		if @user.reminders.create(params[:reminder])
			p "created reminder"
			redirect_to root_url
		else
			respond_with @reminder.errors
		end
	end

	def show
		respond_with @reminder
	end

	def remove
		if @reminder.destroy
			respond_with @reminder
		else
			render :nothing => true, :status => 404
		end
	end


end
