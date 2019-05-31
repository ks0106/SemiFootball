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
</head>
<script>
	$(document).ready(function(){
		$('#ground1').append('<img src="/img/ground1.png" alt="그라운드1" style="width:100%;height:500px;">');
		$('#ground2').append('<img src="/img/ground2.jpg" alt="그라운드2" style="width:100%;height:500px;">');
		$('#ground3').append('<img src="/img/ground3.jpg" alt="그라운드3" style="width:100%;height:500px;">');
		$('#ground4').append('<img src="/img/ground4.jpg" alt="그라운드4" style="width:100%;height:500px;">');
		$('#ground5').append('<img src="/img/ground5.jpg" alt="그라운드5" style="width:100%;height:500px;">');
	});
</script>
<style>
	.side_a{
		font-weight:bolder;
		font-size:18px;
		text-decoration:none;
		cursor:pointer;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!--영상 위 페이지 타이틀 -->
	<div id="title">
		대관
	</div>
	<section>
	<!-- 내용 작성 -->
		<hr style="border:3px solid #2c3c57;margin:0 auto;margin-bottom:30px;padding:0;">
		<!-- 컨텐츠 -->
		<div style="width:85%;background-color:white;margin:0 auto;overflow:hidden;">
		<!-- 컨텐츠 사이드 메뉴 -->
			<div style="width:20%;height:300px;text-align:left;display:inline-block;float:left;">
				<div style="font-size:30px;font-weight:bolder;color:#2c3c57;margin:0;margin-bottom:10px;">대관예약/확인</div>
				<hr style="width:80%;border:2px solid #2c3c57;margin-right:20%;padding:0;">
				<div style="margin-bottom:15px;">
					<a href="/reservation" class="side_a" id="side_menu1" style="color:#3366cc;">대관예약</a>
				</div>
				<div style="margin-bottom:15px;">
					<a class="side_a" id="side_menu2" style="color:#2c3c57;">예약확인</a>
				</div>
			</div><!-- 사이드 메뉴 종료 -->			
		<!-- 컨텐츠 -->
			<div style="width:78%;border-left:1px solid silver;display:inline-block;overflow:hidden;">
   		<!-- 컨텐츠 타이틀 -->
				<div style="font-size:60px;color:#403d3f;text-align: center;margin-bottom:20px;">${rfd.b.branchName}<대관예약> </div>
				<div class="underline" style="margin:0 auto;width:7%;text-align:center;border-top:2px solid #bfc4cc;margin-bottom:50px;"></div>
		<!-- 컨텐츠 본문 -->
				<div style="width:100%;height:150vh;">
					<div style="margin-left:10px;font-size:20px;font-weight:bolder;">예약 가능 일정</div>
					<hr style="margin-left:10px;width:120px;border:2px solid #2c3c57;padding:0;float:left;">
					<hr style="width:20px;border:2px solid #3366cc;padding:0;float:left;">
		<!-- 달력 -->
					<div style="margin-left:10px;margin-top:50px;position:absolute;top:680px;">
						<div style="width:590px;height:1500px;border: 1px solid darkgray;">
							<div style="border-bottom:1px solid darkgray;">
								<jsp:include page="/views/test/calendar.jsp"/>
							</div>
							<div style="width:90%;height:80px;margin:0 auto;display:table;">
								<div style="display:table-cell;vertical-align:middle;font-weight:bolder;font-size:18px;">날짜선택</div><span id="receipt-cal" style="display:table-cell;vertical-align:middle;font-size:20px;"></span>
							</div>
							<hr style="width:90%;height:1px;border:0;margin:0 auto;padding:0;background-color:darkgray;">
							<div style="width:90%;height:150px;margin:0 auto;">
								<div style="font-weight:bolder;font-size:18px;margin-top:30px;display:inline-block;">구장선택</div><span style="color:orangered;font-size:12px;float:right;">※구장을 선택하면 대관 가능 시간이 출력됩니다.</span>
								<select name="courtSelect" style="width:100%;height:50px;font-size:16px;padding:0;margin-top:10px;">
									<option value="default" selected>::: 구장선택 :::</option>
									<c:forEach items="${rfd.list}" var="r" varStatus="i">
										<option value="${r.courtCCode}">${r.courtName}</option>
									</c:forEach>
								</select>
							</div>
							<hr style="width:90%;height:1px;border:0;margin:0 auto;padding:0;background-color:darkgray;">
							<div style="width:90%;height:100px;margin:0 auto;">
								<div style="font-weight:bolder;font-size:18px;margin-top:30px;display:inline-block;">구장선택</div><span style="color:orangered;font-size:12px;float:right;">※구장을 선택하면 대관 가능 시간이 출력됩니다.</span>
								
							</div>
							<hr style="width:90%;height:1px;border:0;margin:0 auto;padding:0;background-color:darkgray;">
							<div style="width:90%;height:100px;margin:0 auto;">
							
							</div>
							<hr style="width:90%;height:1px;border:0;margin:0 auto;padding:0;background-color:darkgray;">
							<div style="width:90%;height:100px;margin:0 auto;">
							
							</div>
							<hr style="width:90%;height:1px;border:0;margin:0 auto;padding:0;background-color:darkgray;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

	<script>
		$(document).on("click",".future",function(){
			var month = $(this).parents('tr').siblings('tr').find('#tbCalendarYM').text();
			var day = parseInt($(this).text());
			var txt;
			if(day > 9){
				txt = month+"."+$(this).text();				
			}else{
				txt = month+"."+"0"+$(this).text();
			}
			$('#receipt-cal').text(txt);
		});
	</script>

</body>
</html>