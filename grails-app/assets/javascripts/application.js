// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
// Nota: el plugin de angular lo descargamos mediante bower
// bower install angular
// http://vasya10.wordpress.com/2014/03/01/grails-application-with-angularjs-setup-part-1/
//
//= require jquery
//= require angular/angular
//= require_tree views
//= require_tree .
//= require_self
if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}
