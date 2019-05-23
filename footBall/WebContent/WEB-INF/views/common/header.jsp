<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%
		Member m = (Member)session.getAttribute("member");
	%>
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		//헤더 영역 사이즈
		$('.area').css("width","100%").css("height","200px");
		//헤더 영역 위치
		$('.area').css("box-sizing","border-box").css("float","left");
		$('.area').css("position","absolute");
		//메뉴바 사이즈
		$('.menu_bar').css("width","100%").css("height","80px");
		//메뉴바 컬러 및 투명도
		$('.menu_bar').css("background-color","black").css("opacity","0.5");
		//메뉴바 위치
		$('.menu_bar').css("margin-top","70px");
		//메뉴 li 설정
		$('.nav-item').css("color","white");
		$('.nav-item').css("display","inline-block");
		$('.nav-item').css("margin-right","50px");
		$('.nav-item').css("line-height","40px");
		$('.nav-item a').css("font-size","24px").css("text-decoration","none").css("color","white");
		//페이지 로드 시 창 사이즈에 따른 메뉴바 상태 변경
		if($(window).width() < 1750){
			$('.nav-item').css("display","none");
		}else{
			$('.nav-item').css("display","inline-block");			
		}
	});
	//창크기 조절 시 창 사이즈에 따른 메뉴바 상태 변경
	$(window).resize(function(){
		if($(window).width() < 1750){
			$('.nav-item').css("display","none");
		}else{
			$('.nav-item').css("display","inline-block");						
		}
	}).resize();
</script>

<style>
	body{
		margin:0;
		padding:0;
		position:relative;
	}
	.menu_bar:hover{
		animation-name:menubar;
		animation-duration:0.5s;
		animation-fill-mode:forwards;
	}
	@keyframes menubar{
		from{
			opacity:0.5;
		}
		to{
			opacity:0.9;
		}
	}
</style>
<header class="area">
<!-- 헤더 작성 -->
   	<a href="/"><img src="/img/header_logo.png" width="180" height="180" id="header_logo" style="top:0px;left:50px;position:absolute;z-index:100;"></a>
	<div class="menu_bar">
 		<a href="/"><img src="/img/header_logo2.png" width="80px" id="header_logo2" style="left:50px;position:absolute;z-index:90;opacity:1;"></a>
 		<ul id="menu" style="position:absolute;left:300px;list-style-type:none;padding:0;">
 			<li class="nav-item"><a href="/branch">지점</a></li>
 			<li class="nav-item"><a href="/reservation">대관</a></li>
 			<li class="nav-item"><a href="/matching">매치/용병</a></li>
 			<li class="nav-item"><a href="/league">대회</a></li>
 			<li class="nav-item"><a href="/gallery">갤러리</a></li>
 			<li class="nav-item"><a href="/notice">고객센터</a></li>
 			<li class="nav-item"><a href="/company">회사소개</a></li>
 			<li class="nav-item"><a href="#" style="display:none;">관리자메뉴</a></li>
 		</ul>
		
	</div>
</header>
</html>