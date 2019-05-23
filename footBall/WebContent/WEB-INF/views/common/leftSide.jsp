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
<style>
	body{
		margin:0;
		padding:0;
	}
	.leftside_area{
		position:fixed;
		display:table;
		float:left;
		width:550px;
		height:100%;
	}
	.leftside_title{
		position:absolute;
		display:inline-block;
		color:white;
		z-index:100;
		top:8%;
		font-size:40px;
		font-weight:bold;
	}
	.leftside_notice{
		position:absolute;
		width:100%;
		color:white;
		z-index:100;
		top:20%;
		text-align: center;
	}
	.leftside_menu{
		position:absolute;
		color:white;
		z-index:100;
		top:40%;
		left:30%;
	}
	.leftside_bar{
		position:absolute;
		width:500px;
		height:100%;
		background-color:black;
		opacity: 0.5;
	}
	.bar_button_area{
		display:table-cell;
		vertical-align: middle;
	}
	.bar_button{
		margin-left:500px;
		display:table;
		width:30px;
		height:150px;
		background-color:black;
		opacity:0.5;
		border-top-right-radius:10px;
		border-bottom-right-radius:10px;
		box-sizing: border-box;
		cursor: pointer;
	}
	.prev_next{
		display:table-cell;
		vertical-align: middle;
	}
	.menu_item a{
		color:white;
		text-decoration:none;
		font-size:50px;
		font-weight:bold;
	}
	@keyframes prev{
		from{
			margin-left:500px;
		}
		to{
			margin-left:0px;
		}
	}
	@keyframes next{
		from{
			margin-left:500px;
		}
		to{
			margin-left:0px;
		}
	}
</style>
<script>
	$(document).ready(function(){
		$('.bar_button').click(function(){
			if($(this).attr('id') == 'prev'){
				$(this).css("display","none");
				$('#next').css("display","table");
				$('.leftside_area').animate({
					left:"-500px"},500);
			}else{
				$(this).css("display","none");
				$('#prev').css("display","table");			
				$('.leftside_area').animate({
					left:"0px"},500);						
			}
		});		
	});
</script>
<!-- 사이드바 작성 -->
<body>
	<div class="leftside_area">
		<div class="leftside_title">
			<img src="/img/header_logo2.png">
			Football Mania	
		</div>
		<div class="leftside_notice">
			<div style="background-color:black;width:400px;height:30px;display:inline-block;border-radius:20px;">
				<img src="/img/notice_white.png" width="20px">
				공지사항 목록
			</div>
		</div>
		<div class="leftside_menu">
			<ul style="list-style-type:none;padding:0;">
				<li class="menu_item"><a href="/branch">지점</a></li>
				<li class="menu_item"><a href="/reservation">대관</a></li>
				<li class="menu_item"><a href="/matching">매치/클럽</a></li>
				<li class="menu_item"><a href="/league">대회</a></li>
				<li class="menu_item"><a href="/gallery">갤러리</a></li>
				<li class="menu_item"><a href="/notice">고객센터</a></li>
				<li class="menu_item"><a href="/company">회사소개</a></li>
			</ul>
		</div>
		<div class="leftside_bar"></div>
<!-- 사이드바 접기/펼치기 작성 -->
		<div class="bar_button_area">
			<div class="bar_button" id="prev">
				<span class="prev_next"><img src="/img/prev_white.png" width="50px" ></span>
			</div>
			<div class="bar_button" id="next" style="display:none;">
				<span class="prev_next"><img src="/img/next_white.png" width="50px"></span>
			</div>
		</div>
	</div>
</body>
</html>