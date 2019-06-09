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
<style>
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
						<a class="side_a" id="side_menu2" style="color: #df0101;">구장 등록/수정/삭제</a>
					</div>
					<div style="margin-bottom: 15px;">
						<a class="side_a" id="side_menu3" style="color: gray;">물품 등록/수정/삭제</a>
					</div>
					<div style="margin-bottom: 15px;">
						<a class="side_a" id="side_menu4" style="color: gray;">스케쥴 등록/수정/삭제</a>
					</div>
				</div>
				<!-- 사이드 메뉴 종료 -->
				<!-- 컨텐츠 -->
				<div style="width: 78%; height: 2000px; border-left: 1px solid silver; display: inline-block; overflow: hidden;">
					<!-- 컨텐츠 타이틀 -->
					<div id="reservationTitle" style="color:black;margin-left:50px;">[관리자] 구장 관리</div>
					<!-- 본문 -->
					<!-- 컨텐츠 파티션 -->
					<div style="width:90%; margin-left:40px;margin-top:50px;">
						<button style="width:150px;height:50px;background-color:black;color:white;font-size:20px;font-weight:bolder;border:0;padding:0;margin:0;float:left;">구장등록</button>
						<button style="width:150px;height:50px;background-color:gray;color:white;font-size:20px;font-weight:bolder;border:0;padding:0;margin:0;float:left;">구장수정</button>
						<button style="width:150px;height:50px;background-color:gray;color:white;font-size:20px;font-weight:bolder;border:0;padding:0;margin:0;display:inline-block;">구장삭제</button>
						<form>
							<div style="width:500px;border:3px solid black;padding:40px;">
								<table style="width:500px;margin-bottom:10px;">
									<tr>
										<th>지점</th>
										<td>
											<select id="branchName" name="branchName" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 지점 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<th>구장타입</th>
										<td>
											<select id="courtType" name="courtType" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 구장타입 :::</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>구장이름</th>
										<td>
											<input id="courtName" name="courtName" type="text" style="width:396px;height:36px;font-size:18px;">
										</td>
									</tr>
									<tr>
										<th>실내/실외</th>
										<td>
											<select id="inOut" name="inOut" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 실내/실외 :::</option>
											</select>									
										</td>
									</tr>
									<tr>
										<th></th>
										<td>
										<input id="view" name="view" type="text" placeholder="저장될 구장명 미리보기" style="width:396px;height:36px;font-size:18px;" readonly disabled>
										</td>
									</tr>
								</table>
								<button type="submit" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:black;font-size:18px;display:inline-block;margin-left:316px;">등록</button>
								<button type="reset" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:gray;font-size:18px;display:inline-block;">리셋</button>
							</div>
						</form>
					</div>
					

					
						<form>
							<div style="width:500px;border:3px solid black;padding:40px;">
								<table style="width:500px;margin-bottom:10px;">
									<tr>
										<th>구장이름</th>
										<td>
											<input id="courtName" name="courtName" type="text" style="width:396px;height:36px;font-size:18px;">
										</td>
									</tr>
									<tr>
										<th>가능여부</th>
										<td>
											<select id="inOut" name="inOut" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 가능/불가능 :::</option>
												<option value="statusYes" selected>가능</option>
												<option value="statusNo" selected>불가능</option>
											</select>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="font-size:13px;color:#df0101;">* 가능여부를 불가능으로 변경 시 해당 구장은 대관예약에 보이지 않게 됩니다.</td>
									</tr>
								</table>
								<button type="submit" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:black;font-size:18px;display:inline-block;margin-left:316px;">변경</button>
								<button type="reset" style="margin:0;padding:0;width:80px;height:30px;border:0;color:white;background-color:gray;font-size:18px;display:inline-block;">리셋</button>
							</div>
						</form>
					
					
					
					
	
						<p style="font-size: 30px; font-weight: bold;color:gray;padding:0;margin-top:50px;margin-bottom:0;">- 구장 삭제</p>
						<form>
							<div style="width:500px;border:3px solid black;margin-top:20px;padding:20px;">
								<table style="width:500px;">
									<tr>
										<th>지점</th>
										<td>
											<select id="branchName" name="branchName" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 지점 :::</option>
											</select>								
										</td>
									</tr>
									<tr>
										<th>구장타입</th>
										<td>
											<select id="courtType" name="courtType" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 구장타입 :::</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>구장이름</th>
										<td>
											<input id="courtName" name="courtName" type="text" style="width:396px;height:36px;font-size:18px;">
										</td>
									</tr>
									<tr>
										<th>실내/실외</th>
										<td>
											<select id="inOut" name="inOut" style="width:400px;height:40px;font-size:18px;">
												<option value="default" selected>::: 실내/실외 :::</option>
											</select>									
										</td>
									</tr>
									<tr>
										<th></th>
										<td>
										<input id="view" name="view" type="text" placeholder="저장될 구장명 미리보기" style="width:396px;height:36px;font-size:18px;" readonly disabled>
										</td>
									</tr>
								</table>
							</div>
							<button type="submit" style="margin:0;padding:0;width:150px;height:50px;border:0;color:white;background-color:black;font-size:20px;font-weight:bolder;float:left;">등록</button>
							<button type="reset" style="margin:0;padding:0;width:150px;height:50px;border:0;color:white;background-color:gray;font-size:20px;font-weight:bolder;">리셋</button>
						</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>