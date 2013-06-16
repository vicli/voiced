require 'twilio-ruby'
class Reminder < ActiveRecord::Base
	# => enum type
	# => 	1: Audio File with URL (via Filepicker/Voice Bunny)
	# => 	2: Text to Speech


  attr_accessible :name, :description, :playtime, :image,
  								:number, :caller, :callee, :_type

  								# 1        #2     
  attr_accessible :file, :message, :gender
 :type
  validates_presence_of :file, :if => "type == 1"
  validates_presence_of :name, :number, :playtime, :unless => "type == 3"
  validates_presence_of :message, :gender, :if => "type == 2"

  belongs_to :caller, :class_name => "User", 
  					 :foreign_key => "caller_id"
  belongs_to :callee, :class_name => "User", 
  					 :foreign_key => 'callee_id'

	def trigger
		if _type == 1
			return play_file
		elsif _type == 2
			return speech_text
		end
		return false
	end

	def play_file
		response = Twilio::TwiML::Response.new do |r|
  		r.Play file
	  end.text
	  return response
	end

	def speech_text
		response = Twilio::TwiML::Response.new do |r|
			r.Say message, :voice => gender
		end.text
		return response
  end

end