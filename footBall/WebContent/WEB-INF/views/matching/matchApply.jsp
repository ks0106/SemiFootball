<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	#matchlist-table{
		border-top:2px solid ;
		border-bottom:2px solid #2c3c57;
		border-collapse: collapse;
		
	}
	#table-wraper{
		margin:0 auto;
		margin-top:30px;
		width: 80%; 
	}
	.content-header{
		color:#2c3c57;
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
		border-top: 3px solid #2c3c57;
		border-bottom: 3px solid #2c3c57;
	}
	.th{
		width: 20%;
		padding: 20px;
		font-size: 16px;
	}
	.td{
		width: 20%;
		padding: 20px;
		font-size: 16px;
		text-align: center;
		cursor:pointer;
	}
	.table-tr:hover{
		background-color: lightgray;
	}
	.mercenaryBtn{
		width:120px;
		height:40px;
		border:none;
		color:white;
	}
</style>
<script>
	$(document).ready(function(){
		/* 헤더 배경 이미지 */
		$('#menuImg').append('<img src="/img/common/matching.jpg" alt="메인 이미지" style="width:100%;max-height:initial; margin-top:-15%;">');
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
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!--영상 위 페이지 타이틀 -->
	<div id="title">
		매치
	</div>
	<section>
	<!-- 내용 작성 -->
		<hr style="border:3px solid #2c3c57;margin:0 auto;margin-bottom:30px;padding:0;">
		<!-- center -->
		<div>
			<div style="width:85%;background-color:white;margin:0 auto;overflow:hidden;">
				<div style="width:20%;height:300px;text-align:left;display:inline-block;float:left;">
					<div style="font-size:30px;font-weight:bolder;color:#2c3c57;margin:0;margin-bottom:10px;">용병지원</div>
					<hr style="width:80%;border:2px solid #2c3c57;margin-right:20%;padding:0;">
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu1" href="/matching" style="color:#3366cc;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">매치</a>
					</div>
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu2" href="/mercenaryRec" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">용병모집</a>
					</div>
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu3" href="/mercenary" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">용병지원</a>
					</div>
				</div>
				<div style="width:78%;border-left:1px solid silver;display:inline-block;overflow:hidden;">
				<p class="content-header">매치신청</p>
							<div class="underline"></div>
				<form action="/addMatchList" method="post">
						<table id="input-table">
							<tr>
								<th class="th">지점</th>
								<td class="td">
									<input type="text" readonly="readonly"  id="bName" style="width: 297px;height: 40px;">
									<input type="hidden" readonly="readonly" name="matchBCode" id="bCode" style="width: 297px;height: 40px;">
									
								</td>
								<th class="th">구장</th>
								<td class="td">
									<input type="text" readonly="readonly"  id="cName" style="width: 297px;height: 40px;">
									<input type="hidden" readonly="readonly" name="matchCCode" id="cCode" style="width: 297px;height: 40px;">
								</td>
							</tr>
							<tr>
								<th class="th">신청자</th>
								<td class="td"><input type="text" name="name" style="width: 297px;height: 40px;" value="${sessionScope.member.name }" readonly="readonly"></td>
								<th class="th">연락처</th>
								<td class="td"><input type="text" name="phone" id="phone" style="width: 297px;height: 40px;"></td>
							</tr>
							<tr>
								<th class="th">매치일정</th>
								<td class="td"><input type="text" name="matchDate" id="matchDate" style="width: 297px;height: 40px;"></td>
								<th class="th">시간선택</th>
								<td class="td"><input type="text" name="matchTime" id="matchTime" style="width: 297px;height: 40px;"></td>
							</tr>
							<tr>
								<th class="th">팀수준</th>
								<td class="td">
									<select name="matchLevel" style="width: 297px;height: 40px;">
										<option>--선택--</option>
										<option value="상">상</option>
										<option value="중상">중상</option>
										<option value="중">중</option>
										<option value="중하">중하</option>
										<option value="하">하</option>
									</select>
								</td>
								<th class="th" >마감여부</th>
								<td class="td" >
									<select name="matchAble" style="width: 297px;height: 40px;">
										<option value="0">가능</option>
										<option value="1">마감</option>
									</select>
								</td>
							<tr>
								<th class="th">매치형식</th>
								<td class="td">
									<select name="matchType" style="width: 297px;height: 40px;">
										<option value="5vs5">5vs5</option>
										<option value="6vs6">6vs6</option>
									</select>
								</td>
								<th  class="th" >매치 가능팀 수</th>
								<td class="td">
									<select name="matchAmount" style="width: 297px;height: 40px;">
										<option value="1">1팀</option>
										<option value="2">2팀</option>
										<option value="3">3팀</option>
									</select>
								</td>
							</tr>
							<tr>
								<th  class="th" colspan="1" >메모</th>
								<td class="td" colspan="3" style="text-align: left;"><textarea rows="5" cols="40" name="memo" style="resize: none;text-align: left;" placeholder="유니폼색상과 메모사항을 적어주세요"></textarea> </td>
							</tr>
						</table>
						<div id="btn-div" style="margin-top: 30px;text-align: center;">
								 <button class="mercenaryBtn" type="submit" style="margin-right: 20px;background-color:#2c3c57;">등록하기</button>
								 <button class="mercenaryBtn" type="reset" style="background-color:gray;">초기화</button>
						 </div>
					</form>
					<div id="table-wraper">
								<div style="margin: 0 auto; margin-top: 30px; margin-bottom: 30px; font-size: 20px;font-weight: bold;text-align: center;">예약정보 확인</div>
									<table id="matchlist-table"  style="width: 100%;">
										<tr style="border-bottom: 1px solid gray;">
											<th class="th">예약번호</th>
											<th class="th">지점</th>
											<th class="th">구장</th>
											<th class="th" colspan="2">예약일</th>
											<th class="th">예약시간</th>
										</tr>
										<!-- 게시판 리스트 출력 포문 -->
										<c:forEach items="${list }" var="r" varStatus="i">
											<tr class="table-tr" onclick="view(${i.index});" style="border-bottom: 1px solid gray;">
												<td class="td">${r.resNo } </td>
												<td class="td">${r.resBName }</td>
												<td class="td">${r.resCName }</td>
												<td colspan="2" class="td">${r.resDate }</td>
												<td class="td">${r.resTime }<input type="hidden" class="res${i.index }" value="${r.resMPhone }"><input type="hidden" class="res${i.index }" value="${r.resBCode }"><input type="hidden" class="res${i.index }" value="${r.resCCode }"></td>
											</tr>
										</c:forEach> 
									</table>
								</div>
							</div>
						</div>
					<div style="width:100%;height:100px;"></div>
				<div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		function view(num){
			$("#bName").val($(".table-tr").eq(num).children().eq(1).text());
			$("#bCode").val($(".res"+num).eq(1).val())
			$("#cCode").val($(".res"+num).eq(2).val())
			$("#cName").val($(".table-tr").eq(num).children().eq(2).text());
			$("#phone").val($(".res"+num).eq(0).val());
			$("#matchDate").val($(".table-tr").eq(num).children().eq(3).text());
			$("#matchTime").val($(".table-tr").eq(num).children().eq(4).text());
			}
	</script>
</body>
</html>