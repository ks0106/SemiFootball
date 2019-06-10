<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel='stylesheet' href="css/common/admin.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
<!-- reservation 공통 js => jqeury를 이용하기 때문에 jquery import 밑으로 내려야 한다. -->
<script type="text/javascript" src="/js/reservation/reservationAdminAll.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
</script>
<style>
	.side_a {
		font-weight: bolder;
		font-size: 18px;
		text-decoration: none;
		cursor: pointer;
	}
	
	#reservationTitle{
		font-size:45px;
		font-weight:bolder;
	}
	
/* 복붙한 style(솎아낼 거 있음) */
.side_nav {
	margin: 5px;
	color: silver;
}
.side_a {
	font-weight: bolder;
	font-size: 18px;
	text-decoration: none;
	cursor: pointer;
}

.side_nav a {
	text-decoration: none;
	color: silver;
	font-size: 16px;
}

#side_menu1 {
	display: block;
}

#side_pr_menu {
	list-style-type: square;
	padding: 0;
	margin: 0;
	margin-left: 20px;
	display: none;
}

#mv {
	background-image: url("/img/ground1.png");
}
.side_nav {
	margin: 5px;
	color: silver;
}

.side_nav a {
	text-decoration: none;
	color: silver;
	font-size: 16px;
}

#side_menu1 {
	display: block;
}

#side_pr_menu {
	list-style-type: square;
	padding: 0;
	margin: 0;
	margin-left: 20px;
	display: none;
}

.insertLeagueBtn {
	width: 200px;
	height: 50px;
	color: teal;
	border: none;
	background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%);
}

.th {
	width: 20%;
	border-bottom: 1px solid gray;
	padding-top: 10px;
	padding-bottom: 10px;
	font-size:18px;
}

.td {
	padding: 16px;
	border-bottom: 1px solid #d5d8dd;
	height: 21px;
	font-size: 18px;
	line-height: 21px;
}

#imgView:hover {
	background-color: #F2F2F2;
	cursor: pointer;
}

#top1 {
	position: absolute;
	width: 150px;
	height: 150px;
	border: 1px solid;
	top: 1%;
	left: 44%;
}

#top2 {
	position: absolute;
	width: 120px;
	height: 110px;
	border: 1px solid;
	top: 28%;
	left: 19%;
}

#top3 {
	position: absolute;
	width: 120px;
	height: 110px;
	border: 1px solid;
	top: 28%;
	left: 72%;
}

#top4 {
	position: absolute;
	width: 120px;
	height: 110px;
	border: 1px solid;
	top: 50%;
	left: 6%;
}

#top5 {
	position: absolute;
	width: 120px;
	height: 110px;
	border: 1px solid;
	top: 50%;
	left: 32%;
}

#top6 {
	position: absolute;
	width: 120px;
	height: 110px;
	border: 1px solid;
	top: 50%;
	left: 59%;
}

#top7 {
	position: absolute;
	width: 120px;
	height: 110px;
	border: 1px solid;
	top: 50%;
	left: 85%;
}

#top8 {
	position: absolute;
	width: 120px;
	height: 110px;
	border: 1px solid;
	top: 74%;
	left: -1%;
}

#top9 {
	position: absolute;
	width: 120px;
	height: 110px;
	border: 1px solid;
	top: 74%;
	left: 13%;
}

#top10 {
	position: absolute;
	width: 120px;
	height: 110px;
	border: 1px solid;
	top: 74%;
	left: 26%;
}

#top11 {
	position: absolute;
	width: 120px;
	height: 110px;
	border: 1px solid;
	top: 74%;
	left: 39%;
}

#top12 {
	position: absolute;
	width: 120px;
	height: 110px;
	border: 1px solid;
	top: 74%;
	left: 52%;
}

#top13 {
	position: absolute;
	width: 120px;
	height: 110px;
	border: 1px solid;
	top: 74%;
	left: 65%;
}

#top14 {
	position: absolute;
	width: 120px;
	height: 110px;
	border: 1px solid;
	top: 74%;
	left: 78%;
}

#top15 {
	position: absolute;
	width: 120px;
	height: 110px;
	border: 1px solid;
	top: 74%;
	left: 91%;
}

.lose {
	width: 100%;
	height: 100%;
	background-color: black;
	position: absolute;
	top: 0%;
	left: 0%;
	opacity: 0.5;
	z-index: 2;
}

#content {
	display: none;
}
</style>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp" />
	<section> <!-- 내용 작성 -->
		<!-- 컨텐츠 -->
		<div style="width:100%;overflow:hidden;margin-top:30px;">
			<div style="width: 95%; background-color: white; margin: 0 auto; overflow: hidden;">
<!-- 				컨텐츠 사이드 메뉴
				<div style="width:300px; height: 300px; text-align: left; display: inline-block; float: left;">
					<div style="font-size: 30px; font-weight: bolder; color: black; margin: 0; margin-bottom: 10px;">대관 관리</div>
					<div style="width: 80%;">
						<hr style="width: 80%; border: 2px solid black;padding: 0;float:left;">
						<hr style="width: 10%; border: 2px solid #df0101;padding: 0;display:inline-block;">
					</div>
					<div style="margin-bottom: 15px;">
						<a class="side_a" id="side_menu1" style="color: #df0101;">예약/결제 취소</a>
					</div>
					<div style="margin-bottom: 15px;">
						<a class="side_a" id="side_menu2" style="color: gray;">물품 등록/수정/삭제</a>
					</div>
					<div style="margin-bottom: 15px;">
						<a class="side_a" id="side_menu3" style="color: gray;">스케쥴 등록/수정/삭제</a>
					</div>
				</div>
				사이드 메뉴 종료 -->
				<!-- 컨텐츠 -->
				<div style="width: 100%; height:100vh; overflow: hidden;">
					<!-- 컨텐츠 타이틀 -->
					<div id="reservationTitle" style="color:black;margin-left:50px;">[관리자] 예약/결제 취소</div>
					<!-- 본문 -->
					<!-- 컨텐츠 파티션 -->
					<div style="width: 90%; margin: 0 auto; margin-bottom: 50px;">
						<p style="font-size:30px;font-weight:bolder;color:silver;margin:20px;">- 취소 신청 목록</p>
						<div id="table-wrapper1" style="margin-bottom: 100px; text-align:left;">
							<table style="margin-top: 50px; border-top: 3px solid black; border-bottom: 3px solid black; width: 80%; margin: 0 auto; border-collapse: collapse;text-align:center;">
								<tr>
									<th class="th">주문번호</th>
									<th class="th">결제일</th>
									<th class="th">취소신청일</th>
									<th class="th">금액</th>
								</tr>
								<c:if test="${!empty list}">
									<c:forEach items="${list}" var="r">
										<tr id="imgView" onclick="window.open('/reservationManagerView?resNo=${r.resNo}','예약확인','width=1000,height=900,location=no,status=no,scrollbars=yes');">
											<td class="td"><span class="priamryNo">${r.resNo}</span></td>
											<td class="td">${r.resPaymentDate}</td>
											<td class="td">${r.resCancelApplyDate}</td>
											<td class="td"><fmt:formatNumber value="${r.resTotalCost}" pattern="#,###" />원</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</div>
						<!-- 페이지 네비 -->
						<div id="pageNavi"
							style="width: 80%; margin: 0 auto; margin-bottom: 100px;">${mpd.pageNavi }
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
</body>
</html>