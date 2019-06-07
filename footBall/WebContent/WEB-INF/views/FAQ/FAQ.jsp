<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="FAQ.model.vo.FAQVo"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="FAQ.model.vo.FAQPageData"%>
<%
	FAQPageData pd = (FAQPageData) request.getAttribute("pd");
	ArrayList<FAQVo> list = pd.getList();
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
<link rel="stylesheet" href="/css/notice/notice.css">
<title>FAQ리스트</title>
</head>
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

	<!--영상 위 페이지 타이틀 -->
	<div id="title">커뮤니티</div>


	<div class="full">
		<div class="tab-container">
			<ul class="tab-list">
				<li class="list-li"><a href="/notice" class="munebar">공지사항</a></li>
				<li class="selected list-li"><a href="#T-con02" class="munebar">FAQ</a></li>
				<li class="list-li"><a href="/boardList" class="munebar">자유게시판</a></li>
			</ul>
			<!-- FAQ -->
			<div id="T-con02" class="tab-con">
				<center>
					<h1 style="font-size: 50px;">
						<b><u>F A Q</u></b>
					</h1>
					<ul style="width: 670px;">
						<li style="text-align: left;">FAQ게시판 입니다.</li>
						<li style="text-align: left;">자주하시는 질문에 대해 정리하였습니다. 원하시는 내용에
							질문을 클릭하시면 답변을 볼 수 있습니다.</li>
						<li style="text-align: left;">FAQ에서 원하는 답변을 찾지 못하였다면
							02-3337-4380으로 문의해주시기 바랍니다.</li>
						<li style="text-align: left;">문의가능 시간은 오전9시부터 오후6시까지이며 토,일요일
							및 공휴일은 휴무 입니다.</li>
					</ul>
				</center>
				<br>
				<br>
				<center>
					<form action="/writerFAQ">
						<button type="submit" class="btn">글쓰기</button>
					</form>
					<table>
						<%
							for (FAQVo fv : list) {
						%>
						<tr>
							<th style="width: 650px;">
							<div data-toggle="collapse" data-target="#faq1" id="fa1">
									<span style="font-size: 15px;"> 
									<img src="img/faq/FAQ.png" style="width: 30px; height: 30px;">
										<%=fv.getFaqTitle()%><br>
									<br>
									</span>
								</div>
								</th>
						</tr>
						<tr>
							<td><div id="faq1" class="collapse">
									<img src="img/faq/FAQ2.PNG" style="width: 30px; height: 20px;">
									<%=fv.getFaqContent()%><br> 
									<form action="/faqUpdate">
									<a href="/faqUpdate?faqNo=<%=fv.getFaqNo()%>"
										class="btn btn-primary btn-sm">수정하기</a>
										</form> 
									<a href="/faqDelete?faqNo=<%=fv.getFaqNo()%>"
										class="btn btn-primary btn-sm">삭제하기</a> <br>
									<br>
								</div></td>
						</tr>
						<%
							}
						%>

					</table>
				</center>

				<script type="text/javascript">
					$(document).ready(function() {
						$('#fa1').click(function() {
							$('#faq2').attr('class', 'collapse');
							$('#faq3').attr('class', 'collapse');
							$('#faq4').attr('class', 'collapse');
							$('#faq5').attr('class', 'collapse');
						});
						$('#fa2').click(function() {
							$('#faq1').attr('class', 'collapse');
							$('#faq3').attr('class', 'collapse');
							$('#faq4').attr('class', 'collapse');
							$('#faq5').attr('class', 'collapse');
						});
						$('#fa3').click(function() {
							$('#faq1').attr('class', 'collapse');
							$('#faq2').attr('class', 'collapse');
							$('#faq4').attr('class', 'collapse');
							$('#faq5').attr('class', 'collapse');
						});
						$('#fa4').click(function() {
							$('#faq1').attr('class', 'collapse');
							$('#faq2').attr('class', 'collapse');
							$('#faq3').attr('class', 'collapse');
							$('#faq5').attr('class', 'collapse');
						});
						$('#fa5').click(function() {
							$('#faq1').attr('class', 'collapse');
							$('#faq2').attr('class', 'collapse');
							$('#faq3').attr('class', 'collapse');
							$('#faq4').attr('class', 'collapse');
						});
					})
				</script>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>