var test=jQuery.noConflict();
test(document).ready(function(){
	
	test('#menu').slicknav();
	
	test( "#accordion" ).accordion({heightStyle: "content"});
	
	test( "select" ).selectmenu();
	
});
