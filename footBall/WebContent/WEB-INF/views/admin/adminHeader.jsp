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
   <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
   <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/common/admin.css">
</head>
<body  style="margin: 0;">
      <div class="menu_bar" >
          <a href="/" id="header_logo2"><img src="/img/header_logo2.png" width="80px" id="header_logo2" style="left:50px;position:absolute;z-index:90;"></a>
          <div class="toggle_bar" style="width:70px;height:65px;float:right;margin-right:50px;margin-top:7px;cursor:pointer;display:none;">
             <div style="width:50px;height:8px;background-color:white;border-radius:10px;margin:10px;"></div>
             <div style="width:50px;height:8px;background-color:white;border-radius:10px;margin:10px;"></div>
             <div style="width:50px;height:8px;background-color:white;border-radius:10px;margin:10px;"></div>
          </div>
          <div>
          <ul id="menu" >
             <li class="header_item"><a href="/branch">지점</a>
             	<ul class="item_items">
             		<li><a href="/branchManage">지점관리</a></li>
             	</ul>
             </li>
             <li class="header_item"><a href="/reservation">대관</a>
             	<ul class="item_items">
             		<li><a href="/reservationManager" style="font-size:15px;font-weight:bolder;">예약/결제 취소</a></li>
             		<li><a href="/reservationCourtManager" style="font-size:15px;font-weight:bolder;">구장 등록</a></li>
             		<li><a href="/reservationGoodsManager" style="font-size:15px;font-weight:bolder;">지점별 물품등록</a></li>
             	</ul>
             </li>
             <li class="header_item"><a href="/matching">매치/용병</a>
             	<ul class="item_items">
             		<li><a href="#">ㅎㅇ</a></li>
             	</ul>
             </li>
             <li class="header_item"><a href="/league">대회</a>
             	<ul class="item_items">
             		<li><a href="#">ㅎㅇ</a></li>
             	</ul>
             </li>
             <li class="header_item"><a href="/gallery">갤러리</a>
             	<ul class="item_items">
             		<li><a href="/galleryWriteFrm">사진등록</a></li>
             		<li><a href="/adminGallery">사진삭제</a></li>
             	</ul>
             </li>
             <li class="header_item"><a href="/notice">공지사항</a>
             	<ul class="item_items">
             		<li><a href="/noticeWriter">공지 작성</a></li>
             		<li><a href="/noticeDeletePage">공지 삭제</a></li>
             	</ul>
             </li>
             <li class="header_item"><a href="/fAQ">FAQ</a>
             	<ul class="item_items">
             		<li><a href="/insertFAQ">FAQ 작성</a></li>
             		<li><a href="/noticeDeletePage">FAQ 삭제</a></li>
             	</ul>
             </li>
          </ul>
          </div>
             <%if(m == null){ %>
                <div id="menu_login" style=" float:right;width:80px;height:80px;margin-right:40px;">
                  <div style="margin-left:16px;"><a href="/views/login/login.jsp"><img src="/img/login_icon_100px_white.png" width="50px" height="50px"></a></div>
                   <div><a href="/views/login/login.jsp" style="text-decoration:none;color:white;">멤버 로그인</a></div>
               </div>
            <%}else{ %>
                <div id="menu_login" style=" float:right;width:80px;height:80px;margin-right:40px;">
                  <div style="margin-left:16px;"><img src="/img/member_icon_100px_white.png" width="50px" height="50px" style="cursor:pointer;"></div>
                   <div><a style="text-decoration:none;color:white;cursor:pointer;"><%=m.getName()%> 님!</a></div>
               </div>   
            <%} %>
      </div>
      <script>
         function loginLocation(){
            location.href="/views/login/login.jsp";
         }
      </script>
   <div id="myPage" style="display:none;">
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
            <input onclick="location.href='/admin'" type="button" style="width:100px;height:40px;color:white;background-color:inherit;border:2px solid #3366cc;font-size:20px;line-height:10px;cursor:pointer;" value="관리자">
         </div>            
      </div>
      <div style="width:300px;height:220px;position:absolute;right:0;top:80px;">
         <img src="/img/textArea_black.png">
      </div>
   </div>
</body>
<script>
   $(document).ready(function(){
      //헤더 영역 사이즈
      $('.area').css("width","100%");
      //헤더 영역 위치
      $('.area').css("box-sizing","border-box").css("float","left");
      $('.area').css("position","fixed");
      //메뉴바 사이즈
      $('.menu_bar').css("width","100%").css("height","80px");
      //메뉴바 컬러 및 투명도
      $('.menu_bar').css("background-color","black"); 
      
      $('#menu_login').click(function(){
         if($("#myPage").attr('class') != 'selectMyPage'){
            $("#myPage").addClass('selectMyPage');
            $("#myPage").css("display","inline-block");   
            console.log($('#myPage').attr('class'));
         }else{
            $("#myPage").removeClass('selectMyPage');
            $("#myPage").css("display","none");                        
            console.log($('#myPage').attr('class'));
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
</html>