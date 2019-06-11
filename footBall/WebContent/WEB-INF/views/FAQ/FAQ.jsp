<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="FAQ.model.vo.FAQVo"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="FAQ.model.vo.FAQPageData"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	FAQPageData pd = (FAQPageData) request.getAttribute("pd");
	ArrayList<FAQVo> list = pd.getList();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/board/board.css">
<link rel="stylesheet" href="/css/common/notice.css">

<title>KS FAQ</title>
</head>

<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<script>
<<<<<<< HEAD
		$(document).ready(function() {
							$('#ground1').append('<img src="/img/ground1.png" alt="그라운드1" style="width:100%;height:500px;">');
							$('#ground2').append('<img src="/img/ground2.jpg" alt="그라운드2" style="width:100%;height:500px;">');
							$('#ground3').append('<img src="/img/ground3.jpg" alt="그라운드3" style="width:100%;height:500px;">');
							$('#ground4').append('<img src="/img/ground4.jpg" alt="그라운드4" style="width:100%;height:500px;">');
							$('#ground5').append('<img src="/img/ground5.jpg" alt="그라운드5" style="width:100%;height:500px;">');
						});
=======
		$(document).ready(function(){
			   /* 헤더 배경 이미지 */
				$('#menuImg').append('<img src="/img/branch/ground3.jpg" alt="지점 메인 이미지" style="width:100%;max-height:initial;">');
		   });
>>>>>>> d7523c075b0439d106e6a0965d5f07d5309c3fdf
	</script>

	<!--영상 위 페이지 타이틀 -->
	<div id="title">커뮤니티</div>


	<hr style="border: 3px solid #2c3c57; margin: 0 auto; margin-bottom: 30px; padding: 0;">
	<div style="width: 85%; background-color: white; margin: 0 auto; overflow: hidden;">
		<div style="width: 20%; height: 300px; text-align: left; display: inline-block; float: left;">
			<div style="font-size: 30px; font-weight: bolder; color: #2c3c57; margin: 0; margin-bottom: 10px;">커뮤니티</div>
			<hr style="width: 80%; border: 2px solid #2c3c57; margin-right: 20%; padding: 0;">
			<div style="margin-bottom: 15px;">
				<a class="side_a" id="side_menu1" href="/notice" style="color: #2c5c57; font-weight: bolder; font-size: 18px; text-decoration: none; cursor: pointer;">공지사항</a>
			</div>
			<div style="margin-bottom: 15px;">
				<a class="side_a" id="side_menu2" style="color: #3366cc; font-weight: bolder; font-size: 18px; text-decoration: none; cursor: pointer;">FAQ</a>
			</div>
			<div style="margin-bottom: 15px;">
				<a class="side_a" id="side_menu3" href="/boardList" style="color: #2c5c57; font-weight: bolder; font-size: 18px; text-decoration: none; cursor: pointer;">자유게시판
				</a>
			</div>
		</div>
		<div style="width: 78%; border-left: 1px solid silver; display: inline-block; overflow: hidden;">
			<div class="tab-content">
				<center>
					<br>
					<br>
					<br>
					<p class="content-header">F A Q</p>
					<div class="underline"></div>
					<div class="btn-wrapper" style="margin: 0 auto; margin-top: 30px; margin-bottom: 30px; text-align: right; width: 100%;">
						<div style="width: 90%;">
							<center>
								<ul style="width: 670px;">
									<li style="text-align: left;">FAQ게시판 입니다.</li>
									<li style="text-align: left;">자주하시는 질문에 대해 정리하였습니다. 원하시는
										내용에 질문을 클릭하시면 답변을 볼 수 있습니다.</li>
									<li style="text-align: left;">FAQ에서 원하는 답변을 찾지 못하였다면
										02-3337-4380으로 문의해주시기 바랍니다.</li>
									<li style="text-align: left;">문의가능 시간은 오전9시부터 오후6시까지이며
										토,일요일 및 공휴일은 휴무 입니다.</li>
								</ul>
							</center>
							<br> <br>
							<center>
								<table>
									<c:forEach items="${pd.list }" var="l" varStatus="i">
										<tr>
											<th style="width: 650px;">
												<div data-toggle="collapse" data-target="#faq${i.count }"
													id="fa1">
													<span style="font-size: 15px;"> <img
														src="img/faq/FAQ.png" style="width: 30px; height: 30px;">
														${l.faqTitle }<br> <br>
													</span>
												</div>
											</th>
										</tr>
										<tr>
											<td><div id="faq${i.count }" class="collapse">
													<img src="img/faq/FAQ2.PNG"
														style="width: 30px; height: 20px;"> ${l.faqContent }
													<br>
													<br>
													<br>
												</div></td>
										</tr>
									</c:forEach>
								</table>
								<!-- 페이징 -->
								<div id="pageNavi"
									style="width: 100%; margin: 0 auto; margin-bottom: 30px; margin-top: 30px;">${pd.pageNavi }</div>
							</center>
						</div>
					</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>