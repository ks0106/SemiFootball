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
<style>
	.side_nav{
		margin:5px;
		color:silver;
	}
	.side_nav a{
		text-decoration:none;
		color:silver;
		font-size:16px;
	}
	#side_menu3{
		display:block;
	}
	#side_pr_menu{
		list-style-type:square;
		padding:0;
		margin:0;
		margin-left:20px;
		display:none;
	}
	#mv{
		background-image: url("/img/ground1.png");
	}
	.tab-container{
	  margin:0 auto;
      text-align:center;
      width:100%;
      height:80px;
   }
   .tab-list{
      margin:0;
      padding0;
      height:100%;
      list-style-type: none;
      border-top:3px solid purple;
      border-bottom:1px solid  green;
      padding-left: 0;
   }
   .list-li{
      height: 100%;
      width:33.33%;
      float: left;
      text-align: center;
      line-height: 80px;
      font-size: 40px;
      font-weight: bold;
      border-right: 1px solid  green;
      box-sizing: border-box;
   }
   .list-li:last-child{
      border-right: none;
   }
   .munebar{
      text-decoration: none;
      color : black;
      width:100%;
      height: 100%;
      display: block;
   }
   .selected > .munebar{
      background-color:  green;
    	color:white;
   }
   .list-li>a:hover{
   		background-color:  green;
   		color:white;
   		text-decoration: none;
   }
	.tab-content{
		margin: 0 auto;
		width: 100%;
		text-align: center;
	}
	.content-header{
		color:#403d3f;
		font-size: 40px;
		font-weight:bold;
		margin-bottom:20px;
		margin-top: 0px;
	}
	.underline{
		margin:0 auto;
		width:7%;
		text-align:center;
		border-top:2px solid #bfc4cc;
	}
	
	#matchlist-table{
		border-top:2px solid  green;
		border-bottom:2px solid  green;
		border-collapse: collapse;
		
	}
	#table-wraper{
		margin:0 auto;
		margin-top:30px;
		width: 90%; 
	}
	.tab-con{
		margin:0 auto;
		width: 100%;
	}
	.th{
		padding: 16px;
		border-bottom: 1px solid #d5d8dd;
		height: 21px;
		font-size: 18px;
		font-weight: 700;
		line-height: 21px;
		text-align: center;
	}
	.table-tr td{
		padding: 16px;
		border-bottom: 1px solid #d5d8dd;
		height: 21px;
		font-size: 18px;
		line-height: 21px;
		text-align: center;
	}
	.table-tr{
		cursor: pointer;
	}
	.table-tr:hover {
		background-color: #F2F2F2;

	}
	.pageNaviBtn{
		width: 50px;
		height: 50px;
		border: 1px solid #A4A4A4;
		display: inline-block;
		margin-right: 10px;
		margin-left: 10px; 
		border-radius: 15px;
		line-height: 45px;
	}

	.selectPage{
		line-height: 50px;
		color: white;
		background-color:  green;
		font-size: 25px;
	}
	


     .page_area{
     	width: 100%;
     	height: 130vh;
     }
 
</style>
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


		<hr style="border:3px solid #2c3c57;margin:0 auto;margin-bottom:30px;padding:0;">
		<div style="width:85%;background-color:white;margin:0 auto;overflow:hidden;">
				<div style="width:20%;height:300px;text-align:left;display:inline-block;float:left;">
					<div style="font-size:30px;font-weight:bolder;color:#2c3c57;margin:0;margin-bottom:10px;">커뮤니티</div>
					<hr style="width:80%;border:2px solid #2c3c57;margin-right:20%;padding:0;">
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu1" href="/notice" style="color:#2c5c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">공지사항</a>
					</div>
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu2" href="/fAQ" style="color:#2c5c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">FAQ</a>
					</div>
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu3" style="color:#3366cc;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">자유게시판	</a>
					</div>
				</div>
			<div style="width:78%;border-left:1px solid silver;display:inline-block;overflow:hidden;">
		<div class="tab-content">
					<center>
					<br><br><br>
						<p class="content-header">자유게시판</p>
							<div class="underline"></div>
							<div class="btn-wrapper" style="margin: 0 auto; margin-top:30px;margin-bottom:30px; text-align: right;width: 100%;">
								<div style="width: 90%;">
								
		<c:if test="${sessionScope.member !=null }">
			<a href="/boardWriter" class="btn" style="border:none;background-color: green;width: 100px;height: 30px;color:white;">글쓰기</a>
		</c:if>
		</div></div>
		<br> <br>
					<div id="table-wraper">

						<table id="matchlist-table" style="width: 100%;">
							<thead>
								<tr>
									<th class="th">글번호</th>
									<th class="th">제목</th>
									<th class="th">작성자</th>
									<th class="th">등록일</th>
									<th class="th">조회수</th>
								</tr>
							</thead>
							<tbody>
								<% for(BoardVo bv : blist) {%>
								<tr class="table-tr">
									<td class="td"><%=bv.getRnum() %></td>
									<td class="td"><a href="/boardView?boardNo=<%=bv.getBoardNo() %>"><%=bv.getBoardTitle() %></a></td>
									<td class="td"><%=bv.getBoardWriter() %></td>
									<td class="td"><%=bv.getBoardDate() %></td>
									<td class="td"><%=bv.getBoardHit() %></td>
								</tr>
								<%} %>
							</tbody>
						</table>
					</div>
					<!-- 페이징 -->
		<div id="pageNavi" style="width:100%; margin:0 auto; margin-bottom: 30px;margin-top: 30px;">${bpd.pageNavi }</div>
		<br> <br>
		<form action="/boardKeyword" method="get">
		<select name="type" style="height: 100%; border:2px solid #A4A4A4; ">
					<option value="boardTitle">제목</option>
					<option value="boardWriter">작성자</option>
				</select>
			<input type="text" size="30" name="keyword" id="keyword"
				placeholder="검색어를 입력해주세요" style="height:100%;border:2px solid #A4A4A4;">
				<button type="submit" style="background-color:#2c3c57; border:none; height: 100%;width: 70px;vertical-align: bottom; "><img src="/img/icon_search.png"></button>
		</form>
	</center>
	</div>
	</div></div><br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>