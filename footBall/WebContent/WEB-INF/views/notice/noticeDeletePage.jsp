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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/common/admin.css">
<link rel="stylesheet" href="/css/common/notice.css">
<link rel="stylesheet" href="/css/common/pageCss.css">

<title>KS 공지관리</title>
</head>

<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp" />

	<div id="title">[관리자]공지사항 수정/삭제</div>
	<br><br><br><br><br><br><br>
	<center>
				<table id="matchlist-table"  style="width: 80%;">
					<tr>
						<th class="th">번호</th>
						<th class="th">제목</th>
						<th class="th">버튼</th>
					</tr>
					<tbody>
							<% for(NoticeVo nv : list) {%>
						<tr class="table-tr">
							<td class="td"><%=nv.getNoticeNo() %></td>
							<td class="td"><%=nv.getNoticeTitle() %></td>
							<td class="td">
								<a href="/noticeUpdate?noticeNo=<%=nv.getNoticeNo() %>" class="btn" style="border:none;background-color: #df0101;width: 100px;height: 30px;color:white;">수정하기</a>
								<a href="/noticeDelete?noticeNo=<%=nv.getNoticeNo() %>" class="btn" style="border:none;background-color: gray;width: 100px;height: 30px;color:white;">삭제하기</a>
							</td>
						</tr>
						<%} %>
							</tbody>
					</table>
					<!-- 페이징 -->
						<div id="pageNavi" style="width: 100%; margin: 0 auto; margin-bottom: 30px; margin-top: 30px;">
						<%=pd.getPageNavi() %></div>
				</center>
</body>
</html>