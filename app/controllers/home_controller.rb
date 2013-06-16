class HomeController < ApplicationController
	before_filter :load

	def load
		@user = current_user
	end


	def index
		p "hello"
		@user = current_user
		p current_user
		@reminder = Reminder.new
	end
end
