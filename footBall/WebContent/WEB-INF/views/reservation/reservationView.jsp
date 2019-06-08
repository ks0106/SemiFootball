<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
<!-- reservation 공통 js => jqeury를 이용하기 때문에 jquery import 밑으로 내려야 한다. -->
<script type="text/javascript" src="/js/reservation/reservationAll.js"></script>
<link rel="stylesheet" href="/css/common/pageCss.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	.side_a {
	font-weight: bolder;
	font-size: 18px;
	text-decoration: none;
	cursor: pointer;
}
	
	.content-header{
		color:#403d3f;
		font-size: 40px;
		margin-bottom:20px;
		margin-top: 0px;
		margin: 0 auto;
		text-align: center;
	}
	.underline{
		margin:0 auto;
		width:7%;
		text-align:center;
		border-top:2px solid #bfc4cc;
		margin-bottom: 50px;
		margin-top: 20px;
	}
	#form-cont{
		margin: 0 auto;
		width: 80%;
	}
	#input-table{
		text-align: center;
		width: 90%;
		margin-top: 50px;
		margin: 0 auto;
		border-collapse: collapse;
		border-top: 3px solid green;
		border-bottom: 3px solid green;
	}
	.th{
		width: 25%;
		padding: 20px;
		font-size: 30px;
	}
	.td{
		width: 25%;
		padding: 20px;
		font-size: 30px;
		text-align: left;
	}
	.receiptTd{
		border-bottom: 1px solid silver;
		border-left: 1px solid silver;
	}	
	.receiptTh{
		border-bottom: 1px solid silver;
	}
	
</style>
<script>
	$(document).ready(function(){
		$('.side_nav:first').css("color","#3366cc");
		$('.side_nav a:first').css("color","#3366cc");
		$('#side_pr_menu').css("display","block");
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
	<section>
		<div style="width: 900px; height:900px; background-color: white; margin: 0 auto;">
				<div style="width:100%;">
				<p class="content-header">예약확인</p>
					<div class="underline"></div>
			<!-- 컨텐츠 시작 -->
					<div id="table-wrapper1" style="margin-top: 50px; border-top: 3px solid #2c3c57; border-bottom: 3px solid #2c3c57; width: 900px; margin: 0 auto; border-collapse: collapse;">
						<div style="width:900px;height:700px;margin:0 auto;background-color:rgb(245,245,245);display:table;">
							<div style="width:80%;height:80%;display:table-cell;vertical-align:middle;">
								<table style="width:100%;height:100%;margin:0 auto;border-collapse:collapse;">
									<tr>
										<th class="receiptTh">지점명</th>
										<td class="receiptTd" colspan="3">${rvpd.b.branchName}</td>
									</tr>
									<tr>
										<th class="receiptTh">구장명</th>
										<td class="receiptTd" colspan="3">${rvpd.c.courtName}</td>
									</tr>
									<tr>
										<th class="receiptTh">예약자(ID)</th>
										<td class="receiptTd" colspan="3">${rvpd.res.resMEmail}</td>
									</tr>
									<tr>
										<th class="receiptTh">연락처</th>
										<td class="receiptTd" colspan="3">${rvpd.res.resMPhone}</td>
									</tr>
									<tr>
										<th class="receiptTh">날짜</th>
										<td class="receiptTd" colspan="3">${rvpd.res.resDate}</td>
									</tr>
									<tr>
										<th class="receiptTh">시간</th>
										<td class="receiptTd" colspan="3" id="tokenizer">${rvpd.res.resTime}</td>
									</tr>
									<tr>
										<th class="receiptTh">구매/대여 물품</th>
										<c:if test="${not empty rvpd.rList}">
											<td class="receiptTd" colspan="3">
												<c:forEach items="${rvpd.rList}" var="r" varStatus="i">
													${rvpd.gList[i.index].goodsName} ${rvpd.gList[i.index].goodsSize} < ${r.rentalGAmount}ea × ${rvpd.gList[i.index].goodsPrice}원 >
													<c:if test="${fn:length(rvpd.rList) > i.index}">
														<br>
													</c:if>
												</c:forEach>
											</td>
										</c:if>
										<c:if test="${empty rvpd.rList}">
											<td class="receiptTd" colspan="3"></td>
										</c:if>
									</tr>
									<tr>
										<th class="receiptTh">결제</th>
										<c:if test="${rvpd.res.resPayment == 1}">
											<c:if test="${rvpd.res.resCancel == 0}">
												<td class="receiptTd">결제완료
												<button id="paymentCancelBtn" type="button" style="border:0;background-color:darkgray;color:white;font-size:13px;">결제취소</button>							
												</td>
											</c:if>
											<c:if test="${rvpd.res.resCancel == 1}">
												<td class="receiptTd">결제취소 진행중
												<button id="paymentCancelRollbackBtn" type="button" style="border:0;background-color:darkgray;color:white;font-size:13px;">취소 철회</button>
												</td>
											</c:if>
											<th class="receiptTd">결제일시</th>
											<td class="receiptTd">${rvpd.res.resPaymentDate}</td>
										</c:if>
										<c:if test="${rvpd.res.resPayment == 2}">
											<td class="receiptTd" style="color:#df0101;font-weight:bolder;">결제취소 완료
											<th class="receiptTd">취소일시</th>
											<td class="receiptTd">${rvpd.res.resCancelDate}</td>
										</c:if>
										
									</tr>
									<tr>
										<th colspan="4" style="border-top:3px double #2c3c57;">총계</th>
									</tr>
									<tr>
										<td colspan="4" style="text-align:center;border-top:1px solid silver;"><fmt:formatNumber value="${rvpd.res.resTotalCost}" pattern="\#,###" /></td>		
									</tr>
								</table>
							</div>						
						</div>
					</div>
					<button style="width:150px;height:50px;background-color:#2c3c57;color:white;border:0;font-weight:bolder;font-size:18px;float:right;cursor:pointer;" onclick="window.close();">닫기</button>					
				<div>
			</div>
		</div>
	</section>
	
	<script>	
		$(document).ready(function(){
			var token = $('#tokenizer').html().replace(/,/gi,"<br>");
			$('#tokenizer').html(token);
		});
		
		$('#paymentCancelBtn').on("click",function(){
			var txt = "처리시간이 최대 24시간까지 소요될 수 있습니다."+"\n"+"취소하시겠습니까?"
			if(confirm(txt)){
				var resNo = '${rvpd.res.resNo}';
				var d = new Date();
				var cancelApplyDate = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
				$.ajax({
					url : '/reservationCancelApply.do',
					type : 'get',
					data : {resNo:resNo,cancelApplyDate:cancelApplyDate},
					success : function(data){
						var result = parseInt(data);
						if(result > 0){
							alert("결제 및 예약 취소 신청 완료");
							opener.location.reload();
							window.close();
						}else{
							alert("잘못된 동작입니다. 잠시 후 다시 시도해주세요.")
							opener.location.reload();
							window.close();
						}
					},
					error : function(){
						alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
					}
				});
			}
		});
		$('#paymentCancelRollbackBtn').on("click",function(){
			var resNo = '${rvpd.res.resNo}';
			var payDate = '${rvpd.res.resPaymentDate}';
			$.ajax({
				url : '/reservationCancelApplyRollback.do',
				type : 'get',
				data : {resNo:resNo,payDate:payDate},
				success : function(data){
					var result = parseInt(data);
					if(result > 0){
						alert("결제 및 예약 취소 철회 성공");
						opener.location.reload();
						window.close();
					}else{
						alert("잘못된 동작입니다. 잠시 후 다시 시도해주세요.")
						opener.location.reload();
						window.close();
					}
				},
				error : function(){
					alert("정보를 읽어올 수 없습니다. 잠시 후 다시 시도해주세요.");
				}
			});			
		});
	</script>
</body>
</html>