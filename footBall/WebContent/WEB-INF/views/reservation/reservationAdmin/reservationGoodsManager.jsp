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
	$(document).ready(function(){
		$('form:first').removeClass('noView');
		$('form:first').addClass('view');
		$('#goodsAddBtn').removeClass('goodsManagerBtn');
		$('#goodsAddBtn').addClass('goodsManagerBtnSelect');		
		
		$(document).on("click",".goodsManagerBtn",function(){
			$(this).siblings('button').removeClass('goodsManagerBtnSelect');
			$(this).siblings('button').addClass('goodsManagerBtn');
			$(this).removeClass('goodsManagerBtn');
			$(this).addClass('goodsManagerBtnSelect');
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
	.goodsManagerBtn{
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
	.goodsManagerBtn:hover{
		background-color:rgb(225,225,225);
		color:black;
	}
	.goodsManagerBtnSelect{
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
						<a class="side_a" id="side_menu2" style="color: #df0101;">물품 등록/수정/삭제</a>
					</div>
					<div style="margin-bottom: 15px;">
						<a class="side_a" id="side_menu3" style="color: gray;">스케쥴 등록/수정/삭제</a>
					</div>
				</div>
				<!-- 사이드 메뉴 종료 -->
				<!-- 컨텐츠 -->
				<div style="width: 78%; height: 100vh; border-left: 1px solid silver; display: inline-block; overflow: hidden;">
					<!-- 컨텐츠 타이틀 -->
					<div id="reservationTitle" style="color:black;margin-left:50px;">[관리자] 물품 관리</div>
					<!-- 본문 -->
					<!-- 컨텐츠 파티션 -->
					<div style="width:90%; margin-left:40px;margin-top:50px;">
						<button class="goodsManagerBtn" id="goodsAddBtn" style="float:left;">물품등록</button>
						<button class="goodsManagerBtn" id="goodsPriceModifyBtn" style="float:left;">가격변경</button>
						<button class="goodsManagerBtn" id="goodsAmountModifyBtn" style="float:left;">재고변경</button>
						<button class="goodsManagerBtn" id="goodsDeleteBtn" style="display:inline-block;">물품삭제</button>
						<div id="formArea">
						<form class="noView" id="goodsAdd" action="/reservationManagerGoodsAdd" method="post">
							<div style="width:650px;border:3px solid black;padding:40px;text-align:center;">
								<table style="width:650px;margin-bottom:10px;">
									<tr>
										<th>지점</th>
										<td>
											<select id="branchName" name="branchName" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 지점선택 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<th>카테고리</th>
										<td>
											<select id="goodsCategory" name="goodsCategory" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 카테고리선택 :::</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>물품명</th>
										<td>
											<input id="goodsName" name="goodsName" type="text" style="width:396px;height:36px;font-size:18px;">
										</td>
									</tr>
									<tr>
										<th>규격/용량</th>
										<td>
											<input id="goodsSize" name="goodsSize" type="text" style="width:396px;height:36px;font-size:18px;">
										</td>
									</tr>
									<tr>
										<th>가격</th>
										<td>
											<input id="goodsPrice" name="goodsPrice" type="number" min="0" style="width:396px;height:36px;font-size:18px;">
										</td>
									</tr>
									<tr>
										<th>수량</th>
										<td>
											<input id="goodsAmount" name="goodsAmount" type="number" min="0" style="width:396px;height:36px;font-size:18px;">
										</td>
									</tr>
								</table>
								<button type="submit" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:black;font-size:18px;display:inline-block;margin-left:400px;">등록</button>
								<button type="reset" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:gray;font-size:18px;display:inline-block;">리셋</button>
							</div>
						</form>					
						<form class="noView" id="goodsPriceModify" action="/reservationManagerGoodsPriceModify" method="post">
							<div style="width:650px;border:3px solid black;padding:40px;text-align:center;">
								<table style="width:650px;margin-bottom:10px;">
									<tr>
										<th>지점</th>
										<td>
											<select id="branchName" name="branchName" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 지점 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<th>물품명</th>
										<td>
											<select id="goodsName" name="goodsName" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 물품선택 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<th>규격/용량</th>
										<td>
											<select id="goodsSize" name="goodsSize" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 규격/용량선택 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<th>기존단가</th>
										<td>
											<input id="goodsOldPrice" name="goodsOldPrice" type="number" min="0" style="width:396px;height:36px;font-size:18px;" readonly disabled>
										</td>
									</tr>									
									<tr>
										<th>새단가</th>
										<td>
											<input id="goodsNewPrice" name="goodsNewPrice" type="number" min="0" style="width:396px;height:36px;font-size:18px;">
										</td>
									</tr>
									<tr>
										<td colspan="2" style="color:#df0101;font-size:13px;font-weight:bolder;">
											* 변경할 개당 가격을 입력해주세요.
										</td>
									</tr>
								</table>
								<button type="submit" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:black;font-size:18px;display:inline-block;margin-left:400px;">수정</button>
								<button type="reset" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:gray;font-size:18px;display:inline-block;">리셋</button>
							</div>
						</form>
						<form class="noView" id="goodsAmountModify" action="/reservationManagerGoodsAmountModify" method="post">
							<div style="width:650px;border:3px solid black;padding:40px;text-align:center;">
								<table style="width:650px;margin-bottom:10px;">
									<tr>
										<th>지점</th>
										<td>
											<select id="branchName" name="branchName" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 지점 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<th>물품명</th>
										<td>
											<select id="goodsName" name="goodsName" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 물품선택 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<th>규격/용량</th>
										<td>
											<select id="goodsSize" name="goodsSize" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 규격/용량선택 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<th>기존수량</th>
										<td>
											<input id="goodsOldAmount" name="goodsOldAmount" type="text" style="width:396px;height:36px;font-size:18px;" readonly disabled>
										</td>
									</tr>									
									<tr>
										<th>변경수량</th>
										<td>
											<input id="goodsNewAmount" name="goodsNewAmount" type="number" min="0" style="width:396px;height:36px;font-size:18px;">
										</td>
									</tr>
									<tr>
										<td colspan="2" style="color:#df0101;font-size:13px;font-weight:bolder;">
											* 기존수량을 기준으로 변경됩니다.
										</td>
									</tr>									
								</table>
								<button type="submit" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:black;font-size:18px;display:inline-block;margin-left:350px;">입고</button>
								<button type="submit" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:black;font-size:18px;display:inline-block;">출고</button>
								<button type="reset" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:gray;font-size:18px;display:inline-block;">리셋</button>
							</div>
						</form>
						<form class="noView" id="goodsDelete" action="/reservationManagerGoodsDelete" method="post">
							<div style="width:650px;border:3px solid black;padding:40px;text-align:center;">
								<table style="width:650px;margin-bottom:10px;">
									<tr>
										<th>지점</th>
										<td>
											<select id="branchName" name="branchName" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 지점 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<th>물품명</th>
										<td>
											<select id="goodsName" name="goodsName" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 물품선택 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<th>규격/용량</th>
										<td>
											<select id="goodsSize" name="goodsSize" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 규격/용량선택 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<td colspan="2" style="color:#df0101;font-size:13px;font-weight:bolder;">
											! 재고가 0이고, 현재 해당 제품을 이용 중인 고객이 없을 경우에만 가능합니다.
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