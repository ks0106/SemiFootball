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
	#reservationTitle{
		font-size:45px;
		font-weight:bolder;
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
   		<!-- 컨텐츠 본문 타이틀 -->
			<div id="con1" style="width:100%%;display:inline-block;overflow:hidden;margin-bottom: 500px;">
				<div id="reservationTitle" style="color:black;position:absolute;top:120px;left:70%;">[관리자] 대회 신청</div>
		<!-- 컨텐츠 지점선택 파티션 -->
				<div  style="width:85%;margin:0 auto;margin-bottom:700px;margin-top:150px;">
					<div id="top1-container" style="height: 130px;margin:0 auto;"> 
						<form action="/addLeague" method="post" enctype="multipart/form-data">
							<table id="form-table" style="border-top: 3px solid black; border-bottom:3px solid black; margin: 0 auto; width: 80%;">
								<tr>
									<th class="th" colspan="1" >대회이름</th>
									<td class="td" colspan="3"><input type="text" name="leagueTitle" size="50" style="height:30px;"></td>
									
								</tr>
								<tr>
									<th class="th" colspan="1">작성자</th>
									<td class="td" colspan="3"><input type="text" name="leagueWriter" size="50" style="height:30px;" value="${sessionScope.member.id}" readonly></td>
									
								</tr>
							
								<tr>
									<th class="th" colspan="1">포스터사진</th>
									<td class="td" colspan="3" ><input type="file" name="filepath" onchange="loadImg(this)"></td>
								</tr>
								<tr>
									<th class="th" colspan="1">이미지 보기</th>
									<td class="td" colspan="3" rowspan="3">
										<div id="img-viewer" style="width: 500px; height: 500px;">
											<img id="img-view" width="100%" height="100%">
										</div>
									</td>
								</tr>
							</table>
							<div id="btn-wrapper" style="width: 80%; margin: 0 auto; height: 150px; text-align: center; margin-top: 20px;">
								<button type="submit" style="width:200px;height: 50px;color:teal;border:none;background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%);">대회공지추가</button>
								<button type="button" onclick="back();" style="width:200px;height: 50px;color:teal;border:none;background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%);">취소</button>
							</div>
						</form>
					</div>
					
				</div>
			</div>
	
	</section>
	
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
	
	});
	function back(){
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