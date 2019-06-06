<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel='stylesheet' href="css/common/pageCss.css">
<link rel='stylesheet' href="css/common/admin.css">
<link rel='stylesheet' href="css/branch/branchManage.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[관리자]지점관리</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=wsxy6r6myr&submodules=geocoder"></script> <!-- 네이버 api 추가 -->
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
<script>
	/* 헤더 슬라이드 이미지 */
	$(document).ready(function(){
		$('#ground1').append('<img src="/img/ground1.png" alt="그라운드1" style="width:100%;height:500px;">');
		$('#ground2').append('<img src="/img/ground2.jpg" alt="그라운드2" style="width:100%;height:500px;">');
		$('#ground3').append('<img src="/img/ground3.jpg" alt="그라운드3" style="width:100%;height:500px;">');
		$('#ground4').append('<img src="/img/ground4.jpg" alt="그라운드4" style="width:100%;height:500px;">');
		$('#ground5').append('<img src="/img/ground5.jpg" alt="그라운드5" style="width:100%;height:500px;">');
	 });
</script>
<style>

</style>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/admin/admin.jsp" />
	<hr class="hr-menu">
	<div class="content-container" style="top:0">
		<div class="content-wrapper">
			<table class="manageTable" border="1">
				<tr>
					<th>지점 이름</th><th>주 소</th><th>구장 정보</th><th>전화번호</th><th>휴대폰</th><th>첨부파일</th><th>정보 수정</th><th>지점 삭제</th>
				</tr>
				<c:forEach items="${list }" var="bd" varStatus="index">
					<tr>
						<td>${bd.b.branchName }</td>
						<td>${bd.b.branchAddr }</td>
						<td>${bd.cd.c1 }<br>${bd.cd.c2 }<br>${bd.cd.c3 }<br></td>
						<td>${bd.b.branchPhone }</td>
						<td>${bd.b.branchTel }</td>
						<td>
							<span class="identifier"><img src="img/file.png"> <span class="biInfo">${bd.bi.bi1 }</span></span><br>
							<span class="identifier"><img src="img/file.png"> <span class="biInfo">${bd.bi.bi2 }</span></span><br>
							<span class="identifier"><img src="img/file.png"> <span class="biInfo">${bd.bi.bi3 }</span></span><br>
							<span class="identifier"><img src="img/file.png"> <span class="biInfo">${bd.bi.bi4 }</span></span><br>
						</td>
						<td><button class="btn-modify" onclick="location.href='/modifyBranch?branchName=${bd.b.branchName}'">정보 수정</button></td>
						<td><button class="btn-delete" onclick="location.href='/deleteBranch?branchName=${bd.b.branchName}'">지점 삭제</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
	<script>
		$(function(){
			console.log($('.identifier'));
			/* 소스 없는 서브이미지 태그 감추기 */
			$('.identifier').each(function(index,item){
				if(!($(item).children().last().html())) {
					$(this).css('display','none');
				}
			});
		});
	</script>
</html>