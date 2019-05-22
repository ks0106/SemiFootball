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
	body{
		margin:0;
		padding:0;
		position: relative;
	}
	.area{
		width:100%;
		height:200px;
		position:absolute;
		box-sizing: border-box;
		float: left;
	}
	.menu_bar{
		width:100%;
		height:80px;
		margin-top:70px;
		background-color:black;
		opacity: 0.5;
	}
	#header_logo{
		top:0px;
		left:50px;
		position:absolute;
		z-index:100;
	}
	#header_logo2{
		left:50px;
		position:absolute;
	}
</style>
<header class="area">
<!-- 헤더 작성 -->
  	<img src="img/header_logo.png" width="180" height="180" id="header_logo">
	<div class="menu_bar">
 		<img src="img/header_logo2.png" width="80px" id="header_logo2">
		<nav>
		</nav>
	</div>
</header>
</html>