<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.model.vo.NoticeVo"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="notice.model.vo.NoticePageData"%>
<%
       NoticePageData pd = (NoticePageData)request.getAttribute("pd");
       ArrayList<NoticeVo> list = pd.getList();
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
<link rel="stylesheet" href="/css/common/admin.css">
<link rel="stylesheet" href="/css/notice/notice.css">
<title>관리자페이지에서 공지삭제</title>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp" />

	<div id="title">고객센터</div>
	<br><br><br><br><br><br><br>
	<center>
				<table style="width:60%">
					<tr>
						<th style="width:10%">번호</th>
						<th style="width:30%">제목</th>
						<th style="width:15%">버튼</th>
					</tr>
					<tbody>
							<% for(NoticeVo nv : list) {%>
						<tr>
							<td><%=nv.getNoticeNo() %></td>
							<td style="font-size: 25px; font-weight: bold;"><%=nv.getNoticeTitle() %></td>
							<td>
								<a href="/noticeDelete?noticeNo=<%=nv.getNoticeNo() %>" class="btn btn-primary">삭제하기</a>
							</td>
						</tr>
						<%} %>
							</tbody>
					</table>
					<!-- 페이징 -->
						<ul class="pagination">
							<li class="page-item"><%=pd.getPageNavi() %></li>
						</ul>
				</center>
</body>
</html>