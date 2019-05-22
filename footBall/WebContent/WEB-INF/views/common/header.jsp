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
		position:relative;
	}
	.area{
		width:100%;
		height:200px;
		position:absolute;
		box-sizing:border-box;
		float:left;
	}
	.menu_bar{
		width:100%;
		height:80px;
		margin-top:70px;
		background-color:black;
		opacity:0.5;
	}
	.nav-item{
		color:white;
		display: inline-block;
		margin-right:50px;
		line-height:40px;
	}
	.nav-item a{
		font-size:24px;
		text-decoration: none;
		color:white;
	}
	.menu_bar:hover{
		animation-name:menubar;
		animation-duration:0.5s;
		animation-fill-mode:forwards;
	}
	@keyframes menubar{
		from{
			opacity:0.5;
		}
		to{
			opacity:0.9;
		}
	}
</style>
<header class="area">
<!-- 헤더 작성 -->
   	<a href="/"><img src="/img/header_logo.png" width="180" height="180" id="header_logo" style="top:0px;left:50px;position:absolute;z-index:100;"></a>
	<div class="menu_bar">
 		<a href="/"><img src="/img/header_logo2.png" width="80px" id="header_logo2" style="left:50px;position:absolute;z-index:90;opacity:1;"></a>
 		<ul id="menu" style="position:absolute;left:300px;list-style-type:none;padding:0;">
 			<li class="nav-item"><a href="#">지점</a></li>
 			<li class="nav-item"><a href="#">대관</a></li>
 			<li class="nav-item"><a href="#">매치/용병</a></li>
 			<li class="nav-item"><a href="#">대회</a></li>
 			<li class="nav-item"><a href="#">갤러리</a></li>
 			<li class="nav-item"><a href="#">고객센터</a></li>
 			<li class="nav-item"><a href="#">회사소개</a></li>
 			<li class="nav-item" style="display:none;">관리자메뉴</li>
 		</ul>
		<nav>
			
		</nav>
	</div>
</header>
</html>