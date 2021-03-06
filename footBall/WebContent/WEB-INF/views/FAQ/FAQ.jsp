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
<link rel="stylesheet" href="/css/board/board.css">
<link rel="stylesheet" href="/css/common/notice.css">
<link rel="stylesheet" href="/css/common/pageCss.css">

<title>KS FAQ</title>
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


	<hr style="border: 3px solid #2c3c57; margin: 0 auto; margin-bottom: 30px; padding: 0;">
	<div style="width: 85%; background-color: white; margin: 0 auto; overflow: hidden;">
		<div style="width: 20%; height: 300px; text-align: left; display: inline-block; float: left;">
			<div style="font-size: 30px; font-weight: bolder; color: #2c3c57; margin: 0;">커뮤니티</div>
			<hr style="width: 80%; border: 2px solid #2c3c57;margin:8px 20% 8px 0; padding: 0;">
			<div style="margin-bottom: 15px;">
				<a class="side_a" id="side_menu1" href="/notice" style="color: #2c3c57; font-weight: bolder; font-size: 18px; text-decoration: none; cursor: pointer;">공지사항</a>
			</div>
			<div style="margin-bottom: 15px;">
				<a class="side_a" id="side_menu2" href="/fAQ" style="color: #3366cc; font-weight: bolder; font-size: 18px; text-decoration: none; cursor: pointer;">FAQ</a>
			</div>
			<div style="margin-bottom: 15px;">
				<a class="side_a" id="side_menu3" href="/boardList" style="color: #2c3c57; font-weight: bolder; font-size: 18px; text-decoration: none; cursor: pointer;">자유게시판
				</a>
			</div>
		</div>
		<div style="width: 78%; border-left: 1px solid silver; display: inline-block; overflow: hidden;">
			<div class="tab-content">
				<center>
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
										<tr style="cursor: pointer;">
											<th>
												<div data-toggle="collapse" data-target="#faq${i.count }">
													<span class="fa1"> 
													<img src="img/faq/FAQ.png" style="width: 30px; height: 30px;">
														${l.faqTitle }<br> <br>
													</span>
												</div>
											</th>
										</tr>
										<tr>
											<td>
											<div id="faq${i.count }" class="collapse">
												<img src="img/faq/FAQ2.PNG" style="width: 30px; height: 20px;"> ${l.faqContent }
													<br><br><br>
											</div>
											</td>
										</tr>
									</c:forEach>
								</table>
								<!-- 페이징 -->
								<div id="pageNavi"
									style="width: 100%; margin: 0 auto; margin-bottom: 30px; margin-top: 30px;">${pd.pageNavi }</div>
							</center>
						</div>
					</div>
				</center>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>