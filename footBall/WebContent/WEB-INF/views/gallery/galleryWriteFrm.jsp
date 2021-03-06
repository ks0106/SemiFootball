  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
    <%
		Member m = (Member)session.getAttribute("member");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KS 사진관리</title>
<script
   src="https://code.jquery.com/jquery-3.4.0.js"
   integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
   crossorigin="anonymous"></script>
   <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
   <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
	
	#galleryWriterTbl{
		border-collapse:collapse;
		color: black;
		text-align: center;
		margin-top: 150px;
	}
	#galleryWriterTbl th,td{
		border: 1px solid silver;
	}
	#input {
		width : 300px;
		height : 50px;
	}
	.boardWriteBtn{
		border: none;
		background-color: #2c3c57;
		width: 120px;
		height: 40px;
		color: white;
	}
</style>
<link rel="stylesheet" href="/css/common/admin.css">
<body>
   <jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"/>
	<!-- 내용 -->
	<div id="title">[관리자]사진 등록</div>
	<section class="page_area">
		<div class="table-wrapper" style="text-align:center; width:70%; margin:0 auto; height: 600px;">
			<form action="/insertGallery" method="post" enctype="multipart/form-data" style="height: 100%;">
				<table id="galleryWriterTbl" align="center" style ="text-align: center; width: 80%; height: 100%; border: 1px solid black">
					<tr >
						<th colspan="2" style="background: #e1dcd9; height: 30px; font-size:20px; font-weight: bold; ">사진 등록</th>
					</tr>
					<tr >
						<th style="width: 10%; height: 20px;">작성자</th>
						<td style="width: 90%;">
							${sessionScope.member.id }
							<input type="hidden" name="photoWriter" value="${sessionScope.member.id }">
						</td>
					</tr>
					<tr >
						<th style="width: 10%; height: 20px;">첨부파일</th>
						<td>
							<input type="file" name="filename" onchange="loadImg(this)">
						</td>
					</tr>
					<tr>
						<th style="width: 10%; height: 80px;">이미지 보기</th>
						<td>
							<div id="img-viewer">
								<img id="img-view" width="350">
							</div>
						</td>
					</tr>
					<tr>
						<th style=" height: 20px;" colspan="2">
							<button class="boardWriteBtn" type="submit">등록하기</button>
							<button class="boardWriteBtn" onclick="location.href='/admin'" type="button" style="background-color:gray;">취소</button>
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
		
		$('#myPage').on("click",function(){

		});
	</script>
</body>

</html>