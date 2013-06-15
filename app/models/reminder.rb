class Reminder < ActiveRecord::Base

	# => enum type
	# => 	1: Audio File with URL (via Filepicker)
	# => 	2: Voicebunny
	# => 	3: Text to Speech

  attr_accessible :description, :image, :name, :type
  								:number, :playtime, :caller, :callee

  								# 1        #2     
  attr_accessible :file_url, :text

  validates_presence_of :name, :number, :caller, :playtime, :type

  belongs_to :caller, :class_name => "User", 
  					 :foreign_key => "caller_id"
  belongs_to :calee, :class_name => "User", 
  					 :foreign_key => 'callee_id'

end
