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
				alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
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
	.scheduleList{
		width:175px;
		height:60px;
		background-color:#2c3c57;
		color:white;
		display:inline-block;
		margin:1px;cursor:pointer;
	}
	.scheduleSelect{
		width:175px;
		height:60px;
		background-color:#3366cc;
		color:white;
		display:inline-block;
		margin:1px;cursor:pointer;
	}
	.reservationGoods{
		width:45%;
		height:30px;
		font-size:15px;
		paddign:0;
		margin:0 auto;
		border:1px solid lightgray;
 		display:none;
	}
	.reservationOption{
		width:25%;
		height:30px;
		font-size:15px;
		paddign:0;
		margin:0 auto;
		border:1px solid lightgray;
 		display:none;
	}
	.reservationAmount{
		width:15%;
		height:30px;
		font-size:15px;
		padding:0;
		margin:0 auto;
		border:1px solid lightgray;
 		display:none;
	}
	.addBtn{
		width:10%;
		height:30px;
		background-color: silver;
		border:0;
		color:white;
		font-weight:bolder;
		font-size:15px;
 		display:none;
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
			<div style="width:78%;height:2000px;border-left:1px solid silver;display:inline-block;overflow:hidden;">
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
						<div style="width:590px;border: 1px solid darkgray;">
							<div style="border-bottom:1px solid darkgray;">
								<jsp:include page="/views/test/calendar.jsp"/>
							</div>
							<div style="display:table;width:90%;margin:0 auto;margin-top:30px;">
								<div style="display:table-cell;vertical-align:middle;font-size:18px;">날짜선택</div><span id="receipt-cal" style="display:table-cell;vertical-align:middle;font-size:20px;"></span>
							</div>
							<hr style="width:90%;height:1px;border:0;margin:0 auto;margin-top:30px;padding:0;background-color:darkgray;">
							<div style="width:90%;margin:0 auto;">
								<div style="font-size:18px;margin-top:30px;display:inline-block;">구장선택</div><span style="color:red;font-size:15px;float:right;">※구장을 선택하면 대관 가능 시간이 출력됩니다.</span>
								<select id="courtSelect" name="courtSelect" style="width:100%;height:50px;font-size:16px;padding:0;margin-top:10px;border:1px solid lightgray;">
									<option id="default" value="default" selected>::: 구장선택 :::</option>
								</select>
							</div>
							<hr style="width:90%;height:1px;border:0;margin:0 auto;margin-top:30px;padding:0;background-color:darkgray;">
							<div style="width:90%;margin:0 auto;">
								<div style="font-size:18px;margin-top:30px;display:inline-block;">시간선택</div><span id="referenceText2" style="color:red;font-size:15px;float:right;">※대관 가능한 시간만 표시됩니다.</span>
								<div id="courtTime" style="width:100%;padding:0;margin-top:10px;">
								</div>
							</div>
							<hr style="width:90%;height:1px;border:0;margin:0 auto;margin-top:30px;padding:0;background-color:darkgray;">
							<div style="width:90%;margin:0 auto;">
								<div style="font-size:18px;margin-top:30px;display:inline-block;">물품대여 및 구매</div><span id="referenceText3" style="color:red;font-size:15px;float:right;">※필수 선택사항이 아닙니다.</span>	
								<div style="width:90%;margin:0 auto;margin-top:30px;">
									<div style="margin-top:20px;">
										<label><input type="checkbox" class="checkGoods" id="checkWater">물</label><span style="font-size:13px;float:right;">구매 가능 수량 : <span class="goodsCount"></span>개</span><br>
										<select class="reservationGoods" id="reservationWater" name="reservationWater">
											<option id="default" value="default" selected>::: 제품 선택 :::</option>
										</select>
										<select class="reservationOption" id="reservationWaterOption" name="reservationWaterOption">
											<option id="default" value="default" selected>::: 옵션 선택 :::</option>
										</select>
										<input type="number" class="reservationAmount" id="reservationWaterAmount" name="reservationWaterAmount" placeholder="수량" min="1">
										<input class="addBtn" id="addWater" type="button" value="추가">
									</div>
									<div style="margin-top:20px;">
										<label><input type="checkbox" class="checkGoods" id="checkVest">조끼</label><span style="font-size:13px;float:right;">구매 가능 수량 : <span class="goodsCount"></span>개</span><br>
										<select class="reservationGoods" id="reservationVest" name="reservationVest">
											<option id="default" value="default" selected>::: 제품 선택 :::</option>
										</select>										
										<select class="reservationOption" id="reservationVestOption" name="reservationVestOption">
											<option id="default" value="default" selected>::: 옵션 선택 :::</option>
										</select>
										<input type="number" class="reservationAmount" id="reservationVestAmount" name="reservationVestAmount" placeholder="수량" min="1">
										<input class="addBtn" id="addVest" type="button" value="추가">
									</div>
									<div style="margin-top:20px;">
										<label><input type="checkbox" class="checkGoods" id="checkShoes">신발</label><span style="font-size:13px;float:right;">구매 가능 수량 : <span class="goodsCount"></span>개</span><br>
										<select class="reservationGoods" id="reservationShoes" name="reservationShoes">
											<option id="default" value="default" selected>::: 제품 선택 :::</option>
										</select>										
										<select class="reservationOption" id="reservationShoesOption" name="reservationShoesOption">
											<option id="default" value="default" selected>::: 옵션 선택 :::</option>
										</select>
										<input type="number" class="reservationAmount" id="reservationShoesAmount" name="reservationShoesAmount" placeholder="수량" min="1">
										<input class="addBtn" id="addShoes" type="button" value="추가">
									</div>
								</div>								
							</div>
							<hr style="width:90%;height:1px;border:0;margin:0 auto;margin-top:30px;padding:0;background-color:darkgray;">
							<div id="reservationReceipt" style="width:90%;margin:0 auto;margin-top:30px;">
								<div class="reservationCost" style="font-size:18px;width:100%;float:left;">삼다수 500ml [800원 * 8개]<span style="font-size:20px;float:right;">6,400원</span></div>
								<div class="reservationCost" style="font-size:18px;width:100%;float:left;">조끼(빨강) XL [1,500원 * 8벌]<span style="font-size:20px;float:right;">12,000원</span></div>
								<div class="reservationCost" style="font-size:18px;width:100%;float:left;">축구화 250size [5,000원 * 8켤레]<span style="font-size:20px;float:right;">40,000원</span></div>
								<div id="reservationAllCost" style="font-size:18px;width:100%;">합계<span id="allCost" style="font-size:20px;float:right;">0원</span></div>
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
			/* 영수증 초기화 */
			var $receipt = $('#reservationReceipt');
			$receipt.find("div").not('#reservationAllCost').remove();
			/* 합계 금액 초기화 */
			allCost = 0;
			$('#allCost').html(allCost.toLocaleString()+'원');				
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
			$('#allCost').html(allCost.toLocaleString()+'원');				
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
		$(document).on("click",".scheduleList",function(){
			$(this).addClass('scheduleSelect');
			$(this).removeClass('scheduleList');
			allCost += parseInt($(this).find('.reservationCost').html().replace(",",""));
			$('#allCost').html(allCost.toLocaleString()+'원');	
			
			/* 영수증 초기화 */
			var scheduleNo = $(this).attr('id');
			var $receipt = $('#reservationReceipt');
			$receipt.prepend('<div name="'+scheduleNo+'" class="reservationCost" style="font-size:18px;width:100%;float:left;">대관('+$(this).find('.startTime').text()+'~'+$(this).find('.endTime').text()+')<span style="font-size:20px;float:right;">'+$(this).find('.reservationCost').text()+'원</span></div>');
			
		});
		$(document).on("click",".scheduleSelect",function(){
			$(this).addClass('scheduleList');
			$(this).removeClass('scheduleSelect');
			allCost -= parseInt($(this).find('.reservationCost').html().replace(",",""));
			$('#allCost').html(allCost.toLocaleString()+'원');	

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
				var $receipt = $('#reservationReceipt');
				$receipt.prepend('<div name="'+scheduleNo+'" class="reservationCost" style="font-size:18px;width:100%;float:left;">대관('+$(this).find('.startTime').text()+'~'+$(this).find('.endTime').text()+')<span style="font-size:20px;float:right;">'+$(this).find('.reservationCost').text()+'원</span></div>');
			}

		});
		
		/* 물품대여 체크박스 체크했을 때 동작하는 함수 */
		$('.checkGoods').on("click",function(e){
			if($('#courtTime').children('.scheduleSelect').attr('class') == 'scheduleSelect'){
				if($(this).is(':checked') == true){
					$(this).parents().siblings('.reservationGoods').css("display","inline-block");
					
					var result = $(this).parents('label').text();
					var bCode = ${b.branchCode};
					var $select = $(this).parents().siblings('.reservationGoods');
					$select.find("option").not('#default').remove();
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
				
				var result = $(this).find('option:selected').html();
				var goodsGId = $(this).find('option:selected').val();
				var bCode = ${b.branchCode};
				var $select = $(this).siblings('.reservationOption');
				$select.find("option").not('#default').remove();
				$.ajax({
					url : "/reservationGoodsCount.do",
					type : "get",
					data : {result:result,goodsGId:goodsGId,bCode:bCode},
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
		
		$('.addBtn').on("click",function(){
			var $receipt = $('#reservationReceipt');
			var goods = $(this).siblings('.reservationGoods').children('option:selected').html();
			var option = $(this).siblings('.reservationOption').children('option:selected').html();
			var amount = parseInt($(this).siblings('.reservationAmount').val());
			
			$.ajax({
				url : "/reservationGoodsPrice.do",
				type : "get",
				data : {goods:goods,option:option},
				success : function(data){
					if(amount > 0){
						var price = parseInt(data.goodsPrice);
						var allPrice = (price*amount);
						$receipt.prepend('<div class="reservationCost" style="font-size:18px;width:100%;float:left;">'+goods+' '+option+' ['+price+'원 * '+amount+'개]<span style="font-size:20px;float:right;">'+allPrice.toLocaleString()+'원</span></div>');
					}else{
						alert("수량을 입력해주세요.");
					}
				},
				error : function(){
					alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
				}
			});

			
		});
	</script>

</body>
</html>