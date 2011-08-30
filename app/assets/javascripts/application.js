// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function(){
	$('input[type="image"]').qtip({
		position: {
	      my: 'top middle', 
	      at: 'bottom middle'
	   },
	   style: { 
	      tip: true,
	      classes: 'ui-tooltip-dark ui-tooltip-rounded'
	   }
	});

	$('img.ingredient').qtip({
		position: {
	      my: 'top middle', 
	      at: 'bottom middle'
	   },
	   style: { 
	      tip: true,
	      classes: 'ui-tooltip-dark ui-tooltip-rounded'
	   }
	});
	
	var toolbox = $('div.ingredient_toolbox');
	$('img.newIngredient').click(
		function() {
			$('#activeStep').value = "1";
			toolbox.slideToggle("slow");
		}
	);
	toolbox.slideToggle(0);

	$('input[type="image"].ingredient').click(
		function() {
			$('#associations_selectedIngredient').val($(this).attr('id'));
			toolbox.slideToggle("fast");
		}
	);
});