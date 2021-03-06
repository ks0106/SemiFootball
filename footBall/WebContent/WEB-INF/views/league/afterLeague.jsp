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
<title>KS 지난대회</title>
<style>
</style>

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
	.insertLeagueBtn{
		width:200px;
		height: 50px;
		color:teal;
		border:none;
		background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%);
	}
	.th{
		width: 20%;
		border-bottom: 1px solid gray;
		padding-top : 10px;
		padding-bottom: 10px;
	}
	.td{
		padding: 16px;
		border-bottom: 1px solid #d5d8dd;
		height: 21px;
		font-size: 18px;
		line-height: 21px;
	}
	#imgView:hover{
		background-color: #F2F2F2;
		cursor: pointer;
	}
		#top1{
		position:absolute;
		width: 150px;
		height: 150px;
		top: 1%;
		left: 44%;
	}
	#top2{
		position:absolute;
		width: 120px;
		height: 110px;
		top: 28%;
		left: 19%;
	}
	#top3{
		position:absolute;
		width: 120px;
		height: 110px;
		top: 28%;
		left: 72%;
	}
	#top4{
		position:absolute;
		width: 120px;
		height: 110px;
		top: 50%;
		left: 6%;
	}
	#top5{
		position:absolute;
		width: 120px;
		height: 110px;
		top: 50%;
		left: 32%;
	}
	#top6{
		position:absolute;
		width: 120px;
		height: 110px;
		top: 50%;
		left: 59%;
	}
	#top7{
	position:absolute;
		width: 120px;
		height: 110px;
		top: 50%;
		left: 85%;
	}
	#top8{
		position:absolute;
		width: 120px;
		height: 110px;
		top: 74%;
		left: -1%;
	}
	#top9{
		position:absolute;
		width: 120px;
		height: 110px;
		top: 74%;
		left: 13%;
	}
	#top10{
	position:absolute;
		width: 120px;
		height: 110px;
		top: 74%;
		left: 26%;
	}
	#top11{
		position:absolute;
		width: 120px;
		height: 110px;
		top: 74%;
		left: 39%;
	}
	#top12{
		position:absolute;
		width: 120px;
		height: 110px;
		top: 74%;
		left: 52%;
	}
	#top13{
		position:absolute;
		width: 120px;
		height: 110px;
		top: 74%;
		left: 65%;
	}
	#top14{
		position:absolute;
		width: 120px;
		height: 110px;
		top: 74%;
		left: 78%;
	}
	#top15{
		position:absolute;
		width: 120px;
		height: 110px;
		top: 74%;
		left: 91%;
	}
	.lose{
		width:100%;
		height:100%;
		background-color:black;
		position:absolute;
		top:0%;
		left: 0%;
		opacity: 0.5;
		z-index: 2;
	}
	#content{
		display: none;
	}
	.pageNaviBtn {
	width: 35px;
	height: 40px;
	border: 1px solid #A4A4A4;
	display: inline-block;
	border-radius: 10px;
	line-height: 40px;
}

.selectPage {
	line-height: 40px;
	color: white;
	background-color: #2c3c57;
	font-size: 20px;
}
.btn {
    display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
}
/* 본문 타이틀 css */
	.content-header{
		color:#2c3c57;
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
	.tab-content{
		margin: 0 auto;
		width: 100%;
		text-align: center;
		margin-bottom:30px;
	}
</style>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!--영상 위 페이지 타이틀 -->
	<div id="title">
		대회
	</div>
	<section>
	<!-- 내용 작성 -->
		<hr style="border:3px solid #2c3c57;margin:0 auto;margin-bottom:30px;padding:0;">
		<!-- 컨텐츠 -->
		<div style="width:85%;background-color:white;margin:0 auto;">
		<!-- 컨텐츠 사이드 메뉴 -->
			<div style="width:20%;height:300px;text-align:left;display:inline-block;float:left;">
				<div style="font-size:30px;font-weight:bolder;color:#2c3c57;margin:0;margin-bottom:10px;">League</div>
				<hr style="width:80%;border:2px solid #2c3c57;margin-right:20%;padding:0;">
				<div style="margin-bottom:15px;">
					<a class="side_a" id="side_menu1" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">대회 공지</a>
				</div>
				<div style="margin-bottom:15px;">
					<a class="side_a" id="side_menu2" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">대회 대진표</a>
				</div>
				<div style="margin-bottom:15px;">
					<a class="side_a selected" id="side_menu3" style="color:#3366cc;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">지난대회결과</a>
				</div>
				
			</div><!-- 사이드 메뉴 종료 -->			
   		<!-- 컨텐츠 본문 타이틀 -->
			<div id="con1" style="width:78%;border-left:1px solid silver;display:inline-block;overflow:hidden;">
				<div class="tab-content" >			
		  			<br><br>
					<p class="content-header">지난대회결과</p>
					<div class="underline"></div>
				</div>
		<!-- 컨텐츠 지점선택 파티션 -->
				<div  style="width:90%;margin:0 auto;margin-bottom:50px;">
				<div id="table-wrapper1" style="margin-bottom: 20px;text-align: center;">
					<table style="margin-top: 50px; border-top: 3px solid #2c3c57;border-bottom:3px solid #2c3c57; width: 80%; margin: 0 auto;border-collapse: collapse;">
						<tr>
							<th class="th">번호</th>
							<th class="th" colspan="2">제목</th>
							<th class="th">등록일</th>
						</tr>
						<c:if test="${!empty lpd.list}">
							<c:forEach items="${lpd.list }" var="l" >
								<tr id="imgView" onclick="imgView('${l.leagueNo}')">
									<td class="td">${l.leagueAfterNo}</td>
									<td class="td" colspan="2">${l.leagueAfterTitle }</td>
									<td class="td">${l.leagueAfterEnrolldate }</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>			
					<!-- 페이지 네비 -->
						<div id="pageNavi" style="width:80%; margin:0 auto; margin-bottom: 100px;text-align: center;">${lpd.pageNavi }</div>
				</div>
				<div id="content">
				<!-- 타이틀자리 -->
				<div id="title-position" style="margin: 0 auto;width: 60%;text-align: center; font-size: 20px; font-weight: 20px;margin-bottom: 30px;"></div>
				<!-- 포스터자리 -->
				<div  style="width:300px;margin:0 auto;margin-bottom:50px;">
					<img id="poster"  width="100%" height="100%">
				</div>
				<!-- 대진표 배경 div  -->
				<div style="margin: 0 auto; width: 60%; font-size: 16px;font-weight: bold;text-align: center;margin-bottom: 30px;"> 대회 경기 결과</div>
					<div style="width: 90%;height:700px; background-image: url('/img/gametable.png');background-size: 100%; background-repeat:no-repeat;margin: 0 auto;position: relative;">
							<div id="top1"><img  style="width: 100%;height: 100%;"><div></div></div>
							<div id="top2" class="win2"><img  style="width: 100%;height: 100%;"><div></div></div>
							<div id="top3" class="win2"><img  style="width: 100%;height: 100%;"><div></div></div>
							<div id="top4" class="win4-1 win4"><img  style="width: 100%;height: 100%;"><div></div></div>
							<div id="top5" class="win4-1 win4"><img  style="width: 100%;height: 100%;"><div></div></div>
							<div id="top6" class="win4-1 win4"><img  style="width: 100%;height: 100%;"><div></div></div>
							<div id="top7" class="win4-1 win4"><img  style="width: 100%;height: 100%;"><div></div></div>
							<div id="top8" class="win8 win8-1"><img style="width: 100%;height: 100%;"><div></div></div>
							<div id="top9" class="win8 win8-1"><img style="width: 100%;height: 100%;"><div></div></div>
							<div id="top10" class="win8 win8-2"><img style="width: 100%;height: 100%;"><div></div></div>
							<div id="top11" class="win8 win8-2"><img style="width: 100%;height: 100%;"><div></div></div>
							<div id="top12" class="win8 win8-3"><img style="width: 100%;height: 100%;"><div></div></div>
							<div id="top13" class="win8 win8-3"><img style="width: 100%;height: 100%;"><div></div></div>
							<div id="top14" class="win8 win8-4"><img style="width: 100%;height: 100%;"><div></div></div>
							<div id="top15" class="win8 win8-4"><img style="width: 100%;height: 100%;"><div></div></div>
					
				</div>
			
			</div>
		</div>
	
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
<script>
	$(document).ready(function(){
		/* 헤더 배경 이미지 */
		$('#menuImg').append('<img src="/img/common/league3.jpg" alt="메인 이미지" style="width:100%;max-height:initial;">');
		//사이드 메뉴 스크립트
		$("#side_menu1").click(function(){
			location.href="/league";
		});
		$("#side_menu2").click(function(){
			location.href="/viewGameTable"
		});
		$("#side_menu3").click(function(){
			location.href="/afterLeague"
		});
		$("#side_menu4").click(function(){
			location.href="/gameTable"
		});
	});
	function imgView(lgNo){
		var count1 = 0; 
		var count2 = 0; 
		var count3 = 0; 
		$.ajax({
			url:"/afterGameTable",
			type:"post",
			data:{leagueNo:lgNo},
			dataType:"json",
			success:function(data){
					for(var i = 0 ; i<8;i++){
						$(".win8").eq(count3).children().filter("img").attr("src","/img/league/"+data[i].filepath);
						count3++;
						if(data[i].match1==1){
						$(".win4").eq(count2).children().filter("img").attr("src","/img/league/"+data[i].filepath);
						count2++;
						}
						if(data[i].match2==1){
						$(".win2").eq(count1).children().filter("img").attr("src","/img/league/"+data[i].filepath);
						count1++;
						}
						if(data[i].match3==1){
						$("#top1").children().filter("img").attr("src","/img/league/"+data[i].filepath);
						}
					}
			}
		});
		$.ajax({
			url:"/afterLeagueSelect",
			type:"post",
			data:{leagueNo:lgNo},
			dataType:"json",
			success:function(data){
					$("#title-position").html(data.leagueAfterTitle);
					$("#poster").attr("src","/img/league/"+data.filepath);
				}
			});
		if($("#top4").children().filter("img").attr("value")==$(".win8-1").eq(0).children().filter("img").attr("value")){
			$(".win8-1").eq(0).children().filter("div").addClass("lose");
		}else if($("#top4").children().filter("img").attr("value")==$(".win8-1").eq(1).children().filter("img").attr("value")){
			$(".win8-1").eq(1).children().filter("div").addClass("lose");	
		}
		if($("#top5").children().filter("img").attr("value")==$(".win8-2").eq(0).children().filter("img").attr("value")){
			$(".win8-2").eq(1).children().filter("div").addClass("lose");
		}else if($("#top5").children().filter("img").attr("value")==$(".win8-2").eq(1).children().filter("img").attr("value")){
			$(".win8-2").eq(0).children().filter("div").addClass("lose");	
		}
		if($("#top6").children().filter("img").attr("value")==$(".win8-3").eq(0).children().filter("img").attr("value")){
			$(".win8-3").eq(1).children().filter("div").addClass("lose");
		}else if($("#top6").children().filter("img").attr("value")==$(".win8-3").eq(1).children().filter("img").attr("value")){
			$(".win8-3").eq(0).children().filter("div").addClass("lose");	
		}
		if($("#top7").children().filter("img").attr("value")==$(".win8-4").eq(0).children().filter("img").attr("value")){
			$(".win8-4").eq(1).children().filter("div").addClass("lose");
		}else if($("#top7").children().filter("img").attr("value")==$(".win8-4").eq(1).children().filter("img").attr("value")){
			$(".win8-4").eq(0).children().filter("div").addClass("lose");	
		}
		if($("#top2").children().is("img")){
			if($("#top2").children().filter("img").attr("value")==$(".win4").eq(0).children().filter("img").attr("value")){
				$(".win4").eq(0).children().filter("div").addClass("lose");
			}else if($("#top2").children().filter("img").attr("value")==$(".win4").eq(1).children().filter("img").attr("value")){
				$(".win4").eq(1).children().filter("div").addClass("lose");	
			}
		}
		if($("#top3").children().is("img")){
			if($("#top3").children().filter("img").attr("value")==$(".win4").eq(2).children().filter("img").attr("value")){
				$(".win4").eq(2).children().filter("div").addClass("lose");
			}else if($("#top3").children().filter("img").attr("value")==$(".win4").eq(3).children().filter("img").attr("value")){
				$(".win4").eq(3).children().filter("div").addClass("lose");	
			}
		}
		if($("#top1").children().is("img")){
			if($("#top1").children().filter("img").attr("value")==$(".win2").eq(0).children().filter("img").attr("value")){
				$(".win2").eq(0).children().filter("div").addClass("lose");
			}else if($("#top1").children().filter("img").attr("value")==$(".win2").eq(1).children().filter("img").attr("value")){
				$(".win2").eq(1).children().filter("div").addClass("lose");	
			}
		}
		$("#content").css("display","block");
	}
	
</script>
</body>
</html>