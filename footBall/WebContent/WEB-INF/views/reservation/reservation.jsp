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
					<a class="side_a" id="side_menu1" style="color:#3366cc;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">대관예약</a>
				</div>
				<div style="margin-bottom:15px;">
					<a class="side_a" id="side_menu2" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">예약확인</a>
				</div>
			</div><!-- 사이드 메뉴 종료 -->			
		<!-- 컨텐츠 본문 -->
   		<!-- 컨텐츠 본문 타이틀 -->
			<div style="width:78%;border-left:1px solid silver;display:inline-block;overflow:hidden;">
   			<br><br>
				<div style="font-size:60px;color:#403d3f;text-align: center;margin-bottom:20px;">대관예약</div>
				<div class="underline" style="margin:0 auto;width:7%;text-align:center;border-top:2px solid #bfc4cc;margin-bottom:50px;"></div>
		<!-- 컨텐츠 지점선택 파티션 -->
				<div style="width:700px;height:400px;margin:0 auto;margin-bottom:100px;border-radius:10px;border:3px solid #2c3c57;">
					<div style="position:relative;width:100%;height:100px;background-color:#2c3c57;color:white;font-size:30px;font-weight:bolder;text-align:center;">
						<div style="width:100%;height:100%;position:absolute;top:25px;">원하는 지점을 선택하세요</div>
					</div>
					<div style="width:100%;height:350px;text-align:center;">
						<select name="reservation">
							<c:forEach items="${list}" var="b" varStatus="i">
								<option value="${b.branchCode}">${b.branchName}</option>
							</c:forEach>
						</select>		
					</div>
				</div>			
		
<!-- 				<div style="width:700px;height:400px;margin:0 auto;margin-bottom:100px;border-radius:10px;border:3px solid #2c3c57;">
					<div style="width:50%;height:100%;float:left;">
						<div style="width:100%;height:50px;background-color:#2c3c57;color:white;font-size:30px;font-weight:bolder;text-align:center;">지점 선택</div>
					</div>
					<div style="width:50%;height:100%;float:right;">
						<div style="width:100%;height:50px;background-color:#2c3c57;color:white;font-size:30px;font-weight:bolder;text-align:center;">검색</div>
					</div>
				</div>			
 -->			</div>
		</div>
	
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>