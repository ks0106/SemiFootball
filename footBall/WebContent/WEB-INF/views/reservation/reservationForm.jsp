<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
<!-- reservation 공통 js => jqeury를 이용하기 때문에 jquery import 밑으로 내려야 한다. -->
<script type="text/javascript" src="/js/reservation/reservationAll.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	$(document).ready(function(){
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
				alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
			}
		});
	});
</script>
<style>
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

.side_a {
	font-weight: bolder;
	font-size: 18px;
	text-decoration: none;
	cursor: pointer;
}

.scheduleList {
	width: 175px;
	height: 60px;
	background-color: #2c3c57;
	color: white;
	display: inline-block;
	margin: 1px;
	cursor: pointer;
}

.scheduleSelect {
	width: 175px;
	height: 60px;
	background-color: #3366cc;
	color: white;
	display: inline-block;
	margin: 1px;
	cursor: pointer;
}

.reservationGoods {
	width: 45%;
	height: 30px;
	font-size: 15px;
	paddign: 0;
	margin: 0 auto;
	border: 1px solid lightgray;
	display: none;
}

.reservationOption {
	width: 25%;
	height: 30px;
	font-size: 15px;
	paddign: 0;
	margin: 0 auto;
	border: 1px solid lightgray;
	display: none;
}

.reservationAmount {
	width: 15%;
	height: 30px;
	font-size: 15px;
	padding: 0;
	margin: 0 auto;
	border: 1px solid lightgray;
	display: none;
}

.addBtn {
	width: 10%;
	height: 30px;
	background-color: darkgray;
	border: 0;
	color: white;
	font-weight: bolder;
	font-size: 15px;
	display: none;
}

</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!--영상 위 페이지 타이틀 -->
	<div id="title">대관</div>
	<section> <!-- 내용 작성 -->
	<hr
		style="border: 3px solid #2c3c57; margin: 0 auto; margin-bottom: 30px; padding: 0;">
	<!-- 컨텐츠 -->
	<div
		style="width: 85%; background-color: white; margin: 0 auto; overflow: hidden;">
		<!-- 컨텐츠 사이드 메뉴 -->
		<div
			style="width: 20%; height: 300px; text-align: left; display: inline-block; float: left;">
			<div
				style="font-size: 30px; font-weight: bolder; color: #2c3c57; margin: 0; margin-bottom: 10px;">대관예약/확인</div>
			<hr
				style="width: 80%; border: 2px solid #2c3c57; margin-right: 20%; padding: 0;">
			<div style="margin-bottom: 15px;">
				<a class="side_a" id="side_menu1" style="color: #3366cc;">대관예약</a>
			</div>
			<div style="margin-bottom: 15px;">
				<a class="side_a" id="side_menu2" style="color: #2c3c57;">예약확인</a>
			</div>
			<c:if test="${sessionScope.member.id == 'admin'}">
				<div style="margin-bottom: 15px;">
					<a class="side_a" id="side_menu3" style="color: #2c3c57;">[관리자] 대관 관리</a>
				</div>
			</c:if>
		</div>
		<!-- 사이드 메뉴 종료 -->
		<!-- 컨텐츠 -->
		<div
			style="width: 78%; border-left: 1px solid silver; display: inline-block; overflow: hidden;">
			<!-- 컨텐츠 타이틀 -->
			<div
				style="font-size: 60px; color: #403d3f; text-align: center; margin-bottom: 20px;">${b.branchName}<대관예약>
			</div>
			<div class="underline"
				style="margin: 0 auto; width: 7%; text-align: center; border-top: 2px solid #bfc4cc; margin-bottom: 50px;"></div>
			<!-- 컨텐츠 본문 -->
			<div style="width: 100%;">
				<!-- 주의사항 -->
				<div style="width:590px; border: 1px solid darkgray;float:right;margin-top:47px;color:#2c3c57;margin-bottom:30px;">
					<div>
						<img src="/img/ground4.jpg" width="590px" height="450px">
					</div>
					<div style="height:70px;background-color:#2c3c57;color:white;border:0;border-bottom:1px solid darkgray;font-weight:bolder;text-align:center;font-size:35px;line-height:70px;">환불규정</div>
					<div style="padding:20px;">
						<br>
						<div style="font-size:18px;font-weight:bolder;">
							1. 단순 대관날짜 변경은 불가하며 예약 취소 및 환불 규정에 의거해 환불 후 신규 대관일을 신청하셔야 합니다.
						</div><br>
						<div style="font-size:18px;font-weight:bolder;">
							2. 대관 당일에는 취소가 불가합니다.
						</div><br>
						<div style="font-size:18px;font-weight:bolder;">
							3. 환불 및 취소는 일일단위로 가능합니다.
						</div>
						<div>
							&nbsp;- 30일 ~ 21일 전 : 100% 환불 / 20일 ~ 16일 전 : 80% 환불
						</div>
						<div>
							&nbsp;- 15일 ~ 11일 전 : 60% 환불 / 10일 ~ 7일 전 : 50% 환불
						</div>
						<div>
							&nbsp;- 6일 ~ 4일 전 : 30% 환불 / 3일 전 ~ 당일 : 환불 불가
						</div><br>
						<div style="font-size:18px;font-weight:bolder;">
							4. 당일 환불은 천재지변으로 인한 경우에만 100% 환불됩니다.
						</div>
						<div>
							&nbsp;(호우경보, 대설경보, 태풍주의보, 태풍경보만 적용)
						</div>
						<br>
						<br>
						<br>
					</div>
					<div style="height:70px;background-color:#2c3c57;color:white;border:0;border-top:1px solid darkgray;border-bottom:1px solid darkgray;font-weight:bolder;text-align:center;font-size:35px;line-height:70px;">확인사항</div>
					<div style="padding:20px;">
						<br>
						<div style="font-size:18px;font-weight:bolder;">
							1. 주의사항
						</div>
						<div>
							&nbsp;* 예약후 2시간이내 입금해주셔야 합니다.확인이안되면 취소됩니다.
						</div>
						<div>
							&nbsp;* 예약후 진행이 어려울실경우 사이트에서 꼭 취소 해주셔야 합니다.
						</div>
						<div>
							&nbsp;* 당일예약은 예약 후 바로 입금 부탁드립니다.
						</div>
						<div>
							&nbsp;* 예약자와 입금자 이름이 다를 경우 반드시 전화주세요.
						</div>
						<div>
							&nbsp;* 우천시에는  풋살화는 대여 하지 않습니다.
						</div>
						<div>
							&nbsp;* 예약 시 이름과 전화번호 정확하게 기입 부탁드립니다.
						</div><br>
						<div style="font-size:18px;font-weight:bolder;">
							2. 문의 전화 : 02-3337-4380 / 010-3337-4380
						</div>
						<div>
							&nbsp;* 가능시간 : 10:00 ~ 18:00
						</div>
						<br>
						<div style="font-size:18px;font-weight:bolder;">
							3. 행사 목적 대관 신청 시 담당자와 사전 문의 바랍니다.
						</div><br>
						<div style="font-size:18px;font-weight:bolder;">
							4. 전 구역 금연지역입니다.
						</div>
						<div>
							&nbsp;! 흡연구역 외 경기장내 흡연 적발 시 대관 취소 및 환불 불가
						</div><br>
						<div style="font-size:18px;font-weight:bolder;">
							5. 화장실은 매장 2층에 위치해 있습니다.
						</div>
						<div>
							&nbsp;! 노상방뇨 적발시 대관 취소 및 환불 불가 => 전구역CCTV작동중
						</div><br>
						<div style="font-size:18px;font-weight:bolder;">
							6. 경기장 내 음료 및 음식물 반입 금지
						</div>
						<div>
							&nbsp;* 물, 탄산수 제외
						</div><br>
						<div style="font-size:18px;font-weight:bolder;">
							7. 주차는 경기장 앞 7층 주차장을 이용하시기 바랍니다.
						</div><br>
						<div style="font-size:18px;font-weight:bolder;">
							8. 현장 카드결제 가능합니다. 현금영수증 발행은 현장 결제 시 가능합니다.
						</div><br>
						<div style="font-size:18px;font-weight:bolder;">
							9. 본 KS풋살파크는 CCTV로 촬영되고 있습니다.
						</div><br>
						<div style="font-size:18px;font-weight:bolder;">
							10.분실물에 대한 책임은 본인에게 있습니다.
						</div><br>
						<div style="font-size:18px;font-weight:bolder;">
							11. 장비는 직접 지참 혹은 대여하실 수 있습니다. 공은 구장마다 마련되어있습니다.
						</div>
						<div>
							&nbsp;! 대여한 물품은 반드시 반납해주시기 바랍니다
						</div><br>
						<div style="font-size:18px;font-weight:bolder;">
							12. 풋살화 이외 축구화는 착용불가합니다.(잔디보호)
						</div><br>
						<div style="font-size:18px;font-weight:bolder;">
							13. 야간 대관 이용 시 소음 관련 민원이 발생 할 수 있으니 고성, 욕설 등은 삼가해 주시기 바랍니다.
						</div>
						<br>
					</div>
				</div>
			
				<div style="margin-left: 10px; font-size: 20px; font-weight: bolder;">예약가능 일정</div>
				<hr style="margin-left: 10px; width: 120px; border: 2px solid #2c3c57; padding: 0; float: left;">
				<hr style="width: 20px; border: 2px solid #3366cc; padding: 0; float: left;">
				<!-- 달력 -->
				<div
					style="margin-left: 10px;display:inline-block;margin-bottom:30px;">
					<div style="width: 590px; border: 1px solid darkgray;display:inline-block;">
						<div style="border-bottom: 1px solid darkgray;">
							<jsp:include page="/views/test/calendar.jsp" />
						</div>
						<div
							style="display: table; width: 90%; margin: 0 auto; margin-top: 30px;">
							<div
								style="display: table-cell; vertical-align: middle; font-size: 18px;">날짜선택</div>
							<span id="receipt-cal"
								style="display: table-cell; vertical-align: middle; font-size: 20px;"></span>
						</div>
						<hr
							style="width: 90%; height: 1px; border: 0; margin: 0 auto; margin-top: 30px; padding: 0; background-color: darkgray;">
						<div style="width: 90%; margin: 0 auto;">
							<div
								style="font-size: 18px; margin-top: 30px; display: inline-block;">구장선택</div>
							<span style="color: red; font-size: 15px; float: right;">※구장을
								선택하면 대관 가능 시간이 출력됩니다.</span> <select id="courtSelect"
								name="courtSelect"
								style="width: 100%; height: 50px; font-size: 16px; padding: 0; margin-top: 10px; border: 1px solid lightgray;">
								<option id="default" value="default" selected>::: 구장선택
									:::</option>
							</select>
						</div>
						<hr
							style="width: 90%; height: 1px; border: 0; margin: 0 auto; margin-top: 30px; padding: 0; background-color: darkgray;">
						<div style="width: 90%; margin: 0 auto;">
							<div
								style="font-size: 18px; margin-top: 30px; display: inline-block;">시간선택</div>
							<span id="referenceText2"
								style="color: red; font-size: 15px; float: right;">※대관
								가능한 시간만 표시됩니다.</span>
							<div id="courtTime"
								style="width: 100%; padding: 0; margin-top: 10px;"></div>
						</div>
						<hr
							style="width: 90%; height: 1px; border: 0; margin: 0 auto; margin-top: 30px; padding: 0; background-color: darkgray;">
						<div style="width: 90%; margin: 0 auto;">
							<div
								style="font-size: 18px; margin-top: 30px; display: inline-block;">물품대여
								및 구매</div>
							<span id="referenceText3"
								style="color: red; font-size: 15px; float: right;">※필수
								선택사항이 아닙니다.</span>
							<div style="width: 90%; margin: 0 auto; margin-top: 30px;">
								<div style="margin-top: 20px;">
									<label><input type="checkbox" class="checkGoods"
										id="checkWater">물</label><span
										style="font-size: 13px; float: right;">구매 가능 수량 : <span
										class="goodsCount"></span>개
									</span><br> <select class="reservationGoods"
										id="reservationWater" name="reservationWater">
										<option id="default" value="default" selected>::: 제품
											선택 :::</option>
									</select> <select class="reservationOption" id="reservationWaterOption"
										name="reservationWaterOption">
										<option id="default" value="default" selected>::: 옵션
											선택 :::</option>
									</select> <input type="number" class="reservationAmount"
										id="reservationWaterAmount" name="reservationWaterAmount"
										placeholder="수량" min="1"> <input class="addBtn"
										id="addWater" type="button" value="추가">
								</div>
								<div style="margin-top: 20px;">
									<label><input type="checkbox" class="checkGoods"
										id="checkVest">조끼</label><span
										style="font-size: 13px; float: right;">구매 가능 수량 : <span
										class="goodsCount"></span>개
									</span><br> <select class="reservationGoods" id="reservationVest"
										name="reservationVest">
										<option id="default" value="default" selected>::: 제품
											선택 :::</option>
									</select> <select class="reservationOption" id="reservationVestOption"
										name="reservationVestOption">
										<option id="default" value="default" selected>::: 옵션
											선택 :::</option>
									</select> <input type="number" class="reservationAmount"
										id="reservationVestAmount" name="reservationVestAmount"
										placeholder="수량" min="0"> <input class="addBtn"
										id="addVest" type="button" value="추가">
								</div>
								<div style="margin-top: 20px;">
									<label><input type="checkbox" class="checkGoods"
										id="checkShoes">신발</label><span
										style="font-size: 13px; float: right;">구매 가능 수량 : <span
										class="goodsCount"></span>개
									</span><br> <select class="reservationGoods"
										id="reservationShoes" name="reservationShoes">
										<option id="default" value="default" selected>::: 제품
											선택 :::</option>
									</select> <select class="reservationOption" id="reservationShoesOption"
										name="reservationShoesOption">
										<option id="default" value="default" selected>::: 옵션
											선택 :::</option>
									</select> <input type="number" class="reservationAmount"
										id="reservationShoesAmount" name="reservationShoesAmount"
										placeholder="수량" min="1"> <input class="addBtn"
										id="addShoes" type="button" value="추가">
								</div>
							</div>
						</div>
						<hr
							style="width: 90%; height: 1px; border: 0; margin: 0 auto; margin-top: 30px; padding: 0; background-color: darkgray;">
						<div id="reservationReceipt"
							style="width: 90%; margin: 0 auto; margin-top: 30px; margin-bottom: 30px;">
							<div id="reservationAllCost"
								style="font-size: 18px; width:100%;color:#3366cc;">
								합계<span style="font-size: 20px; float: right;"><span
									id="allCost">0</span>원</span>
							</div>
						</div>
					</div>
					<div>
						<button onclick="location.href='/reservation'"
							style="width: 100px; height: 40px; border: 2px solid darkgray; background-color: darkgray; padding: 0; margin-top: 5px; font-weight: bolder; font-size: 16px; border-radius: 2px; line-height: 30px; color: white;">취소</button>
						<button
							style="width: 100px; height: 40px; border: 2px solid #2c3c57; background-color: #2c3c57; padding: 0; margin-top: 5px; margin-left: 281px; font-weight: bolder; font-size: 16px; border-radius: 2px; line-height: 30px; color: white;">장바구니</button>
						<button id="paymentBtn"
							style="width: 100px; height: 40px; border: 2px solid #2c3c57; background-color: #2c3c57; padding: 0; margin-top: 5px; font-weight: bolder; font-size: 16px; border-radius: 2px; line-height: 30px; color: white;">결제하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
		<form id="paymentGo" action="/reservationPaymentPage" method="post" style="visibility:hidden;">
			
		</form>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		/* 합계 금액을 저장하는 변수 */
		var allCost = 0;
		/* 년/월/일을 하나로 합쳐 저장하는 변수 */
		var txt;
		$(document).ready(function(){
			var month = $('#tbCalendarYM').text();
			var day = parseInt($('.select-cell').text());
			if(day > 9){
				txt = month+"."+day;
			}else{
				txt = month+"."+"0"+day;
			}
			$('#receipt-cal').text(txt);			
		});
		/* 동적 개체인 달력을 클릭했을 때 동작하는 함수 */
		$(document).on("click",".future",function(){
			/* 시간선택 안내 초기화 */
			$('#referenceText2').text('※대관 가능한 시간만 표시됩니다.');
			$('#referenceText2').css("color","red");
			/* 영수증 초기화 */
			var $receipt = $('#reservationReceipt');
			$receipt.find("div").not('#reservationAllCost').remove();
			/* 합계 금액 초기화 */
			allCost = 0;
			$('#allCost').html(allCost.toLocaleString());				
			/* 달력 함수 */
			month = $('#tbCalendarYM').text();
			day = parseInt($(this).text());
			if(day > 9){
				txt = month+"."+day;
			}else{
				txt = month+"."+"0"+day;
			}
			$('#receipt-cal').text(txt);
			var $select = $('#courtTime');
			$select.find("div").remove();
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
			/* 물품대여 및 구매 초기화 */
			$('.checkGoods').prop('checked', false);
			$('.reservationGoods').css("display","none");
			$('.reservationOption').css("display","none");
			$('.reservationAmount').css("display","none");
			$('.addBtn').css("display","none");
			$('.reservationAmount').val('');
			$('.goodsCount').text('');
		});
		
		/* 구장 선택 select가 변경되었을 때 동작하는 함수 */
		$('#courtSelect').change(function(){
			/* 영수증 초기화 */
			var $receipt = $('#reservationReceipt');
			$receipt.find("div").not('#reservationAllCost').remove();
			/* 합계 금액 초기화 */
			allCost = 0;
			$('#allCost').html(allCost.toLocaleString());				
			/* 구장 선택 함수 */
			var result = txt.replace(/\./gi,'/');
			var cCode = $("#courtSelect").val();
			if(cCode != 'default'){
				$.ajax({
					url : "/reservationCourtSelect.do",
					type : "get",
					data : {cCode:cCode,result:result},
					success : function(data){
						var $select = $('#courtTime');
						$select.find("div").remove();
						$('#referenceText2').text('※한 타임에 두 시간, 여러 타임 예약 가능합니다.');
						$('#referenceText2').css("color","#3366cc");
						if(data.length > 0){
							for(var i=0;i<data.length;i++){
								var scheduleNo = data[i].scheduleNo;
								var scheduleCCode = data[i].scheduleCCode;
								var scheduleDate = data[i].scheduleDate;
								var scheduleStartTime = data[i].scheduleStartTime;
								var scheduleEndTime = data[i].scheduleEndTime;
								var scheduleCost = data[i].scheduleCost;
								var scheduleStatus = data[i].scheduleStatus;
								if(scheduleStatus == 0){
									$select.append('<div class="scheduleList" id="scheduleNo'+scheduleNo+'"><div style="text-align:center;padding:10px;"><span class="startTime">'+scheduleStartTime+'</span>~<span class="endTime">'+scheduleEndTime+'</span><br><span class="reservationCost">'+scheduleCost.toLocaleString()+'</span>원</div></div>');
								}
							}							
						}else{
							$select.append('<div style="width:100%;color:red;display:inline-block;margin:1px;cursor:pointer;">선택하신 구장의 모든 시간이 마감되었습니다.</div>');
						}
					},
					error : function(){
						alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");					
					}
				});
				$('.checkGoods').prop('checked', false);
				$('.reservationGoods').css("display","none");
				$('.reservationOption').css("display","none");
				$('.reservationAmount').css("display","none");
				$('.addBtn').css("display","none");
				$('.reservationAmount').val('');
				$('.goodsCount').text('');
			}else{
				var $select = $('#courtTime');
				$select.find("div").remove();
				$('#referenceText2').text('※대관 가능한 시간만 표시됩니다.');
				$('#referenceText2').css("color","red");
				$('.checkGoods').prop('checked', false);
				$('.reservationGoods').css("display","none");
				$('.reservationOption').css("display","none");
				$('.reservationAmount').css("display","none");
				$('.addBtn').css("display","none");
				$('.reservationAmount').val('');
				$('.goodsCount').text('');
			}
		});
		/* 시간선택 버튼을 누른 경우 */
		$(document).on("click",".scheduleList",function(){
			$(this).addClass('scheduleSelect');
			$(this).removeClass('scheduleList');
			allCost += parseInt($(this).find('.reservationCost').html().replace(",",""));
			$('#allCost').html(allCost.toLocaleString());	
			
			/* 영수증 초기화 */
			var scheduleNo = $(this).attr('id');
			var $receipt = $('#reservationAllCost');
			var newTime = parseInt($(this).find('.startTime').text().replace(":",""));
			var reservationCount = $('.reservationStartTime').length;
			if(reservationCount > 0){
				for(var i=0;i<reservationCount;i++){
					var $addReceipt = $('.reservationReceiptList:eq('+i+')');
					var oldTime = parseInt($('.reservationReceiptList:eq('+i+')').find('.reservationStartTime').text().replace(":",""));
					if(oldTime < newTime){
						if(i == reservationCount -1){
							$receipt.before('<div name="'+scheduleNo+'" class="reservationReceiptList" style="font-size:18px;width:100%;float:left;color:gray;">대관(<span class="reservationStartTime">'+$(this).find('.startTime').text()+'</span>~<span class="reservationEndTime">'+$(this).find('.endTime').text()+'</span>)<span style="font-size:20px;float:right;"><span class="reservationCostNum">'+$(this).find('.reservationCost').text()+'</span>원</span></div>');					
							i = reservationCount+1;
						}
					}else{
						$addReceipt.before('<div name="'+scheduleNo+'" class="reservationReceiptList" style="font-size:18px;width:100%;float:left;color:gray;">대관(<span class="reservationStartTime">'+$(this).find('.startTime').text()+'</span>~<span class="reservationEndTime">'+$(this).find('.endTime').text()+'</span>)<span style="font-size:20px;float:right;"><span class="reservationCostNum">'+$(this).find('.reservationCost').text()+'</span>원</span></div>');					
						i = reservationCount+1;
					}
				}
			}else{
				$receipt.before('<div name="'+scheduleNo+'" class="reservationReceiptList" style="font-size:18px;width:100%;float:left;color:gray;">대관(<span class="reservationStartTime">'+$(this).find('.startTime').text()+'</span>~<span class="reservationEndTime">'+$(this).find('.endTime').text()+'</span>)<span style="font-size:20px;float:right;"><span class="reservationCostNum">'+$(this).find('.reservationCost').text()+'</span>원</span></div>');									
			}
			
		});
		
		/* 시간선택 버튼을 눌렀는데 이미 선택되어있는 경우 */
		$(document).on("click",".scheduleSelect",function(){
			$(this).addClass('scheduleList');
			$(this).removeClass('scheduleSelect');
			allCost -= parseInt($(this).find('.reservationCost').html().replace(",",""));
			$('#allCost').html(allCost.toLocaleString());	

			var scheduleNo = $(this).attr('id');
			var $receipt = $('#reservationReceipt');
			$receipt.find("div[name="+scheduleNo+"]").remove();			
			if($(this).siblings('.scheduleSelect').attr('class') != 'scheduleSelect'){
				$('.reservationGoods').css("display","none");
				$('.reservationOption').css("display","none");
				$('.reservationAmount').css("display","none");
				$('.addBtn').css("display","none");
				$('.reservationAmount').val('');
				$('.goodsCount').text('');
				$('.checkGoods').prop('checked',false);				
				var scheduleNo = $(this).attr('id');
				$('#reservationReceipt').find('div').not('#reservationAllCost').remove();
				allCost = 0;
				$('#allCost').html(allCost.toLocaleString());	
			}

		});
		
		/* 물품대여 체크박스 체크했을 때 동작하는 함수 */
		$('.checkGoods').on("click",function(e){
			var result = $(this).parents('label').text();
			var bCode = ${b.branchCode};
			var $select = $(this).parents().siblings('.reservationGoods');
			$select.find("option").not('#default').remove();

			if($('#courtTime').children('.scheduleSelect').attr('class') == 'scheduleSelect'){
				if($(this).is(':checked') == true){
					$(this).parents().siblings('.reservationGoods').css("display","inline-block");
					
					$.ajax({
						url : "/reservationGoodsList.do",
						type : "get",
						data : {result:result,bCode:bCode},
						success : function(data){
							for(var i=0;i<data.length;i++){
								var goodsBCode = data[i].goodsBCode;
								var goodsCategory = data[i].goodsCategory;
								var goodsName = data[i].goodsName;
								$select.append('<option>'+goodsName+'</option>');
							}
						},
						error : function(){
							alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
						}
					});
					$(this).parents().siblings('.addBtn').css("display","none");
					$(this).parents().siblings('.reservationAmount').val('');
					$('.goodsCount').val('');				
				}else{
					$.ajax({
						url : "/reservationGoodsList.do",
						type : "get",
						data : {result:result,bCode:bCode},
						success : function(data){
							for(var i=0;i<data.length;i++){
								var goodsBCode = data[i].goodsBCode;
								var goodsCategory = data[i].goodsCategory;
								var goodsName = data[i].goodsName;
								for(var j = $('.reservationReceiptListBox').length; j >= 0; j--){
									if($('.reservationReceiptListBox:eq('+j+')').find('.reservationGoodsName').text() == goodsName){
										var price = $('.reservationReceiptListBox:eq('+j+')').find('.reservationGoodsPrice').text().replace(",","");
										allCost -= price;
										$('#allCost').html(allCost.toLocaleString());	
										$('.reservationReceiptListBox:eq('+j+')').remove();
									}
								}
							}
						},
						error : function(){
							alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
						}
					});
					
					$(this).parents().siblings('.reservationGoods').css("display","none");
					$(this).parents().siblings('.reservationOption').css("display","none");
					$(this).parents().siblings('.reservationAmount').css("display","none");
					$(this).parents().siblings('.addBtn').css("display","none");
					$(this).parents().siblings('.reservationAmount').val('');
					$(this).parents().siblings('span').find('.goodsCount').text('');				
				}
			}else{
				e.preventDefault();
				alert("대관 시간을 정해주세요.");
			}
		});

		/* 제품선택 select를 바꿨을 때 동작하는 함수 */
		$('.reservationGoods').change(function(){
			if($(this).val() != 'default'){
				$(this).siblings('.reservationOption').css("display","inline-block");
				
				var result = $(this).find('option:selected').html();
				var bCode = ${b.branchCode};
				var $select = $(this).siblings('.reservationOption');
				$select.find("option").not('#default').remove();
				$.ajax({
					url : "/reservationOptionList.do",
					type : "get",
					data : {result:result,bCode:bCode},
					success : function(data){
						for(var i=0;i<data.length;i++){
							var goodsBCode = data[i].goodsBCode;
							var goodsGId = data[i].goodsGId;
							var goodsCategory = data[i].goodsCategory;
							var goodsName = data[i].goodsName;
							var goodsSize = data[i].goodsSize;
							var goodsPrice = data[i].goodsPrice;
							var goodsCount = data[i].goodsCount;
							$select.append('<option value="'+goodsGId+'">'+goodsSize+'</option>');
						}
					},
					error : function(){
						alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
					}
				});
				$(this).siblings('.reservationAmount').val('');
				$(this).siblings('span').find('.goodsCount').text('');				
			}else{
				$(this).siblings('.reservationOption').css("display","none");
				$(this).siblings('.reservationAmount').css("display","none");
				$(this).siblings('.addBtn').css("display","none");
				$(this).siblings('.reservationAmount').val('');
				$(this).siblings('span').find('.goodsCount').text('');				
			}
		});
		
		/* 제품옵션 select를 바꿨을 때 동작하는 함수 */
		$('.reservationOption').change(function(){
			if($(this).val() != 'default'){
				$(this).siblings('.reservationAmount').css("display","inline-block");
				$(this).siblings('.addBtn').css("display","inline-block");
				var goodsCount = $(this).siblings('span').find('.goodsCount');
				
				var result = $(this).siblings('.reservationGoods').find('option:selected').html();
				var option = $(this).find('option:selected').html();
				var bCode = ${b.branchCode};
				var $select = $(this).siblings('.reservationOption');
				$select.find("option").not('#default').remove();
				$.ajax({
					url : "/reservationGoodsCount.do",
					type : "get",
					data : {result:result,option:option,bCode:bCode},
					success : function(data){
						goodsCount.text(data);
					},
					error : function(){
						alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
					}
				});
				$(this).siblings('.reservationAmount').val('');
				$(this).siblings('span').find('.goodsCount').text('');								
			}else{
				$(this).siblings('.reservationAmount').val('');
				$(this).siblings('.reservationAmount').css("display","none");
				$(this).siblings('.addBtn').css("display","none");
				$(this).parents().siblings('.reservationAmount').val('');
				$(this).siblings('span').find('.goodsCount').text('');
			}
		});

		$('.reservationAmount').keyup(function(){
			var count = parseInt($(this).siblings('span').find('.goodsCount').text());
			if($(this).val() > count){
				alert("재고보다 많은 수를 입력할 수 없습니다.");
				$(this).val(count);
			}
		});
				
		$('.reservationAmount').on("focusout",function(){
			var count = parseInt($(this).siblings('span').find('.goodsCount').text());
			if($(this).val() > count){
				alert("재고보다 많은 수를 입력할 수 없습니다.");
				$(this).val(count);
			}			
		});
		/* 추가 버튼 눌렀을 때 동작하는 함수 */
		$(document).on("click",'.addBtn',function(){
			var $receipt = $('#reservationReceipt');
			var result = $(this).siblings('.reservationGoods').children('option:selected').html();
			var option = $(this).siblings('.reservationOption').children('option:selected').html();
			var bCode = ${b.branchCode};
			var amount = parseInt($(this).siblings('.reservationAmount').val());
			var addReceipt = "";
			if($('.reservationReceiptListBox').length > 0){
				for(var i = 0 ; i < $('.reservationReceiptListBox').length; i++){
					var oldAmount = parseInt($('.reservationReceiptListBox:eq('+i+')').find('.reservationGoodsAmount').val());
					var oldPrice = parseInt($('.reservationReceiptListBox:eq('+i+')').find('.reservationGoodsPrice').text().replace(",",""));
					var $select = $('.reservationReceiptListBox:eq('+i+')').find('.reservationGoodsAmount');
					if($('.reservationReceiptListBox:eq('+i+')').find('.reservationGoodsName').text() == result && $('.reservationReceiptListBox:eq('+i+')').find('.reservationGoodsOption').text() == option){
						if(amount != 0 && isNaN(amount) != true){
							$('.reservationReceiptListBox:eq('+i+')').find('.reservationGoodsAmount').val(amount+oldAmount);
							var $reservationListBox = $('.reservationReceiptListBox:eq('+i+')').find('.reservationGoodsPrice');
							
							$.ajax({
								url : "/reservationGoodsCount.do",
								type : "get",
								data : {result:result,option:option,bCode:bCode},
								success : function(data){
									var count = parseInt(data);
									if((oldAmount+amount) > count){
										alert("재고보다 많은 수를 입력할 수 없습니다.");
										$select.val(count);
										$reservationListBox.html(((oldPrice/oldAmount)*count).toLocaleString());
										allCost -= oldPrice;
										allCost += (oldPrice/oldAmount)*count;
										$('#allCost').html(allCost.toLocaleString());
									}else{
										$reservationListBox.html((oldPrice+((oldPrice/oldAmount)*amount)).toLocaleString());
										allCost += (oldPrice/oldAmount)*amount;
										$('#allCost').html(allCost.toLocaleString());
									}
								},
								error : function(){
									alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
								}
							});
							i = $('.reservationReceiptListBox').length+1;						
						}else{
							alert("수량을 입력해주세요.");
							i = $('.reservationReceiptListBox').length+1;
						}
					}else{
						if(i == $('.reservationReceiptListBox').length-1){
							$.ajax({
								url : "/reservationGoodsPrice.do",
								type : "get",
								data : {bCode:bCode,result:result,option:option},
								success : function(data){
									if(amount > 0){
										var price = parseInt(data.goodsPrice);
										var allPrice = (price*amount);
										addReceipt += '<div class="reservationReceiptListBox" style="width:100%;height:40px;border:1px solid lightgray;position:relative;margin-top:2px;margin-bottom:2px;"><div style="position:absolute;font-size:14px;top:2px;color:gray;"><div>제품명 : <span class="reservationGoodsName">'+result+'</span></div><div>규격/용량 : <span class="reservationGoodsOption">'+option+'</span></div></div>';
										addReceipt += '<div style="position:absolute;left:250px;font-size:13px;text-align: center;top:2px;color:gray;">수량<br><input class="reservationGoodsAmount" type="number" style="width:50px;height:13px;border:1px solid lightgray;" min="0" value="'+amount+'" readonly></div>';
										addReceipt += '<div style="left:400px;font-size:15px;margin-right:50px;margin-top:10px;float:right;text-align:right;color:gray;"><span class="reservationGoodsPrice">'+allPrice.toLocaleString()+'</span>원</div>';
										addReceipt += '<div style="position:absolute;left:500px;top:8px;"><div class="cancelBtn" style="width:20px;height:20px;border-radius:20px;text-align:center;border:2px solid lightgray;line-height:15px;font-size:23px;color:red;cursor:pointer;padding:0;margin:0;">×</div></div></div>';
										$receipt.prepend(addReceipt);
										allCost += allPrice;
										$('#allCost').html(allCost.toLocaleString());	
									}else{
										alert("수량을 입력해주세요.");
									}
								},
								error : function(){
									alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
								}
							});
							i = $('.reservationReceiptListBox').length+1;
						}
					}
				}
			}else{
				$.ajax({
					url : "/reservationGoodsPrice.do",
					type : "get",
					data : {result:result,option:option,bCode:bCode},
					success : function(data){
						if(amount > 0){
							var price = parseInt(data.goodsPrice);
							var allPrice = (price*amount);
							addReceipt += '<div class="reservationReceiptListBox" style="width:100%;height:40px;border:1px solid lightgray;position:relative;margin-top:2px;margin-bottom:2px;"><div style="position:absolute;font-size:14px;top:2px;color:gray;"><div>제품명 : <span class="reservationGoodsName">'+result+'</span></div><div>규격/용량 : <span class="reservationGoodsOption">'+option+'</span></div></div>';
							addReceipt += '<div style="position:absolute;left:250px;font-size:13px;text-align: center;top:2px;color:gray;">수량<br><input class="reservationGoodsAmount" type="number" style="width:50px;height:13px;border:1px solid lightgray;" min="0" value="'+amount+'" readonly></div>';
							addReceipt += '<div style="left:400px;font-size:15px;margin-right:50px;margin-top:10px;float:right;text-align:right;color:gray;"><span class="reservationGoodsPrice">'+allPrice.toLocaleString()+'</span>원</div>';
							addReceipt += '<div style="position:absolute;left:500px;top:8px;"><div class="cancelBtn" style="width:20px;height:20px;border-radius:20px;text-align:center;border:2px solid lightgray;line-height:15px;font-size:23px;color:red;cursor:pointer;padding:0;margin:0;">×</div></div></div>';
							$receipt.prepend(addReceipt);
							allCost += allPrice;
							$('#allCost').html(allCost.toLocaleString());	
						}else{
							alert("수량을 입력해주세요.");
						}
					},
					error : function(){
						alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
					}
				});
			}
			$(this).siblings('.reservationGoods').find('option:eq(0)').prop("selected",true);
			$(this).siblings('.reservationOption').find('option:eq(0)').prop("selected",true);
			$(this).siblings('.reservationAmount').val('');
			$(this).siblings('span').find('.goodsCount').text('');	
		});
		
		$(document).on("click",'.cancelBtn',function(){
			var price = $(this).parents('.reservationReceiptListBox').find('.reservationGoodsPrice').text().replace(",","");
			allCost -= price;
			$('#allCost').html(allCost.toLocaleString());	
			$(this).parents('.reservationReceiptListBox').remove();
		});			
		
		$(document).on('keyup','.reservationGoodsAmount',function(){
			var result = $(this).parents('.reservationReceiptListBox').find('.reservationGoodsName').text();
			var option = $(this).parents('.reservationReceiptListBox').find('.reservationGoodsOption').text();
			var bCode = ${b.branchCode};
			var $select = $(this);
			var selectCount = parseInt($select.val());
			$.ajax({
				url : "/reservationGoodsCount.do",
				type : "get",
				data : {result:result,option:option,bCode:bCode},
				success : function(data){
					var count = parseInt(data);
					if(selectCount > count){
						alert("재고보다 많은 수를 입력할 수 없습니다.");
						$select.val(count);
					}
				},
				error : function(){
					alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
				}
			});
			
		});
		$(document).on('focusout','.reservationGoodsAmount',function(){
			var result = $(this).parents('.reservationReceiptListBox').find('.reservationGoodsName').text();
			var option = $(this).parents('.reservationReceiptListBox').find('.reservationGoodsOption').text();
			var bCode = ${b.branchCode};
			var $select = $(this);
			var selectCount = parseInt($select.val());
			$.ajax({
				url : "/reservationGoodsCount.do",
				type : "get",
				data : {result:result,option:option,bCode:bCode},
				success : function(data){
					var count = parseInt(data);
					if(selectCount > count){
						alert("재고보다 많은 수를 입력할 수 없습니다.");
						$select.val(count);
					}
				},
				error : function(){
					alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
				}
			});
			
		});
		
		
		/* 결제하기 눌렀을 때 */
		$(document).on("click","#paymentBtn",function(){
			if($('#allCost').text() == '0'){
				alert("대관예약 정보를 작성해주세요.");
			}else{				
				var bCode = ${b.branchCode};
				var resDate = ($('#receipt-cal').text().replace(/\./gi,'/')).replace('2019','19');
				var cCode = $('#courtSelect').find('option:selected').val();
				var resGoodsName = new Array($('.reservationReceiptListBox').length);
				var resGoodsOption = new Array($('.reservationReceiptListBox').length);;
				var resGoodsAmount = new Array($('.reservationReceiptListBox').length);;
				var resGoodsPrice = new Array($('.reservationReceiptListBox').length);;
				if($('.reservationReceiptListBox').length > 0){
					for(var i=0;i<$('.reservationReceiptListBox').length;i++){
						resGoodsName[i] = $('.reservationReceiptListBox:eq('+i+')').find('.reservationGoodsName').text();
						resGoodsOption[i] = $('.reservationReceiptListBox:eq('+i+')').find('.reservationGoodsOption').text();
						resGoodsAmount[i] = $('.reservationReceiptListBox:eq('+i+')').find('.reservationGoodsAmount').val();
						resGoodsPrice[i] = $('.reservationReceiptListBox:eq('+i+')').find('.reservationGoodsPrice').text().replace(",","");
					}
				}
				var resStartTime = new Array($('.reservationReceiptList').length);
				var resEndTime = new Array($('.reservationReceiptList').length);
				var resCost = new Array($('.reservationReceiptList').length);
				if($('.reservationReceiptList').length > 0){
					for(var i=0;i<$('.reservationReceiptList').length;i++){
						resStartTime[i] = $('.reservationReceiptList:eq('+i+')').find('.reservationStartTime').text();
						resEndTime[i] = $('.reservationReceiptList:eq('+i+')').find('.reservationEndTime').text();
						resCost[i] = $('.reservationReceiptList:eq('+i+')').find('.reservationCostNum').text().replace(",","");
					}
				}
				var allCost = $('#allCost').text().replace(/,/gi,"");
				
				if($('.reservationReceiptListBox').length > 0){
					goodsCheck(bCode,resDate,cCode,resGoodsName,resGoodsOption,resGoodsAmount,resGoodsPrice,resStartTime,resEndTime,resCost,allCost);
				}else{
					courtCheck(bCode,resDate,cCode,resGoodsName,resGoodsOption,resGoodsAmount,resGoodsPrice,resStartTime,resEndTime,resCost,allCost);
				}
			}
		});
		
		
		function goodsCheck(bCode,resDate,cCode,resGoodsName,resGoodsOption,resGoodsAmount,resGoodsPrice,resStartTime,resEndTime,resCost,allCost) {
			/* 주문장 만들기 전에 상품 수량 확인 */
			for(var i=0;i<$('.reservationReceiptListBox').length;i++){
				var goodsAmount = parseInt(resGoodsAmount[i]);
				var result = resGoodsName[i];
				var option = resGoodsOption[i];
				$.ajax({
					url : "/reservationGoodsCount.do",
					type : "get",
					data : {result:result,option:option,bCode:bCode},
					success : setTimeout(function(data){
						var count = parseInt(data);
						if(count < goodsAmount){
							alert("재고가 부족합니다. 재고 : "+result+" "+option+" : "+count);
							i = $('.reservationReceiptListBox').length + 1;
						}else{
							if(i == $('.reservationReceiptListBox').length){
								courtCheck(bCode,resDate,cCode,resGoodsName,resGoodsOption,resGoodsAmount,resGoodsPrice,resStartTime,resEndTime,resCost,allCost);
								i = $('.reservationReceiptListBox').length + 1;
							}
						}
					},1000),
					error : function(){
						alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
					}
				});
			}			
		}
		
		
		function courtCheck(bCode,resDate,cCode,resGoodsName,resGoodsOption,resGoodsAmount,resGoodsPrice,resStartTime,resEndTime,resCost,allCost){
			/* 주문장 만들기 전에 대관 여부 확인 */
			for(var i=0;i<$('.reservationReceiptList').length;i++){
				var startTime = resStartTime[i];
				var endTime = resEndTime[i];
				$.ajax({
					url : "/reservationCheckCourt.do",
					type : "get",
					data : {resDate:resDate,cCode:cCode,startTime:startTime,endTime:endTime},
					success : function(data){
						var check = parseInt(data);
						if(check != 0){
							alert(startTime+"~"+endTime+" 타임이 마감되어 대관할 수 없습니다.");
							$('.reservationReceiptList:eq('+i+')').remove();
							i = $('.reservationReceiptList').length + 1;
						}else{
							if(i == $('.reservationReceiptList').length){
								payment(bCode,resDate,cCode,resGoodsName,resGoodsOption,resGoodsAmount,resGoodsPrice,resStartTime,resEndTime,resCost,allCost);
								i = $('.reservationReceiptList').length + 1;
							}
						}
					},
					error : function(){
						alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
					}
				});
			}			
		}
		
		function payment(bCode,resDate,cCode,resGoodsName,resGoodsOption,resGoodsAmount,resGoodsPrice,resStartTime,resEndTime,resCost,allCost){
			$.ajax({
				url : '/reservationPayment.do',
				type : 'get',
				data : {bCode:bCode,resDate:resDate,cCode:cCode,resGoodsName:resGoodsName,resGoodsOption:resGoodsOption,resGoodsAmount:resGoodsAmount,resGoodsPrice:resGoodsPrice,resStartTime:resStartTime,resEndTime:resEndTime,resCost:resCost,allCost:allCost},
				success : function(data){
					if(data > 0){
						paymentPage(bCode,resDate,cCode,resStartTime,resEndTime,allCost);
					}else{
						alert(data);
					}
				},
				error : function(){
					alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
				}
			});			
		}
		
		function paymentPage(bCode,resDate,cCode,resStartTime,resEndTime,allCost){
			$.ajax({
				url : '/reservationNo.do',
				type : 'get',
				data : {bCode:bCode,resDate:resDate,cCode:cCode,resStartTime:resStartTime,resEndTime:resEndTime,allCost:allCost},
				success : function(data){
					alert("결제창이 뜰 때까지 기다려주세요(최대 1분 소요)");
					$('#paymentGo').append('<input type="text" name="goAllCost" value="'+allCost+'">');
					$('#paymentGo').append('<input type="text" name="goResNo" value="'+data+'">');
					$('#paymentGo').append('<input type="text" name="goResDate" value="'+resDate+'">');
					$('#paymentGo').append('<input type="text" name="goCCode" value="'+cCode+'">');
					for(var i = 0; i < resStartTime.length ; i++){
						$('#paymentGo').append('<input type="text" name="goStartTime" value="'+resStartTime[i]+'">');
						$('#paymentGo').append('<input type="text" name="goEndTime" value="'+resEndTime[i]+'">');
					}
					$('#paymentGo').submit();
				},
				error : function(){
					alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
				}
			});			
		}	
		
	</script>

</body>
</html>