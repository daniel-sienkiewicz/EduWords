// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap

$(document).ready(function(){

		// Cookie setting script wrapper
		var cookieScripts = function () {
			// Internal javascript called
			console.log("Running");
		
			// Loading external javascript file
			$.cookiesDirective.loadScript({
				appendTo: 'eantics'
			});
		}
		
		$.cookiesDirective({
			privacyPolicyUri: 'myprivacypolicy.html',
			explicitConsent: false,
			position : 'bottom',
			scriptWrapper: cookieScripts, 
			cookieScripts: 'Google Analytics, My Stats Ultimate ', 
			backgroundColor: '#52B54A',
			linkColor: '#ffffff'
		});
	});