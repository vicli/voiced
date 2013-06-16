var VoiceBunny ={}

VoiceBunny.controller = function() {
	API_TOKEN = "8e92600488dff3b1c88e5942d6a53e3d";
	USER_ID = "17571";

	function search(parameters, callback) {
		$.ajax({
			type: "POST",
			url: "https://api.voicebunny.com/samples/search",
			data: parameters,
			dataType: "json",
			success: function(data, status, jqXHR) {
				callbacks['success'](data);
			},
			error: function(error, something, jqXHR) {
				callbacks['error']();
			}
		});

		function speedy(parameters, callbacks) {
			var reminder_id;
			$.ajax({ 
				async: false,
				url: "/reminders",
				type: "POST",
				data : {
					reminder: {
						type: 3
					}
				},
				success: function(data, status, jqXHR) {
					console.log("temp reminder made with id: "+id);
					reminder_id = data['id'];
				}
			});
			parameters['test'] = true;
			parameters['ping'] = "http://voicechat.herokuapp.com/ready?id="+reminder_id;
			$.ajax({
				type: "POST",
				url: "https://"+USER_ID+":"+API_TOKEN+"@api.voicebunny.com/projects/addSpeedy",
				data: parameters,
				success: function(data) {
					callbacks['success'](data);
				},
				error: function() {
					callbacks['error']();
				}
			});
		}
	}

	return {
		search : search,
		speedy : speedy		
	}
}

VoiceBunny.view = function() {

}