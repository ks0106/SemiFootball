/**
 * reservation 페이지 공통 js
 */
$(document).ready(function(){
	$('#ground1').append('<img src="/img/ground1.png" alt="그라운드1" style="width:100%;height:500px;">');
	$('#ground2').append('<img src="/img/ground2.jpg" alt="그라운드2" style="width:100%;height:500px;">');
	$('#ground3').append('<img src="/img/ground3.jpg" alt="그라운드3" style="width:100%;height:500px;">');
	$('#ground4').append('<img src="/img/ground4.jpg" alt="그라운드4" style="width:100%;height:500px;">');
	$('#ground5').append('<img src="/img/ground5.jpg" alt="그라운드5" style="width:100%;height:500px;">');
	$('#side_menu1').click(function(){
		location.href="/reservation";
	});
	$('#side_menu2').click(function(){
		location.href="/reservationViewList";
	});	
	$('#side_menu3').click(function(){
		location.href="/reservationManager";
	});	
});