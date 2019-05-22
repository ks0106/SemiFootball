<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- JSTL 사용을 위한 import -->
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

	#mv{
		 position: fixed;
		 right: 0; bottom: 0;
       	 min-width: 100%; 
       	 min-height: 100%;
       	 width: auto;
       	 height: 100%;
      	 z-index: -100;
        background-size: cover;
        overflow: hidden;
	}	
	#video01{
		width:auto;
		height: auto;
		min-width: 100%; 
       	min-height: 100%;
	}
	
</style>
</head>
<body>
<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- section 안에 index 페이지 작성 -->
<!--영상배경  -->
	<div id="mv">
		<video id="video01" class="pblock" autoplay playsinline muted loop title "> 
			<source src="/img/main.mp4" type="video/mp4"> 
		</video>
	</div>
</body>
</html>
