<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/notice/notice.css">
<title>Insert title here</title>
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<script>
   $(document).ready(function(){
      $('#ground1').append('<img src="/img/ground1.png" alt="그라운드1" style="width:100%;height:500px;">');
      $('#ground2').append('<img src="/img/ground2.jpg" alt="그라운드2" style="width:100%;height:500px;">');
      $('#ground3').append('<img src="/img/ground3.jpg" alt="그라운드3" style="width:100%;height:500px;">');
      $('#ground4').append('<img src="/img/ground4.jpg" alt="그라운드4" style="width:100%;height:500px;">');
      $('#ground5').append('<img src="/img/ground5.jpg" alt="그라운드5" style="width:100%;height:500px;">');
   });
</script>

	<!--영상 위 페이지 타이틀 -->
	<div id="title">커뮤니티</div>


	<div class="full">
		<div class="tab-container">
			<ul class="tab-list">
				<li class="list-li"><a href="/notice" class="munebar">공지사항</a></li>
				<li class="selected list-li"><a href="#T-con02" class="munebar">FAQ</a></li>
				<li class="list-li"><a href="/boardList" class="munebar">자유게시판</a></li>
			</ul>
			<!-- FAQ -->
			<div id="T-con02" class="tab-con">
				<center>
					<h1 style="font-size: 50px;">
						<b><u>F A Q</u></b>
					</h1>
					<ul style="width: 670px;">
						<li style="text-align: left;">FAQ게시판 입니다.</li>
						<li style="text-align: left;">자주하시는 질문에 대해 정리하였습니다. 원하시는 내용에
							질문을 클릭하시면 답변을 볼 수 있습니다.</li>
						<li style="text-align: left;">FAQ에서 원하는 답변을 찾지 못하였다면
							02-3337-4380으로 문의해주시기 바랍니다.</li>
						<li style="text-align: left;">문의가능 시간은 오전9시부터 오후6시까지이며 토,일요일
							및 공휴일은 휴무 입니다.</li>
					</ul>
				</center>
				<br> <br>
				<center>
					<table>
						<!-- 첫번째 -->
						<tr>
							<th style="width: 650px;"><div data-toggle="collapse"
									data-target="#faq1" id="fa1">
									<span style="font-size: 15px;"> <img
										src="img/faq/FAQ.png" style="width: 30px; height: 30px;">
										정확한 위치가 어디인가요?
									</span>
								</div></th>
						</tr>
						<tr>
							<!-- 첫번째 -->
							<td><div id="faq1" class="collapse">
									<img src="img/faq/FAQ2.PNG" style="width: 30px; height: 20px;">
									서울시 영등포구 선유동2로 57 이레빌딩 109, 110층 KS Sports 입니다.<br> 문의는
									02-3337-4380으로 전화 해주시기 바랍니다. 감사합니다.
								</div></td>
						</tr>
					</table>
					<br> <br>
					<table>
						<tr>
							<!-- 두번째 -->
							<th style="width: 650px;"><div data-toggle="collapse"
									data-target="#faq2" id="fa2">
									<span style="font-size: 15px;"><img
										src="img/faq/FAQ.png" style="width: 30px; height: 30px;">
										대관 사용이 끝난 후 연장은 어떻게 해야 하나요?</span>
								</div></th>
						</tr>
						<tr>
							<!-- 두번째 -->
							<td><div id="faq2" class="collapse">
									<img src="img/faq/FAQ2.PNG" style="width: 30px; height: 20px;">
									대표번호 02-3337-4380으로 전화 하셔서 문의주시면 되겠습니다. 감사합니다.
								</div></td>
						</tr>
					</table>
					<br> <br>
					<table>
						<tr>
							<!-- 세번째 -->
							<th style="width: 650px;"><div data-toggle="collapse"
									data-target="#faq3" id="fa3">
									<span style="font-size: 15px;"><img
										src="img/faq/FAQ.png" style="width: 30px; height: 30px;">
										대관하고 당일에 사용 할 수 없을 정도에 기상현상이 일어나면 어떻게 하나요?</span>
								</div></th>
						</tr>
						<tr>
							<!-- 세번째 -->
							<td><div id="faq3" class="collapse">
									<img src="img/faq/FAQ2.PNG" style="width: 30px; height: 20px;">
									대관 날짜 변경 혹은 환불 원하시는 방향으로 처리해드리겠습니다.<br> 문의는 02-3337-4380으로
									전화 해주시기 바랍니다. 감사합니다.
								</div></td>
						</tr>
					</table>
					<br> <br>
					<table>
						<tr>
							<!-- 네번째 -->
							<th style="width: 650px;"><div data-toggle="collapse"
									data-target="#faq4" id="fa4">
									<span style="font-size: 15px;"><img
										src="img/faq/FAQ.png" style="width: 30px; height: 30px;">
										부득이하게 대관을 취소해야 하는 상황이 오면 어떻게 해야 하나요?</span>
								</div></th>
						</tr>
						<tr>
							<!-- 네번째 -->
							<td><div id="faq4" class="collapse">
									<img src="img/faq/FAQ2.PNG" style="width: 30px; height: 20px;">
									02-3337-4380으로 전화주시거나 사이트에서 취소하시면 됩니다.<br> 단, 전액 환불은 안될 수
									있으니 신중하게 날짜 선택해주시기 바랍니다.<br> 감사합니다.
								</div></td>
						</tr>
					</table>
					<br> <br>
					<table>
						<tr>
							<!-- 다섯번째 -->
							<th style="width: 650px;"><div data-toggle="collapse"
									data-target="#faq5" id="fa5">
									<span style="font-size: 15px;"><img
										src="img/faq/FAQ.png" style="width: 30px; height: 30px;">
										매치신청했는데 당일에 매치된 팀이 오지 않고 연락이 안되는데 어떻게 해야 하나요?</span>
								</div></th>
						</tr>
						<tr>
							<!-- 다섯번째 -->
							<td><div id="faq5" class="collapse">
									<img src="img/faq/FAQ2.PNG" style="width: 30px; height: 20px;">
									문의 주시면 저희쪽에서 알아보고 다시 연락드리도록 하겠습니다.<br> 문의는 02-3337-4380으로
									전화 해주시기 바랍니다. 감사합니다.
								</div></td>
						</tr>
					</table>
					<br> <br>
				</center>

				<script type="text/javascript">
					$(document).ready(function(){
						$('#fa1').click(function(){
							$('#faq2').attr('class','collapse');
							$('#faq3').attr('class','collapse');
							$('#faq4').attr('class','collapse');
							$('#faq5').attr('class','collapse');
						});
						$('#fa2').click(function(){
							$('#faq1').attr('class','collapse');
							$('#faq3').attr('class','collapse');
							$('#faq4').attr('class','collapse');
							$('#faq5').attr('class','collapse');
						});
						$('#fa3').click(function(){
							$('#faq1').attr('class','collapse');
							$('#faq2').attr('class','collapse');
							$('#faq4').attr('class','collapse');
							$('#faq5').attr('class','collapse');
						});
						$('#fa4').click(function(){
							$('#faq1').attr('class','collapse');
							$('#faq2').attr('class','collapse');
							$('#faq3').attr('class','collapse');
							$('#faq5').attr('class','collapse');
						});
						$('#fa5').click(function(){
							$('#faq1').attr('class','collapse');
							$('#faq2').attr('class','collapse');
							$('#faq3').attr('class','collapse');
							$('#faq4').attr('class','collapse');
						});
					})
					</script>
			</div>
		</div>
	</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>