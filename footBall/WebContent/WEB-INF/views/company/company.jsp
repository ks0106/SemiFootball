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
				<div style="width:80%;height:300px;float:right;">
					<div style="width:55%;height:500px;margin:0 auto;float:left;border-left:1px solid silver;">
						<div style="margin-left:80px;margin-top:100px;font-size:18px;font-weight:bolder;color:#2c3c57;float:left;">
							<div style="width:5px;height:30px;float:left;">
								<div style="width:100%;height:80%;background-color:silver;"></div>
								<div style="width:100%;height:20%;background-color:#3366cc;"></div>
							</div>&nbsp;생활 스포츠 대중화와 꿈나무 육성, KS가 이끌겠습니다
						</div>
						<br><br>
						<div style="margin-left:80px;margin-top:100px;font-size:15px;color:#2c3c57;text-align:left;">
						KS스포츠는 2010년에 설립되어 생활 스포츠를 전파하고 바쁜 삶을 사는 현대인들의 체력 증진에 도움을 주기 위하여 꾸준히 다양한 변화를 시도하고 있습니다. 2012년부터 자체 대회를 개최하고 있고, 2013년에는 인원수와 시간에 구애받지 않고 운동에만 전념할 수 있도록 용병 시스템을 도입했습니다. 이를 통해 이성용, 기청용, 존 흥민, 앙의조, 조연우와 같은 선수들을 배출함으로써 한국 스포츠의 위상을 높임은 물론 국민생활건강 증진에도 기여하고 있습니다.
						</div>
					</div>
					<div style="width:400px;height:400px;margin:0 auto;float:right;overflow:hidden;border-radius:800px;"><img src="/img/ground3.jpg" height="400px"></div>
				</div>
				<div style="width:80%;height:300px;float:right;">
					<div style="width:400px;height:400px;margin:0 auto;float:right;overflow:hidden;border-radius:800px;"><img src="/img/ground3.jpg" height="400px"></div>
					<div style="width:55%;height:500px;margin:0 auto;float:left;border-left:1px solid silver;">
						<div style="margin-left:80px;margin-top:100px;font-size:18px;font-weight:bolder;color:#2c3c57;float:left;">
							<div style="width:5px;height:30px;float:left;">
								<div style="width:100%;height:80%;background-color:silver;"></div>
								<div style="width:100%;height:20%;background-color:#3366cc;"></div>
							</div>&nbsp;생활 스포츠 대중화와 꿈나무 육성, KS가 이끌겠습니다
						</div>
						<br><br>
						<div style="margin-left:80px;margin-top:100px;font-size:15px;color:#2c3c57;text-align:left;">
							KS스포츠는 2010년에 설립되어 생활 스포츠를 전파하고 바쁜 삶을 사는 현대인들의 체력 증진에 도움을 주기 위하여 꾸준히 다양한 변화를 시도하고 있습니다. 2012년부터 자체 대회를 개최하고 있고, 2013년에는 인원수와 시간에 구애받지 않고 운동에만 전념할 수 있도록 용병 시스템을 도입했습니다. 이를 통해 이성용, 기청용, 존 흥민, 앙의조, 조연우와 같은 선수들을 배출함으로써 한국 스포츠의 위상을 높임은 물론 국민생활건강 증진에도 기여하고 있습니다.
						</div>
					</div>
				</div>
			</div>
		</center>
	
	
	
	
	
	
	
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</section>
</body>
</html>