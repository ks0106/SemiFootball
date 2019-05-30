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
<title>대회 신청</title>
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
	#insertLeagueBtn{
		width:200px;
		height: 50px;
		color:teal;
		border:none;
		background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%);
	}
	.th{
		padding: 15px;
		width: 25%;
		text-align: center;
		height: 20px;
		font-size: 20px;
	}
	.td{
		padding: 15px;
		width: 25%;
		text-align: left;
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
					<a class="side_a" id="side_menu1" style="color:#3366cc;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">대회 공지</a>
				</div>
				<div style="margin-bottom:15px;">
					<a class="side_a" id="side_menu2" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">대회 대진표</a>
				</div>
				<div style="margin-bottom:15px;">
					<a class="side_a" id="side_menu3" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">지난 대회 결과</a>
				</div>
			</div><!-- 사이드 메뉴 종료 -->			
		<!-- 컨텐츠 본문 -->
   			<br><br>
   		<!-- 컨텐츠 본문 타이틀 -->
			<div id="con1" style="width:78%;border-left:1px solid silver;display:inline-block;overflow:hidden;">
				<div style="font-size:60px;color:#403d3f;text-align: center;margin-bottom:20px;">대회 신청</div>
				<div class="underline" style="margin:0 auto;width:7%;text-align:center;border-top:2px solid #bfc4cc;margin-bottom:50px;"></div>
		<!-- 컨텐츠 지점선택 파티션 -->
				<div  style="width:100%;margin:0 auto;margin-bottom:700px;">
					<div id="top1-container" style="width: 100%;height: 130px;"> 
						<form action="/insertLaegue" method="post" enctype="multipart/form-data">
							<table id="form-table" style="border-top: 3px solid green; border-bottom:3px solid green; margin: 0 auto; width: 80%;">
								<tr>
									<th class="th" >팀이름</th>
									<td class="td" ><input type="text" name="teamName" size="30" style="height:30px;"></td>
									<th class="th" >대표자 이메일</th>
									<td class="td" ><input type="text" name="teamEmail" size="30" style="height:30px;"></td>
								</tr>
								<tr>
									<th class="th">대표자 이름</th>
									<td class="td"><input type="text" name="teamRep" size="30" style="height:30px;" value="${sessionScope.member.name }"></td>
									<th class="th">대표자 연락처</th>
									<td class="td"><input type="text" name="teamPhone" size="30" style="height:30px;" value="${sessionScope.member.phone }"></td>
								</tr>
								<tr>
									<th class="th">홈 유니폼 색상</th>
									<td class="td"><input type="text" name="teamColorHome" size="30" style="height:30px;"></td>
									<th class="th">어웨이 유니폼 색상</th>
									<td class="td"><input type="text" name="teamColorAway" size="30" style="height:30px;"></td>
								</tr>
								<tr>
								
								</tr>
									<th class="th">팀 엠블럼 사진</th>
									<td class="td" ><input type="file" name="filepath" onchange="loadImg(this)"></td>
									<th class="th">이미지 보기</th>
									<td class="td">
										<div id="img-viewer">
											<img id="img-view" width="350">
										</div>
									</td>
							</table>
							<div id="btn-wrapper" style="width: 80%; margin: 0 auto; height: 50px; text-align: center; margin-top: 60px; margin-bottom: 60px;">
								<button type="submit" style="width:200px;height: 50px;color:teal;border:none;background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%);">신청하기</button>
								<button type="button" onclick="close();" style="width:200px;height: 50px;color:teal;border:none;background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%);">취소</button>
							</div>
						</form>
					</div>
					
				</div>
			</div>
		</div>
	
	</section>
	
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
			location.href="/gameTable"
		});
		$("#side_menu3").click(function(){
		});
	
	});
	function close(){
		location.href="/league";
	}
	function loadImg(f){
		if(f.files.length !=0 && f.files[0] !=0){
			//배열형태로 가지고 옴 //파일이 업로드 되면 이라는 조건 배열길이가 0이 아니거나 0번에 크기가 0이아니면
			//JS의 FileReader객체 -> 객체 내부의 result 속성에 파일 컨텐츠가 있음
			var reader = new FileReader();
			reader.readAsDataURL(f.files[0]); //선택한 파일 경로를 읽어옴
			reader.onload=function(e){ //다 읽어 왔으면 실행
				$("#img-view").attr('src', e.target.result);
			}
		}else{
			$("#img-view").attr('src','');
		}
	}
</script>
</body>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>