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

	var mouse_is_inside = false;
	var toolbox_is_open = false;

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
			$('#associations_activeStep').val($(this).attr('id'));
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

	
	$('.ingredient_toolbox').hover(function(){ 
        mouse_is_inside=true; 
    }, function(){ 
        mouse_is_inside=false; 
    });

    $("body").mouseup(function(){ 
    	if(toolbox.css("display") != "none")
    		toolbox_is_open = true;
    	else
    		toolbox_is_open = false;

		if(toolbox_is_open) {
        	if(!mouse_is_inside) {
       		 	toolbox.slideToggle("fast");
        	}
    	}
    });


    $('input[type="image"].ingredient').click(function(e) {
        //Cancel the link behavior
        e.preventDefault();

        //Clear previous values
        $('#associations_amount').val('');
        //Store the selected ingerdient
        $('#associations_selectedIngredient').val($(this).attr('id'));
        $('#selectedImage').attr('src', $(this).attr('src'));
        //toolbox.slideToggle("fast");

        $('#ingredient_name').html($(this).attr('title'));
        var id = $(this).attr('id');
     	var modal = $('div.modal');

        //Get the screen height and width
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
     
        //Set height and width to mask to fill up the whole screen
        $('#mask').css({'width':maskWidth,'height':maskHeight});
         
        //transition effect     
        $('#mask').fadeIn(1000);    
        $('#mask').fadeTo("slow",0.8);  
     
        //Get the window height and width
        var winH = $(document).height();
        var winW = $(window).width();

        //Set the popup window to center
        $(modal).css('top',  (winH/2) + $(modal).height());
        $(modal).css('left', ((winW/2)+150));
     
        //transition effect
        $(modal).fadeIn(2000); 
    });
     
    //if close button is clicked
    $('.modal .close').click(function (e) {
        //Cancel the link behavior
        e.preventDefault();
        $('#mask, .modal').hide();
    });     
     
    //if mask is clicked
    $('#mask').click(function () {
	    $(this).hide();
        $('.modal').hide();
    }); 

    //if ok is clicked
    $('#submitIngredient').click(function () {
	    $('#mask, .modal').hide();
    });

    $('#nevermind').click(function () {
	    $('#mask, .modal').hide();
    });
});