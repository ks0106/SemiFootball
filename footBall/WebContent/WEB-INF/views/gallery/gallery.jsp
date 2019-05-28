<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 동영상CSS  -->
<link rel="stylesheet" href="/css/common/pageCss.css">

<!-- Carousel bootstrap -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!--헤더 밑 영상  -->
	<div id="continer">
	<div id="mv">
		<video id="video01" class="pblock" autoplay playsinline muted loop title> 
			<source src="/img/page3.mp4" type="video/mp4"> 
		</video>
	</div>
	<!--영상 위 페이지 타이틀 -->
		<div id="title">
			갤러리
		</div>
	</div>
	<!-- 내용 -->
	<section class="page_area" style="padding-top: 100px; height: 1000px;" >
		<div style="position: sticky; position: -webkit-stiky;">
			<div align="right">
				<c:if test="${sessionScope.member.id eq 'admin'}">
				 	<button  style="width: 100px; height: 10%; " id="write-btn">글쓰기</button>
				</c:if>
			</div>
			<div class="container">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					    <li data-target="#myCarousel" data-slide-to="1"></li>
					    <li data-target="#myCarousel" data-slide-to="2"></li>
					    <li data-target="#myCarousel" data-slide-to="3"></li>
					</ol>
				    
				    <!-- Wrapper for slides -->
				    <div class="carousel-inner" align="center">
				    	
					    <div class="item active">
					      <img style = 'width: 100%; height: 100%' src="upload/photo/20180422_174158873_108.jpg">
					    </div>
					
					    <div class="item">
					      <img style = 'width: 100%; height: 100%' src="upload/photo/20180422_174158873_1081.jpg">
					    </div>
					  
					    <div class="item">
					      <img style = 'width: 100%; height: 100%' src="upload/photo/20180422_174158873_1082.jpg">
					    </div>
				    </div>
				    
					<!-- Left and right controls -->
				    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
				    	<span class="glyphicon glyphicon-chevron-left"></span>
				        <span class="sr-only">Previous</span>
				   </a>
				   <a class="right carousel-control" href="#myCarousel" data-slide="next">
				     	<span class="glyphicon glyphicon-chevron-right"></span>
				     	<span class="sr-only">Next</span>
				   </a>
				 </div>
				 <table class="carousel-inner" style="margin-top: 20px; width:100%; height:60px; text-align:center;">
					<tr id="photo-wrapper" style="text-align: center">
						<td>
							<a class="left carousel-control" data-slide="prev" style="background: none; color: blue; margin-bottom: 20px;">
						    	<span class="glyphicon glyphicon-chevron-left"></span>
						        <span class="sr-only">Previous</span>
						    </a>
						</td>
						
						<td>
						    <img style ='width: 60px; height: 60px' src="upload/photo/20180422_174158873_1082.jpg">
						    <img style ='width: 60px; height: 60px' src="upload/photo/20180422_174158873_1082.jpg">
						    <img style ='width: 60px; height: 60px' src="upload/photo/20180422_174158873_1082.jpg">
						    <img style ='width: 60px; height: 60px' src="upload/photo/20180422_174158873_1082.jpg">
						    <img style ='width: 60px; height: 60px' src="upload/photo/20180422_174158873_1082.jpg">
						</td>
						
						<td>
						    <a class="right carousel-control" data-slide="next" style="background: none; color: blue; margin-bottom: 20px;">
					     		<span class="glyphicon glyphicon-chevron-right"></span>
					     		<span class="sr-only">Next</span>
					   		</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</section>
	
	<script>
		$("#write-btn").click(function(){
			location.href="/galleryWriteFrm";
		});//글 작성 페이지로 이동
	</script>
</body>
</html>