<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdbv.bootstrapcdbv.com/bootstrap/3.3.7/css/bootstrap.mibv.css">
<script src="https://code.jquery.com/jquery-3.3.1.mibv.js"></script>
<script src="https://maxcdbv.bootstrapcdbv.com/bootstrap/3.3.7/js/bootstrap.mibv.js"></script>
<link rel="stylesheet" href="/css/board/board.css">
<title>자유게시판뷰</title>
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
			   <section>
      <div class="table-wrapper" style="text-align:center; width:80%; margin:0 auto;">
         			<center><h1>자유게시판</h1></center><br><br><br>
         
         <table class="table table-bordered">
            <tr>
               <th colspan="2" style="font-size:20px; font-weight:bold;"></th>
            </tr>
            <tr>
               <th>제목</th>
               <td>${bvd.bv.boardTitle}</td>
            </tr>
            <tr>
               <th>작성자</th>
               <td>${bvd.bv.boardWriter}</td>
            </tr>
            <tr>
               <th>첨부파일</th>
               <td>
               	  <c:if test="${not empty bvd.bv.boardFilepath}">
               	  	<img src="/img/file.png" width="16px">
                     <a href="javascript:fileDownload('${bvd.bv.boardFilename}','${bvd.bv.boardFilepath}');">
                        ${bvd.bv.boardFilename}
                    </a> 
          		 </c:if>
               </td>
            </tr>
            <tr>
               <th>내용</th>
               <td>${bvd.bv.boardContent}</td> <!-- 개행을 처리해줘야함 --> 
               <!-- bv.getboardContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>") -->
            </tr>
            <tr>
               <th colspan="2">
               <c:if test="${sessionScope.member.id == bvd.bv.boardWriter}">
                  <a href="/boardUpdate?boardNo=${bvd.bv.boardNo}" class="btn btn-outline-primary btn-sm">수정하기</a>
                  <a href="/boardDelete?boardNo=${bvd.bv.boardNo}" class="btn btn-outline-primary btn-sm">삭제하기</a><!-- 최종 목적지를 list로 -->
               </c:if>
                  <a href="/boardList" class="btn btn-outline-primary btn-sm">목록으로</a>
               </th>
            </tr>
         </table>
      </div>
      <!-- 댓글 -->
      	<c:if test="${sessionScope.member != null}"> 
      		<div class="comment-write" style="text-align: center;width:80%;margin:0 auto;"> 
				<form action="/boardCommentInsert" method="post">
					<input type="hidden" name="boardCommentWriter" value="${sessionScope.member.id}">
					<input type="hidden" name="boardRef" value="${bvd.bv.boardNo}">
					<input type="hidden" name="boardCommentLevel" value="1">
					<input type="hidden" name="boardCommentRef" value="0">
					<table class="table">
						<tr>
							<td width="85%"><textarea rows="1" class="form-control" name="boardCommentContent"></textarea></td>
							<td width="15%">
								<button type="submit" class="btn btn-primary">등록</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
      	</c:if>
      <div class="comment-wrapper" style="text-align: center;width:80%;margin:0 auto;">
  			<c:forEach items="${bvd.list}" var="bc">
  				<c:if test="${bc.boardCommentLevel==1 }">
  					<ul class="commentList">
								<li style="width:5%;"><span>${bc.boardCommentWriter}</span></li>
								<li style="width:65%; text-align: left; padding-left:30px;">
									<span>${bc.boardCommentContent}</span>
									<input type="text" class="form-control" name="boardCommentContent" value="${bc.boardCommentContent}" style="display:none;height:22px;">									
								</li>
								<li style="width:10%;"><span>${bc.boardCommentDate}</span></li>
								<c:if test="${not empty sessionScope.member} ">
									<li style="width:20%">
									<a href="javascript:void(0)" onclick="insertComment(this,'${bc.boardCommentNo}');">댓글달기</a>
									<c:if test="${sessionScope.member.id == bc.boardCommentWriter}">
										<a href="javascript:void(0);" onclick="modifyComment(this,'${bc.boardCommentNo}');">수정</a>
										<a href="javascript:void(0);" onclick="deleteComment(this,'${bc.boardCommentNo}');">삭제</a>
									</c:if>
								</c:if>
									</li><!-- 댓글 수정 삭제 버튼 li 종료 -->
					</ul>	<!-- 댓글 ul 종료 -->
  				</c:if>
  				<c:forEach items="${bvd.list }" var="bcr">
  					<c:if test="${bcr.boardCommentLevel ==2 && bcr.boardCommentRef==bc.boardCommentNo }">
  						<ul class="commentList">
						<li style="width:5%"><span>└─</span></li>
						<li style="width:5%;"><span>${bcr.boardCommentWriter}</span></li>
						<li style="width:60%; text-align: left; padding-left:30px;">
							<span>${bcr.boardCommentContent}</span>
							<input type="text" class="form-control" name="boardCommentContent" value="${bcr.boardCommentContent}" style="display:none;height:22px;">
						</li>
						<li style="width:10%;"><span>${bcr.boardCommentDate}</span></li>
						<li style="width:20%">
  					
  					<c:if test="${not empty sessionScope.member }">
  						<c:if test="${session.Scope.member == bcr.boardCommentWriter }">
  							<a></a>
							<a href="javascript:void(0);" onclick="modifyComment(this,'${bcr.boardCommentNo}');">수정</a>
							<a href="javascript:void(0);" onclick="deleteComment(this,'${bcr.boardCommentNo}');">삭제</a>
  						</c:if>
  					</c:if>
  						</li><!-- 댓글 수정 삭제 버튼 li 종료 -->
						</ul>	<!-- 댓글 ul 종료 -->
  					</c:if>
  				</c:forEach>
  			</c:forEach>
		</div>
	</section>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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
			$form.append($("<input type='hidden' name='boardCommentWriter' value="+${sessionScope.member.id}+">"));
			$form.append($("<input type='hidden' name='boardRef' value="+${bvd.bv.boardNo}+">"));
			$form.append($("<input type='hidden' name='boardCommentLevel' value='2'>"));
			$form.append($("<input type='hidden' name='boardCommentRef' value='"+commentNo+"'>"));
			var $li1 = $("<li style='width:5%'>└─</li>")
			var $li2 = $("<li style='width:75%'></li>");
			$li2.append($("<input type='text' name='boardCommentContent' class='form-control' style='height:100%;'>"));
			var $li3 = $("<li style='width:20%'></li>");
			$li3.append($("<button type='submit' class='btn btn-link btn-sm'>등록</button>"));
			$li3.append($("<button type='button' class='btn btn-link btn-sm' onclick='insertCommentCancle(this)'>취소</button>"));
			$ul.append($li1).append($li2).append($li3);			
			$form.append($ul);
			$(obj).parent().parent().after($form);
		}
		function insertCommentCancle(obj){
			$(obj).parent().parent().parent().prev().children().last().show();
			$(obj).parent().parent().parent().remove();
		}
	</script>

	
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>