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
<title>FAQ수정삭제</title>
<link rel="stylesheet" href="/css/common/admin.css">
<link rel="stylesheet" href="/css/common/notice.css">

</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp" />
	<!--영상 위 페이지 타이틀 -->
	<div id="title">FAQ</div>
	<br><br><br><br><br><br><br>
<center>
					<table id="matchlist-table"  style="width: 80%;">
						<tr>
							<th class="th">번호</th>
							<th class="th">제목</th>
							<th class="th">버튼</th>
						</tr>
						<%
							for (FAQVo fv : list) {
						%>
						
						<tr class="table-tr">
							<td class="td">
								<%=fv.getFaqNo() %>
							</td>
							<td class="td">
								<%=fv.getFaqTitle()%>
							</td>
							<td class="td">
									
								<a href="/faqUpdate?faqNo=<%=fv.getFaqNo()%>"
										class="btn" style="border:none;background-color: green;width: 100px;height: 30px;color:white;">수정하기</a>
								<a href="/deleteFAQ?faqNo=<%=fv.getFaqNo()%>"
										class="btn" style="border:none;background-color: green;width: 100px;height: 30px;color:white;">삭제하기</a>
							</td>
						</tr>

						<%
							}
						%>

					</table>
					<!-- 페이징 -->
						<div id="pageNavi" style="width: 100%; margin: 0 auto; margin-bottom: 30px; margin-top: 30px;">
						${pd.pageNavi }</div>
				</center>
</body>
</html>