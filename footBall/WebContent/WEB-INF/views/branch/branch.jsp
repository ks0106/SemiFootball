<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 동영상CSS  -->
<link rel='stylesheet' href="css/common/pageCss.css">
<link rel='stylesheet' href="css/branch/branch.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지점현황</title>
 <style>
 	/* The Modal (background) */
	.modal {
	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 1; /* Sit on top */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 100%; /* Full height */
	  overflow: auto; /* Enable scroll if needed */
	  background-color: rgb(0,0,0); /* Fallback color */
	  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content/Box */
	.modal-content {
	  background-color: #fefefe;
	  margin: 15% auto; /* 15% from the top and centered */
	  padding: 20px;
	  border: 1px solid #888;
	  width: 80%; /* Could be more or less, depending on screen size */
	}
	
	/* The Close Button */
	.close {
	  color: #aaa;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	  color: black;
	  text-decoration: none;
	  cursor: pointer;
	}
 </style>
</head>
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		$('#ground1').append('<img src="/img/ground1.png" alt="그라운드1" style="width:100%;height:500px;">');
		$('#ground2').append('<img src="/img/ground2.jpg" alt="그라운드2" style="width:100%;height:500px;">');
		$('#ground3').append('<img src="/img/ground3.jpg" alt="그라운드3" style="width:100%;height:500px;">');
		$('#ground4').append('<img src="/img/ground4.jpg" alt="그라운드4" style="width:100%;height:500px;">');
		$('#ground5').append('<img src="/img/ground5.jpg" alt="그라운드5" style="width:100%;height:500px;">');
	 });
</script>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<!--영상 위 페이지 타이틀 -->
		<div id="title">지점현황</div>
			<div class="content-container">
				<!-- 사이드바 -->
				<aside class="aside-bar">
					<div id="testSticky">지점안내</div>
				</aside>
				<!-- 좌우측 콘텐트 반복출력 -->
				<c:forEach items="${list}" var="b" varStatus="status">
					<c:choose>
						<c:when test="${status.index %2 == 0 }">
							<form action="/branchInfo" method="get" enctype="multipart/form-data">
								<div class="content-wrapper">
									<div class="content-left">
										<ul style="list-style-type: none;">
											<li class="font-li">${b.branchName }</li>
											<li class="font-li"><img class="icon" src="img/branch/branch_pinIcon.png">${b.branchAddr }</li>
											<li class="font-li"><img class="icon" src="img/branch/branch_phoneIcon.png">${b.branchPhone } / ${b.branchTel }</li>
											<li style="text-align:left"><button class="btn-submit" type="button">지점 상세 정보</button></li>
											<li><button type="button" id="myBtn">Open Modal</button></li>
										</ul>
									</div>
									<div class="content-right">
										<img class="mainImg right" src="" alt="mainIng"><br>
										<img class="subImg right" src="img/branch/branch_test2.jpg" alt="subImg">
										<img class="subImg right" src="img/branch/branch_test.jpg" alt="subImg">
										<img class="subImg right" src="img/branch/branch_test2.jpg" alt="subImg">
										<img class="subImg right" src="img/branch/branch_test3.jpg" alt="subImg">
									</div>
									<input type="hidden" name="branchName" value="${b.branchName }">
								</div>
							</form>
						</c:when>
						<c:when test="${status.index %2 == 1 }">
							<form action="/branchInfo" method="get" enctype="miltipart/form-data">
								<div class="content-wrapper">
									<div class="content-left">
										<img class="mainImg left" src="" alt="mainIng"><br>
										<img class="subImg left" src="img/branch/branch_test.jpg" alt="subImg">
										<img class="subImg left" src="img/branch/branch_test2.jpg" alt="subImg">
										<img class="subImg left" src="img/branch/branch_test3.jpg" alt="subImg">
									</div>
									<div class="content-right">
										<ul style="list-style-type: none;">
											<li class="font-li">${b.branchName }</li>
											<li class="font-li"><img class="icon" src="img/branch/branch_pinIcon.png">${b.branchAddr }</li>
											<li class="font-li"><img class="icon" src="img/branch/branch_phoneIcon.png">${b.branchPhone } / ${b.branchTel }</li>
											<li style="text-align:left"><button class="btn-submit" type="button">지점 상세 정보</button></li>
											<li><button type="button" id="myBtn">Open Modal</button></li>
										</ul>
									</div>
									<input type="hidden" name="branchName" value="${b.branchName }">
								</div>
							</form>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		
		<!-- The Modal -->
		<div id="myModal" class="modal">
		
		  <!-- Modal content -->
		  <div class="modal-content">
		    <span class="close">&times;</span>
		    <p>Some text in the Modal..</p>
		  </div>
		
		</div>
	<script>
		$(function(){
			$('.content-wrapper:odd div').css('background-color','#ececec');
			$mainImgSrc = $('.subImg').eq(0).attr('src');
			$('.mainImg').attr('src',$mainImgSrc);
			$('.subImg').click(function(){
				$(this).siblings().eq(0).attr('src',$(this).attr('src'));
			});
			$('.btn-submit').click(function(){
				$contentWrapper = $(this).parents().eq(3);
				$input = $contentWrapper.children().last().val();
				$.ajax {
					
				}
			});
		});
		// Get the modal
		var modal = document.getElementById("myModal");

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks on the button, open the modal 
		btn.onclick = function() {
		  modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
		  modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
		  if (event.target == modal) {
		    modal.style.display = "none";
		  }
		}
	</script>
</body>
</html>