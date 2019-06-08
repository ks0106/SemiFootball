<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!-- 아임포트 결제모듈 API 스크립트 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 기타 스크립트 -->
<script src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		var id = '${memberId}';
		var name = '${memberName}';
		var resNo = '${resNo}';
		var resDate = '${resDate}';
		var resStartTime = '${startTime}';
		var resEndTime = '${endTime}';
		var cCode = ${cCode};
		var price = ${allCost};
		var d = new Date();
		var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
		IMP.init('imp06800707');
		IMP.request_pay({
			merchant_uid : "ID"+date,
			name : "대관 결제",
			amount : 100,		//결제금액 테스트 시 price 지우고 100입력
			buyer_email : id,	//메일 테스트 시 id 지우고 "자기 메일" 입력
			buyer_name : name
		},function(rsp){
			if(rsp.success){
				alert("결제가 완료되었습니다.");
				var info1 = rsp.imp_uid;		//고유ID
				var info2 = rsp.paid_amount;	//결제금액
				var info3 = rsp.apply_num;		//카드넘버
				var info4 = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();		//결제일시
				$('#paymentId').val(info1);
				$('#paymentNum').val(info3);
				$('#paymentDate').val(info4);
				$('#resNo').val(resNo);
				$('#resDate').val(resDate);
				$('#cCode').val(cCode);
				$('#paymentSuccess').submit();
			}else{
				alert("결제가 취소되었습니다.");
				location.href="/";
			}
		});	
	});
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	input{
		visibility:hidden;
	}
</style>
<body>
	<form id="paymentSuccess" action="/reservationPaymentUpdate" method="post">
		<input id="paymentId" name="paymentId" type="text">
		<input id="paymentNum" name="paymentNum" type="text">
		<input id="paymentDate" name="paymentDate" type="text">
		<input id="resNo" name="resNo" type="text">
		<input id="resDate" name="resDate" type="text">
		<input id="cCode" name="cCode" type="text">
		<c:forEach items="${startTime}" var="start" varStatus="i">
			<input class="startTime" name="startTime" type="text" value="${start}">
			<input class="startTime" name="endTime" type="text" value="${endTime[i.index]}">
		</c:forEach>
	</form>


</body>
</html>