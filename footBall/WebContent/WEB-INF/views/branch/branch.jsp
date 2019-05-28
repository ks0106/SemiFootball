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
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!--헤더 밑 영상  -->
	<div id="continer">
		<div id="mv">
			<video id="video01" class="pblock" autoplay playsinline muted loop
				title> <source src="/img/page3.mp4" type="video/mp4"></video>
		</div>
		<!--영상 위 페이지 타이틀 -->
		<div id="title">지점현황</div>
	</div>
	<section class="page_area">
		<div class="content-container">
			<c:forEach items="${list}" var="b" varStatus="status">
				<c:choose>
					<c:when test="${status.index %2 == 0 }">
						<div class="content-wrapper">
							<div class="content-left">
								<img class="mainImg" src="" alt="mainIng"><br>
								<img class="subImg" src="img/branch_test.jpg" alt="subImg">
								<img class="subImg" src="img/branch_test2.jpg" alt="subImg">
								<img class="subImg" src="img/branch_test3.jpg" alt="subImg">
							</div>
							<div class="content-right">
								<ul style="list-style-type: none;">
									<li class="font-li">${b.branchName }</li>
									<li class="font-li"><img class="icon" src="img/branch_pinIcon.png">${b.branchAddr }</li>
									<li class="font-li"><img class="icon" src="img/branch_phoneIcon.png">${b.branchPhone } / ${b.branchTel }</li>
									<li style="font-size: 25px; text-align:left; font-weight: bold;"><a class="btn-link" href="/branchInfo">지점 상세 정보</a></li>
								</ul>
							</div>
						</div>
					</c:when>
					<c:when test="${status.index %2 == 1 }">
						<div class="content-wrapper">
							<div class="content-left">
								<ul style="list-style-type: none;">
									<li class="font-li">${b.branchName }</li>
									<li class="font-li"><img class="icon" src="img/branch_pinIcon.png">${b.branchAddr }</li>
									<li class="font-li"><img class="icon" src="img/branch_phoneIcon.png">${b.branchPhone } / ${b.branchTel }</li>
									<li style="font-size: 25px; text-align:left; font-weight: bold;"><a class="btn-link" href="/branchInfo">지점 상세 정보</a></li>
								</ul>
							</div>
							<div class="content-right">
								<img class="mainImg" src="" alt="mainIng"><br>
								<img class="subImg" src="img/branch_test.jpg" alt="subImg">
								<img class="subImg" src="img/branch_test2.jpg" alt="subImg">
								<img class="subImg" src="img/branch_test3.jpg" alt="subImg">
							</div>
						</div>
					</c:when>
				</c:choose>
				
			</c:forEach>
		</div>
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