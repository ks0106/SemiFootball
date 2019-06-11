<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
<!-- reservation 공통 js => jqeury를 이용하기 때문에 jquery import 밑으로 내려야 한다. -->
<script type="text/javascript" src="/js/reservation/reservationAll.js"></script>
<link rel="stylesheet" href="/css/common/pageCss.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KS 대관</title>
<script>
	$(document).ready(function() {
		/* 헤더 배경 이미지 */
		$('#menuImg').append('<img src="/img/common/ground5.jpg" alt="메인 이미지" style="width:100%;max-height:initial; margin-top:-9%; transform:scale(1.2); opacity:0.8;">');
		$('.side_nav:first').css("color", "#3366cc");
		$('.side_nav a:first').css("color", "#3366cc");
		$('#side_pr_menu').css("display", "block");
		$('.side_a').click(function() { /* 메뉴 클릭했을 때 */
			if ($(this).siblings('ul').css("display") == "block") { /* 메뉴 컬러가 연할 때 */
				$(this).siblings('ul').slideUp(); /* 메뉴 닫음 */
			} else { /* 메뉴 컬러가 진할 때 */
				$(this).siblings('ul').find('li:first,a:first').css("color", "#3366cc");
				$(this).siblings('ul').find('li,a').not('li:first,a:first').css("color", "silver");
				$(this).parents('div').siblings().children('ul').slideUp(); /* 다른 메뉴 닫음 */
				$(this).parents('div').siblings().children('a').css("color","#2c3c57"); /* 다른 메뉴 컬러 진하게 */
				$(this).siblings('ul').slideDown(); /* 메뉴 펼침 */
				$(this).css("color", "#3366cc"); /* 컬러 연하게 */
			}
		});
		$('.side_nav').click(function() {
			$(this).css("color", "#3366cc");
			$(this).children('a').css("color","#3366cc");
			$(this).siblings('li').css("color","silver");
			$(this).siblings('li').children('a').css("color", "silver");
		});
	});
	function reservationCheck() {
		if ($('select[name=reservationSelect]').val() == 'default'
				|| $('select[name=reservationSelect]').val() == null) {
			alert("지점을 선택해주세요!");
			return false;
		} else {
			return true;
		}
	}
</script>
<style>
#btn_Res:hover {
	animation-name: btn_color;
	animation-duration: 1s;
	animation-fill-mode: forwards;
}

.side_a {
	font-weight: bolder;
	font-size: 18px;
	text-decoration: none;
	cursor: pointer;
}

@
keyframes btn_color {from { background-color:#2c3c57;
	
}

to {
	background-color: #3366cc;
}

}
.side_nav {
	margin: 5px;
	color: silver;
}

.side_nav a {
	text-decoration: none;
	color: silver;
	font-size: 16px;
}

#side_menu1 {
	display: block;
}

#side_pr_menu {
	list-style-type: square;
	padding: 0;
	margin: 0;
	margin-left: 20px;
	display: none;
}

#mv {
	background-image: url("/img/ground1.png");
}

</style>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!--영상 위 페이지 타이틀 -->
	<div id="title">대관</div>
	<section> <!-- 내용 작성 -->
	<hr style="border: 3px solid #2c3c57; margin: 0 auto; margin-bottom: 30px; padding: 0;">
	<!-- 컨텐츠 -->
	<div style="width: 85%; background-color: white; margin: 0 auto;">
		<!-- 컨텐츠 사이드 메뉴 -->
		<div style="width: 20%; height: 300px; text-align: left; display: inline-block; float: left;">
			<div style="font-size: 30px; font-weight: bolder; color: #2c3c57; margin: 0; margin-bottom: 10px;">대관예약/확인</div>
			<hr style="width: 80%; border: 2px solid #2c3c57; margin-right: 20%; padding: 0;">
			<div style="margin-bottom: 15px;">
				<a class="side_a" id="side_menu1" style="color: #3366cc;">대관예약</a>
			</div>
			<div style="margin-bottom: 15px;">
				<a class="side_a" id="side_menu2" style="color: #2c3c57;">예약확인</a>
			</div>
		</div>
		<!-- 사이드 메뉴 종료 -->
		<!-- 컨텐츠 본문 -->
		<div
			style="width: 78%; border-left: 1px solid silver; display: inline-block; overflow: hidden;">
		<!-- 본문 타이틀 -->
			<div class="tab-content" >			
	  			<br><br>
				<p class="content-header">대관예약</p>
				<div class="underline"></div>
			</div>
		<!-- 본문타이틀 끝 -->
			<!-- 컨텐츠 지점선택 파티션 -->
			<div
				style="width: 700px; height: 400px; margin: 0 auto; margin-bottom: 100px; border-radius: 10px; border: 3px solid #2c3c57; background-color: rgb(235, 235, 235)">
				<!-- 지점선택 타이틀 -->
				<div
					style="width: 100%; height: 100px; background-color: #2c3c57; color: white; font-size: 30px; font-weight: bolder; position: relative;">
					<img src="/img/map_nav_white.png" style="margin-left: 120px;">
					<p style="float: right; margin-top: 25px; margin-right: 120px;">예약할
						지점을 선택하세요</p>
				</div>
				<!-- 지점선택 본문 -->
				<div style="width: 100%; height: 350px; text-align: center;">
					<!-- 지점선택 폼 -->
					<form style="margin-top: 75px;" action="/reservationForm"
						method="post" onsubmit="return reservationCheck();">
						<select name="reservationSelect"
							style="width: 400px; height: 50px; font-size: 20px; padding: 0; margin-left: 6px; border: 1px solid lightgray;">
							<option value="default" selected>::: 지점선택 :::</option>
							<c:forEach items="${list}" var="b" varStatus="i">
								<option value="${b.branchCode}">${b.branchName}</option>
							</c:forEach>
						</select> <br> <br>
						<button id="btn_Res" type="submit"
							style="width: 400px; height: 80px; padding: 0; font-size: 25px; background-color: #2c3c57; color: white; font-weight: bolder; border: none; line-height: 5px; cursor: pointer;">
							대관예약</button>
					</form>
				</div>
			</div>

			<!-- 				<div style="width:700px;height:400px;margin:0 auto;margin-bottom:100px;border-radius:10px;border:3px solid #2c3c57;">
					<div style="width:50%;height:100%;float:left;">
						<div style="width:100%;height:50px;background-color:#2c3c57;color:white;font-size:30px;font-weight:bolder;text-align:center;">지점 선택</div>
					</div>
					<div style="width:50%;height:100%;float:right;">
						<div style="width:100%;height:50px;background-color:#2c3c57;color:white;font-size:30px;font-weight:bolder;text-align:center;">검색</div>
					</div>
				</div>			
 -->
		</div>
	</div>

	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>