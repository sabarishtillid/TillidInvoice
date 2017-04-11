$(document).ready(function(){
	$('.bank_list li').click(function(){
		$(this).toggleClass('active');
	});
	
	$('.stickyicon').click(function(){
		$(this).toggleClass('open');
		$('.overlay').toggleClass('show');
		$(".stick_leftbar").toggle( "slide");
		
	});
	
	$('.overlay').click(function(){
		$('.stickyicon').toggleClass('open');
		$('.overlay').toggleClass('show');
		$(".stick_leftbar").toggle( "slide");
	});
	
	$('.add .close').click(function(){
		$(this).parent().parent().hide();
	});
	
});


