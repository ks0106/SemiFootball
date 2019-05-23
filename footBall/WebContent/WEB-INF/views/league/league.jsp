<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 동영상CSS  -->
<style>
	#video01{
		position:absolute;
		top:50%;
		left:50%; 
		min-width: 100%; 
		min-height: 100%; 
		transform:translateX(-50%) translateY(-55%);
		z-index:-1;
	}
	/* 페이지 타이틀  */
	#title{
		position:absolute;
		z-index: 100;
		font-size: 70px;
		font-weight:900;
		color: white;
		left: 10%;
		top: 400px;
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
			대회
		</div>
	</div>
</body>
</html>