<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

.tab-list {
	margin: 0; padding0;
	height: 100%;
	list-style-type: none;
	border-bottom: 1px solid black;
	padding-left: 0;
}

.list-li {
	height: 100%;
	width: 50%;
	float: left;
	text-align: center;
	line-height: 100px;
	font-size: 40px;
	font-weight: bold;
	border-right: 1px solid black;
	box-sizing: border-box;
}

.navi_match_li:last-child {
	border-right: none;
}

.munebar {
	text-decoration: none;
	color: black;
}

.selected {
	background-color: lightgray;
}
</style>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!--헤더 밑 영상  -->
	<div id="continer">
		<div id="mv">
			<video id="video01" class="pblock" autoplay playsinline muted loop
				title> <source src="/img/page3.mp4" type="video/mp4"></video>
		</div>
		<!--영상 위 페이지 타이틀 -->
		<div id="title">고객센터</div>
	</div>
	<section>
	<div class="tab-container">
		<center><h1>
			<u>공지사항</u>
		</h1>

		<table>
			<tr>
				<th>제목</th>
				<td>${nvd.nv.noticetitle }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${nvd.nv.noticewriter }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${nvd.nv.noticehit }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${nvd.nv.noticecontent }</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><c:if test="${not empty nvd.nv.filepath}">
						<img src="/img/file.png" width="16px">
						<a href="javascript:fileDownload('${nvd.nv.filename}','${nvd.nv.filepath}');">
							${nvd.nv.filename} </a>
					</c:if></td>
			</tr>
			<tr>
				<th colspan="2"><a href="#">수정하기</a> <a href="#">삭제하기</a> <a
					href="/notice">목록으로</a></th>
			</tr>
		</table>
		</center>
	</div>
	</section>
</body>
</html>