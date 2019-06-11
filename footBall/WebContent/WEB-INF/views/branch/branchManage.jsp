<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel='stylesheet' href="css/common/admin.css">
<link rel='stylesheet' href="css/branch/branchManage.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KS 지점관리</title>
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	<!-- 헤더 불러오기 -->
	<div id="title">[관리자] 지점 관리</div>
	<section style="margin-top:120px;" >
		<div class="content-container" style="top:0">
			<div class="content-wrapper">
				<table class="manageTable" border="1">
					<tr><td colspan="11"><button id="btn-insert" onclick="location.href='/insertBranch'">지점 추가</button></td></tr>
					<tr>
						<th>지점 코드</th><th>지점 이름</th><th>주 소</th><th>구장이름</th><th>구장 타입</th><th>실내/실외</th><th>전화번호</th><th>휴대폰</th><th>첨부파일</th><th>정보 수정</th><th>지점 삭제</th>
					</tr>
					<c:forEach items="${list }" var="bd" varStatus="index">
						<tr>
							<td>${bd.b.branchCode }</td>
							<td>${bd.b.branchName }</td>
							<td>${bd.b.branchAddr }</td>
							<td>${bd.cd.c1 }<br>${bd.cd.c2 }<br>${bd.cd.c3 }</td>
							<td>${bd.cd.t1 }<br>${bd.cd.t2 }<br>${bd.cd.t3 }</td>
							<td>${bd.cd.i1 }<br>${bd.cd.i2 }<br>${bd.cd.i3 }</td>
							<td>${bd.b.branchPhone }</td>
							<td>${bd.b.branchTel }</td>
							<td>
								<span class="identifier"><img src="img/file.png"> <span class="biInfo">${bd.bi.bi1 }</span></span><br>
								<span class="identifier"><img src="img/file.png"> <span class="biInfo">${bd.bi.bi2 }</span></span><br>
								<span class="identifier"><img src="img/file.png"> <span class="biInfo">${bd.bi.bi3 }</span></span><br>
								<span class="identifier"><img src="img/file.png"> <span class="biInfo">${bd.bi.bi4 }</span></span><br>
							</td>
							<td><button class="btn-modify" onclick="location.href='/modifyBranch?branchCode=${bd.b.branchCode}'">정보 수정</button></td>
							<td><button class="btn-delete" onclick="location.href='/deleteBranch?branchCode=${bd.b.branchCode}'">지점 삭제</button></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</section>
</body>
	<script>
		$(function(){
			/* 소스 없는 서브이미지 태그 감추기 */
			$('.identifier').each(function(index,item){
				if(!($(item).children().last().html())) {
					$(this).css('display','none');
				}
			});
		});
		$('.btn-delete').click(function(){
			alert("지점이 삭제되었습니다");
		});
	</script>
</html>