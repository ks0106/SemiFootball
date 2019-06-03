<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel='stylesheet' href="css/common/pageCss.css">
<link rel='stylesheet' href="css/branch/branch.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지점현황</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=wsxy6r6myr&submodules=geocoder"></script> <!-- 네이버 api 추가 -->
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
			<hr class="hr-menu">
			<div class="content-container">
				<!-- 사이드바 -->
				<aside class="aside-bar">
					<div id="testSticky">
						<div id="nav-wrapper">
							<span class="nav-span">지점 바로가기</span><br style="clear: both;">
							<hr class="hr-menu" style="border: 2px solid #2c3c57;">
							<c:forEach items="${list }" var="bd">
								<a href="#${bd.b.branchName }" class="internal-link">${bd.b.branchName }</a><br>
							</c:forEach>
							<a href="/branchManage" id="manage-link">[관리자] 지점 관리</a><br>
						</div>
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
		
		<!-- 지점상세 모달 -->
		<div id="myModal" class="modal">
			<!-- 모달 정보창 -->
			<div class="branch-modal">
				<span class="close">&times;</span>
				<div class="branchModal-wrapper">
					<div class="modalHeader">
						<span style="font-size:40px; font-weight:bold;"> </span>
					</div>
					<div class="modalBody">
						<h2>지점 안내</h2>
						<div class="infoForm">
							<!-- img here : overflow: visible? -->
							<img id="spec" src="${bd.bi.bi1 }" alt="상세정보">
							<div id="infoFormFooter"><span class="infoSpan"></span><br><span class="infoSpan"></span></div>
						</div>
						<div class="locForm">
							<h2>위치 안내</h2>
							<!-- naver maps api here -->
							<div id="map"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<script>
		$(function(){
			/* 짝수번째 콘텐트 배경색 지정 */
			$('.content-wrapper:odd div').css('background-color','#ececec');
			$('.content-wrapper:even ul').css('padding','0px');
			/* 소스 없는 서브이미지 태그 감추기 */
			$('.subImg').each(function(index,item){
				if(!($(item).attr('src'))) {
					$(this).css('display','none');
				}
			});
			/* 서브이미지 클릭시 메인이미지 대체 */
			$('.subImg').click(function(){
				$(this).siblings().eq(0).attr('src',$(this).attr('src'));
			});
			/* 사이드바 지점 바로가기 */
			$('.internal-link').click(function(event){
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
		
		/* naver map api */
		window.onload = function() {
			/* var map = new naver.maps.Map('map');  */
			var map = new naver.maps.Map('map',{
				center : new naver.maps.LatLng(37.533807,126.896772),
				zoom : 11,
				zoomControl :true,
				zoomControlOptions:{
					position : naver.maps.Position.TOP_RIGHT,
					style : naver.maps.ZoomControlStyle.SMALL
				}
			});
			var marker = new naver.maps.Marker({
				position : new naver.maps.LatLng(37.533807,126.896772),
				map : map
			});
			naver.maps.Event.addListener(map,'click',function(e){
				marker.setPosition(e.coord);
				if(infoWindow.getMap()) {
					infoWindow.close();
				}
				//위도, 경도는 바로 구할 수 있음
				//위도, 경도를 바탕으로 주소를 갖고오기 - using geocode - 위(import script)에 submodule을 추가해야함
				naver.maps.Service.reverseGeocode({ //cf) .geocode : 주소를 위.경도로 바꾸기
					location : new naver.maps.LatLng(e.coord.lat(),e.coord.lng())
					}, function(status,response) {
						if(status !== naver.maps.Service.Status.OK) {/* !== : 자료형까지 비교하는 JS 연산자 */
							return alert('주소정보 없음');
						}
						var result = response.result;
						items = result.items; /* 도로명주소, 지번주소의 배열형태로 전달받음 */
						address = items[1].address;
						contentString = [
							'<div class="iw_inner">',
							'<p>'+address+'</p>',
							'</div>'
						].join('');
				});
			});
			var contentString = [
				'<div class="iw_inner>"',
				'<p>서울시 영등포구 선유동2로 57 이레빌딩</p>',
				'</div>'
			].join('');
			var infoWindow = new naver.maps.InfoWindow();
			naver.maps.Event.addListener(marker, 'click', function(e){
				if(infoWindow.getMap()) {
					infoWindow.close();
				} else {
					infoWindow.setContent(contentString);
					infoWindow.open(map, marker);
				}
					
			});
		}
		
	</script>
</body>
</html>