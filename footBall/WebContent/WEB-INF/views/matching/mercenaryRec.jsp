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
	
	#matchView{
		position:fixed;
		width: 900px;
		height: 840px;
		margin: 0 auto;
		top: 9%;
		left: 26%;
		background-color: #FFF;
		border-radius: 15px;
		display: none;
		z-index: 1;
	}
	
	.view-th{
		width: 25%;
		padding: 20px;
		border: 1px solid;
		background-color: #BDBDBD;
	}
	.view-td{
		width: 25%;
		padding: 20px;
		border: 1px solid;
	}
	.view-table-div{
	
		margin: 0 auto;
		width: 100%;
		height:70%;
		margin-top: 30px;
	}
	#popup_mask { 
		 	  position: fixed;
	  	 	  width: 100%;
	  		  height: 1000px;
	   		  top: 0px;
	  	      left: 0px;
	   		  display: none; 
	    	  background-color:#000;
	          opacity: 0.6;
	          z-index: 0;
          }
     .page_area{
     	width: 100%;
     	height: 130vh;
     }
</style>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
		<!--헤더 밑 영상  -->
	<div id="continer" style="display:block;">
	<!--영상 위 페이지 타이틀 -->
		<div id="title">
			매치/용병
		</div>
	</div>
	<section class="page_area">
		<!-- 매치페이지 메뉴네비  -->
		<div class="tab-container">
	            <ul class="tab-list">
	               <li class="list-li"><a href="/matching" class="munebar">매칭신청</a></li>
	               <li class="selected list-li"><a href="#T-con02" class="munebar">용병모집</a></li>
	               <li class="list-li"><a href="/mercenary" class="munebar">용병지원</a></li>
	            </ul>
	            <!-- 탭컨텐츠 랩퍼-->
	            <div class="tab-content-wrapper">
	            <!-- 탭컨텐츠1 -->
	               <div id="T-con02" class="tab-con">
	               		<div class="tab-content" >
	            <!-- 탭컨텐츠 제목 -->
	               			<br><br><br>
							<p class="content-header">용병모집</p>
							<div class="underline"></div>
							<!-- 글쓰기 버튼 -->
							<div class="btn-wrapper" style="margin: 0 auto; margin-top:30px;margin-bottom:30px; text-align: right;width: 100%;">
								<div style="width: 90%;">
									<button type="button" onclick="matching()" style="border:none;background-color: green;width: 150px;height: 50px;color:white;  ">
									
									<span style="color:white;height:80%;width: 100%;display: inline;font-size: 17px; vertical-align:super; ">매칭신청 </span> 
									<span><img src="/img/match_icon.png" style="vertical-align: sub;"></span>
									</button>
								</div>
							</div>
							<!-- 매치 게시판 출력 테이블 -->
								<div id="table-wraper">
								
									<table id="matchlist-table" style="width: 100%;">
										<tr>
											<th class="th">지점구분</th>
											<th class="th" colspan="2">매치일자</th>
											<th class="th">모집인원</th>
											<th class="th">작성자</th>
											<th class="th">작성일자</th>
											<th class="th">신청</th>
										</tr>
										<!-- 게시판 리스트 출력 포문 -->
										<c:forEach items="${rpd.list }" var="r">
											<tr class="table-tr" onclick="contentView(${r.seqRecNo});" >
												<td class="td">${r.recBName }</td>
												<td colspan="2" class="td">${r.recDate }</td>
												<td class="td">3명</td>
												<td class="td">${r.recName }</td>
												<td class="td">${r.recEnrollDate }</td>
												<td class="td">${r.able1 }</td>
											</tr>
										</c:forEach> 
									</table>
								</div>
							<!-- 페이지 네비 -->
							<div id="pageNavi" style="width:100%; margin:0 auto; margin-bottom: 30px;">${rpd.pageNavi }</div>
							<!-- Search폼태그 -->
							<div style="height: 50px;">
								<form action="/matchSearch" method="get" style="height: 100%;">
									<select name="branch" style="height: 100%; border:2px solid #A4A4A4; ">
											<option value="">지점</option>
											<option value="부천">부천점</option>
											<option value="고양">고양점</option>
											<option value="남양주">남양주점</option>
											<option value="성남">성남점</option>
											<option value="수원">수원점</option>
											<option value="안양">안양점 </option>
											<option value="동대문지점">동대문점 </option>
									</select>
									<input type="text" size="30" name="keyword" style="height:100%;border:2px solid #A4A4A4;">
									<button type="submit" style="background-color:#2c3c57; border:none; height: 100%;width: 70px;vertical-align: bottom; "><img src="/img/icon_search.png"></button>
								</form>							
							</div>
							<!-- 게시글 view -->
							 <div id="matchView" >
								<div id="closeBtn" style="height: 10%;"><button type="button" onclick="close1(this)" style="width: 10%;float: right; border-radius: 15px;background-color: white; border:none;"><img src="/img/icon-close.png" width="100%" height="100%"></button></div>
								<p style="text-align:left;margin: 0;margin-left: 30px;font-size: 30px;display: block; margin-bottom: 30px;">용병모집 상세보기</p>
								<div id="view-table-div" >
									<table id="view-table" style="margin: 0 auto; width: 80%; border-collapse: collapse;">
										<tr id="tr11">
											<th class="view-th" >작성자 </th> <td class="view-td" colspan="3"></td>
										</tr>
										<tr>
											<th class="view-th">지점</th><td colspan="3" class="view-td">???</td>
										</tr>
										<tr>
											<th class="view-th">매치일자</th><td colspan="3" class="view-td">???</td>
										</tr>
										<tr>
											<th class="view-th">구장</th><td colspan="3" class="view-td">???</td>
										</tr>
										<tr>
											<th class="view-th">연락처</th> <td class="view-td">???</td><th class="view-th">팀수준</th> <td class="view-td">???</td>
										</tr>
										<tr>
											<th class="view-th">모집인원 </th> <td class="view-td">???</td ><th class="view-th">신청가능여부</th> <td class="view-td">???</td>
										</tr>
										<tr>
											<td colspan="4" class="view-td">
										</tr>
									</table>
									<button type="button" onclick="modifyMactchCon()" style="margin-top: 20px;" class="btn btn-info btn-lg">수정하기</button>
								</div>
							</div>
							
	               		</div>
	               </div>
	                <div id="popup_mask"></div>
	            </div>
	         </div>
		</section>
	           <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
		
		
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
     
   	function contentView(pageNum){
   		
   		$.ajax({
   			url:"/recContentView",
   			type:"get",
   			dataType:"json",
   			data:{pageNum:pageNum},
   			success: function(data){
   				var writer = data.recName;
   				var BName = data.recBName;
   				var Date = data.date2;
   				var CName = data.recCName;
   				var Phone = data.recPhone;
   				var Level = data.recLevel;
   				var able = data.able2;
   				var Memo = data.recMemo;
   				$("#tr11").find("td").eq(0).html(writer);
   				$("#tr11").next().find("td").html(BName);
   				$("#tr11").next().next().find("td").html(Date);
   				$("#tr11").next().next().next().find("td").html(CName);
   				$("#tr11").next().next().next().next().find("td").eq(0).html(Phone);
   				$("#tr11").next().next().next().next().find("td").eq(1).html(Level);
   				$("#tr11").next().next().next().next().next().find("td").eq(0).html("1명");
   				$("#tr11").next().next().next().next().next().find("td").eq(1).html(able);
   				$("#tr11").next().next().next().next().next().next().find("td").html(Memo);
   			},
   			erorr : function () {
				console.log("실패다");
			}
   			
   		});
   		$("#matchView").css('display','block');
   		$("#popup_mask").css('display','block');
   	}
   	function close1(here){
   		$(here).parent().parent().css('display','none');
   		$("#popup_mask").css('display','none');
   	}
   	$(document).ready(function(){
        $('#ground1').append('<img src="/img/ground1.png" alt="그라운드1" style="width:100%;height:500px;">');
        $('#ground2').append('<img src="/img/ground2.png" alt="그라운드2" style="width:100%;height:500px;">');
        $('#ground3').append('<img src="/img/ground3.png" alt="그라운드3" style="width:100%;height:500px;">');
        $('#ground4').append('<img src="/img/ground4.png" alt="그라운드4" style="width:100%;height:500px;">');
        $('#ground5').append('<img src="/img/ground5.png" alt="그라운드5" style="width:100%;height:500px;">');
     });
   </script>
   
   
</body>
</html>
