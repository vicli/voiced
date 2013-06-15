module TwillioHelper

	def speech_text(params)
		response = Twilio::TwiML::Response.new do |r|
			r.Say @reminder.text, :voice => @reminder.gender
			r.Dial :callerId => @reminder.number do |d|
				d.Client @reminder.name
			end
		end
  end

	def play_file(params)
		response = Twilio::TwiML::Response.new do |r|
  		r.Play @reminder.file_url
  		r.Dial :callerId => @reminder.number do |d|
	    	d.Client @reminder.name
	    end
	  end
	end

end
