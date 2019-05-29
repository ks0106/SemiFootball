<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 동영상CSS  -->
<link rel='stylesheet' href="css/common/pageCss.css">
<link rel='stylesheet' href="css/branch/branch.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지점현황</title>
</head>
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		$('#ground1').append('<img src="/img/ground1.png" alt="그라운드1" style="width:100%;height:500px;">');
		$('#ground2').append('<img src="/img/ground2.jpg" alt="그라운드2" style="width:100%;height:500px;">');
		$('#ground3').append('<img src="/img/ground3.jpg" alt="그라운드3" style="width:100%;height:500px;">');
		$('#ground4').append('<img src="/img/ground4.jpg" alt="그라운드4" style="width:100%;height:500px;">');
		$('#ground5').append('<img src="/img/ground5.jpg" alt="그라운드5" style="width:100%;height:500px;">');
	 });
</script>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!--영상 위 페이지 타이틀 -->
	<div id="title">지점현황</div>
	<section class="page_area">
		<div class="content-container">
			<aside class="aside-bar">
				<div id="testSticky">지점안내</div>
			</aside>
			<c:forEach items="${list}" var="b" varStatus="status">
				<c:choose>
					<c:when test="${status.index %2 == 0 }">
						<form action="/branchInfo" method="get" enctype="multipart/form-data">
							<div class="content-wrapper">
								<div class="content-left">
									<ul style="list-style-type: none;">
										<li class="font-li">${b.branchName }</li>
										<li class="font-li"><img class="icon" src="img/branch/branch_pinIcon.png">${b.branchAddr }</li>
										<li class="font-li"><img class="icon" src="img/branch/branch_phoneIcon.png">${b.branchPhone } / ${b.branchTel }</li>
										<li style="text-align:left"><button class="btn-submit" type="submit">지점 상세 정보</button></li>
									</ul>
								</div>
								<div class="content-right">
									<img class="mainImg right" src="" alt="mainIng"><br>
									<img class="subImg right" src="img/branch/branch_test2.jpg" alt="subImg">
									<img class="subImg right" src="img/branch/branch_test.jpg" alt="subImg">
									<img class="subImg right" src="img/branch/branch_test2.jpg" alt="subImg">
									<img class="subImg right" src="img/branch/branch_test3.jpg" alt="subImg">
								</div>
								<input type="hidden" name="branchName" value="${b.branchName }">
							</div>
						</form>
					</c:when>
					<c:when test="${status.index %2 == 1 }">
						<form action="/branchInfo" method="get" enctype="miltipart/form-data">
							<div class="content-wrapper">
								<div class="content-left">
									<img class="mainImg left" src="" alt="mainIng"><br>
									<img class="subImg left" src="img/branch/branch_test.jpg" alt="subImg">
									<img class="subImg left" src="img/branch/branch_test2.jpg" alt="subImg">
									<img class="subImg left" src="img/branch/branch_test3.jpg" alt="subImg">
								</div>
								<div class="content-right">
									<ul style="list-style-type: none;">
										<li class="font-li">${b.branchName }</li>
										<li class="font-li"><img class="icon" src="img/branch/branch_pinIcon.png">${b.branchAddr }</li>
										<li class="font-li"><img class="icon" src="img/branch/branch_phoneIcon.png">${b.branchPhone } / ${b.branchTel }</li>
										<li style="text-align:left"><button class="btn-submit" type="submit">지점 상세 정보</button></li>
									</ul>
								</div>
								<input type="hidden" name="branchName" value="${b.branchName }">
							</div>
						</form>
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</section>
	<script>
		$(function(){
			$('.content-wrapper:odd div').css('background-color','#ececec');
			$mainImgSrc = $('.subImg').eq(0).attr('src');
			$('.mainImg').attr('src',$mainImgSrc);
			$('.subImg').click(function(){
				$(this).siblings().eq(0).attr('src',$(this).attr('src'));
			});
		});
	</script>
</body>
</html>