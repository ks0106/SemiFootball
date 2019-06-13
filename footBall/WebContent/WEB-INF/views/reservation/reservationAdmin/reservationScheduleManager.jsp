<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel='stylesheet' href="css/common/admin.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
	<!-- drag import -->
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
 <!-- reservation 공통 js => jqeury를 이용하기 때문에 jquery import 밑으로 내려야 한다. -->
<script type="text/javascript" src="/js/reservation/reservationAdminAll.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KS 대관스케줄관리</title>
</head>
<script>
	$(document).ready(function(){
		/* 로드 시 css 세팅 */
		$('form:first').removeClass('noView');
		$('form:first').addClass('view');
		$('#scheduleAddBtn').removeClass('scheduleManagerBtn');
		$('#scheduleAddBtn').addClass('scheduleManagerBtnSelect');
		/* 지점 로드 함수 */
		branchLoad();
	});
	
	$(function() {
		$( "#draggable" ).draggable();
			$( "#droppable" ).droppable({
				drop: function( event, ui ) {
					$( this )
						.addClass( "ui-state-highlight" )
					.find( "p" )
				.html( "Dropped!" );
			}
		});
	});

	
</script>
<style>

	/* input number 버튼 지우기 */
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
	.side_a {
		font-weight: bolder;
		font-size: 18px;
		text-decoration: none;
		cursor: pointer;
	}
	
	#reservationTitle{
		font-size:45px;
		font-weight:bolder;
	}
	.view{
 		display:block; 
	}
	.noView{
 		display:none; 
	}
	.scheduleManagerBtn{
		width:150px;
		height:50px;
		cursor:pointer;
		background-color:gray;
		color:white;
		font-size:20px;
		font-weight:bolder;
		border:0;
		padding:0;
		margin:0;
	}
	.scheduleManagerBtn:hover{
		background-color:rgb(225,225,225);
		color:black;
	}
	.scheduleManagerBtnSelect{
		width:150px;
		height:50px;
		background-color:black;
		color:white;
		font-size:20px;
		font-weight:bolder;
		border:0;
		padding:0;
		margin:0;
	}
</style>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp" />
	<section> <!-- 내용 작성 -->
		<!-- 컨텐츠 -->
		<div style="width:100%; height:100%;overflow:hidden;margin-top:30px;">
			<div style="width: 95%; background-color: white; margin: 0 auto; overflow: hidden;">
<!-- 				컨텐츠 사이드 메뉴
				<div style="width:300px; height: 300px; text-align: left; display: inline-block; float: left;">
					<div style="font-size: 30px; font-weight: bolder; color: black; margin: 0; margin-bottom: 10px;">대관 관리</div>
					<div style="width: 80%;">
						<hr style="width: 80%; border: 2px solid black;padding: 0;float:left;">
						<hr style="width: 10%; border: 2px solid #df0101;padding: 0;display:inline-block;">
					</div>
					<div style="margin-bottom: 15px;">
						<a class="side_a" id="side_menu1" style="color: gray;">예약/결제 취소</a>
					</div>
					<div style="margin-bottom: 15px;">
						<a class="side_a" id="side_menu2" style="color: gray;">물품 등록/수정/삭제</a>
					</div>
					<div style="margin-bottom: 15px;">
						<a class="side_a" id="side_menu3" style="color: #df0101;">스케쥴 등록/수정/삭제</a>
					</div>
				</div>
				사이드 메뉴 종료 -->
				<!-- 컨텐츠 -->
				<div style="width: 100%; height:800px;overflow:hidden;">
					<!-- 컨텐츠 타이틀 -->
					<div id="reservationTitle" style="color:black;position:absolute;top:120px;left:70%;">[관리자] 스케쥴 관리</div>
					<!-- 본문 -->
					<div class="content-wrapper" style="width:100%; height:100%;">
						<!-- 컨텐츠 파티션 -->
						<div style="width:800px; margin-top:150px; margin-left:100px; float:left;">
							<button class="scheduleManagerBtn" id="scheduleAddBtn" style="float:left;">스케쥴등록</button>
							<button class="scheduleManagerBtn" id="scheduleModifyBtn" style="float:left;">스케쥴수정</button>
							<button class="scheduleManagerBtn" id="scheduleDeleteBtn" style="display:inline-block;">스케쥴삭제</button>
							<div id="formArea">
							<form class="noView" id="scheduleAdd" action="/reservationManagerScheduleAdd" method="post">
								<div style="width:650px;border:3px solid black;padding:40px;text-align:center;">
									<table style="width:650px;margin-bottom:10px;">
										<tr>
											<th>날짜</th>
											<td>
												<input id="scheduleDate" name="scheduleDate" type="text" style="width:396px;height:36px;font-size:18px;" readonly>
											</td>
										</tr>
										<tr>
											<th>지점</th>
											<td>
												<select class="branchName" id="branchName" name="branchName" style="width:400px;height:40px;font-size:18px;">
													<option value="default" selected>::: 지점선택 :::</option>
												</select>								
											</td>
										</tr>
										<tr>
											<th>구장</th>
											<td>
												<select id="courtName" name="courtName" style="width:400px;height:40px;font-size:18px;">
													<option class="default" value="default" selected>::: 구장선택 :::</option>
												</select>								
											</td>
										</tr>
										<tr>
											<th>시작시간</th>
											<td>
												<select id="startTime" name="startTime" style="width:400px;height:40px;font-size:18px;">
													<option class="default" value="default" selected>::: 시작시간 선택 :::</option>
													<option>08:00</option>
													<option>09:00</option>
													<option>10:00</option>
													<option>11:00</option>
													<option>12:00</option>
													<option>13:00</option>
													<option>14:00</option>
													<option>15:00</option>
													<option>16:00</option>
													<option>17:00</option>
													<option>18:00</option>
													<option>19:00</option>
													<option>20:00</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>끝시간</th>
											<td>
												<select id="endTime" name="endTime" style="width:400px;height:40px;font-size:18px;">
													<option class="default" value="default" selected>::: 끝시간 선택 :::</option>
													<option>10:00</option>
													<option>11:00</option>
													<option>12:00</option>
													<option>13:00</option>
													<option>14:00</option>
													<option>15:00</option>
													<option>16:00</option>
													<option>17:00</option>
													<option>18:00</option>
													<option>19:00</option>
													<option>20:00</option>
													<option>21:00</option>
													<option>22:00</option>
												</select>
											</td>
										</tr>
										<tr>
											<td colspan="2" style="color:#df0101;font-size:13px;font-weight:bolder;">
												* 시작시간이나 끝시간 선택 시 2시간 씩 자동으로 세팅됩니다.
												<br>* 이미 등록된 시간은 중복으로 등록할 수 없습니다.
											</td>
										</tr>
										<tr>
											<th>대관료</th>
											<td>
												<input id="resPrice" name="resPrice" type="number" min="0" style="width:396px;height:36px;font-size:18px;">
											</td>
										</tr>
										<tr>
											<td colspan="2" style="color:#df0101;font-size:13px;font-weight:bolder;">
												* 구장 타입에 따라 자동으로 세팅되나 임의로 수정하여 등록할 수 있습니다.
											</td>
										</tr>
									</table>
									<button id="scheduleAddSubmit" type="button" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:black;font-size:18px;display:inline-block;margin-left:400px;">등록</button>
									<button type="reset" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:gray;font-size:18px;display:inline-block;">리셋</button>
								</div>
							</form>
							<form class="noView" id="scheduleModify" action="/reservationManagerScheduleModify" method="post">
								<div style="width:650px;border:3px solid black;padding:40px;text-align:center;">
									<table style="width:650px;margin-bottom:10px;">
										<tr>
											<th>날짜</th>
											<td>
												<input id="scheduleDate" name="scheduleDate" type="text" style="width:396px;height:36px;font-size:18px;" readonly>
											</td>
										</tr>
										<tr>
											<th>지점</th>
											<td>
												<select class="branchName" id="branchName" name="branchName" style="width:400px;height:40px;font-size:18px;">
													<option class="default" value="default" selected>::: 지점선택 :::</option>
												</select>								
											</td>
										</tr>
										<tr>
											<th>구장</th>
											<td>
												<select id="courtName" name="courtName" style="width:400px;height:40px;font-size:18px;">
													<option class="default" value="default" selected>::: 구장선택 :::</option>
												</select>								
											</td>
										</tr>
										<tr>
											<th>시간</th>
											<td>
												<select id="startTime" name="startTime" style="width:400px;height:40px;font-size:18px;">
													<option class="default" value="default" selected>::: 시간 선택 :::</option>
												</select>								
											</td>
										</tr>
										<tr>
											<th>가격</th>
											<td>
												<input id="resPrice" name="resPrice" type="number" min="0" style="width:396px;height:36px;font-size:18px;">
											</td>
										</tr>
										<tr>
											<th>대관여부</th>
											<td>
												<select id="scheduleYN" name="scheduleYN" style="width:400px;height:40px;font-size:18px;">
													<option class="default" value="default" selected>::: 가능/불가능 :::</option>
													<option value="0">가능</option>
													<option value="1">불가능</option>
												</select>
											</td>
										</tr>
										<tr>
											<td colspan="2" style="color:#df0101;font-size:13px;font-weight:bolder;">
												* 가격, 대관여부만 변경할 수 있습니다.
											</td>
										</tr>
									</table>
									<button id="scheduleModifySubmit" type="button" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:black;font-size:18px;display:inline-block;margin-left:400px;">수정</button>
									<button type="reset" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:gray;font-size:18px;display:inline-block;">리셋</button>
								</div>
							</form>
							<form class="noView" id="scheduleDelete" action="/reservationManagerScheduleDelete" method="post">
								<div style="width:650px;border:3px solid black;padding:40px;text-align:center;">
									<table style="width:650px;margin-bottom:10px;">
										<tr>
											<th>날짜</th>
											<td>
												<input id="scheduleDate" name="scheduleDate" type="text" style="width:396px;height:36px;font-size:18px;" readonly>
											</td>
										</tr>
										<tr>
											<th>지점</th>
											<td>
												<select class="branchName" id="branchName" name="branchName" style="width:400px;height:40px;font-size:18px;">
													<option class="default" value="default" selected>::: 지점선택 :::</option>
												</select>								
											</td>
										</tr>
										<tr>
											<th>구장</th>
											<td>
												<select id="courtName" name="courtName" style="width:400px;height:40px;font-size:18px;">
													<option class="default" value="default" selected>::: 구장선택 :::</option>
												</select>								
											</td>
										</tr>
										<tr>
											<th>시간</th>
											<td>
												<select id="startTime" name="startTime" style="width:400px;height:40px;font-size:18px;">
													<option class="default" value="default" selected>::: 시간 선택 :::</option>
												</select>								
											</td>
										</tr>
										<tr>
											<td colspan="2" style="color:#df0101;font-size:13px;font-weight:bolder;">
												! 해당 스케쥴의 대관여부가 불가능이고, 현재 이용중인 고객이 없을 때에만 삭제할 수 있습니다.
											</td>
										</tr>
									</table>
									<button id="scheduleDeleteSubmit" type="button" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:black;font-size:18px;display:inline-block;margin-left:400px;">삭제</button>
									<button type="reset" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:gray;font-size:18px;display:inline-block;">리셋</button>
								</div>
							</form>
							</div>
						</div>
						<!-- 달력 -->
						<div id="draggable" style="width:530px; height:500px; margin-top:150px; margin-right:100px; float:right;">
							<jsp:include page="/views/test/calendar.jsp" />
						</div>
					</div><!-- 본문 끝  -->
				</div>
			</div>
		</div>
	</section>
	
	<script>
		function branchLoad(){
			var branchName = '<c:forEach items="${list}" var="b" varStatus="i">';
			branchName += '<option value="${b.branchCode}">${b.branchName}</option></c:forEach>';
			$('tr').find('.branchName').append(branchName);
		}
		
		////////////////////* 로드되었을 때 동작하는 영역 *////////////////////
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
			$('#scheduleDate').val(txt);			
		});
		
		////////////////////* 클릭했을 때 동작하는 영역 *////////////////////		
		/* 등록,수정,삭제 탭메뉴 클릭 시 동작 */
		$(document).on("click",".scheduleManagerBtn",function(){
			/* 모든 select와 input 초기화 */
			$('select').not('.branchName').not('#scheduleYN').not('#startTime').not('#endTime').find("option").not('.default').remove();
			$('#scheduleYN').find('option:eq(0)').prop('selected',true);
			$('#startTime').find('option:eq(0)').prop('selected',true);
			$('#endTime').find('option:eq(0)').prop('selected',true);
			$('input').not('#scheduleDate').val("");

			/* 버튼 및 페이지 class변경 */
			$(this).siblings('button').removeClass('scheduleManagerBtnSelect');
			$(this).siblings('button').addClass('scheduleManagerBtn');
			$(this).removeClass('scheduleManagerBtn');
			$(this).addClass('scheduleManagerBtnSelect');
			var $target = $(this).attr('id').replace('Btn',"");
			$('#'+$target).siblings('form').removeClass('view');
			$('#'+$target).siblings('form').addClass('noView');
			$('#'+$target).removeClass('noView');			
			$('#'+$target).addClass('view');
			$('.branchName').find('option:eq(0)').prop('selected',true);
			$('#'+$target).find('#scheduleDate').val(txt);
		});
		
		
		////////////////////* include 영역 *////////////////////		
		/* 달력 내용 클릭 시 동작 */
		$(document).on("click",".future",function(){
			month = $('#tbCalendarYM').text();
			day = parseInt($(this).text());
			if(day > 9){
				txt = month+"."+day;
			}else{
				txt = month+"."+"0"+day;
			}
			$('tr').find('#scheduleDate').val(txt);
			$('#scheduleAddSubmit').find('select').not('#startTime').not('#endTime').find('option').not('#default').remove();
			$('tr').find('select').find('option:eq(0)').prop('selected',true);
			$('form').find('input').not('#scheduleDate').val('');
		});
		
		
		
		
		////////////////////* form submit 영역 *////////////////////
		/* 스케쥴등록버튼 눌렀을 때(form submit) */
		$(document).on("click","#scheduleAddSubmit",function(){
			if($('#branchName').find('option:selected').val() != 'default'
				&& $('#courtName').find('option:selected').val() != 'default'
				&& $('#startTime').find('option:selected').val() != 'default'
				&& $('#endTime').find('option:selected').val() != 'default'
				&& $('#scheduleDate').val() != ""
				&& $('#resPrice').val() != ""){
				$('#scheduleDate').val($('#scheduleDate').val().replace(/\./gi,'/'));
				$('#scheduleAdd').submit();
			}else{
				alert("입력된 값이 부족합니다.");
			}
		});
		/* 스케쥴수정버튼 눌렀을 때(form submit) */		
		$(document).on("click","#scheduleModifySubmit",function(){
			if($(this).siblings().find('#branchName').find('option:selected').val() != 'default'
				&& $(this).siblings().find('#courtName').find('option:selected').val() != 'default'
				&& $(this).siblings().find('#startTime').find('option:selected').val() != 'default'
				&& $(this).siblings().find('#scheduleYN').find('option:selected').val() != 'default'
				&& $(this).siblings().find('#scheduleDate').val() != ""
				&& $(this).siblings().find('#resPrice').val() != ""){
				$(this).siblings().find('#scheduleDate').val($('#scheduleDate').val().replace(/\./gi,'/'));
				$('#scheduleModify').submit();
			}else{
				alert("입력된 값이 부족합니다.");
			}
		});
		/* 스케쥴삭제버튼 눌렀을 때(form submit) */		
		$(document).on("click","#scheduleDeleteSubmit",function(){
			if($(this).siblings().find('#branchName').find('option:selected').val() != 'default'
				&& $(this).siblings().find('#courtName').find('option:selected').val() != 'default'
				&& $(this).siblings().find('#startTime').find('option:selected').val() != 'default'
				&& $(this).siblings().find('#scheduleDate').val() != ""){
				$(this).siblings().find('#scheduleDate').val($('#scheduleDate').val().replace(/\./gi,'/'));
				$('#scheduleDelete').submit();
			}else{
				alert("입력된 값이 부족합니다.");
			}
		});

		

		
		
		
		
		////////////////////* ajax 영역 *////////////////////
		/* select change이벤트 동작 시 연관된 select와 input을 초기화시켜줘야 함 */
		/* 지점 선택 시 동작 */
		$(document).on("change","#branchName",function(){
			/* select초기화 시작 */
			var $courtName = $(this).parents('tr').siblings().find('#courtName');
			$courtName.find("option").not('.default').remove();
			var $startTime = $(this).parents('tr').siblings().find('#startTime');
			$startTime.find("option:eq(0)").prop("selected",true);
			var $endTime = $(this).parents('tr').siblings().find('#endTime');
			$endTime.find("option:eq(0)").prop("selected",true);
			var $scheduleYN = $(this).parents('tr').siblings().find('#scheduleYN');
			$scheduleYN.find("option:eq(0)").prop("selected",true);
			var $resPrice = $(this).parents('tr').siblings().find('#resPrice');
			$resPrice.val("");
			/* input초기화 끝 */
			if($(this).find('option:selected').val() != 'default'){
				var bCode = $(this).find('option:selected').val();
				$.ajax({
					url : "/reservationCourtListAll.do",
					type : "get",
					data : {bCode:bCode},
					success : function(data){
						for(var i=0;i<data.length;i++){
							var courtName = data[i].courtName;
							var courtCCode = data[i].courtCCode;
							$courtName.append('<option value="'+courtCCode+'">'+courtName+'</option>');
						}
					},
					error : function(){
						alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
					}
				});
			}
		});
		/* 구장 선택 시 동작 */
		$(document).on("change","#courtName",function(){
			if($('.view').attr('id') == 'scheduleAdd'){
				/* select초기화 시작 */
				var $startTime = $(this).parents('tr').siblings().find('#startTime');
				$startTime.find("option:eq(0)").prop("selected",true);
				var $endTime = $(this).parents('tr').siblings().find('#endTime');
				$endTime.find("option:eq(0)").prop("selected",true);
				var $scheduleYN = $(this).parents('tr').siblings().find('#scheduleYN');
				$scheduleYN.find("option:eq(0)").prop("selected",true);
				/* select초기화 끝 */
				/* input초기화 시작 */
				var $resPrice = $(this).parents('tr').siblings().find('#resPrice');
				$resPrice.val("");
				/* input초기화 끝 */
				if($(this).find('option:selected').val() != 'default'){
					var bCode = $(this).parents('tr').siblings().find('#branchName').val();
					var cCode = $(this).find('option:selected').val();
					$.ajax({
						url : "/reservationCourtType.do",
						type : "get",
						data : {bCode:bCode,cCode:cCode},
						success : function(data){
							var court = data.courtType;
							if(court == 'A'){
								$resPrice.val("120000");
							}else if(court == 'B'){
								$resPrice.val("100000");
							}else if(court == 'C'){
								$resPrice.val("80000");
							}
						},
						error : function(){
							alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
						}
					});
				}
			}else{
				/* select초기화 시작 */
				var $startTime = $(this).parents('tr').siblings().find('#startTime');
				$startTime.find('option').not('.default').remove();
				$startTime.find("option:eq(0)").prop("selected",true);
				var $endTime = $(this).parents('tr').siblings().find('#endTime');
				$endTime.find("option:eq(0)").prop("selected",true);
				var $scheduleYN = $(this).parents('tr').siblings().find('#scheduleYN');
				$scheduleYN.find("option:eq(0)").prop("selected",true);
				/* select초기화 끝 */
				/* input초기화 시작 */
				var $resPrice = $(this).parents('tr').siblings().find('#resPrice');
				$resPrice.val("");
				/* input초기화 끝 */
				if($(this).find('option:selected').val() != 'default'){
					/* 날짜 초기화 */
					$(this).parents('tr').siblings().find('#scheduleDate').val($('#scheduleDate').val().replace(/\./gi,'/'));
					/* 날짜 초기화 끝 */
					var cCode = $(this).find('option:selected').val();
					var result = $(this).parents('tr').siblings().find('#scheduleDate').val();
					$(this).parents('tr').siblings().find('#scheduleDate').val(txt);
					$.ajax({
						url : "/reservationCourtSelect.do",
						type : "get",
						data : {cCode:cCode,result:result},
						success : function(data){
							for(var i=0;i<data.length;i++){	
								var front = data[i].scheduleStartTime;
								var end = data[i].scheduleEndTime;
								$startTime.append('<option value='+front+'>'+front+'~'+end+'</option>');
							}
						},
						error : function(){
							alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
						}
					});
				}
			}
		});	
		/* 시간시간 선택 시 동작 */
		$(document).on("change","#startTime",function(){
			if($('.view').attr('id') == 'scheduleAdd'){
				/* select초기화 시작 */
				var $endTime = $(this).parents('tr').siblings().find('#endTime');
				$endTime.find("option:eq(0)").prop("selected",true);
				/* select초기화 끝 */
				if($(this).find('option:selected').val() != 'default'){
					var front = parseInt($(this).find('option:selected').val().substring(0,2))+2;
					var end = $(this).find('option:selected').val().substring(2,5);
					var check = front+end;
					for(var i=0;i<$(this).find('option').length;i++){
						if($('#endTime').find('option:eq('+i+')').val() == check){
							$('#endTime').find('option:eq('+i+')').prop("selected",true);
							break;
						}
					}
				}
			}
		});
		/* 끝시간 선택 시 동작 */
		$(document).on("change","#endTime",function(){
			if($('.view').attr('id') == 'scheduleAdd'){
				/* select초기화 시작 */
				var $startTime = $(this).parents('tr').siblings().find('#startTime');
				$startTime.find("option:eq(0)").prop("selected",true);
				/* select초기화 끝 */
				if($(this).find('option:selected').val() != 'default'){
					var front = parseInt($(this).find('option:selected').val().substring(0,2))-2;
					if(front < 10){
						front = "0"+front;
					}
					var end = $(this).find('option:selected').val().substring(2,5);
					var check = front+end;
					for(var i=0;i<$(this).find('option').length;i++){
						if($('#startTime').find('option:eq('+i+')').val() == check){
							$('#startTime').find('option:eq('+i+')').prop("selected",true);
							break;
						}
					}
				}
			}
		});


	</script>
	
	
</body>
</html>