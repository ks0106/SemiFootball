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
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=cd02i4r7os&submodules=geocoder"></script> <!-- 네이버 api 추가 -->
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
									<div class="hidden-wrapper">
										<input type="hidden" name="branchCode" value="${bd.b.branchCode }">
										<input type="hidden" name="branchCode" value="${bd.b.branchAddr }">
										<input type="hidden" name="branchName" value="${bd.b.branchName }">
									</div>	
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
									<div class="hidden-wrapper">
										<input type="hidden" name="branchCode" value="${bd.b.branchCode }">
										<input type="hidden" name="branchCode" value="${bd.b.branchAddr }">
										<input type="hidden" name="branchName" value="${bd.b.branchName }">
									</div>	
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
				<div class="modalContent-wrapper" style="position:relative; left:10%; width:80%; height:99.5%;">
					<div class="modalContent-head" style="position:relative; width:100%; height:80px; text-align:center; line-height:2.0;">
						<span style="font-size:40px; font-weight:bold;"></span>
					</div>
					<div class="modalContent-body" style="position:relative; width:100%; height:99.5%%; text-align:center;">
						<table id="modalTable" border="1"></table>
						<div id="map" style="width:800px; height:376px;"></div>
						<div id="infoFooter">
							<span class="infoSpan"></span><br>
							<span class="infoSpan"></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	<script>
		/* 네이버 맵 */
		var map = new naver.maps.Map('map',{
			center : new naver.maps.LatLng(37.3595316, 127.1052133),
			zoom : 11,
			zoomControl :true,
			zoomControlOptions:{
				position : naver.maps.Position.TOP_RIGHT,
				style : naver.maps.ZoomControlStyle.SMALL
			}
		});
		var marker = new naver.maps.Marker({
			position : new naver.maps.LatLng(37.3595316, 127.1052133),
			map : map
		});

		$(function(){
			/* 짝수번째 콘텐트 배경색 지정 */
			$('.content-wrapper:odd div').css('background-color','#ececec');
			$('.content-wrapper:even ul').css('padding','2px');
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
			/* 상세정보 버튼 클릭시 */
			$('.btn-submit').click(function(){
				/* 공통변수 */
				$contentWrapper = $(this).parents().eq(3);
				var branchCode = $contentWrapper.children().last().children().first().val();
				var branchAddr = $contentWrapper.children().last().children().eq(1).val();
				var branchName = $contentWrapper.children().last().children().last().val();
				targetCoord = [];
				/* 네이버 맵 좌표설정 */				
				naver.maps.Service.geocode({
			        query: branchAddr
			    }, function(status, response) {
			    	if (status === naver.maps.Service.Status.ERROR) {
			            return alert('Something Wrong!');
			        }

			        if (response.v2.meta.totalCount === 0) {
			            return alert('totalCount' + response.v2.meta.totalCount);
			        }

			        item = response.v2.addresses[0],
		            point = new naver.maps.Point(item.x, item.y);
			        map.setCenter(point);
			        marker.setPosition(point);
					/* console.log(item.x);
			        console.log(item.y);
			        console.log(item); */	
			    });				
				
				/* ajax로 지점정보 불러오기 */
				modal.style.display = "block";
				$.ajax({
					url : "/branchInfo",
					type : "get",
					data : {branchName : branchName},
					success :  function(data) {
						/* 공백문자 변환함수 선언 */
		                function replaceAll(sValue, param1, param2) {
		                	 return sValue.split(param1).join(param2);
		                }
		                /* selvlet으로부터 변수받아옴 */
						var branchName = decodeURIComponent(data.branchName);
						var branchAddr = decodeURIComponent(data.branchAddr);
						var branchTel = data.branchTel;
						var branchPhone = data.branchPhone;
						var bi1 = data.bi1;
						$('.modalContent-head span').html(branchName);
						$('.infoSpan:first').html("지점주소 : " + replaceAll(branchAddr,"+"," "));
						$('.infoSpan:last').html("지점전화 : " + branchTel +"/"+ branchPhone);
					},
					error : function(){
						console.log("전송 실패");
					}
				});
				/* ajax로 구장정보 불러오기 */
				$.ajax({
					url : "/branchCourtInfo",
					type : "get",
					data : {branchCode : branchCode},
					success : function(data) {
						$('#modalTable').empty();
						var initText="<tr><th>구장 타입</th><th>구분</th><th>사이즈</th><th>대관금액</th></tr>";
						var resultText="";
						var isIndoor = "";
						var size = "";
						var cost = "";
						for(var i=0; i<data.length; i++){
							var courtName = data[i].courtName;
							switch(courtName) {
								case 'A' : isIndoor="실외"; size = "42*25(m)"; cost="120,000￦";
								break;
								case 'B' : isIndoor="실외"; size = "40*22.5(m)"; cost="100,000￦";
								break;
								case 'C' : isIndoor="실내"; size = "38*20(m)"; cost="80,000￦";
								break;
							}
							resultText += "<tr><td>"+courtName+"</td>"+"<td>"+isIndoor+"</td><td>"+size+"</td><td>"+cost+"</td></tr>";
						}
						initText += resultText;
						$('#modalTable').append(initText);
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