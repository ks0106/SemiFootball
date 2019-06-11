<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="FAQ.model.vo.FAQVo"%>
<%
	FAQVo fv = (FAQVo)request.getAttribute("FAQVo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/common/notice.css">
	
<title>FAQ수정</title>
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

#full {
	height: 800px;
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
						<a class="side_a" id="side_menu1" href="/notice" style="color:#2c5c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">공지사항</a>
					</div>
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu2" style="color:#3366cc;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">FAQ</a>
					</div>
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu3" href="/boardList" style="color:#2c5c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">자유게시판	</a>
					</div>
				</div>
			<div style="width:78%;border-left:1px solid silver;display:inline-block;overflow:hidden;">
		<div class="tab-content">
			<section>

			<div class="table-wrapper" style="width: 60%; margin: 0 auto;">
				<form action="/faqUpdateEnd" method="post">
					<br><br><br><br>
					<table class="table table-bordered">
						<input type="hidden" name="faqNo" value="<%=fv.getFaqNo() %>">				
						<tr>
							<th colspan="2" style="font-size: 20px; font-weight: bold; text-align: center;">FAQ수정</th>
						</tr>
						<tr>
							<th style="text-align: center;">제목</th>
							<td><input type="text" name="faqTitle"
								style="width: 100%;" value="<%=fv.getFaqTitle() %>">
							</td>
						</tr>
						<tr>
							<th style="text-align: center; height: 400px;">내용</th>
							<td><textarea name="faqContent" class="form-control" rows="3" style="resize: none; height: 400px;"><%=fv.getFaqContent() %></textarea>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<center>
									<button type="submit" class="btn" style="border: none; background-color: green; width: 100px; height: 30px; color: white;">수정하기</button>
									<button type="reset" class="btn" style="border: none; background-color: green; width: 100px; height: 30px; color: white;">취소</button>
								</center>
							</th>
						</tr>
					</table>
				</form>
			</div>
			</section>
		</div>
	</div></div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>