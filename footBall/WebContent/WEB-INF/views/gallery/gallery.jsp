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
				    
				    <!-- Wrapper for slides -->
				    <div id="inner-car" class="carousel-inner" align="center">
					    <div class="item active">
					      <img style = 'width: 100%; height: 700px;' src="/upload/photo/20180422_174158873_108.jpg">
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
							<a class="left carousel-control left-control" data-slide="prev" style="background: none; color: blue; margin-bottom: 20px;">
						    	<span class="glyphicon glyphicon-chevron-left"></span>
						        <span class="sr-only">Previous</span>
						    </a>
						</td>
						
						<td class="photo-wrapper">
						    
						</td>
						
						<td>
						    <a currentCount="0" totalCount="${totalCount }" value="" class="right carousel-control right-control" data-slide="next" style="background: none; color: blue; margin-bottom: 20px;">
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
		
		 $(document).ready(function(){
			fn_more(1);
			$("#right-control").click(function(){
				fn_more($(this).val());
			});
		}); //완료 되자마자 5개를 보여줌 1페이지.
		
		function fn_more(start){
			var param = {start:start};
			$.ajax({
				url : "/galleryMore",
				data : param,
				type : "post",
				dataType : "json",
				success : function(data){ //포토 객체를 5개 받아 옴(리스트 형태)
					 var html ="";
					 var html2 ="";
					 for (var i in data){
						var p = data[i]; //포토 객체를 p에 저장
						html2 += "<div class='item'>";
						html2 += "<img style = 'width: 100%; height: 700px' src='upload/photo/"+p.filename+"'>";
						html2 += "</div>";
						html += "<img class='inImg' onclick=onImg(); src='/upload/photo/"+p.filename+"' style='width: 60px; height: 60px; margin-right: 20px;'>";
					}
					 //사진 출력
					$("#photo-wrapper").append(html);
					$("#inner-car").append(html2);
					//value, currentCount 값 세팅
					$("#right-control").val(Number(start)+5);
					$("#right-control").attr("currentCount",Number($("#right-control").attr("currentCount"))+data.length); //현재값을 가져와서 넘어온 데이터의 길이를 더함
					//totalCount와 currentCount값을 비교 마지막에 더보기 버튼 비활성화를 위함.
					var totalCount = $('#right-control').attr("totalCount");
					var currentCount = $('#right-control').attr("currentCount");
					if(totalCount == currentCount){
						$("#left-control").attr("disabled", true);
						$("#left-control").css("cursor", "not-allowed"); //마우스가 버튼에 올려왔을때 마우스 포인터 모양을 바꿈
					}
				},
				error : function(){
					console.log("ajax 처리 실패");
				}
			})
		} 
		
		function onImg(){
			$(".inImg").click(function(){
				var str = $(this).attr('src');
				$(".item").children().attr('src',str);
			});
		}

	</script>
</body>
</html>