require 'twilio-ruby'
class TwillioController < ApplicationController
	include TwillioHelper
	before_filter :setup
	
	def trigger_reminder
		if @reminder.type == 1
			play_file params
		elsif @reminder.type == 2
			text_tp_speech params
		end
		render :nothing => true, :status => 500
	end

	def setup
		account_sid = '0947cdfdd17a0cc08e9c088bed3db60a'
		auth_token = 'AC8b70300105eb2b524cc293ba3339fc49'
		@client = Twilio::REST::Client.new account_sid, auth_token
		@reminder = Reminder.find_by_id(params[:recording_id])
		redirect_to root_url if @reminder.nil?
	end

end
