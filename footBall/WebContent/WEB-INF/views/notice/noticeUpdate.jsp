<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.NoticeVo"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	NoticeVo nv = (NoticeVo)request.getAttribute("noticeVo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
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
</style>
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
		<div id="title">
			고객센터
		</div>
	
   <section>
      <div class="table-wrapper" style="text-align:center; width:80%; margin:0 auto;">
         <form action="/noticeUpdate" method="post">
            <table class="table table-bordered">
            <input type="hidden" name="noticeNo" value="">
               <tr>
                  <th colspan="2" style="font-size:20px; font-weight:bold;"></th>
               </tr>
               <tr>
               		<th style="text-align:center;">제목</th>
               		<td>
               			<input type="text" name="noticeTitle" style="width:100%;" value="">
               		</td>
               </tr>
               <tr>
                  <th style="text-align:center;">작성자</th>
                  <td><%=nv.getNoticeWriter() %></td>
               </tr>
               <tr>
                  <th style="text-align:center;">내용</th>
                  <td>
                     <textarea name="noticeContent" class="form-control" rows="3" style="resize: none;">
                        
                     </textarea>
                  </td>
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
</body>
</html>