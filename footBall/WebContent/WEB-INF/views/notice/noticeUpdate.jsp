<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="notice.model.vo.NoticeVo"%>
<%
	NoticeVo nv = (NoticeVo)request.getAttribute("noticeVo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/css/notice/notice.css">
	<link rel="stylesheet" href="/css/common/pageCss.css">
	
	
<title>KS 공지사항수정</title>

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
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp" />

	<script>
   $(document).ready(function(){
	   /* 헤더 배경 이미지 */
	   $('#menuImg').append('<img src="/img/common/test.jpg" alt="메인 이미지" style="width:100%;max-height:initial; margin-top:-10%; opacity:0.8;">');
   });
</script>

	<!--영상 위 페이지 타이틀 -->
	<div id="title">고객센터</div>
	<hr style="border:3px solid #2c3c57;margin:0 auto;margin-bottom:30px;padding:0;">
		
			<div style="width:78%;border-left:1px solid silver;display:inline-block;overflow:hidden;">
		<div class="tab-content">
			<section>

			<div class="table-wrapper" style="width: 60%; margin: 0 auto;">
				<form action="/noticeUpdateEnd" method="post">
					<br>
					<br>
					<br>
					<br>
					<table class="table table-bordered">
						<input type="hidden" name="noticeNo" value="<%=nv.getNoticeNo() %>">
						<tr>
							<th colspan="2"
								style="font-size: 20px; font-weight: bold; text-align: center;">공지사항수정</th>
						</tr>
						<tr>
							<th style="text-align: center;">제목</th>
							<td><input type="text" name="noticeTitle"
								style="width: 100%;" value="<%=nv.getNoticeTitle() %>">
							</td>
						</tr>
						<tr>
							<th style="text-align: center;">작성자</th>
							<td style="text-align: left;"><%=nv.getNoticeWriter() %></td>
						</tr>
						<tr>
							<th style="text-align: center; height: 400px;">내용</th>
							<td><textarea name="noticeContent" class="form-control"
									rows="3" style="resize: none; height: 400px;"><%=nv.getNoticeContent() %></textarea>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<center>
									<button type="submit" class="btn btn-outline-primary"
										style="border: none; background-color: #df0101; width: 100px; height: 30px; color: white;">수정하기</button>
									<button type="reset" class="btn" style="border: none; background-color: #df0101; width: 100px; height: 30px; color: white;">취소</button>
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