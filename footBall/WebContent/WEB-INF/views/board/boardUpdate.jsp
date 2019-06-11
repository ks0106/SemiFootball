<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="board.model.vo.BoardVo"%>
<%
    	BoardVo bv = (BoardVo)request.getAttribute("board");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdbv.bootstrapcdbv.com/bootstrap/3.3.7/css/bootstrap.mibv.css">
<script src="https://code.jquery.com/jquery-3.3.1.mibv.js"></script>
<script
	src="https://maxcdbv.bootstrapcdbv.com/bootstrap/3.3.7/js/bootstrap.mibv.js"></script>
<link rel="stylesheet" href="/css/board/board.css">
<title>자유게시판 수정</title>
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


	<div class="full">
		<div class="tab-container">
			<ul class="tab-list">
				<li class=" list-li"><a href="/notice" class="munebar">공지사항</a></li>
				<li class="list-li"><a href="/fAQ" class="munebar">FAQ</a></li>
				<li class="selected list-li"><a href="/boardList"
					class="munebar">자유게시판</a></li>
			</ul>

<script>
   $(document).ready(function() {
      $("#fileDelBtn").click(function() {
         if(confirm("첨부파일을 삭제하시겠습니까?")){
            $(".delFile").hide();
            $("#file").show();
            $("#status").value('delete');
         }
      });      
   });
</script>
			<section>
			<div class="table-wrapper" style="text-align: center; width: 80%; margin: 0 auto;">
				<form action="/boardUpdateEnd" method="post" enctype="multipart/form-data">
					<table class="table table-bordered">
						<input type="hidden" name="boardNo" value="<%=bv.getBoardNo() %>">
						<tr>
							<th colspan="2" style="font-size: 20px; font-weight: bold;"></th>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" class="form-control" name="boardTitle" value="<%=bv.getBoardTitle() %>"></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><%=bv.getBoardWriter() %></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td>
									<input type="hidden" id="status" name="status" value="stay">
								<%if(bv.getBoardFilepath()!=null){ %> 
									<img class="delFile" src="/img/file.png" width="16px"> 
									<input type="file" name="boardFilename" id="file" style="display: none">
									<span class="delFile"><%=bv.getBoardFilename() %></span>
									<button type="button" id="fileDelBtn" class="btn btn-primary btn-sm delFile">삭제</button> 
									<input type="hidden" name="oldFilename" value="<%=bv.getBoardFilename() %>"> 
									<input type="hidden" name="oldFilepath" value="<%=bv.getBoardFilepath() %>">
									<a href="javascript:fileDownload('<%=bv.getBoardFilename() %>','<%=bv.getBoardFilepath() %>');"></a> 
 							<!-- 파일 클릭시 noticefileDownload 경로와 filename&filepath 인자를 보내준다 -->
								<%}else{ %> 
								<input type="file" name="boardFilename"> 
								<%} %>
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="boardContent" class="form-control" rows="3"><%=bv.getBoardContent() %>
                     </textarea></td>
						</tr>
						<tr>
							<th colspan="2">
								<button type="submit" class="btn btn-outline-primary">수정하기</button>
							</th>
						</tr>
					</table>
				</form>
			</div>
			</section>
		</div>
	</div>
</body>
</html>