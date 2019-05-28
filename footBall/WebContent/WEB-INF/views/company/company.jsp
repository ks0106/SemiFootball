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
	#company_menu1{
		display:block;
	}
	#company_pr_menu{
		list-style-type:square;
		padding:0;
		margin:0;
		margin-left:20px;
		display:none;
	}
}</style>
<script>
	$(document).ready(function(){
		$('.company_nav:first').css("color","#3366cc");
		$('.company_nav a:first').css("color","#3366cc");
		$('#company_pr_menu').css("display","block");
		$('.company').click(function(){													/* 메뉴 클릭했을 때 */
			if($(this).siblings('ul').css("display") == "block"){						/* 메뉴 컬러가 연할 때 */
				$(this).siblings('ul').slideUp();										/* 메뉴 닫음 */
			}else{																		/* 메뉴 컬러가 진할 때 */
				$(this).siblings('ul').find('li:first,a:first').css("color","#3366cc");
				$(this).siblings('ul').find('li,a').not('li:first,a:first').css("color","silver");
				$(this).parents('div').siblings().children('ul').slideUp();				/* 다른 메뉴 닫음 */
				$(this).parents('div').siblings().children('a').css("color","#2c3c57");	/* 다른 메뉴 컬러 진하게 */
				$(this).siblings('ul').slideDown();										/* 메뉴 펼침 */
				$(this).css("color","#3366cc");											/* 컬러 연하게 */
			}
		});
		$('.company_nav').click(function(){
			$(this).css("color","#3366cc");
			$(this).children('a').css("color","#3366cc");
			$(this).siblings('li').css("color","silver");
			$(this).siblings('li').children('a').css("color","silver");
		});
	});
</script>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<!--헤더 밑 영상  -->
	<div id="container">
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
					<div style="margin-bottom:15px;">
						<a class="company" style="color:#3366cc;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">회사소개</a>
						<ul id="company_pr_menu">
							<li class="company_nav"><a href="#">KS Sports</a></li>
							<li class="company_nav"><a href="#">연혁</a></li>
						</ul>
					</div>
					<div style="margin-bottom:15px;">
						<a class="company" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">제휴제안</a>
					</div>
					<div style="margin-bottom:15px;">
						<a class="company" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">오시는 길</a>
					</div>
				</div>
				<div style="width:80%;height:300px;background-color:blue;float:right;">
					<div style="width:60%;height:500px;background-color:pink;margin:0 auto;float:left;"></div>
					<div style="width:400px;height:400px;background-color:yellow;margin:0 auto;float:right;">사진1</div>
				</div>
			</div>
		</center>
	
	
	
	
	
	
	
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</section>
</body>
</html>