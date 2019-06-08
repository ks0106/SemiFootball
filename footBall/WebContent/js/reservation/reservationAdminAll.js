/**
 * 어드민 대관관리 페이지 공통js
 */
$(document).ready(function(){
	$('#side_menu1').click(function(){
		location.href="/reservationManager";
	});
	$('#side_menu2').click(function(){
		location.href="/reservationViewList";
	});	
	$('#side_menu3').click(function(){
		location.href="/reservationManager";
	});	
});