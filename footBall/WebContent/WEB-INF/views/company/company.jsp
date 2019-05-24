<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/css/common/pageCss.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

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
		<hr style="border:3px solid darkblue;margin:0 auto;margin-bottom:30px;padding:0;">
		<div style="height:300px;width:20%;background-color:skyblue;float:left;">
			<div style="width:80%;height:100%;margin:0 auto;box-sizing: border-box;">
				<div style="width:100%;height:50px;border:1px solid darkblue;"></div>
			</div>
		</div>
		<div style="height:800px;width:80%;background-color:gold;float:left;text-align:center;">
			<div style="width:80%;height:500px;background-color: pink;margin:0 auto;"></div>
		</div>
	
	
	
	
	
	
	
	
	
	
	</section>
</body>
</html>