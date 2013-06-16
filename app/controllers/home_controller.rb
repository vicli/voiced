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

	def search
		require 'faraday'
		require 'faraday_middleware'
		@conn = nil
		@api_id = "17571"
		@api_key = "8e92600488dff3b1c88e5942d6a53e3d"
		resp = nil

		@conn = Faraday.new(:url =>("https://"+ @api_id+":"+@api_key +"@api.voicebunny.com"),:ssl => {:verify => false}) do |builder|
			builder.use Faraday::Request::Multipart
			builder.use Faraday::Request::UrlEncoded
			builder.use Faraday::Response::ParseJson
			builder.use Faraday::Adapter::NetHttp		  
		end

		resp = @conn.post '/samples/search.json', {
						 keyword: params[:keyword],
						 language: 'eng-us', 
		         genderAndAge: 'youngAdultAnyGender', 
             itemsPerPage: '30'
					}
		render :json => resp.body
	end
end
