<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/css/common/pageCss.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 동영상CSS  -->
<style>
	/* 페이지 메뉴바 css  */
	.tab-container{
	  margin:0 auto;
      position:absolute;
      text-align:center;
      left:10%;
      width:80%;
      height:80px;
   }
   .tab-list{
      margin:0;
      padding0;
      height:100%;
      list-style-type: none;
      border-bottom:1px solid #2c3c57;
      padding-left: 0;
   }
   .list-li{
      height: 100%;
      width:25%;
      float: left;
      text-align: center;
      line-height: 80px;
      font-size: 40px;
      font-weight: bold;
      border-right: 1px solid #2c3c57;
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
      background-color: #2c3c57;
    	color:white;
   }
   .list-li>a:hover{
   		background-color: #2c3c57;
   		color:white;
   }
	.tab-content{
		margin: 0 auto;
		width: 100%;
		text-align: center;
	}
	.content-header{
		color:#403d3f;
		font-size: 60px;
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
		border-top:2px solid #2c3c57;
		border-bottom:2px solid #2c3c57;
		border-collapse: collapse;
		
	}
	#table-wraper{
		margin:0 auto;
		margin-top:30px;
		width: 100%; 
	}
	.tab-con{
		margin:0 auto;
		width: 100%;
	}
	.td{
		padding: 16px;
		border-bottom: 1px solid #d5d8dd;
		height: 21px;
		font-size: 18px;
		font-weight: 700;
		line-height: 21px;
	}
	.table-tr td{
		padding: 16px;
		border-bottom: 1px solid #d5d8dd;
		height: 21px;
		font-size: 18px;
		line-height: 21px;
	}
	.table-tr{
		cursor: pointer;
	}
	.table-tr:hover {
		background-color: #F2F2F2;
	}
</style>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
		<!--헤더 밑 영상  -->
	<div id="continer" style="display:block;">
	<div id="mv">
		<video id="video01" class="pblock" autoplay playsinline muted loop title> 
			<source src="/img/page3.mp4" type="video/mp4"> 
		</video>
	</div>
	<!--영상 위 페이지 타이틀 -->
		<div id="title">
			매치/용병
		</div>
	</div>
	<section class="page_area">
		<!-- 매치페이지 메뉴네비  -->
		<div class="tab-container">
	            <ul class="tab-list">
	               <li class="selected list-li"><a href="#T-con01" class="munebar">매칭신청</a></li>
	               <li class="list-li"><a href="#T-con02" class="munebar">용병모집</a></li>
	               <li class="list-li"><a href="#T-con03" class="munebar">용병지원</a></li>
	            </ul>
	            <!-- 탭컨텐츠 랩퍼-->
	            <div class="tab-content-wrapper">
	            <!-- 탭컨텐츠1 -->
	               <div id="T-con01" class="tab-con">
	               		<div class="tab-content" >
	            <!-- 탭컨텐츠 제목 -->
	               			<br><br><br>
							<p class="content-header">매칭신청</p>
							<div class="underline"></div>
							<!-- 글쓰기 버튼 -->
							<div class="btn-wrapper" style="margin: 0 auto; margin-top:30px;margin-bottom:30px; text-align: right;width: 100%;">
								<button type="button" onclick="matching()" style="border:none;background-color:#2c3c57;width: 150px;height: 50px;color:white;  ">
								
								<p style="color:white;height:80%;">매칭신청</p> 
								
								</button>
							</div>
							<!-- 매치 게시판 출력 테이블 -->
								<div id="table-wraper">
								
									<table id="matchlist-table" style="width: 100%;">
										<tr>
											<th class="td">매치형태</th>
											<th class="td">지점구분</th>
											<th class="td" colspan="2">배치일자</th>
											<th class="td">신청가능팀</th>
											<th class="td">작성자</th>
											<th class="td">작성일자</th>
											<th class="td">신청</th>
										</tr>
										<!-- 게시판 리스트 출력 포문 -->
										<c:forEach items="${mpd.list }" var="m">
											<tr class="table-tr" onclick="contentView(${m.seqMatchNo})" >
												<td>${m.matchType } </td>
												<td>${m.matchBName }</td>
												<td colspan="2">${m.matchDate }</td>
												<td>${m.teamCount }</td>
												<td>${m.matchWriter }</td>
												<td>${m.matchEnrollDate }</td>
												<td>${m.able }</td>
											</tr>
										</c:forEach> 
									</table>
								</div>
							<div id="pageNavi" style="width:80%; margin:0 auto;">${mpd.pageNavi }</div>
	               		</div>
	               </div>
	               <div id="T-con02" class="tab-con">
	               	2
	               </div>
	               <div id="T-con03" class="tab-con">
	               3
	               </div>
	            </div>
	         </div>
		</section>

   <script >
     $(".tab-container").each(function  () {
         var $cmTabList = $(this).children(".tab-list");
         var $cmTabListli = $cmTabList.find("li");
         var $cmConWrapper = $(this).children(".tab-content-wrapper");
         var $cmContent = $cmConWrapper.children(".tab-con");
         
         
         // 탭 영역 숨기고 selected 클래스가 있는 영역만 보이게
         var $selectCon = $cmTabList.find("li.selected").find("a").attr("href");
         $cmContent.hide();
         $($selectCon).show();

         $cmTabListli.children("a").click(function  () {
            if ( !$(this).parent().hasClass("selected")) {
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
