<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/admin/admin.css">
<link rel="stylesheet" href="/css/faq/faq.css">

<title>FAQ글쓰기</title>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp" />

	<!--영상 위 페이지 타이틀 -->
	<div id="title">FAQ</div>

	<br><br><br><br><br><br><br><br>
	<div class="full">
			<form action="/insertFAQ">
			<center>
			<table class="table" id="tb1">
			<tr>
				<th colspan="2" id="FAQTitle">FAQ 작성</th>
			</tr>
				<tr>
					<th class="ft">제목</th>
					<td><input type="text" name="faqtitle" id="faqtitle"></td>
				</tr>
				<tr>
					<th class="ft">내용</th>
					<td><textarea rows="6" name="faqcontent" id="faqcontent"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><button type="submit">등록</button>
					<button type="reset">취소</button></td>
				</tr>
			</table>
			</center>
			</form>
		</div>	
</body>
</html>