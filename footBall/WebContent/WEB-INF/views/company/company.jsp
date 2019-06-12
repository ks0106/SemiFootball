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
<title>KS 회사소개</title>
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
</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!--영상 위 페이지 타이틀 -->
	<div id="title">
		About Us
	</div>
	<section>
	<!-- 내용 작성 -->
		<hr style="border:3px solid #2c3c57;margin:0 auto;margin-bottom:30px;padding:0;">
		<!-- center -->
		<div>
			<div style="width:85%;background-color:white;margin:0 auto;overflow:hidden;">
				<div style="width:20%;height:300px;text-align:left;display:inline-block;float:left;">
					<div style="font-size:30px;font-weight:bolder;color:#2c3c57;margin:0;margin-bottom:10px;">KS Sports</div>
					<hr style="width:80%;border:2px solid #2c3c57;margin-right:20%;padding:0;">
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu1" style="color:#3366cc;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">회사소개</a>
						<ul id="side_pr_menu">
							<li class="side_nav" id="side_menu2"><a href="/company">KS Sports</a></li>
						</ul>
					</div>
					<div style="margin-bottom:15px;">
						<a href="/companyLocation" class="side_a" id="side_menu4" style="color:#2c3c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">오시는 길</a>
					</div>
				</div>
				<div style="width:78%;border-left:1px solid silver;display:inline-block;overflow:hidden;">
					<div style="width:100%;height:400px;">
						<div style="width:50%;margin:0 auto;display:inline-block;float:left;margin-top:100px;">
							<div style="margin-left:80px;font-size:18px;font-weight:bolder;color:#2c3c57;">
								<div style="width:5px;height:30px;float:left;">
									<div style="width:100%;height:80%;background-color:silver;"></div>
									<div style="width:100%;height:20%;background-color:#3366cc;"></div>
								</div>&nbsp;생활 스포츠 대중화, KS가 이끌겠습니다.
							</div>
							<br>
							<div style="margin-left:80px;font-size:15px;color:#2c3c57;text-align:left;">
								KS스포츠는 2010년에 설립되어 생활 스포츠를 전파하고 바쁜 삶을 사는 현대인들의 체력 증진에 도움을 주기 위하여 꾸준히 다양한 변화를 시도하고 있습니다. 2012년부터 자체 대회를 개최하고 있고, 2013년에는 인원수와 시간에 구애받지 않고 운동에만 전념할 수 있도록 용병 시스템을 도입했습니다. 이를 통해 이성용, 기청용, 존 흥민, 앙의조, 조연우와 같은 선수들을 배출함으로써 한국 스포츠의 위상을 높임은 물론 국민생활건강 증진에도 기여하고 있습니다.
							</div>
						</div>
						<div style="width:400px;height:400px;margin:0 auto;overflow:hidden;border-radius:800px;display:inline-block;margin-left:100px;">
							<img src="/img/common/com_spec1.jpg" alt="회사소개1" height="400px">
						</div>
					</div>
					<div style="width:100%;height:400px;">
						<div style="width:400px;height:400px;margin:0 auto;overflow:hidden;border-radius:800px;display:inline-block;margin-left:80px;">
							<img src="/img/common/com_spec2.jpg" alt="회사소개2" height="400px" style="margin-left:-40%;">
						</div>
						<div style="width:50%;margin:0 auto;float:right;">
							<div style="margin-top:100px;font-size:18px;font-weight:bolder;color:#2c3c57;display:inline-block;">
								<div style="width:5px;height:30px;float:left;">
									<div style="width:100%;height:80%;background-color:silver;"></div>
									<div style="width:100%;height:20%;background-color:#3366cc;"></div>
								</div>&nbsp;KS스포츠 토너먼트 리그
							</div>
							<br>
							<br>
							<div style="font-size:15px;color:#2c3c57;text-align:left;">
								KS스포츠가 주최하고 유명 스포츠 기업, 문화체육관광부가 후원하는 'KS토너먼트 리그'는 운동이 부족한 현대인들에게 동기를 부여하고, 미래의 주역인 청소년들의 재능을 발굴함으로써 진취적인 기상을 심어주고자 기획되었습니다. 수많은 대한민국 국민들이 대회를 통해 도전정신을 기르고, 건강한 육체를 유지하여 미래의 글로벌 리더로 성장하기를 기대하는 취지에서 진행하게 되었습니다.
							</div>
						</div>
					</div>
					<div style="width:100%;height:400px;">
						<div style="width:50%;margin:0 auto;display:inline-block;float:left;margin-top:100px;">
							<div style="margin-left:80px;font-size:18px;font-weight:bolder;color:#2c3c57;">
								<div style="width:5px;height:30px;float:left;">
									<div style="width:100%;height:80%;background-color:silver;"></div>
									<div style="width:100%;height:20%;background-color:#3366cc;"></div>
								</div>&nbsp;'기업과 사회가 동반 성장하는 모범'
							</div>
							<br>
							<div style="margin-left:80px;font-size:15px;color:#2c3c57;text-align:left;">
								KS스포츠는 사회의 발전이 곧 기업의 발전이라는 생각을 가지고 회사와 사회가 서로 상생하는 기업경영의 모범을 펼치고자 노력하고 있습니다.
							</div>
							<div style="margin-top:5px;">
								<div style="margin-left:80px;font-size:14px;font-weight:bolder;color:#2c3c57;">
									- 지역사회 공헌
								</div>
								<div style="margin-left:80px;font-size:14px;color:#2c3c57;text-align:left;margin-top:5px;">
									매년 각 사업장에서는 자매결연하고 있는 지역마을을 대상으로 일손을 지원하고 있습니다. 이러한 일손 돕기를 통해 지역사회에 활력을 기하고 경제 지원 및 지역민과 상생하는 경영실천을 꾀하고 있습니다.
								</div>
							</div>							
						</div>
						<div style="width:400px;height:400px;margin:0 auto;overflow:hidden;border-radius:800px;display:inline-block;margin-left:100px;">
							<img src="/img/common/com_spec3.jpg" alt="회사소개3" height="400px">
						</div>
					</div>
					<div style="width:100%;height:100px;"></div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
	$(document).ready(function(){
		/* 헤더 배경 이미지 */
		$('#menuImg').append('<img src="/img/common/test2.jpg" alt="메인 이미지" style="width:100%;max-height:initial; margin-top:-20%; opacity:0.8;">');
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
</body>
</html>