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
<title>대회</title>
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
				<div style="font-size:30px;font-weight:bolder;color:#2c3c57;margin:0;margin-bottom:10px;">Reague</div>
				<hr style="width:80%;border:2px solid #2c3c57;margin-right:20%;padding:0;">
				<div style="margin-bottom:15px;">
					<a class="side_a selected" id="side_menu1" style="color:#3366cc;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">대회 공지</a>
				</div>
				<div style="margin-bottom:15px;">
					<a class="side_a" id="side_menu2" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">대회 대진표</a>
				</div>
				<c:if test="${sessionScope.member.id eq'admin' }">
					<div style="margin-bottom:15px;">
						<a class="side_a " id="side_menu4" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">관리자 전용</a>
					</div>
				</c:if>
				
			</div><!-- 사이드 메뉴 종료 -->			
		<!-- 컨텐츠 본문 -->
   			<br><br>
   		<!-- 컨텐츠 본문 타이틀 -->
			<div id="con1" style="width:78%;border-left:1px solid silver;display:inline-block;overflow:hidden;">
				<div style="font-size:60px;color:#403d3f;text-align: center;margin-bottom:20px;">대회 공지</div>
				<div class="underline" style="margin:0 auto;width:7%;text-align:center;border-top:2px solid #bfc4cc;margin-bottom:50px;"></div>
		<!-- 컨텐츠 지점선택 파티션 -->
				<div  style="width:700px;margin:0 auto;margin-bottom:50px;">
					<img src="/img/poster.png" width="100%" height="100%">
				</div>
				<div id="btn-wrapper" style="margin: 0 auto; width: 100%; text-align: center;margin-bottom:100px;">
					<button type="button" class="insertLeagueBtn" onclick="insertLeague();" id="addTeam">참가 신청</button>
					<button type="button" class="insertLeagueBtn" onclick="teamView();" >참가 팀 보기</button>
					
					
				</div>			
				<div id="table-wrapper1" style="margin-bottom: 300px;text-align: center;">
					<p style="font-size: 30px; font-weight: bold;">지난 공지</p>
					<table style="margin-top: 50px; border-top: 3px solid green;border-bottom:3px solid green; width: 80%; margin: 0 auto;border-collapse: collapse;">
						<tr>
							<th class="th">번호</th>
							<th class="th" colspan="2">제목</th>
							<th class="th">작성자</th>
							<th class="th">등록일</th>
						</tr>
						<tr>
							<td class="th">7</td>
							<td class="th" colspan="2">2019 고양시청배 풋살대회</td>
							<td class="th">관리자</td>
							<td class="th">2019-4-29</td>
						</tr>
						<tr>
							<td class="th">6</td>
							<td class="th" colspan="2">2019 고양시청배 풋살대회</td>
							<td class="th">관리자</td>
							<td class="th">2019-4-14</td>
						</tr>
						<tr>
							<td class="th">5</td>
							<td class="th" colspan="2">2019 고양시청배 풋살대회</td>
							<td class="th">관리자</td>
							<td class="th">2019-3-7</td>
						</tr>
						<tr>
							<td class="th">4</td>
							<td class="th" colspan="2">2019 고양시청배 풋살대회</td>
							<td class="th">관리자</td>
							<td class="th">2018-10-2</td>
						</tr>
						<tr>
							<td class="th">3</td>
							<td class="th" colspan="2">2019 고양시청배 풋살대회</td>
							<td class="th">관리자</td>
							<td class="th">2018-9-10</td>
						</tr>
						<tr>
							<td class="th">2</td>
							<td class="th" colspan="2">2019 고양시청배 풋살대회</td>
							<td class="th">관리자</td>
							<td class="th">2018-6-23</td>
						</tr>
						<tr>
							<td class="th">1</td>
							<td class="th" colspan="2">2019 고양시청배 풋살대회</td>
							<td class="th">관리자</td>
							<td class="th">2018-5-10</td>
						</tr>
					</table>
					<c:if test="${sessionScope.member.id eq 'admin' }">
					<div style="margin-top: 50px;">
						<button type="button" onclick="addLeague();" style="width:200px;height: 50px;color:teal;border:none;background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%);">공지추가</button>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
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
		});
		$("#side_menu4").click(function(){
			location.href="/gameTable"
		});
 		$.ajax({
   			url:"/countTeam",
   			type:"get",
   			dataType:"json",
   			success: function(data){
				if(data<8){
					$("#addTeam").html("참가 신청.")
				}else{
					$("#addTeam").html("신청이 마감되었습니다.")
					$("#addTeam").prop("disabled", true);
				}
   			}
		}); 
 		$.ajax({
   			url:"/sendId",
   			type:"get",
   			dataType:"json",
   			success: function(data){
   					
   					for(var i=0 ; i<data.length;i++){
   						 if(data[i].teamEmail=="${sessionScope.member.id}"){
   							$("#btn-wrapper").append("<button type='button' class='insertLeagueBtn' onclick='removeTeam();' >참가신청 취소</button>");
   						} 
   					}
				}
		});
	});
		function removeTeam(){
			if(confirm("대회신청을 취소하시겠습니까?")){
				$.ajax({
		   			url:"/sendId",
		   			type:"get",
		   			dataType:"json",
		   			success: function(data){
		   				for(var i=0 ; i<data.length;i++){
								if(data[i].teamEmail=="${sessionScope.member.id}"){
									location.href="/removeTeam?teamEmail=${sessionScope.member.id}&filepath="+data[i].filepath;
								}
						}	   					
					}
				});
			}
		}
		function insertLeague(){
			if(${sessionScope.member != null}){
				location.href="/views/league/insertLeague.jsp";
			}else{
				alert("로그인후 사용가능합니다.")
			}
		}
		function addLeague(){
			alert("까먹지말고 만들어!");
		}
		function teamView(){
			location.href="/viewGameTable#teamViewpoint"
		}
		
</script>
</body>
</html>