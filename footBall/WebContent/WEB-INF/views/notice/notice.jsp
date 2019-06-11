<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="notice.model.vo.NoticeVo"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="notice.model.vo.NoticePageData"%>
<%
	NoticePageData pd = (NoticePageData) request.getAttribute("pd");
	ArrayList<NoticeVo> list = pd.getList();
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
<link rel="stylesheet" href="/css/board/board.css">
<link rel="stylesheet" href="/css/common/pageCss.css">

<title>KS 커뮤니티</title>
</head>

<style>
a{
	color:black;
}
.pageNaviBtn {
	width: 35px;
	height: 40px;
	border: 1px solid #A4A4A4;
	display: inline-block;
	border-radius: 10px;
	line-height: 40px;
}

.selectPage {
	line-height: 40px;
	color: white;
	background-color: #2c3c57;
	font-size: 20px;
}
</style>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!--영상 위 페이지 타이틀 -->
	<div id="title">커뮤니티</div>
	<script>
		$(document).ready(function() {
			/* 헤더 배경 이미지 */
			$('#menuImg').append('<img src="/img/common/test.jpg" alt="메인 이미지" style="width:100%;max-height:initial; margin-top:-10%; opacity:0.8;">');
		});
		function contentView(num){
			location.href="/noticeView?noticeNo="+num+"&reqPage="+$(".selectPage").eq(0).children().html();
			}

	</script>
	<hr style="border: 3px solid #2c3c57; margin: 0 auto; margin-bottom: 30px; padding: 0;">
<section>
	<div style="width: 85%; background-color: white; margin: 0 auto; overflow: hidden;">
		<div style="width: 20%; height: 300px; text-align: left; display: inline-block; float: left;">
			<div style="font-size: 30px; font-weight: bolder; color: #2c3c57; margin: 0;">커뮤니티</div>
			<hr style="width: 80%; border: 2px solid #2c3c57;margin:8px 20% 8px 0; padding: 0;">
			<div style="margin-bottom: 15px;">
				<a class="side_a" id="side_menu1" href="/notice" style="color: #3366cc; font-weight: bolder; font-size: 18px; text-decoration: none; cursor: pointer;">공지사항</a>
			</div>
			<div style="margin-bottom: 15px;">
				<a class="side_a" id="side_menu2" href="/fAQ" style="color: #2c3c57; font-weight: bolder; font-size: 18px; text-decoration: none; cursor: pointer;">FAQ</a>
			</div>
			<div style="margin-bottom: 15px;">
				<a class="side_a" id="side_menu3" href="/boardList" style="color: #2c3c57; font-weight: bolder; font-size: 18px; text-decoration: none; cursor: pointer;">자유게시판
				</a>
			</div>
		</div>
		<div style="width: 78%; border-left: 1px solid silver; display: inline-block; overflow: hidden;">
			<div class="tab-content">
				<!-- 공지사항 리스트 조회 -->
				<center>
					<br><br>
					<p class="content-header">공지사항</p>
					<div class="underline"></div>
					<div class="btn-wrapper"
						style="margin: 0 auto; margin-top: 30px; margin-bottom: 30px; text-align: right; width: 100%;">
						<div style="width: 90%;">
							<c:if test="${sessionScope.member.id=='admin' }">
								<a href="/noticeWriter" class="btn" style="border: none; background-color: #2c3c57; width: 100px; height: 30px; color: white;">글쓰기</a>
							</c:if>
						</div>
					</div>
				
					<div id="table-wraper">
						<table id="matchlist-table" style="width: 100%;">
							<thead>
								<tr>
									<th class="th">글번호</th>
									<th class="th" colspan="2">제목</th>
									<th class="th">작성자</th>
									<th class="th">등록일</th>
									<th class="th">조회수</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (NoticeVo nv : list) {
								%>
								<tr class="table-tr">
									<td class="td" style="text-align: center;"><%=nv.getRnum()%></td>
									<td class="td" style="text-align: center;" colspan="2"><a onclick="contentView(<%=nv.getNoticeNo()%>)"><%=nv.getNoticeTitle()%></a></td>
									<td class="td" style="text-align: center;"><%=nv.getNoticeWriter()%></td>
									<td class="td" style="text-align: center;"><%=nv.getNoticeDate()%></td>
									<td class="td" style="text-align: center;"><%=nv.getNoticeHit()%></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
					<!-- 페이징 -->
					<div id="pageNavi" style="width: 100%; margin: 0 auto; margin-bottom: 30px; margin-top: 30px;"><%=pd.getPageNavi()%></div>
					<br> <br>
					<form action="/searchKeyword" method="get">
						<input type="text" size="30" name="keyword" placeholder="검색어를 입력해주세요" style="height: 40px; border: 2px solid #A4A4A4;vertical-align: middle;">
						<button type="submit" style="background-color: #2c3c57; border: none; height: 40px; width: 70px; vertical-align: middle;">
							<img src="/img/icon_search.png">
						</button>
					</form>
				</center>
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