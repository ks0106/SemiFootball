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
<title>KS 대회공지</title>
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
		color:#ebebeb;
		border:none;
		background-color: #757575;
		font-size:14px;
		
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
				<div style="margin-bottom:15px;">
					<a class="side_a selected" id="side_menu3" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">지난대회결과</a>
				</div>
				
			</div><!-- 사이드 메뉴 종료 -->			
		<!-- 컨텐츠 본문 -->
   			<br><br>
   		<!-- 컨텐츠 본문 타이틀 -->
			<div id="con1" style="width:78%;border-left:1px solid silver;display:inline-block;overflow:hidden;">
				<div style="font-size:60px;color:#403d3f;text-align: center;margin-bottom:20px;">대회 공지</div>
				<div class="underline" style="margin:0 auto;width:7%;text-align:center;border-top:2px solid #bfc4cc;margin-bottom:50px;"></div>
		<!-- 컨텐츠 지점선택 파티션 -->
				<div  style="width:500px;margin:0 auto;margin-bottom:50px;">
				<c:choose>
				<c:when test="${ll !=null }">
					<img src="/img/league/${ll.filepath }" width="100%" height="100%">
				</c:when>
				<c:when test="${ll ==null }">
					<div style="margin: 0 auto;text-align: center;width: 80%;font-size: 35px;">현재 진행중인 대회가 없습니다.</div>
				</c:when>
				</c:choose>
				</div>
				<div id="btn-wrapper" style="margin: 0 auto; width: 100%; text-align: center;margin-bottom:100px;">
				<c:choose>
				<c:when test="${ll !=null }">
					<button type="button" class="insertLeagueBtn" onclick="insertLeague();" id="addTeam">참가 신청</button>
					<button type="button" class="insertLeagueBtn" onclick="teamView();" >참가 팀 보기</button>
				</c:when>
				</c:choose>
					
					<c:if test="${sessionScope.member.id eq 'admin' }">
					<div style="margin-top: 50px;">
						<button type="button" class="insertLeagueBtn" onclick="addLeague();">공지추가</button>
						<button type="button" class="insertLeagueBtn" onclick="downLeague();" >공지내리기</button>
					</div>
					</c:if>
					
				</div>			
				
			</div>
		</div>
	
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
<script>
	$(document).ready(function(){
		/* 헤더 배경 이미지 */
		$('#menuImg').append('<img src="/img/branch/ground3.jpg" alt="지점 메인 이미지" style="width:100%;max-height:initial;">');
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
 		$.ajax({
   			url:"/countTeam",
   			type:"get",
   			dataType:"json",
   			success: function(data){
				if(data<8){
					$("#addTeam").html("참가 신청")
				}else{
					$("#addTeam").html("신청이 마감되었습니다.")
					$("#addTeam").prop("disabled", true);
				}
   			}
		}); 
 		if(${sessionScope.member != null}){
 			
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
 		}
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
			location.href="/views/league/addLeague.jsp";
		}
		function teamView(){
			location.href="/viewGameTable#teamViewpoint"
		}
		function downLeague(){
			if(confirm("현재 공지를 마감하시겠습니까?")){
				location.href="/downLeague?leagueNo=${ll.leagueNo}&leagueTitle=${ll.leagueTitle}&leagueWriter=${ll.leagueWriter}&filepath=${ll.filepath}";
			}
		}
		
		
</script>
</body>
</html>