require 'twilio-ruby'
class Reminder < ActiveRecord::Base
	# => enum type
	# => 	1: Audio File with URL (via Filepicker/Voice Bunny)
	# => 	2: Text to Speech


  attr_accessible :name, :description, :playtime, :image,
  								:number, :_type,
  								:callee_id, :caller_id

  								# 1        #2     
  attr_accessible :file, :message, :gender

  validates_presence_of :file, :if => "_type == 1"
  validates_presence_of :message, :gender, :if => "_type == 2"

  belongs_to :caller, :class_name => "User", 
  					 :foreign_key => "caller_id"
  belongs_to :callee, :class_name => "User", 
  					 :foreign_key => 'callee_id'

  def as_json(options)
  	super(:include => [:callee , :caller])
  end

	def trigger
		puts "in trigger"
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
# User.first.reminders.create({ :message => "test", :_type=>2, :gender=>"male", name:"test", :playtime=>Time.now, :number=>"+13476172295"})