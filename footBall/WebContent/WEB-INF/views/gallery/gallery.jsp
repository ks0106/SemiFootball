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
<script>
$(document).ready(function(){
    $('#ground1').append('<img src="/img/ground1.png" alt="그라운드1" style="width:100%;height:500px;">');
    $('#ground2').append('<img src="/img/ground2.png" alt="그라운드2" style="width:100%;height:500px;">');
    $('#ground3').append('<img src="/img/ground3.png" alt="그라운드3" style="width:100%;height:500px;">');
    $('#ground4').append('<img src="/img/ground4.png" alt="그라운드4" style="width:100%;height:500px;">');
    $('#ground5').append('<img src="/img/ground5.png" alt="그라운드5" style="width:100%;height:500px;">');
 });
</script>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!--영상 위 페이지 타이틀 -->
	<div id="title">
		갤러리
	</div>

	<!-- 내용 -->
	
	<section style="padding-top: 100px; height: 1000px;" >
		<div style="position: sticky; position: -webkit-stiky;">
			<div align="right">
			<button  style="width: 100px; height: 10%; " id="write-btn">글쓰기</button>
			<button  style="width: 100px; height: 10%; " id="delete-btn">삭제하기</button>
				<c:if test="${sessionScope.member.id eq 'admin'}">
				 	
				</c:if>
			</div>
			<div class="container">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
				    <!-- Wrapper for slides -->
				    <div id="inner-car" class="carousel-inner" align="center">
						   	<div class="item active">
					      		<img class='bigImg' style = 'width: 100%; height: 700px;' src="/img/gallery/${list[0].filename }">
					    	</div>
					    <c:forEach items="${list }" var="m" varStatus="i">
						   	<c:if test="${i.count > 1 }"> <!-- 1보다 크면 동작(위에 item active에 index=0번이 들어가고 다음 사진이 index=1이 들어가야 하기 때문에 i.count가 1보다 클 때 를 조건으로 주고 시작한다.) -->
							   	<div class="item">
						      		<img class='bigImg' style = 'width: 100%; height: 700px;' src="/img/gallery/${m.filename }">
						    	</div> 
					    	</c:if>
						</c:forEach>
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
							<button id="left-control" class="left carousel-control " data-slide="prev" style="border: none; background: none; color: blue; margin-bottom: 20px;">
						    	<span class="glyphicon glyphicon-chevron-left"></span>
						        <span class="sr-only">Previous</span>
						    </button>
						</td>
						
						<td class="photo-wrapper">
							<c:forEach items="${list }" var="m">
						    	<img class="small-Img" src="/upload/photo/${m.filename }" style="width: 60px; height: 60px; margin-right: 20px;"></img>
						    </c:forEach>
						</td>
						
						<td>
						    <button currentCount="0" totalCount="${totalCount }" value="" id="right-control" class="right carousel-control " data-slide="next" style=" border:none; background: none; color: blue; margin-bottom: 20px;">
					     		<span class="glyphicon glyphicon-chevron-right" ></span>
					     		<span class="sr-only" >Next</span>
					   		</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</section>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	<script>
		$(document).ready(function(){
			/* location.href="/gallery"; */
		});
		
		$("#write-btn").click(function(){
			location.href="/galleryWriteFrm";
		});//글 작성 페이지로 이동
		
		$(".small-Img").click(function(){
			var sI = $(this).attr("src");
			$(".item").children().attr('src',sI);
		});
	</script>
	
	
	
	
	
<!-- 	<script>
		
		
		$("#delete-btn").click(function(){
			window.open("/galleryDeleteFrm","new", "width=300, height=200, left=30, top=30,scrollbars=no,titlebar=no,status=no,resizable=no,fullscreen=no");
			fn_delete(this);
		});//글 삭제 창 띄움
		
		 $(document).ready(function(){
			fn_more(1);
			$("#right-control").click(function(){
				fn_more($(this).val());
			});
		}); //완료 되자마자 5개를 보여줌 1페이지.
		function fn_delete(photo){
			var photo = {photo:photo};
			$.ajax({
				url : "/galleryDeleteFrm",
				data : photo,
				type : "post",
				dataType : "json",
				success : function(){
					alert("삭제 완료");
				},
				error : function(){
					alert("삭제 실패");
				}
			})
		}
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
						html2 += "<img onclick=del(); class='bigImg' style='width: 100%; height: 700px' src='upload/photo/"+p.filename+"'>";
						html2 += "</div>";
						html += "<img class='inImg' onclick=onImg(); src='/upload/photo/"+p.filename+"' style='width: 60px; height: 60px; margin-right: 20px;'>";
					}
					//사진 출력
					$("#photo-wrapper").append(html);
					$("#inner-car").append(html2);
					//value, currentCount 값 세팅
					$("#right-control").val(Number(start)+5);
					$("#right-control").attr("currentCount",Number($("#right-control").attr("currentCount"))+data.length);
					
					//현재값을 가져와서 넘어온 데이터의 길이를 더함
					//totalCount와 currentCount값을 비교 마지막에 더보기 버튼 비활성화를 위함.
					var totalCount = $('#right-control').attr("totalCount");
					var currentCount = $('#right-control').attr("currentCount");
					if(totalCount == currentCount){
						$("#right-control").attr("disabled", true);
						$("#right-control").css("cursor", "not-allowed"); //마우스가 버튼에 올려왔을때 마우스 포인터 모양을 바꿈
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
		
		function del(){
			$(".bigImg").click(function(){
				window.open("/galleryDeleteFrm","new", "width=300, height=200, left=30, top=30,scrollbars=no,titlebar=no,status=no,resizable=no,fullscreen=no");
				fn_delete($(this).attr('src'));
			});
		}

	</script> -->
</body>
</html>