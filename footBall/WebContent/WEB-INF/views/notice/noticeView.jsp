<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<link rel="stylesheet" href="/css/notice/notice.css">

<title>공지사항뷰</title>
<style>
.side_nav {
	margin: 5px;
	color: silver;
}

.side_nav a {
	text-decoration: none;
	color: silver;
	font-size: 16px;
}

#side_menu1 {
	display: block;
}

#side_pr_menu {
	list-style-type: square;
	padding: 0;
	margin: 0;
	margin-left: 20px;
	display: none;
}

#mv {
	background-image: url("/img/ground1.png");
}

.tab-container {
	margin: 0 auto;
	text-align: center;
	width: 100%;
	height: 80px;
}

.tab-list {
	margin: 0; padding0;
	height: 100%;
	list-style-type: none;
	border-top: 3px solid purple;
	border-bottom: 1px solid green;
	padding-left: 0;
}

.list-li {
	height: 100%;
	width: 33.33%;
	float: left;
	text-align: center;
	line-height: 80px;
	font-size: 40px;
	font-weight: bold;
	border-right: 1px solid green;
	box-sizing: border-box;
}

.list-li:last-child {
	border-right: none;
}

.munebar {
	text-decoration: none;
	color: black;
	width: 100%;
	height: 100%;
	display: block;
}

.selected>.munebar {
	background-color: green;
	color: white;
}

.list-li>a:hover {
	background-color: green;
	color: white;
	text-decoration: none;
}

.tab-content {
	margin: 0 auto;
	width: 100%;
	text-align: center;
}

.content-header {
	color: #403d3f;
	font-size: 40px;
	font-weight: bold;
	margin-bottom: 20px;
	margin-top: 0px;
}

.underline {
	margin: 0 auto;
	width: 7%;
	text-align: center;
	border-top: 2px solid #bfc4cc;
}

#matchlist-table {
	border-top: 2px solid green;
	border-bottom: 2px solid green;
	border-collapse: collapse;
}

#table-wraper {
	margin: 0 auto;
	margin-top: 30px;
	width: 80%;
}

.tab-con {
	margin: 0 auto;
	width: 100%;
}

.th {
	padding: 16px;
	border-bottom: 1px solid #d5d8dd;
	height: 21px;
	font-size: 18px;
	font-weight: 700;
	line-height: 21px;
	text-align: center;
}

.table-tr td {
	padding: 16px;
	border-bottom: 1px solid #d5d8dd;
	height: 21px;
	font-size: 18px;
	line-height: 21px;
	text-align: center;
}

.table-tr {
	cursor: pointer;
}

.table-tr:hover {
	background-color: #F2F2F2;
}

.pageNaviBtn {
	width: 50px;
	height: 50px;
	border: 1px solid #A4A4A4;
	display: inline-block;
	margin-right: 10px;
	margin-left: 10px;
	border-radius: 15px;
	line-height: 45px;
}

.selectPage {
	line-height: 50px;
	color: white;
	background-color: green;
	font-size: 25px;
}
</style>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<script>
   $(document).ready(function(){
      $('#ground1').append('<img src="/img/ground1.png" alt="그라운드1" style="width:100%;height:500px;">');
      $('#ground2').append('<img src="/img/ground2.jpg" alt="그라운드2" style="width:100%;height:500px;">');
      $('#ground3').append('<img src="/img/ground3.jpg" alt="그라운드3" style="width:100%;height:500px;">');
      $('#ground4').append('<img src="/img/ground4.jpg" alt="그라운드4" style="width:100%;height:500px;">');
      $('#ground5').append('<img src="/img/ground5.jpg" alt="그라운드5" style="width:100%;height:500px;">');
   });
</script>
	<!--영상 위 페이지 타이틀 -->
	<div id="title">고객센터</div>


	<hr style="border:3px solid #2c3c57;margin:0 auto;margin-bottom:30px;padding:0;">
		<div style="width:85%;background-color:white;margin:0 auto;overflow:hidden;">
				<div style="width:20%;height:300px;text-align:left;display:inline-block;float:left;">
					<div style="font-size:30px;font-weight:bolder;color:#2c3c57;margin:0;margin-bottom:10px;">커뮤니티</div>
					<hr style="width:80%;border:2px solid #2c3c57;margin-right:20%;padding:0;">
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu1" style="color:#3366cc;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">공지사항</a>
					</div>
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu2" href="/fAQ" style="color:#2c5c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">FAQ</a>
					</div>
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu3" href="/boardList" style="color:#2c5c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">자유게시판	</a>
					</div>
				</div>
			<div style="width:78%;border-left:1px solid silver;display:inline-block;overflow:hidden;">
		<div class="tab-content">
			<section>
			<div class="table-wrapper"
				style="text-align: center; width: 60%; margin: 0 auto;">
				<center>
					<h1>공지사항</h1>
				</center>
				<br>
				<br>
				<br>
				<center>
					<table class="table">
						<tr>
							<th style="font-size: 25px; font-weight: bold; text-align: center;">${nv.noticeTitle}</th>
							<th>${nv.noticeDate}</th>
						</tr>
						<tr>
							<td>작성자 : ${nv.noticeWriter}</td>
							<td>조회수 : ${nv.noticeHit}</td>
						</tr>
						<tr>
							<td style="height: 500px;" colspan="2">${nv.noticeContent}</td>
						</tr>
						<tr>
							<th colspan="2"><center>
									<c:if test="${sessionScope.member.id =='admin' }">
										<a href="/noticeUpdate?noticeNo=${nv.noticeNo}"
											class="btn" style="border: none; background-color: green; width: 100px; height: 30px; color: white;">수정하기</a>
										<a href="/noticeDelete?noticeNo=${nv.noticeNo}"
											class="btn" style="border: none; background-color: green; width: 100px; height: 30px; color: white;">삭제하기</a>
									</c:if>
									<a href="/notice" class="btn" style="border: none; background-color: green; width: 100px; height: 30px; color: white;">목록으로</a>
								</center></th>
						</tr>
					</table>
				</center>
			</div>
			</section>
		</div>
	</div></div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>