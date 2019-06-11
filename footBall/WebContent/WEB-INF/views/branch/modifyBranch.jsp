<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href="css/common/admin.css">
<link rel='stylesheet' href="css/branch/branchManage.css?ver=1.2">

<meta charset="UTF-8">
<title>KS 지점 정보 수정</title>
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
			<form action="/modifyBData" method="post" enctype="multipart/form-data">
				<table class="manageTable" border="1">
					<tr><th colspan="6">지점 정보</th></tr>
					<tr><td colspan="3">지점 코드</td><td colspan="3"><span name="branchCode"></span></td></tr>
					<tr><td colspan="3">지점 이름</td><td colspan="3"><input type="text" name="branchName"></td></tr>
					<tr><td colspan="3">지점 주소(지번)</td><td colspan="3"><input type="text" name="branchAddr"></td></tr>
					<tr><td colspan="3">전화번호(국번)</td><td colspan="3"><input type="text" name="branchPhone"></td></tr>
					<tr><td colspan="3">휴대폰 번호</td><td colspan="3"><input type="text" name="branchTel"></td></tr>					
					<tr><th colspan="6">지점 세부 정보</th></tr>
					<tr>
						<td>구장 이름1</td><td><input type="text" name="courtName1"></td>
						<td>구장 타입1(A,B,C 중 하나)</td><td><input type="text" name="courtType1"></td>
						<td>실내/실외 구분</td><td><input type="text" name="courtIndoor1"><input type="hidden" name="courtCode1"></td>
					</tr>
					<tr>
						<td>구장 이름2</td><td><input type="text" name="courtName2"></td>
						<td>구장 타입2(A,B,C 중 하나)</td><td><input type="text" name="courtType2"></td>
						<td>실내/실외 구분</td><td><input type="text" name="courtIndoor2"><input type="hidden" name="courtCode2"></td>
					</tr>
					<tr>
						<td>구장 이름3</td><td><input type="text" name="courtName3"></td>
						<td>구장 타입3(A,B,C 중 하나)</td><td><input type="text" name="courtType3"></td>
						<td>실내/실외 구분</td><td><input type="text" name="courtIndoor3"><input type="hidden" name="courtCode3"></td>
					</tr>
					<tr>
						<td colspan="3">지점 사진(삭제 후 멀티 업로드, 최대 4장)</td>
						<td colspan="3">
							<span class="identifier">
								<c:if test="${bd.bi.bi1 ne null }">
									<input type="hidden" class="status" name="status1" value="stay">
									<input type="hidden" name="oldFilename1" value="${bd.bi.bi1 }">
									<input type="hidden" name="oldFilepath1" value="${bd.bi.bi1 }">
									<img class="delFile" src="/img/file.png" width="16px">
									<span class="delFile">${bd.bi.bi1 }</span>
									<button type="button" class="fileDelBtn">삭제</button>
								</c:if>
							</span><br>
							<span class="identifier">
								<c:if test="${bd.bi.bi2 ne null }">
									<input type="hidden" class="status" name="status2" value="stay">
									<input type="hidden" name="oldFilename2" value="${bd.bi.bi2 }">
									<input type="hidden" name="oldFilepath2" value="${bd.bi.bi2 }">
									<img class="delFile" src="/img/file.png" width="16px">
									<span class="delFile">${bd.bi.bi2 }</span>
									<button type="button" class="fileDelBtn">삭제</button>
								</c:if>
							</span><br>
							<span class="identifier">
								<c:if test="${bd.bi.bi3 ne null }">
									<input type="hidden" class="status" name="status3" value="stay">
									<input type="hidden" name="oldFilename3" value="${bd.bi.bi3 }">
									<input type="hidden" name="oldFilepath3" value="${bd.bi.bi3 }">
									<img class="delFile" src="/img/file.png" width="16px">
									<span class="delFile">${bd.bi.bi3 }</span>
									<button type="button" class="fileDelBtn">삭제</button>
								</c:if>
							</span><br>
							<span class="identifier">
								<c:if test="${bd.bi.bi4 ne null }">
									<input type="hidden" class="status" name="status4" value="stay">
									<input type="hidden" name="oldFilename4" value="${bd.bi.bi4 }">
									<input type="hidden" name="oldFilepath4" value="${bd.bi.bi4 }">
									<img class="delFile" src="/img/file.png" width="16px">
									<span class="delFile">${bd.bi.bi4 }</span>
									<button type="button" class="fileDelBtn">삭제</button>
								</c:if>
							</span><br>
							사진 추가 <input type="file" name="photo" multiple="multiple">
						</td>
					</tr>
					<tr><td colspan="6"><a class="link-manage" href="/branchManage">취소</a><button class="btn-manage" type="submit" id="submit">확인</button></td></tr>
				</table>
			</form>
		</section>
	<script>
		$(function(){
			$('span[name=branchCode]').html('${requestScope.bd.b.branchCode}');
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
			$('input[name=courtCode1]').val('${requestScope.bd.cd.code1}');
			$('input[name=courtCode2]').val('${requestScope.bd.cd.code2}');
			$('input[name=courtCode3]').val('${requestScope.bd.cd.code3}');
		});	
		$(".fileDelBtn").click(function(){
			if(confirm("sure?")){
				$(this).siblings().eq(3).hide();
				$(this).siblings().eq(4).hide();
				$(this).hide();
				$(this).siblings().eq(0).val('delete');
			}
		});
	</script>	
</body>
</html>