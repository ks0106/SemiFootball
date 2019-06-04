<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="area">
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
			 			<li class="header_item"><a href="/admin">관리자메뉴</a></li>
	 		</ul>

	 		<div id="menu_login" style="float:right;width:100px;height:100px;margin-top:5px;margin-right:20px;">
				<div style="margin-left:16px;"><a href="/views/login/login.jsp"><img src="/img/login_icon_100px_white.png" width="50px" height="50px"></a></div>
	 			<div><a href="/views/login/login.jsp" style="text-decoration:none;color:white;">멤버 로그인</a></div>
			</div>
		 		<div id="menu_login" style="float:right;width:100px;height:100px;margin-top:5px;margin-right:20px;">
					<div style="margin-left:16px;"><img src="/img/member_icon_100px_white.png" width="50px" height="50px" style="cursor:pointer;"></div>
		 			<div><a style="text-decoration:none;color:white;cursor:pointer;">${session.member.name } 님!</a></div>
		 			<div id="myPage" style="display:none;">
						<div style="width:300px;height:220px;position:absolute;right:0;top:180px;z-index:10;">
							<div style="color:white;text-align:center;font-size:20px;font-weight:bolder;">회원 정보</div>
							<div style="width:100%;margin:0 auto;box-sizing:border-box;">
								<hr style="width:85%;height:2px;border:0;margin:0;padding:0;background-color:white;display:inline-block;"><hr style="width:15%;height:2px;border:0;margin:0;padding:0;background-color:#3366cc;display:inline-block;">
							</div>
							<div style="color:white;text-align:center;">ID : ${session.member.id }</div>
							<div style="color:white;text-align:center;">Name : ${session.member.name }</div>
							<div style="color:white;text-align:center;">Phone : ${session.member.phone }</div>
							<div style="color:white;text-align:center;">가입일 : ${session.member.enrolldate }</div>				
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
		</div>
</body>
</html>