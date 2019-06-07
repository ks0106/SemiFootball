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
						<a class="side_a" id="side_menu1" href="/matching" style="color:#2c5c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">매치</a>
					</div>
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu2" style="color:#3366cc;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">용병모집</a>
					</div>
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu3" href="/mercenary" style="color:#2c5c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">용병지원</a>
					</div>
				</div>
				<div style="width:78%;border-left:1px solid silver;display:inline-block;overflow:hidden;">
				<p class="content-header">용병지원</p>
							<div class="underline"></div>
				<form action="/matchApply" method="post">
						<table id="input-table">
							<tr>
								<th class="th">지점</th>
								<td class="td">
									<select name="Bname" style="width: 300px;height:50px;">
										<option value="">지점선택</option>
										<option value="부천점">부천지점</option>
										<option value="고양점">고양지점</option>
										<option value="남양주점">남양주지점</option>
										<option value="성남점">성남지점</option>
										<option value="수원점">수원지점</option>
										<option value="안양점">안양지점</option>
									</select>
								</td>
								<th class="th">구장</th>
								<td class="td">
									<select name="Cname" style="width: 300px;height:50px;">
										<option value="">구장선택</option>
										<option value="A">A구장</option>
										<option value="B">B구장</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="th">신청자</th>
								<td class="td"><input type="text" name="name" style="width: 297px;height: 40px;"></td>
								<th class="th">연락처</th>
								<td class="td"><input type="text" name="phone1" style="width: 88px;height: 40px;">-<input type="text" name="phone2" style="width: 88px;height: 40px;">-<input type="text" name="phone3" style="width: 88px;height: 40px;"></td>
							</tr>
							<tr>
								<th class="th">매치일정</th>
								<td class="td"><input type="text" name="matchDate" style="width: 297px;height: 40px;"></td>
								<th class="th">시간선택</th>
								<td class="td"><input type="text" name="matchTime" style="width: 297px;height: 40px;"></td>
							</tr>
							<tr>
								<th class="th">유니폼 색상</th>
								<td class="td">
									<input type="text" name="phone1" style="width: 80px;height: 40px;" placeholder="상의">-
									<input type="text" name="phone2" style="width: 80px;height: 40px;" placeholder="하의">-
									<input type="text" name="phone3" style="width: 80px;height: 40px;" placeholder="스타킹">
								</td>
								<th class="th">팀수준</th>
								<td class="td"><input type="text" name="matchLevel" style="width: 297px;height: 40px;"></td>
							</tr>
								<th class="th">매치일정</th>
								<td class="td"><input type="text" name="matchDate" style="width: 297px;height: 40px;"></td>
								<th class="th">시간선택</th>
								<td class="td"><input type="text" name="matchTime" style="width: 297px;height: 40px;"></td>
							</tr>
							<tr>
								<th class="th" colspan="1">마감여부</th>
								<td class="td" colspan="3"><input type="text" name="matchLevel" style="width: 297px;height: 40px;"></td>
							</tr>
							<tr>
								<th colspan="4" class="th" >메모</th>
							</tr>
							<tr>
								<td class="th" colspan="4" rowspan="4"><textarea rows="5" cols="100" style="resize: none;text-align: center;"></textarea> </td>
							</tr>
						</table>
						<div id="btn-div" style="margin-top: 30px;"><button class="btn btn-primary btn-lg" type="submit" style="margin-right: 20px;">등록하기</button> <button class="btn btn-primary btn-lg" type="reset">초기화</button></div>
					</form>
					
					
					<div style="width:100%;height:100px;"></div>
				<div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>