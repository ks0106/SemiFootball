  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/common/pageCss.css">
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
    $('#ground1').append('<img src="/img/ground1.png" alt="그라운드1" style="width:100%;height:500px;">');
    $('#ground2').append('<img src="/img/ground2.png" alt="그라운드2" style="width:100%;height:500px;">');
    $('#ground3').append('<img src="/img/ground3.png" alt="그라운드3" style="width:100%;height:500px;">');
    $('#ground4').append('<img src="/img/ground4.png" alt="그라운드4" style="width:100%;height:500px;">');
    $('#ground5').append('<img src="/img/ground5.png" alt="그라운드5" style="width:100%;height:500px;">');
 });
</script>
</head>

<style>
	body{
		background : #A9E2C5;
		
	}
	#galleryWriterTbl{
		background : #9197B5;
		border-collapse:collapse;
		color: white;
		text-align: center;
	}
	#galleryWriterTbl th,td{
		border: 1px solid skyblue;
	}
	#input {
		width : 300px;
		height : 50px;
	}
</style>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!--영상 위 페이지 타이틀 -->
	<div id="title">
		갤러리
	</div>
	<!-- 내용 -->
	<section class="page_area">
		<div class="table-wrapper" style="text-align:center; width:80%;margin:0 auto; height: 700px;">
			<form action="/insertGallery" method="post" enctype="multipart/form-data" style="height: 100%;">
				<table id="galleryWriterTbl" style ="text-align: center; width: 100%; height: 100%; border: 1px solid black">
					<tr >
						<th colspan="2" style="font-size:20px; font-weight: bold; ">사진 등록</th>
					</tr>
					<tr >
						<th >작성자</th>
						<td>
							${sessionScope.member.id }
							<input type="hidden" name="photoWriter" value="${sessionScope.member.id }">
						</td>
					</tr>
					<tr >
						<th>첨부파일</th>
						<td>
							<input type="file" name="filename" onchange="loadImg(this)">
						</td>
					</tr>
					<tr>
						<th>이미지 보기</th>
						<td>
							<div id="img-viewer">
								<img id="img-view" width="350">
							</div>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<button id="input" type="submit">등록하기</button>
						</th>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<script>
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
</html>