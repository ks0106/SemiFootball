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
<link rel="stylesheet" href="/css/common/admin.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
<script>
	$(document).ready(function(){
		$('#ground1').append('<img src="/img/ground1.png" alt="그라운드1" style="width:100%;height:500px;">');
		$('#ground2').append('<img src="/img/ground2.jpg" alt="그라운드2" style="width:100%;height:500px;">');
		$('#ground3').append('<img src="/img/ground3.jpg" alt="그라운드3" style="width:100%;height:500px;">');
		$('#ground4').append('<img src="/img/ground4.jpg" alt="그라운드4" style="width:100%;height:500px;">');
		$('#ground5').append('<img src="/img/ground5.jpg" alt="그라운드5" style="width:100%;height:500px;">');
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
</script>
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
	#insertLeagueBtn{
		width:200px;
		height: 50px;
		color:teal;
		border:none;
		background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%);
	}
	.attendTeam{
		width: 25%;
		height: 50%;
		box-sizing: border-box;
		display: inline-block;
		float: left;
		text-align: center;
		font-size: 15px;
		font-weight: 700;
		line-height: 45px;
	}
	.teamE{
		width: 100%;
		height: 80%;
	}
	#top1{
		position:absolute;
		width: 150px;
		height: 150px;
		border: 1px solid;
		top: 1%;
		left: 44%;
	}
	#top2{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 28%;
		left: 19%;
	}
	#top3{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 28%;
		left: 72%;
	}
	#top4{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 50%;
		left: 6%;
	}
	#top5{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 50%;
		left: 32%;
	}
	#top6{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 50%;
		left: 59%;
	}
	#top7{
	position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 50%;
		left: 85%;
	}
	#top8{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: -1%;
	}
	#top9{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: 13%;
	}
	#top10{
	position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: 26%;
	}
	#top11{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: 39%;
	}
	#top12{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: 52%;
	}
	#top13{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: 65%;
	}
	#top14{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
		top: 74%;
		left: 78%;
	}
	#top15{
		position:absolute;
		width: 120px;
		height: 110px;
		border: 1px solid;
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
	}
</style>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"/>
	<!--영상 위 페이지 타이틀 -->
	<div id="title">
	</div>
	<section>
	<!-- 내용 작성 -->
		<hr style="border:3px solid #2c3c57;margin:0 auto;margin-bottom:30px;padding:0;">
		<!-- 컨텐츠 -->
		<div style="width:85%;background-color:white;margin:0 auto;">
		<!-- 컨텐츠 사이드 메뉴 -->
		<!-- 컨텐츠 본문 -->
   			<br><br>
   		<!-- 컨텐츠 본문 타이틀 -->
			<div id="con1" style="width:78%;display:inline-block;overflow:hidden;">
				<div style="font-size:60px;color:#403d3f;text-align: center;margin-bottom:20px;">대회 대진표</div>
				<div class="underline" style="margin:0 auto;width:7%;text-align:center;border-top:2px solid #bfc4cc;margin-bottom:50px;"></div>
		<!-- 컨텐츠 지점선택 파티션 -->
				<div  style="width:100%;margin:0 auto;margin-bottom:700px;">
				
			<c:choose>
			<c:when test="${not empty list.allList }">
			
				<!-- 대진표 배경 div  -->
					<div style="width: 90%;height:700px; background-image: url('/img/gametable.png');background-size: 100%; background-repeat:no-repeat;margin: 0 auto;position: relative;">
					<c:forEach items="${list.allList }" var="l">
						<c:choose>
							<c:when test="${l.match3 eq 1 }">
								<div id="top1" value="level"><img src="/img/league/${l.filepath }" style="width: 100%;height: 100%;" name="teamNo" value="${l.teamNo }"><div></div></div>
							</c:when>
							<c:otherwise>
								<div id="top1"></div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${not empty list.win2List }">
						 <c:forEach varStatus="k" begin="0" end="1">
							<c:forEach items="${list.win2List }" var="l" varStatus="i">
							 <c:choose>
							 	<c:when test="${not empty list.win2List[k.index] }">
									<div id="top${i.count+1 }" class="win2"><img src="/img/league/${l.filepath }" style="width: 100%;height: 100%;" name="teamNo" value="${l.teamNo }"><div></div></div>
								</c:when>
								<c:otherwise>
									<div id="top${k.count+1 }" class="win2" ></div>
								</c:otherwise>
							 </c:choose>
							</c:forEach>
						 </c:forEach>
						</c:when>
						
						<c:when test="${empty list.win2List }">
								<div id="top2" class="win2" name="match2" value="match2"></div>
								<div id="top3" class="win2" name="match2" value="match2"></div>
						</c:when>
					</c:choose>
					<c:choose>
					<c:when test="${not empty list.win4List }">
						<c:forEach begin="0" end="3" varStatus="j">
							<c:forEach items="${list.win4List }" var="l" varStatus="i">
								<c:choose>
									<c:when test="${not empty list.win4List[j.index] }">
										<div id="top${i.count+3 }" class="win4-1 win4"><img src="/img/league/${l.filepath }" style="width: 100%;height: 100%;" name="teamNo" value="${l.teamNo }"><div></div></div>
										<c:if test="${i.count>2 }">
										<div id="top${i.count+3 }" class="win4-2 win4"><img src="/img/league/${l.filepath }" style="width: 100%;height: 100%;" name="teamNo" value="${l.teamNo }"><div></div></div>
										</c:if>
									</c:when>
									<c:otherwise>
										<div id="top${j.count+3 }" class="win4-1 win4"></div>
										<c:if test="${j.count>2 }">
										<div id="top${j.count+3 }" class="win4-2 win4"></div>
										</c:if>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:forEach>
					</c:when>
					<c:when test="${empty list.win4List }">
							<div id="top4" class="win4-1 win4"></div>
							<div id="top5" class="win4-1 win4"></div>
							<div id="top6" class="win4-2 win4"></div>
							<div id="top7" class="win4-2 win4"></div>
					</c:when>
					</c:choose>
					<c:forEach items="${list.allList }" var="l" varStatus="i">
						<c:if test="${(i.count+7)<10 }">
							<div id="top${i.count+7 }" class="win8-1"><img src="/img/league/${l.filepath }" style="width: 100%;height: 100%;" name="teamNo" value="${l.teamNo }"><div></div></div>
						</c:if>
						<c:if test="${(i.count+7)>9&&(i.count+7)<12 }">
							<div id="top${i.count+7 }" class="win8-2"><img src="/img/league/${l.filepath }" style="width: 100%;height: 100%;" name="teamNo" value="${l.teamNo }"><div></div></div>
						</c:if>
						<c:if test="${(i.count+7)>11&&(i.count+7)<14 }">
							<div id="top${i.count+7 }" class="win8-3"><img src="/img/league/${l.filepath }" style="width: 100%;height: 100%;" name="teamNo" value="${l.teamNo }"><div></div></div>
						</c:if>
						<c:if test="${(i.count+7)>13&&(i.count+7)<16 }">
							<div id="top${i.count+7 }" class="win8-4"><img src="/img/league/${l.filepath }" style="width: 100%;height: 100%;" name="teamNo" value="${l.teamNo }"><div></div></div>
						</c:if>
					</c:forEach>
				</div>
				<div id="cansleBtn" style="margin: 0 auto; width: 80%;text-align: center;">
					<button onclick="location.href='/settingGameTable'" style="width:200px;height: 50px;color:teal;border:none;background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%);">초기화</button>
					<button onclick="ok();" style="width:200px;height: 50px;color:teal;border:none;background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%);">확정하기</button>
				 </div>
				<!-- 현재 참가팀 엠블럼  -->
				<div id="teamViewpoint" style="height: 100px;"></div>
				<div id="teamView" style="margin: 0 auto; width: 80%; height: 500px; ">
				<p style="width: 80%;height: 50px; margin: 0 auto;text-align: center;font-size: 50px;font-weight: 700;margin-bottom: 50px;">현재 참가팀</p>
				<c:forEach items="${list.allList }" var="l">
					<div class="attendTeam"><div class="teamE"><img src="/img/league/${l.filepath }" style="width: 100%;height: 100%;"></div>${l.teamName }</div>
					
				</c:forEach>
				</div>
			</c:when>
			<c:when test="${empty list.allList }">
				<div style="margin: 0 auto;width: 80%; text-align: center;font-size: 40px;font-weight: bold">현재 진행중인 대회가 없습니다.</div>
			</c:when>
			</c:choose>
			</div>
		</div>
	
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		$(document).ready(function(){
		 $(".win8-1").click(function(){
				img = "<img src='"+$(this).children().attr("src")+"' style='"+$(this).children().attr("style")+"' name='"+$(this).children().attr("name")+"' value='"+$(this).children().attr("value")+"'>";
				$("#top4").empty();
				$(this).siblings().filter($(".win8-1")).append("<div></div>");
				$(this).children().remove("div");
				$(this).siblings().filter($(".win8-1")).children().filter("div").addClass("lose");
				$("#top4").append(img);
				
			});
			
			$(".win8-2").click(function(){
				img = "<img src='"+$(this).children().attr("src")+"' style='"+$(this).children().attr("style")+"' name='"+$(this).children().attr("name")+"' value='"+$(this).children().attr("value")+"'>";
				$("#top5").empty();
				$(this).siblings().filter($(".win8-2")).append("<div></div>");
				$(this).children().remove("div");
				$(this).siblings().filter($(".win8-2")).children().filter("div").addClass("lose");
				$("#top5").append(img);
			});
			
			$(".win8-3").click(function(){
				img = "<img src='"+$(this).children().attr("src")+"' style='"+$(this).children().attr("style")+"' name='"+$(this).children().attr("name")+"' value='"+$(this).children().attr("value")+"'>";
				$("#top6").empty();
				$(this).siblings().filter($(".win8-3")).append("<div></div>");
				$(this).children().remove("div");
				$(this).siblings().filter($(".win8-3")).children().filter("div").addClass("lose");
				$("#top6").append(img);
			});
			$(".win8-4").click(function(){
				img = "<img src='"+$(this).children().attr("src")+"' style='"+$(this).children().attr("style")+"' name='"+$(this).children().attr("name")+"' value='"+$(this).children().attr("value")+"'>";
				$("#top7").empty();
				$(this).siblings().filter($(".win8-4")).append("<div></div>");
				$(this).children().remove("div");
				$(this).siblings().filter($(".win8-4")).children().filter("div").addClass("lose");
				$("#top7").append(img);
			});
			$(".win4-1").click(function(){
				img = "<img src='"+$(this).children().attr("src")+"' style='"+$(this).children().attr("style")+"' name='"+$(this).children().attr("name")+"' value='"+$(this).children().attr("value")+"'>";
				$("#top2").empty();
				$(this).siblings().filter($(".win4-1")).append("<div></div>");
				$(this).children().remove("div");
				$(this).siblings().filter($(".win4-1")).children().filter("div").addClass("lose");
				$("#top2").append(img);
			});
			$(".win4-2").click(function(){
				img = "<img src='"+$(this).children().attr("src")+"' style='"+$(this).children().attr("style")+"' name='"+$(this).children().attr("name")+"' value='"+$(this).children().attr("value")+"'>";
				$("#top3").empty();
				$(this).siblings().filter($(".win4-2")).append("<div></div>");
				$(this).children().remove("div");
				$(this).siblings().filter($(".win4-2")).children().filter("div").addClass("lose");
				$("#top3").append(img);
			});
			$(".win2").click(function(){
				img = "<img src='"+$(this).children().attr("src")+"' style='"+$(this).children().attr("style")+"' name='"+$(this).children().attr("name")+"' value='"+$(this).children().attr("value")+"'>";
				$("#top1").empty();
				$(this).siblings().filter($(".win2")).append("<div></div>");
				$(this).children().remove("div");
				$(this).siblings().filter($(".win2")).children().filter("div").addClass("lose");
				$("#top1").append(img);
			});
			
		}); 
		/* function winner(teamNo){
			location.href="/winner?teamNo="+teamNo;
			$(this).chiledren().filter("div").addClass("lose");
		} */
		function ok(){
			if(confirm("변경한 내용을 저장하시겠습니까?")){
				var win4="";
				 $(".win4").each(function(index){
					 if($(".win4").eq(index).children().is("img")){
							win4 +=$(this).children().filter("img").attr("value")+",";
					 }
				});
					 win4 = win4.substring(0,win4.length-1);
					
					
				var win2 ="";
				 $(".win2").each(function(index){
					 if($(".win2").eq(index).children().is("img")){
							win2 +=$(this).children().filter("img").attr("value")+",";
					 }
				}); 
				 win2 = win2.substring(0,win2.length-1);
				var top1="";
				if($("#top1").children().is("img")){
					top1 =$("#top1").children().filter("img").attr("value"); 
				}
				
				location.href="/win4?win4="+win4+"&win2="+win2+"&top1="+top1;
				
				
			}
		}
	</script>
</body>
</html>