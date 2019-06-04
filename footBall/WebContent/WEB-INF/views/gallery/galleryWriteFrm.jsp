  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
    <%
		Member m = (Member)session.getAttribute("member");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
   src="https://code.jquery.com/jquery-3.4.0.js"
   integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
   crossorigin="anonymous"></script>
   <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
   <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

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
</script>
<style>
   body{
      margin:0;
      padding:0;
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
   .area{
      position:absolute;
      top:0;
      z-index:3;
   }
   header{
      width:100%;
      height:80px;
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
   
</style>
<style>
	body{
		background : grey;
	}
	#galleryWriterTbl{
		background : #9ce6ff;
		border-collapse:collapse;
		color: black;
		text-align: center;
		margin-top: 300px;
	}
	#galleryWriterTbl th,td{
		border: 1px solid skyblue;
	}
	#input {
		width : 300px;
		height : 50px;
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
</script>
<body>
<header class="area">
<!-- 헤더 작성 -->
	<body>
   <header class="area">
   <!-- 헤더 작성 -->
      <div class="menu_bar">
          <a href="/" id="header_logo2"><img src="/img/header_logo2.png" width="80px" id="header_logo2" style="left:50px;position:absolute;z-index:90;"></a>
          <div class="toggle_bar" style="width:70px;height:65px;float:right;margin-right:50px;margin-top:7px;cursor:pointer;display:none;">
             <div style="width:50px;height:8px;background-color:white;border-radius:10px;margin:10px;"></div>
             <div style="width:50px;height:8px;background-color:white;border-radius:10px;margin:10px;"></div>
             <div style="width:50px;height:8px;background-color:white;border-radius:10px;margin:10px;"></div>
          </div>       
          <ul id="menu" style="position:absolute;left:150px;list-style-type:none;padding:0;">
             <li class="header_item"><a href="/branchManage">지점관리</a></li>
             <li class="header_item"><a href="/reservation">대관</a></li>
             <li class="header_item"><a href="/matching">매치/용병</a></li>
             <li class="header_item"><a href="/league">대회</a></li>
             <li class="header_item"><a href="/galleryWrite">갤러리 사진등록</a></li>
             <li class="header_item"><a href="/adminGallery">갤러리 사진 삭제</a></li>
             <li class="header_item"><a href="/noticeWrite">공지작성</a></li>
             <li class="header_item"><a href="#" style="display:none;">관리자메뉴</a></li>
          </ul>
             <%if(m == null){ %>
                <div id="menu_login" style="float:right;width:100px;height:100px;margin-top:5px;margin-right:20px;">
                  <div style="margin-left:16px;"><a href="/views/login/login.jsp"><img src="/img/login_icon_100px_white.png" width="50px" height="50px"></a></div>
                   <div><a href="/views/login/login.jsp" style="text-decoration:none;color:white;">멤버 로그인</a></div>
               </div>
            <%}else{ %>
                <div id="menu_login" style="float:right;width:100px;height:100px;margin-top:5px;margin-right:20px;">
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
   </header>
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
</header>

	<!--영상 위 페이지 타이틀 -->
	<div id="title" style="">
		사진등록{관리자}
	</div>
	<!-- 내용 -->
	<section class="page_area">
		<div class="table-wrapper" style="text-align:center; width:80%;margin:0 auto; height: 700px;">
			<form action="/insertGallery" method="post" enctype="multipart/form-data" style="height: 100%;">
				<table id="galleryWriterTbl" style ="text-align: center; width: 100%; height: 100%; border: 1px solid black">
					<tr >
						<th colspan="2" style="background: #31cdff;font-size:20px; font-weight: bold; ">사진 등록</th>
					</tr>
					<tr >
						<th >작성자</th>
						<td>
							${sessionScope.member.id }
							<input type="hidden" name="photoWriter" value="${sessionScope.member.id }">
						</td>
					</tr>
					<tr >
						<th>첨부파일</th>
						<td>
							<input type="file" name="filename" onchange="loadImg(this)">
						</td>
					</tr>
					<tr>
						<th>이미지 보기</th>
						<td>
							<div id="img-viewer">
								<img id="img-view" width="350">
							</div>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<button id="input" type="submit">등록하기</button>
						</th>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<script>
		function loadImg(f){
			if(f.files.length !=0 && f.files[0] !=0){
				//배열형태로 가지고 옴 //파일이 업로드 되면 이라는 조건 배열길이가 0이 아니거나 0번에 크기가 0이아니면
				//JS의 FileReader객체 -> 객체 내부의 result 속성에 파일 컨텐츠가 있음
				var reader = new FileReader();
				reader.readAsDataURL(f.files[0]); //선택한 파일 경로를 읽어옴
				reader.onload=function(e){ //다 읽어 왔으면 실행
					$("#img-view").attr('src', e.target.result);
				}
			}else{
				$("#img-view").attr('src','');
			}
		}
		
		$('#myPage').on("click",function(){

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
</body>
</html>