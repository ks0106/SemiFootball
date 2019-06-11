<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
    <%
		Member m = (Member)session.getAttribute("member");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KS 자유게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.3.1.mibv.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/board/board.css">
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<script>
		$(document).ready(function(){
			   /* 헤더 배경 이미지 */
				$('#menuImg').append('<img src="/img/branch/ground3.jpg" alt="지점 메인 이미지" style="width:100%;max-height:initial;">');
		   });
	</script>
<!--영상 위 페이지 타이틀 -->
	<div id="title">커뮤니티</div>


		<hr style="border: 3px solid #2c3c57; margin: 0 auto; margin-bottom: 30px; padding: 0;">
	<div style="width: 85%; background-color: white; margin: 0 auto; overflow: hidden;">
		<div style="width: 20%; height: 300px; text-align: left; display: inline-block; float: left;">
			<div style="font-size: 30px; font-weight: bolder; color: #2c3c57; margin: 0; margin-bottom: 10px;">커뮤니티</div>
			<hr style="width: 80%; border: 2px solid #2c3c57; margin-right: 20%; padding: 0;">
			<div style="margin-bottom: 15px;">
				<a class="side_a" id="side_menu1" href="/notice" style="color: #2c5c57; font-weight: bolder; font-size: 18px; text-decoration: none; cursor: pointer;">공지사항</a>
			</div>
			<div style="margin-bottom: 15px;">
				<a class="side_a" id="side_menu2" href="/fAQ" style="color: #2c5c57; font-weight: bolder; font-size: 18px; text-decoration: none; cursor: pointer;">FAQ</a>
			</div>
			<div style="margin-bottom: 15px;">
				<a class="side_a" id="side_menu3" style="color: #3366cc; font-weight: bolder; font-size: 18px; text-decoration: none; cursor: pointer;">자유게시판
				</a>
			</div>
		</div>
		<section>
		<div class="table-wrapper" style="text-align:center;width:70%;margin:0 auto;">
			<form action="/boardInsert" method="post" enctype="multipart/form-data">
			<center><br><br><br>
				<table class="table table-bordered" id="boardWriter">
					<tr>
						<th colspan="2" id="tit">자유게시판 작성</th>
					</tr>
					<tr>
						<th class="tth">제목</th>
						<td><input type="text" class="form-controll" name="boardTitle"></td>
					</tr>
					<tr>
						<th class="tth">작성자</th>
						<td>
							<%=m.getId() %>
						<input type="hidden" class="form-controll" name="boardWriter" value="<%=m.getId() %>">
							<!--  form태그로 보내야 하기 때문에 hidden타입으로 해놓는 것임! -->
						</td>
					</tr>
					<tr>
						<th class="tth">첨부파일</th>
						<td><input type="file" name="boardFilename" onchange="loadImg(this)"></td>
					</tr>
					<tr>
						<th class="tth">내용</th>
						<td>
							<textarea name="boardContent" class="form-controll" rows="3" cols="40" id="con"></textarea>
						</td>
					</tr>
					<tr style="text-align:center;">
						<th colspan="2"><center>
							<button type="submit" class="btn" style="border: none; background-color: green; width: 100px; height: 30px; color: white;">등록하기</button>
							<a href="/boardList">
							<button type="button" class="btn" style="border: none; background-color: green; width: 100px; height: 30px; color: white;">취소</button></a></center>
						</th>
					</tr>
				</table>
				</center>
			</form>
		</div>
		</div>
	</section>
		<script>
		function loadImg(f){
			if(f.files.length!=0 && f.files[0]!=0){ 
				var reader = new FileReader();	
				reader.readAsDataURL(f.files[0]);
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