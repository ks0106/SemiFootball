<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ page import="notice.model.vo.NoticeVo"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="notice.model.vo.NoticePageData"%>
	<%
		Member m = (Member)session.getAttribute("member");
		%>
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/css/common/pageCss.css">
<!-- 사이드 헤더(높이가 일정 크기 이상일 때 사이드) -->
<style>
	body{
		margin:0;
		padding:0;
	}
	.leftside_area{
		position:fixed;
		display:table;
		float:left;
		width:550px;
		height:100%;
	}
	.leftside_title{
		position:absolute;
		display:inline-block;
		color:white;
		z-index:100;
		top:8%;
		font-size:40px;
		font-weight:bold;
	}
	.leftside_notice{
		position:absolute;
		width:100%;
		color:white;
		z-index:100;
		top:20%;
		text-align: center;
	}
	.leftside_menu{
		position:absolute;
		color:white;
		z-index:100;
		top:40%;
		left:30%;
	}
	.leftside_bar{
		position:absolute;
		width:500px;
		height:100%;
		background-color:black;
		opacity: 0.5;
	}
	.bar_button_area{
		display:table-cell;
		vertical-align: middle;
	}
	.bar_button{
		margin-left:500px;
		display:table;
		width:30px;
		height:150px;
		background-color:black;
		opacity:0.5;
		border-top-right-radius:10px;
		border-bottom-right-radius:10px;
		box-sizing: border-box;
		cursor: pointer;
	}
	.prev_next{
		display:table-cell;
		vertical-align: middle;
	}
	.menu_item a{
		color:white;
		text-decoration:none;
		font-size:50px;
		font-weight:bold;
	}
</style>
<script>
	var oldHeight;
	var newHeight;
	$(document).ready(function(){
		$('.bar_button').click(function(){
			if($(this).attr('id') == 'prev'){
				$(this).css("display","none");
				$('#next').css("display","table");
				$('.leftside_area').animate({
					left:"-500px"},500);
			}else{
				$(this).css("display","none");
				$('#prev').css("display","table");			
				$('.leftside_area').animate({
					left:"0px"},500);						
			}
		});
		//페이지 로드 시 창 사이즈에 따른 사이드바 상태 변경
		oldHeight = $(window).height();
		if(oldHeight < 850){
			$('sidebar').css("display","none");
			$('header').css("display","block").css("position","absolute");
			$('.area2').css("display","none");
			$('#myPage2').css("display","none");
			$('.area').animate({
				top:"-70px"},200);
		}else{
			$('sidebar').css("display","block");			
			$('header').css("display","none");
			$('.area2').css("display","block");
			$('#myPage').css("display","none");
			$('.area').animate({
				top:"0px"},200);
		}
	});
	//창크기 조절 시 창 사이즈에 따른 사이드바 상태 변경
	$(window).resize(function(){
		newHeight = $(window).height();
		if(oldHeight < 850){
			if(newHeight >= 850){
				$('sidebar').css("display","block");
				$('header').css("display","none");
				$('.area2').css("display","block");
				$('#myPage').css("display","none");
				$('.area').animate({
					top:"0px"},200);
				oldHeight = $(window).height();
			}
		}else if(oldHeight >= 850){
			if(newHeight < 850){
				$('sidebar').css("display","none");
				$('header').css("display","block").css("position","absolute");
				$('.area2').css("display","none");
				$('#myPage2').css("display","none");
				$('.area').animate({
					top:"-70px"},200);				
				oldHeight = $(window).height();
			}
		}
	}).resize();
</script>
<!-- 사이드바 작성 -->
<sidebar>
	<div class="leftside_area">
		<div class="leftside_title">
			<a href="#"><img src="/img/header_logo2.png" width="100px" height="100px" style="vertical-align:middle;margin-left:50px;"></a>
			<a href="#" style="text-decoration:none;color:white;vertical-align:middle;">KS Futsal Park</a>
		</div>
		<div class="leftside_notice">
			<div style="background-color:black;margin:0 auto;width:400px;height:30px;display:block;border-radius:20px;">
				<img src="/img/notice_white.png" width="20px">
				<span id="no1"><a></a></span>
						 
			</div>
		</div>
		<div class="leftside_menu">
			<ul style="list-style-type:none;padding:0;">
				<li class="menu_item"><a href="/branch">지점</a></li>
				<li class="menu_item"><a href="/reservation">대관</a></li>
				<li class="menu_item"><a href="/matching">매치/용병</a></li>
				<li class="menu_item"><a href="/league">대회</a></li>
				<li class="menu_item"><a href="/gallery">갤러리</a></li>
				<li class="menu_item"><a href="/notice">커뮤니티</a></li>
				<li class="menu_item"><a href="/company">회사소개</a></li>
			</ul>
		</div>
		<div class="leftside_bar"></div>
<!-- 사이드바 접기/펼치기 작성 -->
		<div class="bar_button_area">
			<div class="bar_button" id="prev">
				<span class="prev_next"><img src="/img/prev_white.png" width="50px" ></span>
			</div>
			<div class="bar_button" id="next" style="display:none;">
				<span class="prev_next"><img src="/img/next_white.png" width="50px"></span>
			</div>
		</div>
	</div>
</sidebar>
<!-- 여기서부터 메인인덱스 헤더(높이가 일정 크기 이하일 때 사이드 -> 헤더로 전환) -->
<script>
	var oldWidth;
	var newWidth;
	$(document).ready(function(){
		//헤더 영역 사이즈
		$('.area').css("width","100%");
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
		oldWidth = $(window).width();
		if(oldWidth < 980){
			$('#menu').css("display","none");
			$('#menu_login').css("display","none");
			$('.toggle_bar').css("display","block");
		}else if(oldWidth >= 980 && oldWidth <= 1550){
			$('.right_area').css("display","none");			/* 토글 사이드바 사라짐 */
			$('#menu').css("display","block");				/* 메뉴 나타남 */
			$('#menu_login').css("display","block");		/* 로그인 버튼 나타남 */
			$('.toggle_bar').css("display","none");			/* 메뉴와 로그인을 담은 토글바 사라짐 */
			$('#menu').css("left","150px");
			$('.header_item').css("margin-right","20px");
			$('.header_item a').css("font-size","18px");			
		}
		//메뉴바 마우스 올렸을 때 opacity값 변경
		$('.menu_bar').mouseenter(function(){
			$('.menu_bar').animate({
				opacity:"0.9"
			},200);
		});
		$('.menu_bar').mouseleave(function(){
			if($('.right_area').css("display") == "none"){
				$('.menu_bar').animate({
					opacity:"0.5"
				},200);
			}
		});
	});
	//창크기 조절 시 창 사이즈에 따른 메뉴바 상태 변경
	$(window).resize(function(){
		newWidth = $(window).width();							/* newWidth(새 창 크기)에 현재 창 크기 저장 */
		if(oldWidth < 980){										
			if(newWidth >= 980 && newWidth <= 1550){		/* 예전 창크기가 980보다 작을 때 새 창크기가 980보다 크면 */
				$('.right_area').css("display","none");			/* 토글 사이드바 사라짐 */
				$('#menu').css("display","block");				/* 메뉴 나타남 */
				$('#menu_login').css("display","block");		/* 로그인 버튼 나타남 */
				$('.toggle_bar').css("display","none");			/* 메뉴와 로그인을 담은 토글바 사라짐 */
				$('#menu').css("left","150px");
				$('.header_item').css("margin-right","20px");
				$('.header_item a').css("font-size","18px");
				oldWidth = $(window).width();					/* oldWidth(예전 창 크기)에 현재 창 크기 저장 */
			}else if(newWidth > 1550){
				$('.right_area').css("display","none");			/* 토글 사이드바 사라짐 */
				$('#menu').css("display","block");				/* 메뉴 나타남 */
				$('#menu_login').css("display","block");		/* 로그인 버튼 나타남 */
				$('.toggle_bar').css("display","none");			/* 메뉴와 로그인을 담은 토글바 사라짐 */
				$('#menu').css("left","300px");
				$('.header_item').css("margin-right","50px");
				$('.header_item a').css("font-size","24px");
				oldWidth = $(window).width();					/* oldWidth(예전 창 크기)에 현재 창 크기 저장 */
			}
		}else if(oldWidth >=980 && oldWidth <=1550){
			if(newWidth < 980){
				$('#menu').css("display","none");
				$('#menu_login').css("display","none");
				$('.toggle_bar').css("display","block");
				oldWidth = $(window).width();
			}else if(newWidth > 1550){
				$('.right_area').css("display","none");			/* 토글 사이드바 사라짐 */
				$('#menu').css("display","block");				/* 메뉴 나타남 */
				$('#menu_login').css("display","block");		/* 로그인 버튼 나타남 */
				$('.toggle_bar').css("display","none");			/* 메뉴와 로그인을 담은 토글바 사라짐 */
				$('#menu').css("left","300px");
				$('.header_item').css("margin-right","50px");
				$('.header_item a').css("font-size","24px");
				oldWidth = $(window).width();					/* oldWidth(예전 창 크기)에 현재 창 크기 저장 */
			}
		}else if(oldWidth > 1550){
			if(newWidth >= 980 && newWidth <= 1550){				/* 예전 창크기가 980보다 작을 때 새 창크기가 980보다 크면 */
				$('.right_area').css("display","none");			/* 토글 사이드바 사라짐 */
				$('#menu').css("display","block");				/* 메뉴 나타남 */
				$('#menu_login').css("display","block");		/* 로그인 버튼 나타남 */
				$('.toggle_bar').css("display","none");			/* 메뉴와 로그인을 담은 토글바 사라짐 */
				$('#menu').css("left","150px");
				$('.header_item').css("margin-right","20px");
				$('.header_item a').css("font-size","18px");
				oldWidth = $(window).width();					/* oldWidth(예전 창 크기)에 현재 창 크기 저장 */
			}else if(newWidth < 980){
				$('#menu').css("display","none");
				$('#menu_login').css("display","none");
				$('.toggle_bar').css("display","block");
				oldWidth = $(window).width();
			}
		}
	}).resize();
	//스크롤바 내렸을 때 헤더 위치 변경
</script>
<style>
/* 메뉴 li설정 (script 사용 시 로딩하는 동안 li기본형 뜨는 문제 때문에 css로 직접 줌) */
	.area2{
		position: absolute;
		top:70px;
		right:20px;
	}
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
		font-weight: bolder;
	}
/* 토글 사이드바 숨김  */
	.right_area{
		display:none;
	}
	body{
		margin:0;
		padding:0;
		position:relative;
	}
	.right_menu_item{
		width:100%;
		height:50px;
	}
	.right_menu_item a{
		font-size: 30px;
		text-decoration: none;
		color:white;
	}
	#no1 a{
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
				$('.menu_bar').css("opacity","0.9");
				$('.right_area').animate({
					top:"-500px"},500);
			}else{				
				$('.right_area').css("display","none");
				$('.right_area').animate({
					top:"-500px"},500);
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
		$('#menu_login2').click(function(){
			if($("#myPage2").attr('class') != 'selectMyPage'){
				$("#myPage2").addClass('selectMyPage');
				$("#myPage2").css("display","inline-block");				
			}else{
				$("#myPage2").removeClass('selectMyPage');
				$("#myPage2").css("display","none");								
			}
		});
		$.ajax({
			url:"/indexNotice",
			dataType:'json',
			success:function(data){
					$("#no1").children().attr("href","/noticeView?reqPage=1&noticeNo="+data[0].noticeNo);
					$("#no1").children().html(data[0].noticeTitle);
					
			}
		});
			
		
	});
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
<script>
	/*카카오톡 로그아웃
	function kout(){
	alert("script");
	Kakao.Auth.logout(function(){
		setTimeout(function () {
			location.href="/https://kapi.kakao.com/v1/user/logout";
						
		},1000);
        });
	}*/
	
</script>
<header class="area2">
	<%if(m == null){ %>
	<div class="menu_bar2">
		<div id="menu_login2" style="float:right;margin-right:40px;">
			<button onclick="location.href='/views/login/login.jsp'" style="background-color:inherit;border:none;line-height:80px;">
				<span style="text-decoration:none;color:white;vertical-align:middle;">Member Login</span>			
				<span><img src="/img/login_logo2_white.png" width="50px" height="50px" style="vertical-align:middle;"></span>
			</button>
		</div>
	</div>
	<%}else{ %>
	<div class="menu_bar2">
 		<div id="menu_login2" style="float:right;width:100px;height:80px;margin-right:40px;">
			<div style="margin-left:16px;"><img src="/img/member_icon_100px_white.png" width="50px" height="50px" style="cursor:pointer;"></div>
 			<div><a style="text-decoration:none;color:white;cursor:pointer;"><%=m.getName()%> 님!</a></div>
 			<div id="myPage2" style="display:none;">
				<div style="width:300px;height:220px;position:absolute;right:0;top:110px;z-index:10;">
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
								<input onclick="location.href='/myPage?memberId=<%=m.getId()%>'" type="button" style="width:100px;height:40px;color:white;background-color:inherit;border:2px solid #3366cc;font-size:20px;line-height:10px;cursor:pointer;" value="MyPage">
									
								<%} %>
					</div>				
				</div>
				<div style="width:300px;height:220px;position:absolute;right:0;top:80px;opacity:0.5;">
					<img src="/img/textArea_black.png">
				</div>
			</div>
		</div>				
	</div>
	<%} %>
</header>

<header class="area">
<!-- 헤더 작성 -->
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
					<button onclick="location.href='/views/login/login.jsp'" style="background-color:inherit;border:none;line-height:80px;">
						<span style="text-decoration:none;color:white;vertical-align:middle;">Member Login</span>			
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
								<input onclick="location.href='/admin'" type="button" style="width:100px;height:40px;color:white;background-color:inherit;border:2px solid #3366cc;font-size:20px;line-height:10px;cursor:pointer;" value="관리자">
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
						<button onclick="loginLocation();" style="background-color:inherit;border:0;float:right;margin-right:30px;">
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
					<%} %>
				<%} %>
			</ul>
		</div>
	</nav>
	<script>
		function loginLocation(){
			location.href="/views/login/login.jsp";
		}
		$('#myPage').on("click",function(){
	
		});
	</script>
</header>
</html>