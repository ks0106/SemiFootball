<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="board.model.vo.BoardVo"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="board.model.vo.BoardPageData"%>
<%
       BoardPageData bpd = (BoardPageData)request.getAttribute("bpd");
       ArrayList<BoardVo> blist = bpd.getBlist();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/notice/notice.css">
<title>자유게시판 리스트</title>
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
	<div id="title">커뮤니티</div>


	<div class="full">
		<div class="tab-container">
			<ul class="tab-list">
				<li class=" list-li"><a href="/notice" class="munebar">공지사항</a></li>
				<li class="list-li"><a href="/noticeFAQ" class="munebar">FAQ</a></li>
				<li class="selected list-li"><a href="/boardList" class="munebar">자유게시판</a></li>
			</ul>

	<center>
		<h1 style="font-size: 50px;">
			<u><b>자유게시판</b></u>
		</h1>
		<c:if test="${sessionScope.member !=null }">
			<a href="/boardWriter" class="btn btn-info">글쓰기</a>
		</c:if>
		<br> <br>
		<table class="table table-dark table-hover" id="table_notice">
			<thead>
				<tr>
					<th style="text-align: center;">글번호</th>
					<th style="text-align: center;">제목</th>
					<th>작성자</th>
					<th style="text-align: center;">등록일</th>
					<th style="text-align: center;">죄회수</th>
				</tr>
			</thead>
			<tbody>
				<% for(BoardVo bv : blist) {%>
				<tr>
					<th style="text-align: center;"><%=bv.getRnum() %></th>
					<th style="width:400px;"><a href="/boardView?boardNo=<%=bv.getBoardNo() %>"><%=bv.getBoardTitle() %></a></th>
					<th><%=bv.getBoardWriter() %></th>
					<th style="text-align: center;"><%=bv.getBoardDate() %></th>
					<th style="text-align: center;"><%=bv.getBoardHit() %></th>
				</tr>
				<%} %>
			</tbody>
		</table>
		<!-- 페이징 -->
		<ul class="pagination">
			<li class="page-item">${bpd.pageNavi }</li>
		</ul>
		<br> <br>
		<form action="#" method="get">
			<input type="text" name="keyword" id="keyword"
				placeholder="검색어를 입력해주세요">
			<button type="submit" id="search">검색</button>
		</form>
	</center>
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>