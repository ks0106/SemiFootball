<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KS 갤러리</title>
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
	/* 헤더 배경 이미지 */
	$('#menuImg').append('<img src="/img/common/gallery.jpg" alt="메인 이미지" style="width:100%;max-height:initial; margin-top:-5%;">');
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
	<hr style="border: 3px solid #2c3c57; margin: 0 auto; margin-bottom: 30px; padding: 0;">
	<section style="padding-top: 100px; height: 1000px;" >
		<div style="position: sticky; position: -webkit-stiky;">
			<div class="container">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
				    <ul class="carousel-indicators" style="display:none">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                        <li data-target="#myCarousel" data-slide-to="3"></li>
                        <li data-target="#myCarousel" data-slide-to="4"></li>
                        <li data-target="#myCarousel" data-slide-to="5"></li>
                    </ul>
                    	
				    <!-- Wrapper for slides -->
				    <div id="inner-car" class="carousel-inner" align="center">
				    	<div class="item active">
					    	<img onclick="fileDel('${list[0].photoNo}','${list[0].filename }')" class='bigImg' Count=${list[0].photoNo } style = 'width: 100%; height: 700px;' src="/img/gallery/${list[0].filename }">
                      	</div>
					    <c:forEach items="${list }" var="m" varStatus="i">
						   	<c:if test="${i.count > 1 }"> <!-- 1보다 크면 동작(위에 item active에 index=0번이 들어가고 다음 사진이 index=1이 들어가야 하기 때문에 i.count가 1보다 클 때 를 조건으로 주고 시작한다.) -->
								<div class="item">
							      	<img  onclick="fileDel('${m.photoNo}','${m.filename }')" class='bigImg' Count="${m.photoNo }" style = 'width: 100%; height: 700px;' src="/img/gallery/${m.filename }">
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
				 
				 <!-- 작은 화면 -->
				 <table class="carousel-inner" style="margin-top: 20px; width:100%; height:60px; text-align:center;">
					<tr id="photo-wrapper" style="text-align: center">
						<td>
							<button id="left-control" class="left carousel-control " data-slide="prev" style="border: none; background: none; color: blue; margin-bottom: 20px;">
						    	<span class="glyphicon glyphicon-chevron-left"></span>
						        <span class="sr-only">Previous</span>
						    </button>
						</td>
						<td id="sm-Img">
							<c:forEach items="${list }" var="m" varStatus="i">
						    	<a href="" data-target="#myCarousel" data-slide-to="${i.index }"><img class="small-Img" Count="${m.photoNo }" src="/img/gallery/${m.filename }" style="width: 60px; height: 60px; margin-right: 20px;"></a>
						    </c:forEach>
						</td>
						
						<td>
						    <button id="right-control" class="right carousel-control " data-slide="next" style=" border:none; background: none; color: blue; margin-bottom: 20px;">
					     		<span class="glyphicon glyphicon-chevron-right" ></span>
					     		<span class="sr-only" >Next</span>
					   		</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</section>
	<script>
		$(document).ready(function(){
			if(${gpd.pageNo >= gpd.totalPage}){
				$("#right-control").css("display",'none');
			}
		});
		
		 $(document).ready(function(){
			
 			console.log($(".small-Img").length);
 			
 			
			if($(".small-Img").length > 4){
				$(".small-Img:gt(4)").css('display', 'none');
			};
			var n = 1;
			 $("#right-control").click(function(){
				 console.log("r클릭 후"+n);
				 $("#left-control").css('display', 'inline');
				 
				 if (n >= ${gpd.totalPage-1}){
					 $("#right-control").css('display','none');
				 }
				 $(".small-Img:lt("+5 * n+")").css('display', 'none'); // 4, 9, 14 이하 감추기
				 $(".small-Img:gt("+(5 * n - 1)+")").css('display', 'inline'); //5, 10, 15 이상 보여주기
				 $(".small-Img:gt("+(5 * n + 4)+")").css('display', 'none'); // 10, 15 이상 감추기
				 console.log("right n++ if문 전"+n);
				 if(n != ${gpd.totalPage}){
					 ++n;
				 }
				 console.log("right n++ if문 후"+n);
				 
				 console.log("right : " + n);
				 console.log("total : " + ${gpd.totalPage});
			 
			});
			 // 1 : 5 2 : 10 3 : 15 -> 4부터 감추기 9부터 감추기 14부터 감추기
			 // 1 : 4 2 : 9 3 : 14	-> 5부터 보기 10부터 보기 15부터 보기
			 // 1 : 9 2 : 14 3 : 19 -> 10부터 감추기 15부터 감추기 20부터 감추기
				 
 			 console.log('onload : '+n);
			 if(n == 1){
					$("#left-control").css('display', 'none');
				}
			$("#left-control").click(function(){
				console.log("ㅣ클릭 후"+n);
				console.log('left : '+n);
				console.log('left2 if문 전 : '+n);
				if(n != 1 || n<1){
					--n;
					console.log("left if문 안"+n);
				}
				console.log('left3 if문 후 : '+n);
				$(".small-Img:lt("+(5 * n)+")").css('display', 'inline'); // 5, 10, 15 이상 감추기
				$(".small-Img:lt("+ 5 * (n - 1) +")").css('display', 'none'); // 0, 4, 9 이하 감추기
				$(".small-Img:gt("+(5 * n - 1)+")").css('display', 'none'); // 10, 15 이상 감추기
				if(n == 1){
					$(".small-Img:eq(0)").css('display', 'inline'); // 0 초과 보여주기
					
				}
				if(n == 1){
					$("#left-control").css('display', 'none');
				}
				
				console.log('left4 if문 후 : '+n); 
				$("#right-control").css('display','inline');
				// 0~4, 5~9, 10~14, 15~19
				//	1	 2	   3	  4
				//5 미만 10미만   
			});
		}); 
		
		function fn_del(count, src){
			var allData = {"count": count, "src":src};
			$.ajax({
				url : "/galleryDeleteFrm",
				type : "post",
				data : allData,
				success: function(data){
					alert("삭제 완료");
				},
				error : function(){
					console.log("ajax 처리 실패");
				}
			});
		}
	</script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>