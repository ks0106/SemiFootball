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
		var m = $('#tbCalendarYM').text();
		var d = parseInt($('.select-cell').text());
		var t;
		if(d > 9){
			t = m+"."+d;
		}else{
			t = m+"."+"0"+d;
		}
		$('#receipt-cal').text(t);
		var result = t.replace(/\./gi,'/');
		var bCode = ${b.branchCode};
		$.ajax({
			url : "/reservationCourtList.do",
			type : "get",
			data : {result:result,bCode:bCode},
			success : function(data){
				var $select = $('#courtSelect');
				$select.find("option").not('#default').remove();
				for(var i=0;i<data.length;i++){
					var courtBCode = data[i].courtBCode;
					var courtCCode = data[i].courtCCode;
					var courtName = data[i].courtName;
					var courtStatus = data[i].courtStatus;
					var selected = "";
					$select.append('<option value="'+courtCCode+'">'+courtName+'</option>');
				}
			},
			error : function(){
				alert("실패");
			}
		});

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
				<div style="font-size:60px;color:#403d3f;text-align: center;margin-bottom:20px;">${b.branchName}<대관예약> </div>
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
							<div style="display:table;width:90%;margin:0 auto;margin-top:30px;">
								<div style="display:table-cell;vertical-align:middle;font-weight:bolder;font-size:18px;">날짜선택</div><span id="receipt-cal" style="display:table-cell;vertical-align:middle;font-size:20px;"></span>
							</div>
							<hr style="width:90%;height:1px;border:0;margin:0 auto;margin-top:30px;padding:0;background-color:darkgray;">
							<div style="width:90%;margin:0 auto;">
								<div style="font-weight:bolder;font-size:18px;margin-top:30px;display:inline-block;">구장선택</div><span style="color:orangered;font-size:12px;float:right;">※구장을 선택하면 대관 가능 시간이 출력됩니다.</span>
								<select id="courtSelect" name="courtSelect" style="width:100%;height:50px;font-size:16px;padding:0;margin-top:10px;border:1px solid lightgray;">
									<option id="default" value="default" selected>::: 구장선택 :::</option>
								</select>
							</div>
							<hr style="width:90%;height:1px;border:0;margin:0 auto;margin-top:30px;padding:0;background-color:darkgray;">
							<div style="width:90%;margin:0 auto;">
								<div style="font-weight:bolder;font-size:18px;margin-top:30px;display:inline-block;">시간선택</div><span style="color:orangered;font-size:12px;float:right;">※대관 가능한 시간만 표시됩니다.</span>
								<div id="courtTime" style="width:100%;padding:0;margin-top:10px;">
								</div>
							</div>
							<hr style="width:90%;height:1px;border:0;margin:0 auto;margin-top:30px;padding:0;background-color:darkgray;">
							<div style="width:90%;height:100px;margin:0 auto;">
							
							</div>
							<hr style="width:90%;height:1px;border:0;margin:0 auto;margin-top:30px;padding:0;background-color:darkgray;">
							<div style="width:90%;height:100px;margin:0 auto;">
							
							</div>
							<hr style="width:90%;height:1px;border:0;margin:0 auto;margin-top:30px;padding:0;background-color:darkgray;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

	<script>
		$(document).on("click",".future",function(){
			var month = $('#tbCalendarYM').text();
			var day = parseInt($(this).text());
			var txt;
			if(day > 9){
				txt = month+"."+day;
			}else{
				txt = month+"."+"0"+day;
			}
			$('#receipt-cal').text(txt);
			var result = txt.replace(/\./gi,'/');
			var bCode = ${b.branchCode};
			$.ajax({
				url : "/reservationCourtList.do",
				type : "get",
				data : {result:result,bCode:bCode},
				success : function(data){
					var $select = $('#courtSelect');
					$select.find("option").not('#default').remove();
					for(var i=0;i<data.length;i++){
						var courtBCode = data[i].courtBCode;
						var courtCCode = data[i].courtCCode;
						var courtName = data[i].courtName;
						var courtStatus = data[i].courtStatus;
						var selected = "";
						if(courtStatus == 0){
							$select.append('<option value="'+courtCCode+'">'+courtName+'</option>');
						}
					}
				},
				error : function(){
					alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
				}
			});
		});
		$('#courtSelect').change(function(){
			var cCode = $("#courtSelect").val();
			if(cCode != 'default'){
				$.ajax({
					url : "/reservationCourtSelect.do",
					type : "get",
					data : {cCode:cCode},
					success : function(data){
						var $select = $('#courtTime');
						$select.find("div").remove();
						for(var i=0;i<data.length;i++){
							var scheduleNo = data[i].scheduleNo;
							var scheduleCCode = data[i].scheduleCCode;
							var scheduleDate = data[i].scheduleDate;
							var scheduleStartTime = data[i].scheduleStartTime;
							var scheduleEndTime = data[i].scheduleEndTime;
							var scheduleCost = data[i].scheduleCost;
							var scheduleStatus = data[i].scheduleStatus;
							$select.append('<div class="scheduleList" id="'+scheduleNo+'" style="width:175px;height:60px;background-color:#2c3c57;color:white;display:inline-block;margin:1px;cursor:pointer;"><div style="text-align:center;padding:10px;">'+scheduleStartTime+'~'+scheduleEndTime+'<br>'+scheduleCost.toLocaleString()+'원</div></div>');
						}
					},
					error : function(){
						alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");					
					}
				});
			}
		});
	</script>

</body>
</html>