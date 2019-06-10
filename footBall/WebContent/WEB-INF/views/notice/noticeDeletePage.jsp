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
	#side_menu1{
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
		width: 80%; 
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
	</style>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp" />

	<div id="title">고객센터</div>
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
								<a href="/noticeUpdate?noticeNo=<%=nv.getNoticeNo() %>" class="btn" style="border:none;background-color: green;width: 100px;height: 30px;color:white;">수정하기</a>
								<a href="/noticeDelete?noticeNo=<%=nv.getNoticeNo() %>" class="btn" style="border:none;background-color: green;width: 100px;height: 30px;color:white;">삭제하기</a>
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