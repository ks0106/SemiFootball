<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 동영상CSS  -->
<link rel='stylesheet' href="css/common/pageCss.css">
	<style>
		img {
			margin: 10px;
			border-radius: 5px;
		}
		.mainImg {
			 width: 100%;
			 height: 70%;
			 float: left;
		}
		.subImg {
			width: 100px;
			height: 70px;
			margin-left: 10px;
			float: left;
		}
		.content-container {
			position: absolute;
			top: 485px;
			width: 100%;
			height: 1000px;
			text-align: center;
		}
		.content-wrapper {
			position: relative;
			display: inline-block;
			margin-top: 50px;
			width: 70%;
			height: 40%;
			background-color: orange;
		}
		.content {
			float: left;
			width: 50%;
			height: 100%;
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
	<div class="content-container">
		<div class="content-wrapper">
			<div class="content">
				<img class="mainImg" src="" alt="mainIng"><br>
				<img class="subImg" src="img/branch_test.jpg" alt="subImg">
				<img class="subImg" src="img/branch_test2.jpg" alt="subImg">
				<img class="subImg" src="img/branch_test3.jpg" alt="subImg">
			</div>
			<div class="content">
				<span>testSpan</span>
			</div>
		</div>
		<div class="content-wrapper">
			안양점
		</div>
		<div class="content-wrapper">
			안산점
		</div>
	</div>
	<script>
		$(function(){
			$mainImgSrc = $('.subImg').eq(0).attr('src');
			$('.mainImg').attr('src',$mainImgSrc);
			$('.subImg').click(function(){
				$('.mainImg').attr('src',$(this).attr('src'));
			});
		});
	</script>
</body>
</html>