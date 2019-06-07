<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/common/pageCss.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
<script>
	$(document).ready(function(){
		$('#ground1').append('<img src="/img/ground1.png" alt="그라운드1" style="width:100%;height:500px;">');
		$('#ground2').append('<img src="/img/ground2.jpg" alt="그라운드2" style="width:100%;height:500px;">');
		$('#ground3').append('<img src="/img/ground3.jpg" alt="그라운드3" style="width:100%;height:500px;">');
		$('#ground4').append('<img src="/img/ground4.jpg" alt="그라운드4" style="width:100%;height:500px;">');
		$('#ground5').append('<img src="/img/ground5.jpg" alt="그라운드5" style="width:100%;height:500px;">');
		$('.side_nav:first').css("color","#3366cc");
		$('.side_nav a:first').css("color","#3366cc");
		$('#side_pr_menu').css("display","block");
		$('.side_a').click(function(){													/* 메뉴 클릭했을 때 */
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
		$('.side_nav').click(function(){
			$(this).css("color","#3366cc");
			$(this).children('a').css("color","#3366cc");
			$(this).siblings('li').css("color","silver");
			$(this).siblings('li').children('a').css("color","silver");
		});
		$('#side_menu1').click(function(){
			location.href="/reservation";
		});
		$('#side_menu2').click(function(){
			location.href="/reservationView";
		});
	});
</script>
<style>
	.side_nav{
		margin:5px;
		color:silver;
	}
	.side_nav a{
		text-decoration:none;
		color:silver;
		font-size:16px;
	}
	#side_menu1{
		display:block;
	}
	#side_pr_menu{
		list-style-type:square;
		padding:0;
		margin:0;
		margin-left:20px;
		display:none;
	}
	#mv{
		background-image: url("/img/ground1.png");
	}
</style>
<style>
	.side_nav{
		margin:5px;
		color:silver;
	}
	.side_nav a{
		text-decoration:none;
		color:silver;
		font-size:16px;
	}
	#side_menu1{
		display:block;
	}
	#side_pr_menu{
		list-style-type:square;
		padding:0;
		margin:0;
		margin-left:20px;
		display:none;
	}
	.insertLeagueBtn{
		width:200px;
		height: 50px;
		color:teal;
		border:none;
		background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%);
	}
	.th{
		width: 20%;
		border-bottom: 1px solid gray;
		padding-top : 10px;
		padding-bottom: 10px;
	}
	.td{
		padding: 16px;
		border-bottom: 1px solid #d5d8dd;
		height: 21px;
		font-size: 18px;
		line-height: 21px;
	}
	#imgView:hover{
		background-color: #F2F2F2;
		cursor: pointer;
	}
		#top1{
		position:absolute;
		width: 150px;
		height: 150px;
		border: 1px solid;
		top: 1%;
		left: 44%;
	}
	#top2{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 28%;
		left: 19%;
	}
	#top3{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 28%;
		left: 72%;
	}
	#top4{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 50%;
		left: 6%;
	}
	#top5{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 50%;
		left: 32%;
	}
	#top6{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 50%;
		left: 59%;
	}
	#top7{
	position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 50%;
		left: 85%;
	}
	#top8{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: -1%;
	}
	#top9{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: 13%;
	}
	#top10{
	position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: 26%;
	}
	#top11{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: 39%;
	}
	#top12{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: 52%;
	}
	#top13{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: 65%;
	}
	#top14{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: 78%;
	}
	#top15{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: 91%;
	}
	.lose{
		width:100%;
		height:100%;
		background-color:black;
		position:absolute;
		top:0%;
		left: 0%;
		opacity: 0.5;
		z-index: 2;
	}
	#content{
		display: none;
	}
</style>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!--영상 위 페이지 타이틀 -->
	<div id="title">
		대관
	</div>
	<section>
	<!-- 내용 작성 -->
		<hr style="border:3px solid #2c3c57;margin:0 auto;margin-bottom:30px;padding:0;">
		<!-- 컨텐츠 -->
		<div style="width:85%;background-color:white;margin:0 auto;">
		<!-- 컨텐츠 사이드 메뉴 -->
			<div style="width:20%;height:300px;text-align:left;display:inline-block;float:left;">
				<div style="font-size:30px;font-weight:bolder;color:#2c3c57;margin:0;margin-bottom:10px;">대관예약/확인</div>
				<hr style="width:80%;border:2px solid #2c3c57;margin-right:20%;padding:0;">
				<div style="margin-bottom:15px;">
					<a class="side_a" id="side_menu1" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">대관예약</a>
				</div>
				<div style="margin-bottom:15px;">
					<a class="side_a" id="side_menu2" style="color:#3366cc;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">예약확인</a>
				</div>
			</div><!-- 사이드 메뉴 종료 -->			
		<!-- 컨텐츠 본문 -->
   		<!-- 컨텐츠 본문 타이틀 -->
			<div style="width:78%;height:120vh;border-left:1px solid silver;display:inline-block;overflow:hidden;">
				<div style="font-size:60px;color:#403d3f;text-align: center;margin-bottom:20px;">예약확인</div>
				<div class="underline" style="margin:0 auto;width:7%;text-align:center;border-top:2px solid #bfc4cc;margin-bottom:50px;"></div>
		<!-- 컨텐츠 지점선택 파티션 -->
				<div  style="width:90%;margin:0 auto;margin-bottom:50px;">
				<div id="table-wrapper1" style="margin-bottom: 100px;text-align: center;">
					<p style="font-size: 30px; font-weight: bold;">주문장 목록</p>
					<table style="margin-top: 50px; border-top: 3px solid #2c3c57;border-bottom:3px solid #2c3c57; width: 80%; margin: 0 auto;border-collapse: collapse;">
						<tr>
							<th class="th">주문번호</th>
							<th class="th" colspan="2">날짜</th>
							<th class="th">금액</th>
							<th class="th">결제</th>
						</tr>
						<c:if test="${!empty list}">
							<c:forEach items="${list}" var="r" >
								<tr id="imgView" onclick="imgView('')">
									<td class="td">${r.resNo}</td>
									<td class="td" colspan="2">${r.resDate}</td>
									<td class="td">${r.resTotalCost}</td>
									<c:if test="${r.resPayment == 1}">
										<td class="td">결제완료</td>
									</c:if>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>			
					<!-- 페이지 네비 -->
						<div id="pageNavi" style="width:80%; margin:0 auto; margin-bottom: 100px;">${mpd.pageNavi }</div>
				</div>
				<div id="content">
				<!-- 타이틀자리 -->
				<div id="title-position" style="margin: 0 auto;width: 60%;text-align: center; font-size: 30px;"></div>
				<!-- 포스터자리 -->
				<div  style="width:700px;margin:0 auto;margin-bottom:50px;">
					<img id="poster"  width="100%" height="100%">
				</div>
				<!-- 대진표 배경 div  -->
					<div style="width: 90%;height:700px; background-image: url('/img/gametable.png');background-size: 100%; background-repeat:no-repeat;margin: 0 auto;position: relative;">
							<div id="top1"><img  style="width: 100%;height: 100%;"><div></div></div>
							<div id="top2" class="win2"><img  style="width: 100%;height: 100%;"><div></div></div>
							<div id="top3" class="win2"><img  style="width: 100%;height: 100%;"><div></div></div>
							<div id="top4" class="win4-1 win4"><img  style="width: 100%;height: 100%;"><div></div></div>
							<div id="top5" class="win4-1 win4"><img  style="width: 100%;height: 100%;"><div></div></div>
							<div id="top6" class="win4-1 win4"><img  style="width: 100%;height: 100%;"><div></div></div>
							<div id="top7" class="win4-1 win4"><img  style="width: 100%;height: 100%;"><div></div></div>
							<div id="top8" class="win8 win8-1"><img style="width: 100%;height: 100%;"><div></div></div>
							<div id="top9" class="win8 win8-1"><img style="width: 100%;height: 100%;"><div></div></div>
							<div id="top10" class="win8 win8-2"><img style="width: 100%;height: 100%;"><div></div></div>
							<div id="top11" class="win8 win8-2"><img style="width: 100%;height: 100%;"><div></div></div>
							<div id="top12" class="win8 win8-3"><img style="width: 100%;height: 100%;"><div></div></div>
							<div id="top13" class="win8 win8-3"><img style="width: 100%;height: 100%;"><div></div></div>
							<div id="top14" class="win8 win8-4"><img style="width: 100%;height: 100%;"><div></div></div>
							<div id="top15" class="win8 win8-4"><img style="width: 100%;height: 100%;"><div></div></div>
					
				</div>
			
			</div>
		</div>
	
				
			</div>
		</div>
	
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>