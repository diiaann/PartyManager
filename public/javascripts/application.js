// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


// Datepicker code
	$(function() {
		$( ".datepicker" ).datepicker();
	});
	
	
// Flash fade
	$(function() {
	   $('#flash_notice').fadeIn('normal', function() {
	      $(this).delay(3700).fadeOut();
	   });
	});
	
	$(function() {
	   $('#flash_error').fadeIn('normal', function() {
	      $(this).delay(3700).fadeOut();
	   });
	});
