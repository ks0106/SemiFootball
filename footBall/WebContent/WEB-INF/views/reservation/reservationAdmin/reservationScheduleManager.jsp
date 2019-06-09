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
<!-- reservation 공통 js => jqeury를 이용하기 때문에 jquery import 밑으로 내려야 한다. -->
<script type="text/javascript" src="/js/reservation/reservationAdminAll.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
</script>
<script>
	$(document).ready(function(){
		$('form:first').removeClass('noView');
		$('form:first').addClass('view');
		$('#scheduleAddBtn').removeClass('scheduleManagerBtn');
		$('#scheduleAddBtn').addClass('scheduleManagerBtnSelect');		
		
		$(document).on("click",".scheduleManagerBtn",function(){
			$(this).siblings('button').removeClass('scheduleManagerBtnSelect');
			$(this).siblings('button').addClass('scheduleManagerBtn');
			$(this).removeClass('scheduleManagerBtn');
			$(this).addClass('scheduleManagerBtnSelect');
			var $target = $(this).attr('id').replace('Btn',"");
			$('#'+$target).siblings('form').removeClass('view');
			$('#'+$target).siblings('form').addClass('noView');
			$('#'+$target).removeClass('noView');			
			$('#'+$target).addClass('view');			
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
		<div style="width:100%;overflow:hidden;margin-top:30px;">
			<div style="width: 95%; background-color: white; margin: 0 auto; overflow: hidden;">
				<!-- 컨텐츠 사이드 메뉴 -->
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
				<!-- 사이드 메뉴 종료 -->
				<!-- 컨텐츠 -->
				<div style="width: 78%; height:100vh; border-left: 1px solid silver; display: inline-block; overflow:hidden;">
					<!-- 컨텐츠 타이틀 -->
					<div id="reservationTitle" style="color:black;margin-left:50px;">[관리자] 스케쥴 관리</div>
					<!-- 본문 -->
					<!-- 달력 -->
					<div style="width:530px;float:right;position:fixed;right:150px;bottom:200px;">
						<jsp:include page="/views/test/calendar.jsp" />
					</div>
					<!-- 컨텐츠 파티션 -->
					<div style="width:90%; margin-left:40px;margin-top:50px;">
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
											<input id="scheduleDate" name="scheduleDate" type="text" style="width:396px;height:36px;font-size:18px;" readonly disabled>
										</td>
									</tr>
									<tr>
										<th>지점</th>
										<td>
											<select id="branchName" name="branchName" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 지점선택 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<th>구장</th>
										<td>
											<select id="courtName" name="courtName" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 구장선택 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<th>시작시간</th>
										<td>
											<select id="scheduleStartTime" name="scheduleStartTime" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 시작시간 선택 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<th>끝시간</th>
										<td>
											<select id="scheduleEndTime" name="scheduleEndTime" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 끝시간 선택 :::</option>
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
											<input id="scheduleAmount" name="scheduleAmount" type="number" min="0" style="width:396px;height:36px;font-size:18px;">
										</td>
									</tr>
									<tr>
										<td colspan="2" style="color:#df0101;font-size:13px;font-weight:bolder;">
											* 구장 타입에 따라 자동으로 세팅되나 임의로 수정하여 등록할 수 있습니다.
										</td>
									</tr>
								</table>
								<button type="submit" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:black;font-size:18px;display:inline-block;margin-left:400px;">등록</button>
								<button type="reset" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:gray;font-size:18px;display:inline-block;">리셋</button>
							</div>
						</form>
						<form class="noView" id="scheduleModify" action="/reservationManagerScheduleModify" method="post">
							<div style="width:650px;border:3px solid black;padding:40px;text-align:center;">
								<table style="width:650px;margin-bottom:10px;">
									<tr>
										<th>날짜</th>
										<td>
											<input id="scheduleDate" name="scheduleDate" type="text" style="width:396px;height:36px;font-size:18px;" readonly disabled>
										</td>
									</tr>
									<tr>
										<th>지점</th>
										<td>
											<select id="branchName" name="branchName" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 지점선택 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<th>구장</th>
										<td>
											<select id="courtName" name="courtName" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 구장선택 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<th>시간</th>
										<td>
											<select id="scheduleStartTime" name="scheduleStartTime" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 시작시간 선택 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<th>가격</th>
										<td>
											<input id="scheduleNewPrice" name="scheduleNewPrice" type="number" min="0" style="width:396px;height:36px;font-size:18px;">
										</td>
									</tr>
									<tr>
										<th>대관여부</th>
										<td>
											<select id="scheduleStartTime" name="scheduleStartTime" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 가능/불가능 :::</option>
												<option value="0" selected>가능</option>
												<option value="1" selected>불가능</option>
											</select>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="color:#df0101;font-size:13px;font-weight:bolder;">
											* 가격, 대관여부만 변경할 수 있습니다.
										</td>
									</tr>
								</table>
								<button type="submit" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:black;font-size:18px;display:inline-block;margin-left:400px;">수정</button>
								<button type="reset" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:gray;font-size:18px;display:inline-block;">리셋</button>
							</div>
						</form>
						<form class="noView" id="scheduleDelete" action="/reservationManagerScheduleDelete" method="post">
							<div style="width:650px;border:3px solid black;padding:40px;text-align:center;">
								<table style="width:650px;margin-bottom:10px;">
									<tr>
										<th>날짜</th>
										<td>
											<input id="scheduleDate" name="scheduleDate" type="text" style="width:396px;height:36px;font-size:18px;" readonly disabled>
										</td>
									</tr>
									<tr>
										<th>지점</th>
										<td>
											<select id="branchName" name="branchName" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 지점선택 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<th>구장</th>
										<td>
											<select id="courtName" name="courtName" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 구장선택 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<th>시작시간</th>
										<td>
											<select id="scheduleStartTime" name="scheduleStartTime" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 시작시간 선택 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<td colspan="2" style="color:#df0101;font-size:13px;font-weight:bolder;">
											! 해당 스케쥴의 대관여부가 불가능이고, 현재 이용중인 고객이 없을 때에만 삭제할 수 있습니다.
										</td>
									</tr>
								</table>
								<button type="submit" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:black;font-size:18px;display:inline-block;margin-left:400px;">삭제</button>
								<button type="reset" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:gray;font-size:18px;display:inline-block;">리셋</button>
							</div>
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
</body>
</html>