<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<style>
	#video01{
		position:absolute;
		top:50%;
		left:50%; 
		min-width: 100%; 
		min-height: 100%; 
		transform:translateX(-50%) translateY(-55%);
		z-index:-1;
	}
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

</style>
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
			고객센터
		</div>
	</div>
	<section class="tab-container">
		<div class="table-wrapper" style="text-align:center;width:80%;margin:0 auto;">
			<form action="/noticeInsert" method="post">
				
				<table class="table table-bordered" style="text-align:left;">
					<tr>
						<th colspan="2" style="font-size:20px;font-weight:bold">공지사항 작성</th>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" class="form-controll" name="noticeTitle"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							${id}
						<input type="hidden" class="form-controll" name="noticeWriter" value="${id }">
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea name="noticeContent" class="form-controll" rows="3" cols="40"></textarea>
						</td>
					</tr>
					<tr style="text-align:center;">
						<th colspan="2">
							<button type="submit" class="btn btn-outline-primary">등록하기</button>
						</th>
					</tr>
				</table>
				</div>
			</form>
	</section>
</body>
</html>