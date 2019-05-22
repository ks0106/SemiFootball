<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%
		Member m = (Member)session.getAttribute("member");
	%>
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
</head>
<style>
	.area{
		width:100%;
		height:200px;
	}
	.menu_bar{
		width:100%;
		height:80px;
		margin-top:70px;
		background-color:black;
		opacity: 0.5;
		position:relative;
	}
	#header_logo{
		top:0px;
		left:50px;
		position:absolute;
	}
</style>
<header class="area">
<!-- 헤더 작성 -->
	<img src="/img/header_logo.png" width="200" height="200" id="header_logo">
	<div class="menu_bar">
		<nav>
		</nav>
	</div>
</header>
</html>