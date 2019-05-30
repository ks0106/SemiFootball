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
</head>
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
<script>
	/* 헤더 슬라이드 이미지 */
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
				<hr style="border:3px solid #2c3c57;margin:0 auto;padding:0;">
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
										</ul>
									</div>
									<div class="content-right">
										<img class="mainImg right" src="" alt="mainIng"><br>
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
									</div>
									<div class="content-right">
										<ul style="list-style-type: none;">
											<li class="font-li">${b.branchName }</li>
											<li class="font-li"><img class="icon" src="img/branch/branch_pinIcon.png">${b.branchAddr }</li>
											<li class="font-li"><img class="icon" src="img/branch/branch_phoneIcon.png">${b.branchPhone } / ${b.branchTel }</li>
											<li style="text-align:left"><button class="btn-submit" type="button">지점 상세 정보</button></li>
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
			<div class="branch-modal">
				<span class="close">&times;</span>
				<div class="branchModal-wrapper">
					<div class="modalHeader">
						<h1></h1>
					</div>
					<div class="modalBody">
						<div class="infoForm">
							<h2>지점 안내</h2>
							<!-- img here : overflow: visible -->
							<div id="infoFormFooter"><span class="infoSpan"></span><br><span class="infoSpan"></span></div>
						</div>
						<div class="locForm">
							<h2>위치 안내</h2>
							<!-- google maps api here -->
						</div>
					</div>
				</div>
			</div>
		</div>
	<script>
		$(function(){
			/* 짝수번째 콘텐트 배경색 지정 */
			$('.content-wrapper:odd div').css('background-color','#ececec');
			$mainImgSrc = $('.content-wrapper img:eq(3)').attr('src');
			$('.mainImg').attr('src',$mainImgSrc);
			$('.subImg').click(function(){
				$(this).siblings().eq(0).attr('src',$(this).attr('src'));
			});
			/* 상세정보 버튼 클릭시 - ajax */
			$('.btn-submit').click(function(){
				$contentWrapper = $(this).parents().eq(3);
				var branchName = $contentWrapper.children().last().val();
				modal.style.display = "block";
				$.ajax({
					url : "/branchInfo",
					type : "get",
					data : {branchName : branchName},
					success :  function(data) {
						/* 변환함수 선언 */
		                function replaceAll(sValue, param1, param2) {
		                	 return sValue.split(param1).join(param2);
		                }
		                /* selvlet으로부터 변수받아옴 */
						var branchName = decodeURIComponent(data.branchName);
						var branchAddr = decodeURIComponent(data.branchAddr);
						var branchTel = data.branchTel;
						var branchPhone = data.branchPhone;
						$('.modalHeader h1').html(branchName);
						$('.infoSpan:first').html("지점주소 : " + replaceAll(branchAddr,"+"," "));
						$('.infoSpan:last').html("지점전화 : " + branchTel +"/"+ branchPhone);
					},
					error : function(){
						console.log("전송 실패");
					}
				});
			});
		});
		/* modal scripts */
		// Get the modal
		var modal = document.getElementById("myModal");
		// Get the button that opens the modal
		var span = document.getElementsByClassName("close")[0];
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