<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
#video01 {
	position: absolute;
	top: 50%;
	left: 50%;
	min-width: 100%;
	min-height: 100%;
	transform: translateX(-50%) translateY(-55%);
	z-index: -1;
}
/* 페이지 타이틀  */
#title {
	position: absolute;
	z-index: 100;
	font-size: 70px;
	font-weight: 900;
	color: white;
	left: 10%;
	top: 400px;
}

.tab-container {
	position: absolute;
	top: 485px;
	width: 100%;
	height: 100px;
	text-align: center;
}
.noticeWriter{
	top:500px;
	border: 1px solid black;
	width:50%;
	height: 500px;
}
</style>
<body>
<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!--헤더 밑 영상  -->
	<div id="continer">
		<div id="mv">
			<video id="video01" class="pblock" autoplay playsinline muted loop title> 
				<source src="/img/page3.mp4" type="video/mp4"></video>
		</div>
		<!--영상 위 페이지 타이틀 -->
		<div id="title">고객센터</div>
	</div>
	<section>
	<!-- 글작성 -->
	<div class="tab-container">
		<form action="/noticeInsert" method="post" enctype="multipart/form-data">
			<center>
			<br><br><br><br>
			<table class="noticeWriter" border="1">
				<tr>
					<th colspan="2">공지사항 작성</th>
				</tr>
				<tr>
					<th>제목</th>
					<td>&nbsp;&nbsp;<input type="text" name="noticetitle" style="width:90%;"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><!-- 관리자아이디 --><input type="hidden" value=""></td><!-- 관리자아이디벨류값넣기 -->
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>&nbsp;&nbsp;<input type="file" name="filename"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						&nbsp;&nbsp;<textarea name="noticecontent" rows="3" cols="40" style="width:90%;height:200px;"></textarea>
					</td>
				</tr>
				<tr>
					<th colspan="2">
					<button type="submit">등록하기</button>
					<button type="reset">취소</button>
				</tr>
			</table>
			</center>
			<br><br><br><br><br>
		</form>
	</div>
	</section>
</body>
</html>