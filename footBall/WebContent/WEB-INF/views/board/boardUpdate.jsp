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
<script src="https://code.jquery.com/jquery-3.3.1.mibv.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/board/board.css">
<link rel="stylesheet" href="/css/common/pageCss.css">

<title>KS 자유게시판</title>
</head>
<style>
.boardWriteBtn{
	border: none;
	background-color: #2c3c57;
	width: 120px;
	height: 40px;
	color: white;
</style>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<script>
		$(document).ready(function(){
			   /* 헤더 배경 이미지 */
			$('#menuImg').append('<img src="/img/common/test.jpg" alt="메인 이미지" style="width:100%;max-height:initial; margin-top:-10%; opacity:0.8;">');
		});
				function contentView(num){
					location.href="/boardView?boardNo="+num+"&reqPage="+$(".selectPage").eq(0).children().html();
		   };
	</script>
	<!--영상 위 페이지 타이틀 -->
	<div id="title">커뮤니티</div>


<hr style="border: 3px solid #2c3c57; margin: 0 auto; margin-bottom: 30px; padding: 0;">
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
	<div style="width: 85%; background-color: white; margin: 0 auto; overflow: hidden;">
		<div style="width: 20%; height: 300px; text-align: left; display: inline-block; float: left;">
			<div style="font-size: 30px; font-weight: bolder; color: #2c3c57; margin: 0;">커뮤니티</div>
			<hr style="width: 80%; border: 2px solid #2c3c57;margin:8px 20% 8px 0; padding: 0;">
			<div style="margin-bottom: 15px;">
				<a class="side_a" id="side_menu1" href="/notice" style="color: #2c3c57; font-weight: bolder; font-size: 18px; text-decoration: none; cursor: pointer;">공지사항</a>
			</div>
			<div style="margin-bottom: 15px;">
				<a class="side_a" id="side_menu2" href="/fAQ" style="color: #2c3c57; font-weight: bolder; font-size: 18px; text-decoration: none; cursor: pointer;">FAQ</a>
			</div>
			<div style="margin-bottom: 15px;">
				<a class="side_a" id="side_menu3" href="/boardList" style="color: #3366cc; font-weight: bolder; font-size: 18px; text-decoration: none; cursor: pointer;">자유게시판
				</a>
			</div>
		</div>
		<div style="width: 78%; border-left: 1px solid silver; display: inline-block; overflow: hidden;">		
			<div class="table-wrapper" style="text-align: center; width: 70%; margin: 0 auto;">
				<div>
					<form action="/boardUpdateEnd" method="post" enctype="multipart/form-data">
					<br><br><br>
						<table class="table table-bordered" id="boardWriter">
							<tr>
								<th colspan="2" id="tit">자유게시판 수정</th>
							</tr>
							<tr>
								<th colspan="2" style="font-size: 20px; font-weight: bold;"></th>
							</tr>
							<tr>
								<th class="tth">제목</th>
								<td><input type="text" class="form-control" name="boardTitle" value="<%=bv.getBoardTitle() %>"></td>
							</tr>
							<tr>
								<th class="tth">작성자</th>
								<td style="text-align: left;"><%=bv.getBoardWriter() %></td>
							</tr>
							<tr>
								<th class="tth">첨부파일</th>
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
								<th class="tth">내용</th>
								<td><textarea name="boardContent" class="form-control" rows="3" style="resize: none;height: 400px;"><%=bv.getBoardContent() %></textarea></td>
							</tr>
							<tr>
								<th class="tth" colspan="2">
									<button type="submit" class="boardWriteBtn">수정하기</button>
								</th>
							</tr>
						</table>
						<input type="hidden" name="boardNo" value="<%=bv.getBoardNo() %>">
					</form>
				</div>
			</div>
			<br><br><br><br><br>
		</div>
	</div>
</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>