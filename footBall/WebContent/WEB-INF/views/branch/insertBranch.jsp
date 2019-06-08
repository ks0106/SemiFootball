<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href="css/common/admin.css">
<link rel='stylesheet' href="css/branch/branchManage.css">

<meta charset="UTF-8">
<title>[관리자]지점관리</title>
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
		<!-- 헤더 불러오기 -->
		<div id="title">[관리자] 지점 추가</div>
		<section style="padding-top: 120px; height: 1000px;" >
			<form action="/insertBInfo" method="post">
				<table class="manageTable" border="1">
					<tr><td colspan="4">지점 등록하기</td></tr>
					<tr><td colspan="2">지점 이름</td><td colspan="2"><input type="text" name="branchName"></td></tr>
					<tr><td colspan="2">지점 주소(지번)</td><td colspan="2"><input type="text" name="branchAddr"></td></tr>
					<tr><td colspan="2">전화번호(국번)</td><td colspan="2"><input type="text" name="branchPhone"></td></tr>
					<tr><td colspan="2">휴대폰 번호</td><td colspan="2"><input type="text" name="branchTel"></td></tr>					
					<tr><td colspan="4"><a href="/branchManage">취소</a><button type="submit" id="submit">확인</button></td></tr>
				</table>
			</form>
			<br><br>
			<form action="/insertBiAndC" method="post" enctype="multipary/form-data">
				<table class="manageTable" border="1">
					<tr><td colspan="4">새 지점의 세부 정보 등록하기 (주의 : 지점 등록 이후에 세부정보 입력 가능)</td></tr>
					<tr><td colspan="2">지점 코드</td><td colspan="2"><input type="text" name="branchCode"></td></tr>
					<tr><td>구장 이름1</td><td><input type="text" name="courtName1"></td><td>구장 타입1(A,B,C 중 하나)</td><td><input type="text" name="courtType1"></td></tr>
					<tr><td>구장 이름2</td><td><input type="text" name="courtName2"></td><td>구장 타입2(A,B,C 중 하나)</td><td><input type="text" name="courtType2"></td></tr>
					<tr><td>구장 이름3</td><td><input type="text" name="courtName3"></td><td>구장 타입3(A,B,C 중 하나)</td><td><input type="text" name="courtType3"></td></tr>
					<tr><td colspan="2">지점 사진(최대 4장)</td><td colspan="2"><input type="file" name="photo" multiple="multiple"></td></tr>
					<tr><td colspan="4"><a href="/branchManage">취소</a><button type="submit" id="submit">확인</button></td></tr>
				</table>
			</form>
		</section>
</body>
</html>