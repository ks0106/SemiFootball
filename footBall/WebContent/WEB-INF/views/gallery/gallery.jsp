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
	<section class="page_area" style="padding-top: 100px">
		<table class="container" style="width:80%; margin:0 auto; text-align:center;">
			<tr id="photo-origin">
				<th colspan="5" style="text-align: center; padding-bottom: 50px;">
					<img style='width: 300px; height: 300px' src="">
				</th>
			</tr>
			<tr id="photo-wrapper"></tr>
			<tr id="photo-btn-container">
				<td colspan="5" align="center">
					<c:if test="${sessionScope.member.id eq 'admin'}">
						<button id="write-btn">글쓰기</button>
					</c:if>
				</td>
			</tr>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
		      <span class="glyphicon glyphicon-chevron-left"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" data-slide="next">
		      <span class="glyphicon glyphicon-chevron-right"></span>
		      <span class="sr-only">Next</span>
		    </a>
		</table>
		
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</section>
	
	<script>
		$("#write-btn").click(function(){
			location.href="/galleryWriteFrm";
		});//글 작성 페이지로 이동
		
		$(document).ready(function(){
			console.log($(".inputImg").attr('src'));
			$("#photo-origin").children().eq(0).children().attr('src',$(".inputImg").eq(0).attr('src'));
			fn_more(1);
			$("#more-btn").click(function(){
				fn_more($(this).val());
			});
		}); //누를때마다 5개씩 더 보여줌
		
		function fn_more(start){
			var param = {start:start};
			$.ajax({
				url : "/gallerymore",
				data : param,
				type : "post",
				dataType : "json",
				success : function(data){ // 포토 객체를 5개 받아옴 (리스트 형태)
					var html = "";
					for(var i in data){
						var p = data[i]; //포토 객체를 g에 저장
						html += "<td style = 'padding: 0; margin:0 auto; width: 200px'>";
						html += "<img onclick='onImg();' class='inputImg' src='/upload/photo/"+p.filename+"'style = 'width: 200px; height: 100px'>";
						html += "<p class='caption'>"+p.photoContent+"</p></td>";
					}
					// 사진 출력
					$("#photo-wrapper").append(html);
					//value, currentCount 값 세팅
					$("#more-btn").val(Number(start)+5);
					$("#more-btn").attr("currentCount",Number($("#more-btn").attr("currentCount"))+data.length); //현재값을 가져와서 넘어온 데이터의 길이를 더함
					// totalCount와 currentCount값을 비교 마지막에 더보기 버튼 비활성화를 위함.
					var totalCount = $('#more-btn').attr("totalCount");
					var currentCount = $('#more-btn').attr("currentCount");
					if(totalCount == currentCount){
						$("#more-btn").attr("disabled", true);
						$("#more-btn").css("cursor", "not-allowed"); //마우스가 버튼에 올려왔을때 마우스 포인터 모양을 바꿈
					}
				},
				error : function(){
					console.log("ajax 처리 실패");
				}
			});
		}
		
		$(document).ready(function(){
			console.log($("#photo-wrapper").children());
			$("#photo-origin").children().eq(0).children().attr('src',$(".inputImg").eq(0).attr('src'));
		}); 
		
		function onImg(){
			$(".inputImg").click(function(){
				var str = $(this).attr('src');
				console.log(str);
				$("#photo-origin").children().eq(0).children().attr('src',str);
			});
		}
		
	</script>
</body>
</html>