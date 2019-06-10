<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/common/pageCss.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<script>
	$(document).ready(function(){
		$('#ground1').append('<img src="/img/ground1.png" alt="그라운드1" style="width:100%;height:500px;">');
		$('#ground2').append('<img src="/img/ground2.jpg" alt="그라운드2" style="width:100%;height:500px;">');
		$('#ground3').append('<img src="/img/ground3.jpg" alt="그라운드3" style="width:100%;height:500px;">');
		$('#ground4').append('<img src="/img/ground4.jpg" alt="그라운드4" style="width:100%;height:500px;">');
		$('#ground5').append('<img src="/img/ground5.jpg" alt="그라운드5" style="width:100%;height:500px;">');
		$('.side_nav:first').css("color","#3366cc");
		$('.side_nav a:first').css("color","#3366cc");
		$('#side_pr_menu').css("display","block");
		$('.side_a').click(function(){													/* 메뉴 클릭했을 때 */
			if($(this).siblings('ul').css("display") == "block"){						/* 메뉴 컬러가 연할 때 */
				$(this).siblings('ul').slideUp();										/* 메뉴 닫음 */
			}else{																		/* 메뉴 컬러가 진할 때 */
				$(this).siblings('ul').find('li:first,a:first').css("color","#3366cc");
				$(this).siblings('ul').find('li,a').not('li:first,a:first').css("color","silver");
				$(this).parents('div').siblings().children('ul').slideUp();				/* 다른 메뉴 닫음 */
				$(this).parents('div').siblings().children('a').css("color","#2c3c57");	/* 다른 메뉴 컬러 진하게 */
				$(this).siblings('ul').slideDown();										/* 메뉴 펼침 */
				$(this).css("color","#3366cc");											/* 컬러 연하게 */
			}
		});
		$('.side_nav').click(function(){
			$(this).css("color","#3366cc");
			$(this).children('a').css("color","#3366cc");
			$(this).siblings('li').css("color","silver");
			$(this).siblings('li').children('a').css("color","silver");
		});
	});
</script>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!--영상 위 페이지 타이틀 -->
	<div id="title">
		매치
	</div>
	<section>
	<!-- 내용 작성 --> 
		<hr style="border:3px solid #2c3c57;margin:0 auto;margin-bottom:30px;padding:0;">
		<!-- center -->
		<div>
			<div style="width:85%;background-color:white;margin:0 auto;overflow:hidden;">
				<div style="width:20%;height:300px;text-align:left;display:inline-block;float:left;">
					<div style="font-size:30px;font-weight:bolder;color:#2c3c57;margin:0;margin-bottom:10px;">매치/용병</div>
					<hr style="width:80%;border:2px solid #2c3c57;margin-right:20%;padding:0;">
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu1" href="/matching" style="color:#2c5c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">매치</a>
					</div>
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu2" href="/mercenaryRec" style="color:#2c5c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">용병모집</a>
					</div>
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu3"  style="color:#3366cc;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">용병지원</a>
					</div>
				</div>
				<div style="width:78%;border-left:1px solid silver;display:inline-block;overflow:hidden;">
					<div class="tab-content" >
	               			<br><br><br>
							<p class="content-header">용병지원</p>
							<div class="underline"></div>
							<!-- 글쓰기 버튼 -->
							<div class="btn-wrapper" style="margin: 0 auto; margin-top:30px;margin-bottom:30px; text-align: right;width: 100%;">
								<div style="width: 90%;">
									<button type="button" onclick="matching()" style="border:none;background-color: green;width: 150px;height: 50px;color:white;  ">
									
									<span style="color:white;height:80%;width: 100%;display: inline;font-size: 17px; vertical-align:super; ">용병지원 </span> 
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
	                <div id="popup_mask"></div>
					
					
					<div style="width:100%;height:100px;"></div>
				<div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
	function matching(){
		location.href="/views/match/mercenaryApp.jsp";
	}
	</script>
</body>
</html>