
//jQuery(function($) {
(function( $ ){
	$('#matricula_field').focus(function() {
    	$('#matricula-balloon').fadeIn('slow');
  	});
  	$('#matricula_field').blur(function() {
    $('#matricula-balloon').fadeOut('slow');
  });
})( jQuery );
//});
