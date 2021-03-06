<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%
		Member m = (Member)session.getAttribute("member");
	%>
	<link rel="stylesheet" href="/css/common/bootstrap_copy.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/common/style.css">
<script>
	var oldWidth;
	var newWidth;
	var oldScroll;
	var newScroll;
	$(document).ready(function(){
		//헤더 영역 사이즈
		$('.area').css("width","100%");
		$('.area').css("height","150px");
		//헤더 영역 위치
		$('.area').css("box-sizing","border-box").css("float","left");
		$('.area').css("position","fixed");
		//메뉴바 사이즈
		$('.menu_bar1').css("width","100%").css("height","80px");
		//메뉴바 컬러 및 투명도
		$('.menu_bar1').css("background-color","black").css("opacity","0.5");
		//메뉴바 위치
		$('.menu_bar1').css("margin-top","70px");
		//페이지 로드 시 창 사이즈에 따른 메뉴바 상태 변경
		oldWidth = $(window).width();
		oldScroll = $(this).scrollTop();
		if(oldWidth < 980){
			$('#menu1').css("display","none");
			$('#header_logo').css("display","none");
			$('#menu_login').css("display","none");
			$('.toggle_bar').css("display","block");
			$('.area').animate({
				top:"-70px"},200);
		}else if(oldWidth >= 980 && oldWidth <= 1550){
			$('.right_area').css("display","none");			/* 토글 사이드바 사라짐 */
			$('#menu1').css("display","block");				/* 메뉴 나타남 */
			$('#menu_login').css("display","block");		/* 로그인 버튼 나타남 */
			$('.toggle_bar').css("display","none");			/* 메뉴와 로그인을 담은 토글바 사라짐 */
			$('#menu1').css("left","150px");
			$('.header_item').css("margin-right","20px");
			$('.header_item a').css("font-size","18px");			
			$('#header_logo').css("display","none");
			$('.area').animate({
				top:"-70px"},200);
		}else if(oldWidth > 1550){
			if(oldScroll < "70"){
				$('#header_logo').css("display","block");							
			}else{
				$('#header_logo').css("display","none");
				$('.area').animate({
					top:"-70px"},200);				
			}
		}
		//메뉴바 마우스 올렸을 때 opacity값 변경
		$('.menu_bar1').mouseenter(function(){
			$('.menu_bar1').animate({
				opacity:"0.9"
			},200);
		});
		$('.menu_bar1').mouseleave(function(){
			if($('.right_area').css("display") == "none"){
				$('.menu_bar1').animate({
					opacity:"0.5"
				},200);
			}
		});
		//스크롤바 내렸을 때 헤더 위치 변경
		$(window).scroll(function(){
			newScroll = $(this).scrollTop();
			if(oldWidth > 1550){
				if(oldScroll < "70"){
					if(newScroll >= "70"){
						$('.area').animate({
							top:"-70px"},200);	
						$('#header_logo').css("display","none");
						oldScroll = $(this).scrollTop();
					}
				}else{
					if(newScroll < "70"){
						$('.area').animate({
							top:"0px"},200);	
						$('#header_logo').css("display","block");
						oldScroll = $(this).scrollTop();						
					}
				}								
			}
		});
	});
	//창크기 조절 시 창 사이즈에 따른 메뉴바 상태 변경
	$(window).resize(function(){
		newWidth = $(window).width();							/* newWidth(새 창 크기)에 현재 창 크기 저장 */
		if(oldWidth < 980){										
			if(newWidth >= 980 && newWidth <= 1550){		/* 예전 창크기가 980보다 작을 때 새 창크기가 980보다 크면 */
				$('.right_area').css("display","none");			/* 토글 사이드바 사라짐 */
				$('#menu1').css("display","block");				/* 메뉴 나타남 */
				$('#menu_login').css("display","block");		/* 로그인 버튼 나타남 */
				$('.toggle_bar').css("display","none");			/* 메뉴와 로그인을 담은 토글바 사라짐 */
				$('#menu1').css("left","150px");
				$('.header_item').css("margin-right","20px");
				$('.header_item a').css("font-size","18px");
				oldWidth = $(window).width();					/* oldWidth(예전 창 크기)에 현재 창 크기 저장 */
			}else if(newWidth > 1550){
				if(oldScroll < 70){
					$('.right_area').css("display","none");			/* 토글 사이드바 사라짐 */
					$('#menu1').css("display","block");				/* 메뉴 나타남 */
					$('#menu_login').css("display","block");		/* 로그인 버튼 나타남 */
					$('#header_logo').css("display","block");		/* 파란 헤더 로고 나타남 */
					$('.area').animate({							/* 헤더 원위치 */
						top:"0px"},200);
					$('.toggle_bar').css("display","none");			/* 메뉴와 로그인을 담은 토글바 사라짐 */
					$('#menu1').css("left","300px");
					$('#header_logo').css("display","block");		/* 파란 헤더 로고 나타남 */
					$('.header_item').css("margin-right","50px");
					$('.header_item a').css("font-size","24px");
					oldWidth = $(window).width();					/* oldWidth(예전 창 크기)에 현재 창 크기 저장 */
				}else{
					$('.right_area').css("display","none");			/* 토글 사이드바 사라짐 */
					$('#menu1').css("display","block");				/* 메뉴 나타남 */
					$('#menu_login').css("display","block");		/* 로그인 버튼 나타남 */
					$('.toggle_bar').css("display","none");			/* 메뉴와 로그인을 담은 토글바 사라짐 */
					$('#menu1').css("left","300px");
					$('.header_item').css("margin-right","50px");
					$('.header_item a').css("font-size","24px");
					oldWidth = $(window).width();					/* oldWidth(예전 창 크기)에 현재 창 크기 저장 */										
				}
			}
		}else if(oldWidth >=980 && oldWidth <=1550){
			if(newWidth < 980){
				$('#menu1').css("display","none");
				$('#menu_login').css("display","none");
				$('#header_logo').css("display","none");
				$('.toggle_bar').css("display","block");
				oldWidth = $(window).width();
			}else if(newWidth > 1550){
				if(oldScroll < 70){
					$('.right_area').css("display","none");			/* 토글 사이드바 사라짐 */
					$('#menu1').css("display","block");				/* 메뉴 나타남 */
					$('#menu_login').css("display","block");		/* 로그인 버튼 나타남 */
					$('#header_logo').css("display","block");		/* 파란 헤더 로고 나타남 */
					$('.area').animate({							/* 헤더 원위치 */
						top:"0px"},200);
					$('.toggle_bar').css("display","none");			/* 메뉴와 로그인을 담은 토글바 사라짐 */
					$('#menu1').css("left","300px");
					$('.header_item').css("margin-right","50px");
					$('.header_item a').css("font-size","24px");
					oldWidth = $(window).width();					/* oldWidth(예전 창 크기)에 현재 창 크기 저장 */
				}else{
					$('.right_area').css("display","none");			/* 토글 사이드바 사라짐 */
					$('#menu1').css("display","block");				/* 메뉴 나타남 */
					$('#menu_login').css("display","block");		/* 로그인 버튼 나타남 */
					$('.toggle_bar').css("display","none");			/* 메뉴와 로그인을 담은 토글바 사라짐 */
					$('#menu1').css("left","300px");
					$('.header_item').css("margin-right","50px");
					$('.header_item a').css("font-size","24px");
					oldWidth = $(window).width();					/* oldWidth(예전 창 크기)에 현재 창 크기 저장 */					
				}
			}
		}else if(oldWidth > 1550){
			if(newWidth >= 980 && newWidth <= 1550){				/* 예전 창크기가 980보다 작을 때 새 창크기가 980보다 크면 */
				$('.right_area').css("display","none");			/* 토글 사이드바 사라짐 */
				$('#menu1').css("display","block");				/* 메뉴 나타남 */
				$('#menu_login').css("display","block");		/* 로그인 버튼 나타남 */
				$('.toggle_bar').css("display","none");			/* 메뉴와 로그인을 담은 토글바 사라짐 */
				$('#menu1').css("left","150px");
				$('.header_item').css("margin-right","20px");
				$('.header_item a').css("font-size","18px");
				$('#header_logo').css("display","none");
				$('.area').animate({
					top:"-70px"},200);
				oldWidth = $(window).width();					/* oldWidth(예전 창 크기)에 현재 창 크기 저장 */
			}else if(newWidth < 980){
				$('#menu1').css("display","none");
				$('#menu_login').css("display","none");
				$('#header_logo').css("display","none");
				$('.toggle_bar').css("display","block");
				$('.area').animate({
					top:"-70px"},200);
				oldWidth = $(window).width();
			}
		}
	}).resize();
</script>

<style>
/* 메뉴 li설정 (script 사용 시 로딩하는 동안 li기본형 뜨는 문제 때문에 css로 직접 줌) */
	.area{
		position:absolute;
		top:0;
		z-index:3;
	}
	header{
		width:100%;
		height:485px;
		overflow:hidden;
	}
	.header_item{
		color:white;
		display:inline-block;
		margin-right:50px;
		line-height:40px;
	}
	.header_item a{
		font-weight: bolder;
		font-size: 24px;
		text-decoration: none;
		color:white;
	}
/* 토글 사이드바 숨김  */
	.right_area{
		display:none;
	}
	body{
		margin:0;
		padding:0;
		overflow-x: hidden; 		/* 좌우 스크롤 제거 Css구문 */
	}
	.right_menu_item{
		width:100%;
		height:50px;
	}
	.right_menu_item a{
		font-size: 25px;
		font-weight:bolder;
		text-decoration: none;
		color:white;
	}

</style>
<script>
	/* 토글바 클릭 이벤트 */
	$(document).ready(function(){
		$('.toggle_bar').click(function(){
			if($('.right_area').css("display") == "none"){
				$('.right_area').css("display","block");
				$('.menu_bar1').css("opacity","0.9");
				$('.right_area').animate({
					left:"-500px"},500);
			}else{				
				$('.right_area').css("display","none");
				$('.right_area').animate({
					left:"-500px"},500);
			}
		});
		$('#menu_login').click(function(){
			if($("#myPage").attr('class') != 'selectMyPage'){
				$("#myPage").addClass('selectMyPage');
				$("#myPage").css("display","inline-block");				
			}else{
				$("#myPage").removeClass('selectMyPage');
				$("#myPage").css("display","none");								
			}
		});				
	});
</script>
<header>
	<div id="container" style="width:100%;height:485px;overflow:hidden;">
	    <div id="ground" style="text-align:center;height:500px;width:100%;z-index:1;">
	    	<div id="menuImg"></div>
	    </div>
	</div>
<!-- 헤더 작성 -->
	<div class="area" style="z-index:4;">
	   	<a href="/" id="header_logo"><img src="/img/header_logo.png" width="180" height="180" id="header_logo" style="top:0px;left:50px;position:absolute;z-index:100;"></a>
		<div class="menu_bar1">
	 		<a href="/" id="header_logo2"><img src="/img/header_logo2.png" width="80px" id="header_logo2" style="left:50px;position:absolute;z-index:90;opacity:1;"></a>
	 		<div class="toggle_bar" style="width:70px;height:65px;float:right;margin-right:50px;margin-top:7px;cursor:pointer;display:none;">
	 			<div style="width:50px;height:8px;background-color:white;border-radius:10px;margin:10px;"></div>
	 			<div style="width:50px;height:8px;background-color:white;border-radius:10px;margin:10px;"></div>
	 			<div style="width:50px;height:8px;background-color:white;border-radius:10px;margin:10px;"></div>
	 		</div> 		
	 		<ul id="menu1" style="position:absolute;left:300px;list-style-type:none;padding:0;margin-top:16px;">
	 			<li class="header_item"><a href="/branch">지점</a></li>
	 			<li class="header_item"><a href="/reservation">대관</a></li>
	 			<li class="header_item"><a href="/matching">매치/용병</a></li>
	 			<li class="header_item"><a href="/league">대회</a></li>
	 			<li class="header_item"><a href="/gallery">갤러리</a></li>
	 			<li class="header_item"><a href="/notice">커뮤니티</a></li>
	 			<li class="header_item"><a href="/company">회사소개</a></li>
				<%if(m != null){ %>
					<%if(m.getId().equals("admin")){ %>	 			
			 			<li class="header_item"><a href="/admin">관리자메뉴</a></li>
			 		<%} %>
			 	<%} %>
	 		</ul>
	 		<%if(m == null){ %>
	 		<div id="menu_login" style="float:right;margin-right:40px;">
	 			<button onclick="location.href='/views/login/login.jsp'" style="color:white;background-color:inherit;border:0;line-height:80px;">
		 			<span style="vertical-align:middle;">Member Login</span>
					<span><img src="/img/login_logo2_white.png" width="50px" height="50px" style="vertical-align:middle;"></span>
	 			</button>
			</div>
			<%}else{ %>
		 		<div id="menu_login" style="float:right;width:100px;height:80px;margin-right:40px;">
					<div style="margin-left:16px;"><img src="/img/member_icon_100px_white.png" width="50px" height="50px" style="cursor:pointer;"></div>
		 			<div><a style="text-decoration:none;color:white;cursor:pointer;"><%=m.getName()%> 님!</a></div>
		 			<div id="myPage" style="display:none;">
						<div style="width:300px;height:220px;position:absolute;right:0;top:180px;z-index:10;">
							<div style="color:white;text-align:center;font-size:20px;font-weight:bolder;">회원 정보</div>
							<div style="width:100%;margin:0 auto;box-sizing:border-box;">
							<hr style="width:85%;height:2px;border:0;margin:0;padding:0;background-color:white;display:inline-block;"><hr style="width:15%;height:2px;border:0;margin:0;padding:0;background-color:#3366cc;display:inline-block;">
							</div>
							<div style="color:white;text-align:center;">ID : <%=m.getId()%></div>
							<div style="color:white;text-align:center;">Name : <%=m.getName()%></div>
							<div style="color:white;text-align:center;">Phone : <%=m.getPhone()%></div>
							<div style="color:white;text-align:center;">가입일 : <%=m.getEnrollDate()%></div>				
							<div style="width:100%;margin:0 auto;box-sizing:border-box;">
								<hr style="width:85%;height:2px;border:0;margin:0;padding:0;background-color:white;display:inline-block;"><hr style="width:15%;height:2px;border:0;margin:0;padding:0;background-color:#3366cc;display:inline-block;">
							</div>
							<div style="color:white;text-align:center;margin-top:15px;">
								<input onclick="kout();" type="button" style="width:100px;height:40px;color:white;background-color:inherit;border:2px solid #3366cc;font-size:20px;line-height:10px;cursor:pointer;" value="로그아웃">
								<%if(m.getId().equals("admin")){ %>
								<input onclick="location.href='/admin'" type="button" style="width:100px;height:40px;color:white;background-color:inherit;border:2px solid #3366cc;font-size:20px;line-height:10px;cursor:pointer;" value="관리자">
								<%}else{ %>
								<input  onclick="location.href='/myPage?memberId=<%=m.getId()%>'" type="button" style="width:100px;height:40px;color:white;background-color:inherit;border:2px solid #3366cc;font-size:20px;line-height:10px;cursor:pointer;" value="MyPage">
									
								<%} %>
							</div>				
						</div>
						<div style="width:300px;height:220px;position:absolute;right:0;top:150px;opacity:0.5;">
							<img src="/img/textArea_black.png">
						</div>
					</div>
				</div>
			<%} %>
		</div>
	<!-- 토글바 클릭 시 나오는 오른쪽 사이드바 작성 -->
		<nav class="right_area">
			<div style="width:350px;height:100vh;background-color:black;opacity:0.9;position:absolute;right:0;">
				<%if(m == null){ %>
					<div style="width:100%;margin:0 auto;margin-top:10px;margin-bottom:10px;">
						<button onclick="loginLocation();" style="background-color:inherit;border:0;float:right;margin-right:30px;line-height:80px;">
							<span style="color:white;fint-size:25px;vertical-align:middle;">Member Login</span>
							<span><img src="/img/login_logo2_white.png" width="50px" style="vertical-align:middle;"></span>						
						</button>
					</div>
				<%}else{ %>
					<div style="width:100%;margin:0 auto;margin-top:10px;margin-bottom:10px;">
						<div id="myPage" style="float:right;margin-right:30px;cursor:pointer;"><a style="text-decoration:none;color:white;font-size:25px;"><%=m.getName()%> 님!</a>
						<img src="/img/member_icon_100px_white.png" width="30px"></div>
					</div>
				<%} %>
				<div style="width:80%;margin:0 auto;box-sizing:border-box;">
					<hr style="width:85%;height:2px;border:0;margin:0;padding:0;background-color:white;display:inline-block;"><hr style="width:15%;height:2px;border:0;margin:0;padding:0;background-color:#3366cc;display:inline-block;">
				</div>
				<ul id="side_menu" style="list-style-type:none;padding:0;margin-left:10%;">
					<li class="right_menu_item"><a href="/branch">지점</a></li>
					<li class="right_menu_item"><a href="/reservation">대관</a></li>
					<li class="right_menu_item"><a href="/matching">매치/용병</a></li>
					<li class="right_menu_item"><a href="/league">대회</a></li>
					<li class="right_menu_item"><a href="/gallery">갤러리</a></li>
					<li class="right_menu_item"><a href="/notice">커뮤니티</a></li>
					<li class="right_menu_item"><a href="/company">회사소개</a></li>
				</ul>
					<div style="width:80%;margin:0 auto;box-sizing:border-box;">
						<hr style="width:85%;height:2px;border:0;margin:0;padding:0;background-color:white;display:inline-block;"><hr style="width:15%;height:2px;border:0;margin:0;padding:0;background-color:#3366cc;display:inline-block;">
					</div>
				<ul id="side_menu" style="list-style-type:none;padding:0;margin-left:10%;">
					<%if(m != null){ %>
						<li class="right_menu_item"><a onclick="kout();" style="cursor:pointer;">로그아웃</a></li>
						<%if(m.getId().equals("admin")){ %>
							<li class="right_menu_item"><a href="/admin">관리자메뉴</a></li>
						<%}else{ %>
													
							<li class="right_menu_item"><a href="/mypage">마이페이지</a></li>
						<%} %>
					<%} %>
				</ul>
			</div>
		</nav>
	</div>
	
	<script>
		function loginLocation(){
			location.href="/views/login/login.jsp";
		}
		function  kout() {
			var url = "http://developers.kakao.com/logout";
			$.ajax({
				url: url,
				dataType: 'jsonp',
				jsonpCallback: "myCallback",
				complete : function(){      //try~catch의 finally (옵션)
		               location.href="/logout";
				}
			});
		};
	</script>
</header>
