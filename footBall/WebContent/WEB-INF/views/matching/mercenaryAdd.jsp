<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
<script>
	$(document).ready(function(){
		/* 헤더 배경 이미지 */
		$('#menuImg').append('<img src="/img/branch/ground3.jpg" alt="지점 메인 이미지" style="width:100%;max-height:initial;">');
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
						<a class="side_a" id="side_menu1" href="/matching" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">매치</a>
					</div>
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu2" href="/mercenaryRec" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">용병모집</a>
					</div>
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu3" href="/mercenary" style="color:#3366cc;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">용병지원</a>
					</div>
				</div>
				<div style="width:78%;border-left:1px solid silver;display:inline-block;overflow:hidden;">
				<p class="content-header">용병지원</p>
							<div class="underline"></div>
				<form action="/mercenaryAdd" method="post">
						<table id="input-table">
							<tr>
								<th class="th">지점</th>
								<td class="td">
									<select name="Bname" style="width: 300px;height:50px;">
										<option value="">지점선택</option>
										<option value="1">부천지점</option>
										<option value="2">고양지점</option>
										<option value="3">남양주지점</option>
										<option value="4">성남지점</option>
										<option value="5">수원지점</option>
										<option value="6">안양지점</option>
									</select>
								</td>
								<th class="th">구장</th>
								<td class="td">
									<select name="Cname" style="width: 300px;height:50px;">
										<option value="">구장선택</option>
										<option value="1">A구장</option>
										<option value="2">B구장</option>
										<option value="3">C구장</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="th">신청자</th>
								<td class="td"><input type="text" name="name" value="${sessionScope.member.name }" style="width: 297px;height: 40px;"></td>
								<th class="th">연락처</th>
								<td class="td"><input type="text" name="phone" value="${sessionScope.member.phone }" style="width: 297px;height: 40px;"></td>
							</tr>
							<tr>
								<th class="th">매치일정</th>
								<td class="td"><input type="text" name="matchDate" style="width: 297px;height: 40px;" placeholder="ex)2019-01-01"></td>
								<th class="th">시간선택</th>
								<td class="td">
								<select id="select04" name="matchTime" style="width: 300px;height:50px;">
									<option value="">시간 선택</option>
									<option value="10시~11시">10시 ~ 11시</option>
									<option value="11시~12시">11시 ~ 12시</option>
									<option value="12시~13시">12시 ~ 13시</option>
									<option value="13시~14시">13시 ~ 14시</option>
									<option value="14시~15시">14시 ~ 15시</option>
									<option value="15시~16시">15시 ~ 16시</option>
									<option value="16시~17시">16시 ~ 17시</option>
									<option value="17시~18시">17시 ~ 18시</option>
								</select>
								</td>
							</tr>
							<tr>
								<th class="th">팀수준</th>
								<td class="td">
									<select name="recLevel" style="width: 300px;height:50px;">
										<option>--선택--</option>
										<option value="상">상</option>
										<option value="중상">중상</option>
										<option value="중">중</option>
										<option value="중하">중하</option>
										<option value="하">하</option>
									</select>
								</td>
								<th class="th" >마감여부</th>
								<td class="td" ><select name="recAble" style="width: 297px;height: 40px;">
										<option value="0">가능</option>
										<option value="1">마감</option>
									</select></td>
							</tr>
							<tr>
								<th  class="th" >지원인원 수</th>
								<td class="td" >
									<select name="recAmount" style="width: 300px;height:50px;">
										<option value="1">1명</option>
										<option value="2">2명</option>
										<option value="3">3명</option>
										<option value="4">4명</option>
										<option value="5">5명</option>
									</select>
								</td>
								<th class="th" >메모</th>
								<td class="td"  style="text-align: left;"><textarea rows="5" cols="40" name="memo" style="resize: none;text-align: left;" placeholder="유니폼색상과 메모사항을 적어주세요"></textarea> </td>
							</tr>
						</table>
						<div id="btn-div" style="margin-top: 30px;text-align: center;">
								 <button class="btn btn-primary btn-lg" type="submit" style="margin-right: 20px;">등록하기</button>
								 <button class="btn btn-primary btn-lg" type="reset">초기화</button>
						</div>
					</form>
					<div style="width:100%;height:100px;"></div>
				<div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>