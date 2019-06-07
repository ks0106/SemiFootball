<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member m = (Member) session.getAttribute("member");
%>
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

<title>공지사항작성</title>
</head>
<style>
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
}

#noticewriter {
	width: 60%;
}

#full {
	height: 800px;
}
</style>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<script>
		$(document)
				.ready(
						function() {
							$('#ground1')
									.append(
											'<img src="/img/ground1.png" alt="그라운드1" style="width:100%;height:500px;">');
							$('#ground2')
									.append(
											'<img src="/img/ground2.jpg" alt="그라운드2" style="width:100%;height:500px;">');
							$('#ground3')
									.append(
											'<img src="/img/ground3.jpg" alt="그라운드3" style="width:100%;height:500px;">');
							$('#ground4')
									.append(
											'<img src="/img/ground4.jpg" alt="그라운드4" style="width:100%;height:500px;">');
							$('#ground5')
									.append(
											'<img src="/img/ground5.jpg" alt="그라운드5" style="width:100%;height:500px;">');
						});
	</script>

	<div id="title">고객센터</div>
	<div id="full">
		<div class="tab-container">
			<ul class="tab-list">
				<li class="selected list-li"><a href="/notice" class="munebar">공지사항</a></li>
				<li class="list-li"><a href="/fAQ" class="munebar">FAQ</a></li>
				<li class="list-li"><a href="/boardList" class="munebar">자유게시판</a></li>
			</ul>
			<section>

			<div class="table-wrapper"
				style="text-align: center; width: 80%; margin: 0 auto;">
				<form action="/noticeInsert" method="post">
					<br><br><br><br>
					<center>
						<table class="table table-bordered" id="noticewriter">
							<tr>
								<th colspan="2"
									style="font-size: 20px; font-weight: bold; text-align: center;">공지사항
									작성</th>
							</tr>
							<tr>
								<th style="text-align: center;">제목</th>
								<td><input type="text" class="form-controll"
									name="noticeTitle" style="width: 100%;"></td>
							</tr>
							<tr>
								<th style="text-align: center;">작성자</th>
								<td><p style="text-align: left;"><%=m.getName()%></p> <input
									type="hidden" class="form-controll" name="noticeWriter"
									style="text-align: left;" value="<%=m.getName()%>"></td>
							</tr>
							<tr>
								<th style="text-align: center;">내용</th>
								<td><textarea name="noticeContent" class="form-controll"
										rows="3" cols="40"
										style="resize: none; width: 100%; height: 400px;"></textarea></td>
							</tr>
							<tr>
								<th colspan="2">
									<center>
										<button type="submit" class="btn btn-outline-primary"
											style="color: gray;">등록하기</button>
										<a href="/notice"><button class="btn" style="color: gray;">취소</button></a>
									</center>
								</th>
							</tr>
						</table>
					</center>
				</form>
			</div>

			</section>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>