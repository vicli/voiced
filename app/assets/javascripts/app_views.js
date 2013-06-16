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

var FeedItemView = function(model) {
	template = _.template($("#feed-item-template").html());
	templatize = function(model) {
		if (!model.caller) model.caller = false;
		if (!model.callee) model.callee = false;
		_.extend(model, window.view_helper)
		return $.parseHTML(template(model));
	}
	return templatize(model);
}