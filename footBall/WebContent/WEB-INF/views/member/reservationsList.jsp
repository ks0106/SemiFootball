<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%
    	Member m = (Member)request.getAttribute("member");
    %>
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
<title>KS 대관예약확인</title>
<style>
	/* 모든 버튼 타입 커서  */
	input[type="button"],input[type="submit"],input[type="reset"],button{
		cursor:pointer;
	}

	.side_a {
		font-weight: bolder;
		font-size: 18px;
		text-decoration: none;
		cursor: pointer;
	}
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
	.th {
		width: 20%;
		border-bottom: 1px solid gray;
		padding-top: 10px;
		padding-bottom: 10px;
		font-size:18px;
	}
	.td {
		padding: 16px;
		border-bottom: 1px solid #d5d8dd;
		height: 21px;
		font-size: 18px;
		line-height: 21px;
	}
	#imgView:hover {
		background-color: #F2F2F2;
		cursor: pointer;
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
	

	.selectPage{
		line-height: 50px;
		color: white;
		background-color:  green;
		font-size: 25px;
	}
	
	#matchView{
		position:fixed;
		width: 870px;
		height: 685px;
		margin: 0 auto;
		top: 18%;
		left: 29%;
		background-color: #FFF;
		border-radius: 15px;
		display: none;
		z-index: 1;
	}
	
	
	.view-table-div{
	
		margin: 0 auto;
		width: 100%;
		height:70%;
		margin-top: 30px;
	}
	
     .page_area{
     	width: 100%;
     	height: 130vh;
     }
     #able{
     	width: 50px;
     	height: 35px;
     	border-radius: 5px;
     	background-color: green;
     	color:white;
     }
     #disable{
     width: 50px;
     	height: 35px;
     	border-radius: 5px;
     	background-color: red;
     	color:white;
     }
    input{
    	height: 20px;
    }
    
    #top1 {
	position: absolute;
	width: 150px;
	height: 150px;
	border: 1px solid;
	top: 1%;
	left: 44%;
	}
	
	#top2 {
		position: absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 28%;
		left: 19%;
	}
	
	#top3 {
		position: absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 28%;
		left: 72%;
	}
	
	#top4 {
		position: absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 50%;
		left: 6%;
	}
	
	#top5 {
		position: absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 50%;
		left: 32%;
	}
	
	#top6 {
		position: absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 50%;
		left: 59%;
	}
	
	#top7 {
		position: absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 50%;
		left: 85%;
	}
	
	#top8 {
		position: absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: -1%;
	}
	
	#top9 {
		position: absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: 13%;
	}
	
	#top10 {
		position: absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: 26%;
	}
	
	#top11 {
		position: absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: 39%;
	}
	
	#top12 {
		position: absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: 52%;
	}
	
	#top13 {
		position: absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: 65%;
	}
	
	#top14 {
		position: absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: 78%;
	}
	
	#top15 {
		position: absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: 91%;
	}
	
	.lose {
		width: 100%;
		height: 100%;
		background-color: black;
		position: absolute;
		top: 0%;
		left: 0%;
		opacity: 0.5;
		z-index: 2;
	}
	
	#content {
		display: none;
	}
</style>
<script>
	$(document).ready(function(){
		$('#menuImg').append('<img src="/img/common/myPage.jpg" alt="메인 이미지" style="width:100%;max-height:initial; margin-top:-5%;">');
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
		MyPage
	</div>
	<section>
	<!-- 내용 작성 -->
		<hr style="border:3px solid #2c3c57;margin:0 auto;margin-bottom:30px;padding:0;">
		<!-- center -->
		<div style="width:85%;background-color:white;margin:0 auto;overflow:hidden;">
			<div style="width:20%;height:300px;text-align:left;display:inline-block;float:left;">
				<div style="font-size:30px;font-weight:bolder;color:#2c3c57;margin:0;margin-bottom:10px;">MyPage</div>
				<hr style="width:80%;border:2px solid #2c3c57;margin-right:20%;padding:0;">
				<div style="margin-bottom:15px;">
					<a class="side_a" id="side_menu1" href="/myPage?memberId=${member.id }" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">계정관리</a>
				</div>
				<div style="margin-bottom:15px;">
					<a class="side_a" id="side_menu2" href="/reservationViewMyPageList" style="color:#3366cc;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">결제내역</a>
				</div>					
			</div>
		<!-- 비밀번호 확인 jsp include -->
		<jsp:include page="/WEB-INF/views/common/password.jsp"/>
			<div id="mypage" style="width: 78%; height: 120vh; border-left: 1px solid silver;overflow: hidden;display:none; ">
				<div
					style="font-size: 60px; color: #403d3f; text-align: center; margin-bottom: 20px;">예약확인</div>
				<div class="underline"
					style="margin: 0 auto; width: 7%; text-align: center; border-top: 2px solid #bfc4cc; margin-bottom: 50px;"></div>
				<!-- 컨텐츠 파티션 -->
				<div style="width: 90%; margin: 0 auto; margin-bottom: 50px;">
					<div id="table-wrapper1"
						style="margin-bottom: 100px; text-align: center;">
						<p style="font-size: 30px; font-weight: bold;">주문장 목록</p>
						<table
							style="margin-top: 50px; border-top: 3px solid #2c3c57; border-bottom: 3px solid #2c3c57; width: 80%; margin: 0 auto; border-collapse: collapse;">
							<tr>
								<th class="th">주문번호</th>
								<th class="th">날짜</th>
								<th class="th">금액</th>
								<th class="th">결제</th>
							</tr>
							<c:if test="${!empty list}">
								<c:forEach items="${list}" var="r">
									<tr id="imgView" onclick="window.open('/reservationView?resNo=${r.resNo}','예약확인','width=1000,height=900,location=no,status=no,scrollbars=yes');">
										<td class="td"><span class="priamryNo">${r.resNo}</span></td>
										<td class="td">${r.resDate}</td>
										<td class="td"><fmt:formatNumber value="${r.resTotalCost}" pattern="#,###" />원</td>
										<c:if test="${r.resPayment == 1}">
											<c:if test="${r.resCancel == 0}">
												<td class="td">결제완료</td>
											</c:if>
											<c:if test="${r.resCancel == 1}">
												<td class="td">결제취소 진행중</td>
											</c:if>
										</c:if>
										<c:if test="${r.resPayment == 2}">
											<td class="td">결제취소 완료</td>
										</c:if>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div>
					<!-- 페이지 네비 -->
					<div id="pageNavi"
						style="width: 80%; margin: 0 auto; margin-bottom: 100px;">${mpd.pageNavi }
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>