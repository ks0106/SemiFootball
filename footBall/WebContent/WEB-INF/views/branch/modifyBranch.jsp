<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href="css/common/admin.css">
<link rel='stylesheet' href="css/branch/branchManage.css">

<meta charset="UTF-8">
<title>[관리자]지점 정보 수정</title>
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
		<!-- 헤더 불러오기 -->
		<div id="title">[관리자] 지점 정보 수정</div>
		<section style="padding-top: 120px; height: 1000px;" >
			<form action="/modifyBData" method="post">
				<table class="manageTable" border="1">
					<tr><th colspan="6">지점 정보</th></tr>
					<tr><td colspan="3">지점 코드</td><td colspan="3"><input type="text" name="branchCode" readonly="readonly"></td></tr>
					<tr><td colspan="3">지점 이름</td><td colspan="3"><input type="text" name="branchName"></td></tr>
					<tr><td colspan="3">지점 주소(지번)</td><td colspan="3"><input type="text" name="branchAddr"></td></tr>
					<tr><td colspan="3">전화번호(국번)</td><td colspan="3"><input type="text" name="branchPhone"></td></tr>
					<tr><td colspan="3">휴대폰 번호</td><td colspan="3"><input type="text" name="branchTel"></td></tr>					
					<tr><th colspan="6">지점 세부 정보</th></tr>
					<tr>
						<td>구장 이름1</td><td><input type="text" name="courtName1"></td>
						<td>구장 타입1(A,B,C 중 하나)</td><td><input type="text" name="courtType1"></td>
						<td>실내/실외 구분</td><td><input type="text" name="courtIndoor1"></td>
					</tr>
					<tr>
						<td>구장 이름2</td><td><input type="text" name="courtName2"></td>
						<td>구장 타입2(A,B,C 중 하나)</td><td><input type="text" name="courtType2"></td>
						<td>실내/실외 구분</td><td><input type="text" name="courtIndoor2"></td>
					</tr>
					<tr>
						<td>구장 이름3</td><td><input type="text" name="courtName3"></td>
						<td>구장 타입3(A,B,C 중 하나)</td><td><input type="text" name="courtType3"></td>
						<td>실내/실외 구분</td><td><input type="text" name="courtIndoor3"></td>
					</tr>
					<tr>
						<td colspan="3">지점 사진(최대 4장)</td>
						<td colspan="3">
							<span class="identifier"><img src="img/file.png"> <span class="biInfo">${bd.bi.bi1 }</span></span><br>
							<span class="identifier"><img src="img/file.png"> <span class="biInfo">${bd.bi.bi2 }</span></span><br>
							<span class="identifier"><img src="img/file.png"> <span class="biInfo">${bd.bi.bi3 }</span></span><br>
							<span class="identifier"><img src="img/file.png"> <span class="biInfo">${bd.bi.bi4 }</span></span><br>
						</td>
					</tr>
					<tr><td colspan="6"><a href="/branchManage">취소</a><button type="submit" id="submit">확인</button></td></tr>
				</table>
			</form>
		</section>
	<script>
		$(function(){
			$('input[name=branchCode]').val('${requestScope.bd.b.branchCode}');
			$('input[name=branchName]').val('${requestScope.bd.b.branchName}');
			$('input[name=branchAddr]').val('${requestScope.bd.b.branchAddr}');
			$('input[name=branchPhone]').val('${requestScope.bd.b.branchPhone}');
			$('input[name=branchTel]').val('${requestScope.bd.b.branchTel}');
			$('input[name=courtName1]').val('${requestScope.bd.cd.c1}');
			$('input[name=courtName2]').val('${requestScope.bd.cd.c2}');
			$('input[name=courtName3]').val('${requestScope.bd.cd.c3}');
			$('input[name=courtType1]').val('${requestScope.bd.cd.t1}');
			$('input[name=courtType2]').val('${requestScope.bd.cd.t2}');
			$('input[name=courtType3]').val('${requestScope.bd.cd.t3}');
			$('input[name=courtIndoor1]').val('${requestScope.bd.cd.i1}');
			$('input[name=courtIndoor2]').val('${requestScope.bd.cd.i2}');
			$('input[name=courtIndoor3]').val('${requestScope.bd.cd.i3}');

			$('.identifier').each(function(index,item){
				if(!($(item).children().last().html())) {
					$(this).css('display','none');
				}
			});
		});
	</script>	
</body>
</html>