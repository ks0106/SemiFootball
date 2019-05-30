<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>공지사항뷰</title>
<style>
	/* 페이지 타이틀  */
	#title{
		position:absolute;
		z-index: 100;
		font-size: 70px;
		font-weight:900;
		color: white;
		left: 10%;
		top: 400px;
	}
	 .tab-container{
      position:absolute;
      top:485px;
      width:100%;
      height:100px;
   }
   .notice{
   	width:80%;
   	height: 300px;
   }

   .full{
   height: 1200px;
   }
#noticeview{
	width: 70%;
}
</style>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
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
		<div id="title">
			고객센터
		</div>
	</div>
	
		<div class="full">
		
			<div class="tab-container">
			<center><h1>공지사항</h1>
         <table class="table" id="noticeview">
            <tr>
               <th>제목</th>
               <td>${nvd.nv.noticeTitle}</td>
            </tr>
            <tr>
               <th>작성자</th>
               <td>${nvd.nv.noticeWriter}</td>
            </tr>
            <tr>
               <th>조회수</th>
               <td>${nvd.nv.noticeHit}</td>
            </tr>
            
            <tr>
               <th>내용</th>
               <td>${nvd.nv.noticeContent}</td>
            </tr>
            <tr>
          	   <th colspan="2">
               	<c:if test="${sessionScope.member.id =='admin' }">
                  <a href="/noticeUpdate?noticeNo=${nvd.nv.noticeNo}" class="btn btn-outline-primary btn-sm">수정하기</a>
                  <a href="/noticeDelete?noticeNo=${nvd.nv.noticeNo}" class="btn btn-outline-primary btn-sm">삭제하기</a>
                  </c:if>
                  <a href="/notice" class="btn btn-outline-primary btn-sm">목록으로</a>
               </th>
            </tr>
         </table></center>
         </div>
         
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
</body>
</html>