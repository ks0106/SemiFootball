<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 동영상CSS  -->
<link rel='stylesheet' href="css/common/pageCss.css">
	<style>
		a { text-decoration: none; }
	    a:visited { text-decoration: none; }
	    a:hover { text-decoration: none; }
	    a:focus { text-decoration: none; }
	    a:hover, a:active { text-decoration: none; }
	    
		.mainImg {
			 border-radius: 10px;
			 width: 500px;
			 height: 320px;
			 margin-top:10px;
			 margin-left:10px;
			 margin-bottom:1px;
			 float: left;
		}
		.subImg {
			border-radius: 5px;
			width: 100px;
			height: 60px;
			margin-top: 5px;
			margin-left: 10px;
			float: left;
			cursor: pointer;
			opacity: 1;
			-webkit-transition: .3s ease-in-out;
			transition: .3s ease-in-out;
		}
		.subImg:hover {
			opacity: .5;
		}
		.icon {
			width:25px;
			height:25px;
		}
		.font-li {
			font-size: 25px;
			text-align: left;
			font-weight: bold;
			color: #446087;
		}
		.btn-link {
			display:inline-block; 
			text-align:center; 
			border-radius:10px; ;
			width:225px; 
			height:70px; 
			line-height:70px;
			text-decoration: none;
			background-color: #446087;
			color: white;
			
		}
		.content-container {
			position: absolute;
			width: 100%;
			height: 1000px;
			text-align: center;
		}
		.content-wrapper {
			position: relative;
			display: inline-block;
			margin-top:25px;
			width: 100%;
			height: 40%;
		}
		.content-left {
			float: left;
			width: 40%;
			height: 100%;
			padding-left:10%;
		}
		.content-right {
			float: left;
			width: 40%;
			height: 100%;
			padding-right:10%;
		}

	</style>
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