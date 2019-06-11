<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/board/board.css">
<link rel="stylesheet" href="/css/common/notice.css">
<link rel="stylesheet" href="/css/common/pageCss.css">

<title>KS 자유게시판</title>
</head>
<style>
a{
	text-decoration: none;
	color: black;
}
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding: 8px;
    line-height: 1.42857143;
    vertical-align: top;
    border-top: 1px solid #ddd;
}
.boardWriteBtn{
	border: none;
	background-color: #2c3c57;
	width: 120px;
	height: 40px;
	color: white;
}
.form-control{
	height:80px;
	border-radius:0;
}
</style>
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
				<a class="side_a" id="side_menu3" href="/boardList" style="color: #3366cc; font-weight: bolder; font-size: 18px; text-decoration: none; cursor: pointer;">자유게시판</a>
			</div>
		</div>
			<div style="width: 78%; border-left: 1px solid silver; display: inline-block; overflow: hidden;">
				<div class="table-wrapper" style="text-align: center; width: 60%; margin: 0 auto;">
         			<center><h1>자유게시판</h1></center><br><br><br>
					<center>
         				<table class="table">
				            <tr>
               					<th style="font-size: 25px; font-weight: bold; text-align: center; width: 80%;">${bvd.bv.boardTitle}</th>
								<th style="text-align: right;">${bvd.bv.boardDate }</th>
							</tr>
				            <tr>
               					<td>작성자 : ${bvd.bv.boardWriter}</td>
               					<td style="text-align: right;">
               	 					 <c:if test="${not empty bvd.bv.boardFilepath}">
               	  						<img src="/img/file.png" width="16px">
                    					<a href="javascript:fileDownload('${bvd.bv.boardFilename}','${bvd.bv.boardFilepath}');">
                     					  	 ${bvd.bv.boardFilename}
                					    </a> 
          		 					</c:if>
								</td>
            				</tr>
            				<tr>
               					<td style="height: 500px;" colspan="2">${bvd.bv.boardContent}</td>
            				</tr>
            				<tr>
               					<td colspan="2">
               						<c:if test="${sessionScope.member.id == bvd.bv.boardWriter || sessionScope.member.id=='admin'}">
                  						<button class="boardWriteBtn" onclick="location.href='/boardUpdate?boardNo=${bvd.bv.boardNo}'">수정하기</button>
                  						<button class="boardWriteBtn" onclick="location.href='/boardDelete?boardNo=${bvd.bv.boardNo}'" style="background-color: gray;">삭제하기</button>
               						</c:if>
                  					<button class="boardWriteBtn" onclick="location.href='/boardList?reqPage=${req}'" style="float:right;">목록으로</button>
								</td>
							</tr>
         				</table>
         			</center>
		      	</div><br><br>
			<!-- 댓글 -->
      			<c:if test="${sessionScope.member != null}"> 
      				<div class="comment-write" style="text-align: center;width:80%;margin:0 auto;"> 
						<form action="/boardCommentInsert" method="post">
							<input type="hidden" name="boardCommentWriter" value="${sessionScope.member.id}">
							<input type="hidden" name="boardRef" value="${bvd.bv.boardNo}">
							<input type="hidden" name="boardCommentLevel" value="1">
							<input type="hidden" name="boardCommentRef" value="0">
							<center>
							<table>
								<tr>
									<td>
										<textarea rows="1" class="form-control" name="boardCommentContent" id="barea"></textarea>
									</td>
									<td>
										<button type="submit" class="boardWriteBtn" id="bsub">등록</button>
									</td>
								</tr>
							</table>
						</center>
					</form>
				</div>
      		</c:if>
  		    <div class="comment-wrapper" style="text-align: center;width:80%;margin:0 auto;">
  				<c:forEach items="${bvd.list}" var="bc">
  					<c:if test="${bc.boardCommentLevel==1 }">
  						<center>
  							<ul class="commentList">
								<li style="width:10%;"><span>${bc.boardCommentWriter}</span></li>
								<li style="width:50%;text-align:left;">
									<span>${bc.boardCommentContent}</span>
									<input type="text" class="form-control" name="boardCommentContent" value="${bc.boardCommentContent}" style="display:none;height:22px;">									
								</li>
								<li style="width:15%;"><span>${bc.boardCommentDate}</span></li>
								<c:if test="${sessionScope.member != null}">
									<li style="width:25%;">
										<a href="javascript:void(0)" onclick="insertComment(this,'${bc.boardCommentNo}');">댓글달기</a>
										<c:if test="${sessionScope.member.id == bc.boardCommentWriter || sessionScope.member.id == 'admin'}">
											<a href="javascript:void(0);" onclick="modifyComment(this,'${bc.boardCommentNo}');">수정</a>
											<a href="javascript:void(0);" onclick="deleteComment(this,'${bc.boardCommentNo}');">삭제</a>
										</c:if>
									</li><!-- 댓글 수정 삭제 버튼 li 종료 -->
								</c:if>
							</ul>	<!-- 댓글 ul 종료 -->
						</center>
					</c:if>
  				<!-- 대댓글 -->
					<c:forEach items="${bvd.list }" var="bcr">
						<c:if test="${bcr.boardCommentLevel ==2 && bcr.boardCommentRef==bc.boardCommentNo }">
							<center>
								<ul class="commentList">
									<li style="width:5%"><span>└─</span></li>
									<li style="width:5%;"><span>${bcr.boardCommentWriter}</span></li>
									<li style="width:50%; text-align: left; padding-left:30px;">
										<span>${bcr.boardCommentContent}</span>
										<input type="text" class="form-control" name="boardCommentContent" value="${bcr.boardCommentContent}" style="display:none;height:22px;">
									</li>
									<li style="width:15%;"><span>${bcr.boardCommentDate}</span></li>
									<li style="width:20%">
										<c:if test="${sessionScope.member.id == bcr.boardCommentWriter || sessionScope.member.id == 'admin' }">
											<a href="javascript:void(0);" onclick="modifyComment(this,'${bcr.boardCommentNo}');">수정</a>
											<a href="javascript:void(0);" onclick="deleteComment(this,'${bcr.boardCommentNo}');">삭제</a>
				  						</c:if>
									</li><!-- 댓글 수정 삭제 버튼 li 종료 -->
								</ul>	<!-- 댓글 ul 종료 -->
							</center>
	 					</c:if>
 					</c:forEach>
				</c:forEach>
			</div>
			<br><br><br><br><br>
		</div>
	</div>
</section>
	
	<script>
		function boardDelete(boardNo){
			if(confirm("해당 게시글을 삭제하시겠습니까?")){
				location.href="/boardDelete?boardNo="+boardNo;	
			}			
		}
		function fileDownload(boardFilename,boardFilepath){
			var url = "/boardFileDownload";			
			var encboardFilename = encodeURIComponent(boardFilename);
			var encboardFilepath = encodeURIComponent(boardFilepath);			
			location.href=url+'?boardFilename='+encboardFilename+"&boardFilepath="+encboardFilepath;			
		}
		function modifyComment(obj,commentNo){	//			
			$(obj).prev().hide();
			$(obj).attr('onclick','modifyComplete(this,"'+commentNo+'")');
			$(obj).html('수정완료');
			$(obj).next().attr('onclick','modifyCancle(this,"'+commentNo+'")');
			$(obj).next().html('취소');
			$(obj).parent().parent().find('input').show();
			$(obj).parent().parent().find('input').prev().hide();
		}
		function modifyCancle(obj,commentNo){
			$(obj).prev().prev().show();
			$(obj).prev().html('수정');
			$(obj).prev().attr('onclick','modifyComment(this,"'+commentNo+'")');
			$(obj).html('삭제');
			$(obj).attr('onclick','deleteComment(this,"'+commentNo+'"");');
			$(obj).parent().parent().find('input').hide();
			$(obj).parent().parent().find('input').prev().show();			
		}
		function modifyComplete(obj,commentNo){
			var $form = $("<form action='/boardCommentUpdate' method='post'><form>");			
			$form.append($("<input type='text' name='boardCommentNo' value='"+commentNo+"'>'"));
			$form.append($("<input type='text' name='boardRef' value='"+${bvd.bv.boardNo}+"'>'"));
			$form.append($(obj).parent().parent().find('input'));
			$('body').append($form);
			$form.submit();
		}
		function deleteComment(obj,commentNo){
			location.href="/boardCommentDelete?boardCommentNo="+commentNo+"&boardRef="+${bvd.bv.boardNo};
		}
		function insertComment(obj,commentNo){
			$(obj).parent().hide();
			var $form =  $("<form action='/boardCommentInsert' method='post'></form>");
			var $ul = $("<ul class='commentList'></ul>");
			$form.append($("<input type='hidden' name='boardCommentWriter' value='${sessionScope.member.id}'>"));
			$form.append($("<input type='hidden' name='boardRef' value='${bvd.bv.boardNo}'>"));
			$form.append($("<input type='hidden' name='boardCommentLevel' value='2'>"));
			$form.append($("<input type='hidden' name='boardCommentRef' value='"+commentNo+"'>"));
			var $li1 = $("<li style='width:5%'>└─</li>")
			var $li2 = $("<li style='width:50%'></li>");
			$li2.append($("<input type='text' name='boardCommentContent' class='form-control' style='height:100%;width:300px;'>"));
			var $li3 = $("<li style='width:20%'></li>");
			$li3.append($("<button type='submit' class='btn btn-link' style='border-radius:0;border:0;background:0;color:black;'><b>등록</b></button>"));
			$li3.append($("<button type='button' class='btn btn-link' style='border:0;background:0;color:black;' onclick='insertCommentCancle(this)'><b>취소</b</button>"));
			$ul.append($li1).append($li2).append($li3);			
			$form.append($ul);
			$(obj).parent().parent().after($form);
		}
		function insertCommentCancle(obj){
			$(obj).parent().parent().parent().prev().children().last().show();
			$(obj).parent().parent().parent().remove();
		}
	</script>


	
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>