<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- 네이버 지도 API 스크립트 : 서브모듈러 추가 시 콤마(,)찍고 추가 -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=cd02i4r7os&submodules=geocoder"></script>
	<!-- 부트스트랩 -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/common/pageCss.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KS 오시는길</title>
<style>
	.side_nav{
		margin:5px;
		color:silver;
	}
	.side_nav a{
		text-decoration:none;
		color:silver;
		font-size:16px;
	}
	#side_menu1{
		display:block;
	}
	#side_pr_menu{
		list-style-type:square;
		padding:0;
		margin:0;
		margin-left:20px;
		display:none;
	}
	#mv{
		background-image: url("/img/ground1.png");
	}
</style>
<script>
	$(document).ready(function(){
		$('#ground1').append('<img src="/img/ground1.png" alt="그라운드1" style="width:100%;height:500px;">');
		$('#ground2').append('<img src="/img/ground2.jpg" alt="그라운드2" style="width:100%;height:500px;">');
		$('#ground3').append('<img src="/img/ground3.jpg" alt="그라운드3" style="width:100%;height:500px;">');
		$('#ground4').append('<img src="/img/ground4.jpg" alt="그라운드4" style="width:100%;height:500px;">');
		$('#ground5').append('<img src="/img/ground5.jpg" alt="그라운드5" style="width:100%;height:500px;">');
		$('.side_nav:first').css("color","#3366cc");
		$('.side_nav a:first').css("color","#3366cc");
		$('#side_pr_menu').css("display","none");
		$('.side_a').click(function(){													/* 메뉴 클릭했을 때 */
			if($(this).siblings('ul').css("display") == "block"){						/* 메뉴 컬러가 연할 때 */
				$(this).siblings('ul').slideUp();										/* 메뉴 닫음 */
			}else{																		/* 메뉴 컬러가 진할 때 */
				$(this).siblings('ul').find('li:first,a:first').css("color","#3366cc");
				$(this).siblings('ul').find('li,a').not('li:first,a:first').css("color","silver");
				$(this).parents('div').siblings().children('ul').slideUp();				/* 다른 메뉴 닫음 */
				$(this).parents('div').siblings().children('a').css("color","#2c3c57");	/* 다른 메뉴 컬러 진하게 */
				$(this).siblings('ul').slideDown();										/* 메뉴 펼침 */
				$(this).css("color","#3366cc");											/* 컬러 연하게 */
			}
		});
		$('.side_nav').click(function(){
			$(this).css("color","#3366cc");
			$(this).children('a').css("color","#3366cc");
			$(this).siblings('li').css("color","silver");
			$(this).siblings('li').children('a').css("color","silver");
		});
	});
</script>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!--영상 위 페이지 타이틀 -->
	<div id="title">
		회사소개
	</div>
	<section>
	<!-- 내용 작성 -->
		<hr style="border:3px solid #2c3c57;margin:0 auto;margin-bottom:30px;padding:0;">
		<div style="width:85%;background-color:white;margin:0 auto;overflow:hidden;">
			<div style="width:20%;height:300px;text-align:left;display:inline-block;float:left;">
				<div style="font-size:30px;font-weight:bolder;color:#2c3c57;margin:0;margin-bottom:10px;">KS Sports</div>
				<hr style="width:80%;border:2px solid #2c3c57;margin-right:20%;padding:0;">
				<div style="margin-bottom:15px;">
					<a class="side_a" id="side_menu1" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">회사소개</a>
					<ul id="side_pr_menu">
						<li class="side_nav" id="side_menu2"><a href="/company">KS Sports</a></li>
					</ul>
				</div>
				<div style="margin-bottom:15px;">
					<a href="/companyLocation" class="side_a" id="side_menu4" style="color:#3366cc;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">오시는 길</a>
				</div>
			</div>
		<!-- 컨텐츠 본문 -->
   		<!-- 컨텐츠 본문 타이틀 -->
			<div style="width:78%;border-left:1px solid silver;display:inline-block;overflow:hidden;">
				<div style="font-size:60px;color:#403d3f;text-align: center;margin-bottom:20px;">오시는 길</div>
				<div class="underline" style="margin:0 auto;width:7%;text-align:center;border-top:2px solid #bfc4cc;margin-bottom:50px;"></div>				
		<!-- 컨텐츠 지도 파티션 -->
				<div id="map" style="float:left;margin-left:20px;width:600px;height:600px;margin-bottom:50px;"></div>
				<div style="width:500px;float:left;margin-left:20px;">
					<div style="font-size:20px;font-weight:bolder;">주소</div>
					<hr style="width:120px;height:4px;background-color:#2c3c57;border:0;padding:0;display:inline-block;float:left;">
					<hr style="width:20px;height:4px;background-color:#3366cc;border:0;padding:0;display:inline-block;float:left;">
				</div>
				<br>
				<br>
	<!-- 컨텐츠 주소 -->
				<div style="float:left;margin-left:20px;font-size:13px;display:inline-block;">서울 영등포구 선유동2로 57 이레빌딩 109,110층 KS Sports</div>
				<div style="float:left;margin-left:20px;font-size:13px;display:inline-block;">57, Seonyudong 2-ro, Yeongdeungpo-gu, Seoul, Republic of Korea</div>
			</div>
		</div>
	</section>
	<script>
		//네이버 지도 API
		window.onload = function(){
//			var map = new naver.maps.Map('map');		//시청 기준 map
			var map = new naver.maps.Map('map',{		//위도,경도 기준 map
				center : new naver.maps.LatLng(37.533807,126.896772),
				zoom:10,
				zoomControl : true,						//zoom 콘트롤러
				zoomControlOptions : {					//zoom 콘트롤러 설정
					position : naver.maps.Position.TOP_RIGHT,		//위치:상단 오른쪽
					style : naver.maps.ZoomControlStyle.SMALL		//사이즈:최소
				}
			});
			var marker = new naver.maps.Marker({		//조건에 맞는 위치를 지도에 찍어주는 핀(마커)
				position : new naver.maps.LatLng(37.533807,126.896772),
				map : map
			});
			naver.maps.Event.addListener(map, 'click', function(e){
				if(infoWindow.getMap()){
					infoWindow.close();
				}
				//위도 경도는 바로 구할 수 있음
				//geocode 서브모듈을 이용한 위경도 -> 주소변환
				//geocede : 주소 -> 위경도 / reverseGeocode : 위경도 -> 주소
				naver.maps.Service.reverseGeocode({
					location : new naver.maps.LatLng(e.coord.lat(),e.coord.lng()),		//위도,경도를 클릭한 곳으로 바꿔줌(마커 위치)
					},function(status,response){
						if(status !== naver.maps.Service.Status.OK){					//위도,경도를 못 얻어온 경우
							return alert("못찾음");
						}
						var result = response.result,
						items = result.items;
						address = items[0].address;
				});
			});
			var contentString = [						//마커 클릭 시 출력할 주소 배열
		        '   <h3 style="display:inline-block;padding:10px;">KS Sports 당산 본점</h3>',
		        '       <img src="/img/header_logo.png" width="100" height="100" alt="KS" style="float:right;" class="thumb" />',
		        '   	<p style="font-size:13px;padding:10px;">서울 영등포구 양평동4가 2 | 서울시 영등포구 선유동2로 57 이레빌딩<br />',
		        '       TEL : 02-3337-4380 | FAX : 02-3337-4381<br />',
		        '       <a href="http://www.kssports.go.kr" target="_blank" style="text-decoration:none;">http://www.kssports.go.kr/</a>',
		        '   </p>',
		        '</div>'
			].join('');									//배열 값을 String으로 합침
			var infoWindow = new naver.maps.InfoWindow();		//마커 클릭 시 띄우는 창
			naver.maps.Event.addListener(marker,'click',function(){
				if(infoWindow.getMap()){				//infoWindow가 열려있는지 판단
					infoWindow.close();					//열려있을 때 닫음
				}else{
					infoWindow.setContent(contentString);		//정보창에 글시 세팅
					infoWindow.open(map,marker);
				}
			});
		}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>