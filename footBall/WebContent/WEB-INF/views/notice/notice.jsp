<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ page import="notice.model.vo.NoticeVo" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="notice.model.vo.NoticePageData" %>
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
<link rel="stylesheet" href="/css/notice/notice.css">
<title>공지사항리스트</title>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
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
		<div id="title">
			고객센터
		</div>

	
	
	
	<!-- 전체 리스트 조회 -->
	<div class="full">
		<div class="tab-container">
			<ul class="tab-list">
				<li class="selected list-li"><a href="#T-con01" class="munebar">공지사항</a></li>
				<li class="list-li"><a href="#T-con02" class="munebar">FAQ</a></li>
			</ul>
			<div class="tab-content-wrapper">
				<div id="T-con01" class="tab-con">
					<center>
						<h1>공지사항</h1>
						<c:if test="${sessionScope.member.id =='admin' }">
							<a href="/noticeWriter" class="btn btn-outline-primary btn-sm">글쓰기</a>
						</c:if>
						<br>
						<br>
						<table class="table table-dark table-hover" id="table_notice">
							<thead>
								<tr>
									<th>글번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>죄회수</th>
								</tr>
							</thead>
							<tbody>
						<% for(NoticeVo nv : list) {%>
							<tr>
								<th><%=nv.getRnum() %></th>
								<th><a href="/noticeView?noticeNo=<%=nv.getNoticeNo() %>"><%=nv.getNoticeTitle() %></a></th>
								<th><%=nv.getNoticeWriter() %></th>
								<th><%=nv.getNoticeDate() %></th>
								<th><%=nv.getNoticeHit() %></th>
							</tr>	
							<%} %>
							</tbody>
						</table>
						<!-- 페이징 -->
						<div id="pageNavi">${pd.pageNavi }</div>
						<br><br>
						<form action="/searchKeyword" method="get">
							<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력해주세요">
							<button type="submit" id="search">검색</button>
						</form>
					</center>
				</div>
				<div id="T-con02" class="tab-con">
					<h1>F A Q</h1>
					
				</div>
			</div>
		</div>
		
	</div>
	<script>
	  $(".tab-container").each(function() {
	      var $cmTabList = $(this).children(".tab-list");
	      var $cmTabListli = $cmTabList.find("li");
	      var
		$cmConWrapper = $(this)
							.children(".tab-content-wrapper");
					var $cmContent = $cmConWrapper.children(".tab-con");

					// 탭 영역 숨기고 selected 클래스가 있는 영역만 보이게
					var $selectCon = $cmTabList.find("li.selected").find("a")
							.attr("href");
					$cmContent.hide();
					$($selectCon).show();

					$cmTabListli.children("a").click(function() {
						if (!$(this).parent().hasClass("selected")) {
							var visibleCon = $(this).attr("href");
							$cmTabListli.removeClass("selected");
							$(this).parent("li").addClass("selected");
							$cmContent.hide();
							$(visibleCon).fadeIn();
						}
						return false;
					});
				});
	</script>
			<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>