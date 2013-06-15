require 'twilio-ruby'
class TwillioController < ApplicationController
	include TwillioHelper
	before_filter :setup
	

	def setup
		account_sid = '0947cdfdd17a0cc08e9c088bed3db60a'
		auth_token = 'AC8b70300105eb2b524cc293ba3339fc49'

		# set up a client to talk to the Twilio REST API
		@client = Twilio::REST::Client.new account_sid, auth_token
	end

end
