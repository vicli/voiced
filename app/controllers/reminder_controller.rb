class ReminderController < ApplicationController
	respond_to :json
	before_filter :check_permissions, :authenticate_user!, :load
	skip_before_filter  :verify_authenticity_token

  # loads the current_user
  	def load
  		@user = current_user
  	end
	def create
		p"rawrrrrrr"
		p @user
		if @user.reminders.create(params[:reminder])
			respond_with @reminder
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

	def check_permissions
		if (params[:id])
			@reminder = Reminder.find_by_id(params[:id])
			redirect_to root_url if @reminder.nil? || @reminder.callee_id != current_user.id || @reminder.caller_id != current_user.id 
		end
	end

end
