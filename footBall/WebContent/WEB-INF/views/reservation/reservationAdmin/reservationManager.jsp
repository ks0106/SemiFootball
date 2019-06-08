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
<script type="text/javascript" src="/js/reservation/reservationAll.js"></script>
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
</style>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp" />
	<section> <!-- 내용 작성 -->
		<!-- 컨텐츠 -->
		<div style="width:100%;overflow:hidden;">
			<div style="width: 95%; background-color: white; margin: 0 auto; overflow: hidden;">
				<!-- 컨텐츠 사이드 메뉴 -->
				<div style="width:300px; height: 300px; text-align: left; display: inline-block; float: left;">
					<div style="font-size: 30px; font-weight: bolder; color: #2c3c57; margin: 0; margin-bottom: 10px;">대관 관리</div>
					<hr style="width: 80%; border: 2px solid #2c3c57; margin-right: 20%; padding: 0;">
					<div style="margin-bottom: 15px;">
						<a href="/reservation" class="side_a" id="side_menu1" style="color: #2c3c57;">예약/결제 취소</a>
					</div>
					<div style="margin-bottom: 15px;">
						<a class="side_a" id="side_menu2" style="color: #2c3c57;">구장 등록</a>
					</div>
					<c:if test="${sessionScope.Member.id == admin}">
						<div style="margin-bottom: 15px;">
							<a class="side_a" id="side_menu3" style="color: #3366cc;">지점별 물품 등록</a>
						</div>
					</c:if>
				</div>
				<!-- 사이드 메뉴 종료 -->
				<!-- 컨텐츠 -->
				<div style="width: 78%; height: 2000px; border-left: 1px solid silver; display: inline-block; overflow: hidden;">
					<!-- 컨텐츠 타이틀 -->
					<div id="reservationTitle" style="color:#2c3c57;">[관리자] 대관 관리</div>
					<!-- 본문 -->
				</div>
			</div>
		</div>
	</section>
</body>
</html>