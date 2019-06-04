<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
    <%
		Member m = (Member)session.getAttribute("member");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdbv.bootstrapcdbv.com/bootstrap/3.3.7/css/bootstrap.mibv.css">
<script src="https://code.jquery.com/jquery-3.3.1.mibv.js"></script>
<script src="https://maxcdbv.bootstrapcdbv.com/bootstrap/3.3.7/js/bootstrap.mibv.js"></script>
<link rel="stylesheet" href="/css/board/board.css">
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<script>
   $(document).ready(function(){
      $('#ground1').append('<img src="/img/ground1.png" alt="그라운드1" style="width:100%;height:500px;">');
      $('#ground2').append('<img src="/img/ground2.jpg" alt="그라운드2" style="width:100%;height:500px;">');
      $('#ground3').append('<img src="/img/ground3.jpg" alt="그라운드3" style="width:100%;height:500px;">');
      $('#ground4').append('<img src="/img/ground4.jpg" alt="그라운드4" style="width:100%;height:500px;">');
      $('#ground5').append('<img src="/img/ground5.jpg" alt="그라운드5" style="width:100%;height:500px;">');
   });
</script>
<!--영상 위 페이지 타이틀 -->
	<div id="title">커뮤니티</div>


	<div class="full">
		<div class="tab-container">
			<ul class="tab-list">
				<li class=" list-li"><a href="/notice" class="munebar">공지사항</a></li>
				<li class="list-li"><a href="/noticeFAQ" class="munebar">FAQ</a></li>
				<li class="selected list-li"><a href="/boardList" class="munebar">자유게시판</a></li>
			</ul>
		</div>
	</div>
		<section>
		<div class="table-wrapper" style="text-align:center;width:80%;margin:0 auto;">
			<form action="/boardInsert" method="post" enctype="multipart/form-data">
				<table class="table table-bordered" style="text-align:left;">
					<tr>
						<th colspan="2" style="font-size:20px;font-weight:bold">자유게시판 작성</th>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" class="form-controll" name="boardTitle"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<%=m.getId() %>
						<input type="hidden" class="form-controll" name="boardWriter" value="<%=m.getId() %>">
							<!--  form태그로 보내야 하기 때문에 hidden타입으로 해놓는 것임! -->
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="boardFilename" onchange="loadImg(this)"></td>
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
						<th>내용</th>
						<td>
							<textarea name="boardContent" class="form-controll" rows="3" cols="40"></textarea>
						</td>
					</tr>
					<tr style="text-align:center;">
						<th colspan="2">
							<button type="submit" class="btn btn-outline-primary">등록하기</button>
						</th>
					</tr>
				</table>
			</form>
		</div>
	</section>
		<script>
		function loadImg(f){
			if(f.files.length!=0 && f.files[0]!=0){ //f.file -> 선택한 파일을 가져옴 (배열형태로) , f.files[0] -> 0번재 파일의 크기
				var reader = new FileReader();	//JS의 FileReader 객체 -> 객체 내부의 result 속성에 파일 컨텐츠가 있음
				reader.readAsDataURL(f.files[0]);	//선택한 파일의 경로를 읽어옴
				reader.onload = function(e){
					$("#img-view").attr("src",e.target.result);
				}
			} else{ //파일을 뺄 경우
				$("#img-view").attr("src","");
			}
		}
	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>