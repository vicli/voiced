var VoiceRecording = function() {
	add_voice_recording = function(params, callbacks) {
		$.ajax({
			type: "POST",
			url: "/reminders",
			data: {
				reminder : {
					name: params['name'],
					file: params['url'],
					message: params['message'],
					description: params['description'],
					playtime: params['playtime'],
					_type: params['type'],
					gender: params['gender']
				},
			},
			success : function(data, status, jqXHR) {
				callbacks['success'](data);
			},
			error: function(error, something, jqXHR) {
				callbacks['error'](data);
			}
		});
	}

	return add_voice_recording
}