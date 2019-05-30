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
<title>Insert title here</title>
<!-- 동영상CSS  -->
<style>

	/* 페이지 타이틀  */
	#title{
		position:absolute;
		z-index: 100;
		font-size: 70px;
		font-weight:900;
		color: white;
		left: 10%;
		top: 400px;
	}
	 .tab-container{
      position:absolute;
      top:485px;
      width:100%;
      height:100px;
   }
	.tab-list{
      margin:0;
      padding0;
      height:100%;
      list-style-type: none;
      border-bottom:1px solid black;
      padding-left: 0;
   }
   .list-li{
      height: 100%;
      width: 50%;
      float: left;
      text-align: center;
      line-height: 100px;
      font-size: 40px;
      font-weight: bold;
      border-right: 1px solid black;
      box-sizing: border-box;
   }
   .navi_match_li:last-child{
      border-right: none;
   }
   .munebar{
   	text-decoration: none;
   	color : black;
   }
   .selected{
   	background-color: lightgray;
   }
#footer {
    position:absolute;
    bottom:0;
    width:100%;
    height: 5px;   
}
     .page_area{
      position:absolute;
      z-index:-1;
      width:100%;
      top: 50px;
   }
   #table_notice{
   		width:70%;
   		height: 200px;
   		text-align: center;
   }
   .full{
   	height: 600px;
   }
</style>
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
							<a href="/noticeWriter">글쓰기</a>
						</c:if>
						<br>
						<br>
						<table class="table" id="table_notice">
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
							<% for(NoticeVo nv : list) {%>
							<tr>
								<th><%=nv.getNoticeNo() %></th>
								<th><a href="/noticeView?noticeNo=<%=nv.getNoticeNo() %>"><%=nv.getNoticeTitle() %></a></th>
								<th><%=nv.getNoticeWriter() %></th>
								<th><%=nv.getNoticeDate() %></th>
								<th><%=nv.getNoticeHit() %></th>
							</tr>
							<%} %>
						</table>
						<!-- 페이징 -->
						<div id="pageNavi">${pd.pageNavi }</div>
					</center>
					<br>
					<br>
					<br>
				</div>
				<div id="T-con02" class="tab-con">
					<h1>F A Q</h1>
				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="/WEB-INF/views/common/footer.jsp" />
		</div>
	</div>
	<script>
	  $(".tab-container").each(function  () {
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

</body>
</html>