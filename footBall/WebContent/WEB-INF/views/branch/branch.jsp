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
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyDUqmobb6MbacXONycKU0UweQir-dpu3kM" ></script>
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
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<!--영상 위 페이지 타이틀 -->
		<div id="title">지점현황</div>
			<div class="content-container">
				<hr style="border:3px solid #2c3c57;margin:0 auto;padding:0;">
				<!-- 사이드바 -->
				<aside class="aside-bar">
					<div id="testSticky">
						<h2>지점 바로가기</h2>
						<c:forEach items="${list }" var="bd">
							<a href="#${bd.b.branchName }" class="go_btn">${bd.b.branchName }</a><br>
						</c:forEach>
					</div>
				</aside>
				<!-- 좌우측 콘텐트 반복출력 -->
				<c:forEach items="${list}" var="bd" varStatus="status">
					<c:choose>
						<c:when test="${status.index %2 == 0 }">
							<form action="/branchInfo" method="get" enctype="multipart/form-data">
								<div class="content-wrapper">
									<div class="content-left">
										<ul style="list-style-type: none;">
											<li class="font-li"><a id="${bd.b.branchName }">${bd.b.branchName }</a></li>
											<li class="font-li"><img class="icon" src="img/branch/branch_pinIcon.png">${bd.b.branchAddr }</li>
											<li class="font-li"><img class="icon" src="img/branch/branch_phoneIcon.png">${bd.b.branchPhone } / ${bd.b.branchTel }</li>
											<li style="text-align:left"><button class="btn-submit" type="button">지점 상세 정보</button></li>
										</ul>
									</div>
									<div class="content-right">
										<img class="mainImg right" src="${bd.bi.bi1 }" alt="mainIng"><br>
										<c:if test="${bd.bi != null}">
											<img class="subImg right" src="${bd.bi.bi1 }" alt="subImg">
											<img class="subImg right" src="${bd.bi.bi2 }" alt="subImg">
											<img class="subImg right" src="${bd.bi.bi3 }" alt="subImg">
											<img class="subImg right" src="${bd.bi.bi4 }" alt="subImg">
										</c:if>
									</div>
									<input type="hidden" name="branchName" value="${bd.b.branchName }">
								</div>
							</form>
						</c:when>
						<c:when test="${status.index %2 == 1 }">
							<form action="/branchInfo" method="get" enctype="miltipart/form-data">
								<div class="content-wrapper">
									<div class="content-left">
										<img class="mainImg left" src="${bd.bi.bi1 }" alt="mainIng"><br>
										<c:if test="${bd.bi != null }">
											<img class="subImg left" src="${bd.bi.bi1 }" alt="subImg">
											<img class="subImg left" src="${bd.bi.bi2 }" alt="subImg">
											<img class="subImg left" src="${bd.bi.bi3 }" alt="subImg">
											<img class="subImg left" src="${bd.bi.bi4 }" alt="subImg">
										</c:if>
									</div>
									<div class="content-right">
										<ul style="list-style-type: none;">
											<li class="font-li"><a id="${bd.b.branchName }">${bd.b.branchName }</a></li>
											<li class="font-li"><img class="icon" src="img/branch/branch_pinIcon.png">${bd.b.branchAddr }</li>
											<li class="font-li"><img class="icon" src="img/branch/branch_phoneIcon.png">${bd.b.branchPhone } / ${bd.b.branchTel }</li>
											<li style="text-align:left"><button class="btn-submit" type="button">지점 상세 정보</button></li>
										</ul>
									</div>
									<input type="hidden" name="branchName" value="${bd.b.branchName }">
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
						<span style="font-size:40px; font-weight:bold;"> </span>
					</div>
					<div class="modalBody">
						<h2>지점 안내</h2>
						<div class="infoForm">
							<!-- img here : overflow: visible -->
							<img id="spec" src="${bd.bi.bi1 }" alt="상세정보">
							<div id="infoFormFooter"><span class="infoSpan"></span><br><span class="infoSpan"></span></div>
						</div>
						<div class="locForm">
							<h2>위치 안내</h2>
							<!-- google maps api here -->
							<div id="map_ma"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<script>
		$(function(){
			/* 짝수번째 콘텐트 배경색 지정 */
			$('.content-wrapper:odd div').css('background-color','#ececec');
			/* 소스 없는 서브이미지 태그 감추기 */
			if($('.subImg').attr('src') == "") {
				$(this).css('display','none');
			}
			/* 서브이미지 클릭시 메인이미지 대체 */
			$('.subImg').click(function(){
				$(this).siblings().eq(0).attr('src',$(this).attr('src'));
			});
			/* 사이드바 지점 바로가기 */
			$('.go_btn').click(function(event){
				event.preventDefault();
				var targetId = ($(this).attr('href')).substring(1);
				var position = $('#'+targetId).offset();
				$('html,body').animate({scrollTop:position.top-156},500);
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
						var bi1 = data.bi1;
						$('.modalHeader span').html(branchName);
						$('.infoSpan:first').html("지점주소 : " + replaceAll(branchAddr,"+"," "));
						$('.infoSpan:last').html("지점전화 : " + branchTel +"/"+ branchPhone);
						$('#spec').attr('src',bi1);
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
		
		/* google maps api */
		$(function(){
			var myLatlng = new google.maps.LatLng(35.837143,128.558612); // 위치값 위도 경도
			var Y_point			= 35.837143;		// Y 좌표
			var X_point			= 128.558612;		// X 좌표
			var zoomLevel		= 18;				// 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
			var markerTitle		= "대구광역시";		// 현재 위치 마커에 마우스를 오버을때 나타나는 정보
			var markerMaxWidth	= 300;				// 마커를 클릭했을때 나타나는 말풍선의 최대 크기

			// 말풍선 내용
			var contentString	= '<div>' +
			'<h2>대구남구</h2>'+
			'<p>안녕하세요. 구글지도입니다.</p>' +
			
			'</div>';
			var myLatlng = new google.maps.LatLng(Y_point, X_point);
			var mapOptions = {
				zoom: zoomLevel,
				center: myLatlng,
				mapTypeId: google.maps.MapTypeId.ROADMAP
			}
			var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
			var marker = new google.maps.Marker({
							position: myLatlng,
							map: map,
							title: markerTitle
						});
			var infowindow = new google.maps.InfoWindow({
								content: contentString,
								maxWizzzdth: markerMaxWidth
														
							});
			google.maps.event.addListener(marker, 'click', function() {
					infowindow.open(map, marker);
				});
		});
		</script>
</body>
</html>