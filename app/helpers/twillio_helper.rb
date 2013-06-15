module TwillioHelper
	def call(params)

	end

	def speech_text(params)
		reminder = Reminder.find_by_id(params[:recording_id])
		if reminder
			response = Twilio::TwiML::Response.new do |r|
  			r.Say reminder., :voice => r.gender
  			r.Dial :callerId => reminder. do |d|
    	d.Client reminder 
    end
    return false
  end

	def play_file(params)
		
	end

	def play_recording(params)

	end

	def play_vb_file(params)

	end

	def text_to_speech(params)

	end
end
