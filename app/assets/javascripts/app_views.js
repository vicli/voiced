var AppViews = function() {
	return {
		hide: function(selector) {
			$(selector).slideUp(400);
		},
		show: function(selector) {
			$(selector).slideDown(400);
		}
	}
}

var FeedItemView = function() {
	template = _.template($("#feed-item-template"));
	_.extend(model, window.view_helper)
	templatize = function(model) {
		return $.parseHTML(template(model));
	}
	return templatize;
}