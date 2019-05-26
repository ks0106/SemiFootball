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
	var oldSize;
	var newSize;
	$(document).ready(function(){
		oldSize = $(window).width();
		//헤더 영역 사이즈
		$('.area').css("width","100%").css("height","100vh");
		//헤더 영역 위치
		$('.area').css("box-sizing","border-box").css("float","left");
		$('.area').css("position","fixed");
		//메뉴바 사이즈
		$('.menu_bar').css("width","100%").css("height","80px");
		//메뉴바 컬러 및 투명도
		$('.menu_bar').css("background-color","black").css("opacity","0.5");
		//메뉴바 위치
		$('.menu_bar').css("margin-top","70px");
		//페이지 로드 시 창 사이즈에 따른 메뉴바 상태 변경
		if(oldSize < 1750){
			$('#menu').css("display","none");
			$('#header_logo').css("display","none");
			$('#menu_login').css("display","none");
			$('.toggle_bar').css("display","block");
			$('.area').animate({
				top:"-70px"},500);
		}
	});
	//창크기 조절 시 창 사이즈에 따른 메뉴바 상태 변경
	$(window).resize(function(){
		newSize = $(window).width();							/* newSize(새 창 크기)에 현재 창 크기 저장 */
		if(oldSize < 1750){										
			if(newSize < 1750){									/* 예전 창크기가 1750보다 작을 때 새 창크기도 1750보다 작으면 */
				$('#menu').css("display","none");				/* 메뉴 사라짐 */
				$('#menu_login').css("display","none");			/* 로그인 버튼 사라짐 */
				$('#header_logo').css("display","none");		/* 파란 헤더 로고 사라짐 */
				$('.toggle_bar').css("display","block");		/* 메뉴와 로그인을 담은 토글바 나타남 */
				oldSize = $(window).width();					/* oldSize(예전 창 크기)에 현재 창 크기 저장 */
			}else{												/* 예전 창크기가 1750보다 작을 때 새 창크기가 1750보다 크면 */
				$('#menu').css("display","block");				/* 메뉴 나타남 */
				$('#menu_login').css("display","block");		/* 로그인 버튼 나타남 */
				$('#header_logo').css("display","block");		/* 파란 헤더 로고 나타남 */
				$('.area').animate({							/* 헤더 원위치 */
					top:"0px"},500);
				$('.toggle_bar').css("display","none");			/* 메뉴와 로그인을 담은 토글바 사라짐 */
				oldSize = $(window).width();					/* oldSize(예전 창 크기)에 현재 창 크기 저장 */
			}			
		}else{
			if(newSize < 1750){
				$('#menu').css("display","none");
				$('#menu_login').css("display","none");
				$('#header_logo').css("display","none");
				$('.area').animate({
					top:"-70px"},500);
				$('.toggle_bar').css("display","block");
				oldSize = $(window).width();
			}else{
				$('#menu_login').css("display","block");
				$('#header_logo').css("display","block");
				$('.toggle_bar').css("display","none");
				oldSize = $(window).width();
			}						
		}
	}).resize();
	//스크롤바 내렸을 때 헤더 위치 변경
</script>

<style>
/* 메뉴 li설정 (script 사용 시 로딩하는 동안 li기본형 뜨는 문제 때문에 css로 직접 줌) */
	.header_item{
		color:white;
		display:inline-block;
		margin-right:50px;
		line-height:40px;
	}
	.header_item a{
		font-size: 24px;
		text-decoration: none;
		color:white;
	}
	body{
		margin:0;
		padding:0;
		position:relative;
		overflow-x: hidden; 		/* 좌우 스크롤 제거 Css구문 */
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
<script>
	/* 토글바 클릭 이벤트 */
	
</script>
<header class="area">
<!-- 헤더 작성 -->
   	<a href="/" id="header_logo"><img src="/img/header_logo.png" width="180" height="180" id="header_logo" style="top:0px;left:50px;position:absolute;z-index:100;display:none;"></a>
	<div class="menu_bar">
 		<a href="/" id="header_logo2"><img src="/img/header_logo2.png" width="80px" id="header_logo2" style="left:50px;position:absolute;z-index:90;opacity:1;"></a>
 		<div class="toggle_bar" style="width:70px;height:65px;float:right;margin-right:50px;margin-top:7px;cursor:pointer;display:none;">
 			<div style="width:50px;height:8px;background-color:white;border-radius:10px;margin:10px;"></div>
 			<div style="width:50px;height:8px;background-color:white;border-radius:10px;margin:10px;"></div>
 			<div style="width:50px;height:8px;background-color:white;border-radius:10px;margin:10px;"></div>
 		</div> 		
 		<ul id="menu" style="position:absolute;left:300px;list-style-type:none;padding:0;">
 			<li class="header_item"><a href="/branch">지점</a></li>
 			<li class="header_item"><a href="/reservation">대관</a></li>
 			<li class="header_item"><a href="/matching">매치/용병</a></li>
 			<li class="header_item"><a href="/league">대회</a></li>
 			<li class="header_item"><a href="/gallery">갤러리</a></li>
 			<li class="header_item"><a href="/notice">고객센터</a></li>
 			<li class="header_item"><a href="/company">회사소개</a></li>
 			<li class="header_item"><a href="#" style="display:none;">관리자메뉴</a></li>
 		</ul>
 		<div id="menu_login" style="float:right;margin-right:100px;width:100px;height:90%;margin-top:5px;">
			<div style="margin-left:16px;"><a href="/views/login/login.jsp"><img src="/img/login_icon_100px_white.png" width="50" height="50"></a></div>
 			<div><a href="/views/login/login.jsp" style="text-decoration:none;color:white;">멤버 로그인</a></div>
		</div>
	</div>
	<nav class="right_area">
	
		<div style="width:400px;height:100vh;background-color:black;opacity:0.9;float:right;display:none;"></div>
	</nav>
</header>
