<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/common/pageCss.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		$('.company_nav:first').css("color","#3366cc");
		$('.company_nav a:first').css("color","#3366cc");
	});
</script>
<style>
	.company_nav{
		margin:5px;
		color:silver;
	}
	.company_nav a{
		text-decoration:none;
		color:silver;
		font-size:16px;
	}
</style>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<!--헤더 밑 영상  -->
	<div id="continer">
		<div id="mv">
			<video id="video01" class="pblock" autoplay playsinline muted loop title> 
				<source src="/img/page3.mp4" type="video/mp4"> 
			</video>
		</div>
		<!--영상 위 페이지 타이틀 -->
		<div id="title">
			회사소개
		</div>
	</div>
	<section class="page_area">
	<!-- 내용 작성 -->
		<hr style="border:3px solid #2c3c57;margin:0 auto;margin-bottom:30px;padding:0;">
		<!-- center -->
		<center>
			<div style="width:85%;height:500px;background-color:white;margin:0 auto;">
				<div style="width:20%;height:300px;float:left;text-align:left;">
					<div style="font-size:30px;font-weight:bolder;color:#2c3c57;margin:0;margin-bottom:10px;">KS Sports</div>
					<hr style="width:80%;border:2px solid #2c3c57;margin-right:20%;padding:0;">
					<div style="margin-bottom:20px;">
						<a href="#" style="color:#3366cc;font-weight:bolder;font-size:18px;text-decoration:none;">회사소개</a>
						<ul style="list-style-type:square;padding:0;margin:0;margin-left:20px;">
							<li class="company_nav"><a href="#">KS Sports</a></li>
							<li class="company_nav"><a href="#">연혁</a></li>
							<li class="company_nav"><a href="#">CEO 인사말</a></li>
							<li class="company_nav"><a href="#">본사위치</a></li>
						</ul>
					</div>
					<div>
						<a href="#" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;">제휴제안</a>
					</div>
				</div>
				<div style="width:80%;height:300px;background-color:blue;float:right;">
					<div style="width:55%;height:500px;background-color:pink;margin:0 auto;margin-left:50px;float:left;"></div>
					<div style="width:35%;height:500px;background-color:yellow;margin:0 auto;margin-right:50px;float:right;">사진1</div>
				</div>
			</div>
		</center>
	
	
	
	
	
	
	
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</section>
</body>
</html>