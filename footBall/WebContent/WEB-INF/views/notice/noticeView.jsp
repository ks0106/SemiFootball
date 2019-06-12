<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/common/notice.css">
<link rel="stylesheet" href="/css/board/board.css">
<link rel="stylesheet" href="/css/common/pageCss.css">

<title>KS 공지사항</title>
<style>
.boardWriteBtn{
	border: none;
	background-color: #2c3c57;
	width: 120px;
	height: 40px;
	color: white;
}
</style>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<script>
   $(document).ready(function(){
	   /* 헤더 배경 이미지 */
	   $('#menuImg').append('<img src="/img/common/test.jpg" alt="메인 이미지" style="width:100%;max-height:initial; margin-top:-10%; opacity:0.8;">');
   });
</script>
	<!--영상 위 페이지 타이틀 -->
	<div id="title">커뮤니티</div>
<section>
	<hr style="border:3px solid #2c3c57;margin:0 auto;margin-bottom:30px;padding:0;">
	<div style="width:85%;background-color:white;margin:0 auto;overflow:hidden;">
		<div style="width:20%;height:300px;text-align:left;display:inline-block;float:left;">
			<div style="font-size: 30px; font-weight: bolder; color: #2c3c57; margin: 0;">커뮤니티</div>
			<hr style="width: 80%; border: 2px solid #2c3c57;margin:8px 20% 8px 0; padding: 0;">
			<div style="margin-bottom:15px;">
				<a class="side_a" id="side_menu1" href="/notice" style="color:#3366cc;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">공지사항</a>
			</div>
			<div style="margin-bottom:15px;">
				<a class="side_a" id="side_menu2" href="/fAQ" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">FAQ</a>
			</div>
			<div style="margin-bottom:15px;">
				<a class="side_a" id="side_menu3" href="/boardList" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">자유게시판	</a>
			</div>
		</div>
		<div style="width:78%;border-left:1px solid silver;display:inline-block;overflow:hidden;">
			<div class="tab-content">
				<div class="table-wrapper" style="text-align: center; width: 60%; margin: 0 auto;">
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
								<td style="height: 500px;" colspan="2">${nv.noticeContent} </td>

							</tr>
							<tr>
								<td colspan="2">
									<c:if test="${sessionScope.member.id =='admin' }">
										<button class="boardWriteBtn" onclick="location.href='/noticeUpdate?noticeNo=${nv.noticeNo}'">수정하기</button>
										<button class="boardWriteBtn" onclick="location.href='/noticeDelete?noticeNo=${nv.noticeNo}'" style="background-color:gray;">삭제하기</button>
									</c:if>
									<button class="boardWriteBtn" onclick="location.href='/notice?reqPage=${req}'" style="float:right;">목록으로</button>									
								</td>
							</tr>
							<tr>
							</tr>
						</table>
					</center>
				</div>
			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>