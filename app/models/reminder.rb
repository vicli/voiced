class Reminder < ActiveRecord::Base

	# => enum type
	# => 	1: Audio File with URL (via Filepicker)
	# => 	2: Audio via Twilio
	# => 	3: Text to Speech
	# => 	4: Voicebunny

  attr_accessible :description, :image, :name, :type
  								:number, :playtime, :caller, :callee

  								# 1        #2           #3       
  attr_accessible :file_url, :twiml_audo, :vb_file, 
  								#4
  								:text_to_speech, :gender

  validates_presence_of :name, :number, :caller, :playtime, :type

  belongs_to :caller, :class_name => "User", 
  					 :foreign_key => "caller_id"
  belongs_to :calee, :class_name => "User", 
  					 :foreign_key => 'callee_id'

end
