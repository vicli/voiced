var Reminder = function() {
	var file = null;
	var name = null;
	var description = null;
	var playtime = null;
	var callee = null;
	var image = null;
	var number = null;
	var _type = null;
	var gender = null;
	var message = null;

	return {
		setURL : function(url) {
			this.file = url;
		},
		setName: function(name) {
			this.name = name;
		},
		setDescription : function(description) {
			this.description = description;
		},
		setPlaytime : function(datetime) {
			this.platime = datetime;
		},
		setCallee : function(callee) {
			this.callee = callee;
		},
		setImage : function(image) {
			this.image = image;
		},
		setNumber : function(number) {
			this.number = number;
		},
		setType : function(type) {
			this._type = type;
		},
		setGender : function(gender) {
			this.gender = gender;
		},
		setMessage : function(message) {
			this.message = message;
		}
	}
}