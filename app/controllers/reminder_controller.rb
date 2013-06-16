class ReminderController < ApplicationController

	def create
		@reminder = Reminder.create(params[:reminder])
		render :json => @reminder
	end		
end
