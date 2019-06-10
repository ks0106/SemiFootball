<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
    <%
    	Member m = (Member)request.getAttribute("member");
    %>
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
	.tab-container{
	  margin:0 auto;
      text-align:center;
      width:100%;
      height:80px;
   }
   .tab-list{
      margin:0;
      padding0;
      height:100%;
      list-style-type: none;
      border-top:3px solid purple;
      border-bottom:1px solid  green;
      padding-left: 0;
   }
   .list-li{
      height: 100%;
      width:33.33%;
      float: left;
      text-align: center;
      line-height: 80px;
      font-size: 40px;
      font-weight: bold;
      border-right: 1px solid  green;
      box-sizing: border-box;
   }
   .list-li:last-child{
      border-right: none;
   }
   .munebar{
      text-decoration: none;
      color : black;
      width:100%;
      height: 100%;
      display: block;
   }
   .selected > .munebar{
      background-color:  green;
    	color:white;
   }
   .list-li>a:hover{
   		background-color:  green;
   		color:white;
   		text-decoration: none;
   }
	.tab-content{
		margin: 0 auto;
		width: 100%;
		text-align: center;
	}
	.content-header{
		color:#403d3f;
		font-size: 40px;
		font-weight:bold;
		margin-bottom:20px;
		margin-top: 0px;
	}
	.underline{
		margin:0 auto;
		width:7%;
		text-align:center;
		border-top:2px solid #bfc4cc;
	}
	
	#matchlist-table{
		border-top:2px solid  green;
		border-bottom:2px solid  green;
		border-collapse: collapse;
		
	}
	#table-wraper{
		margin:0 auto;
		margin-top:30px;
		width: 80%; 
	}
	.tab-con{
		margin:0 auto;
		width: 100%;
	}
	.th{
		padding: 16px;
		border-bottom: 1px solid #d5d8dd;
		height: 60px;
		font-size: 18px;
		font-weight: 700;
		line-height: 21px;
		text-align: center;
	}
	.table-tr td{
		padding: 16px;
		border-bottom: 1px solid #d5d8dd;
		height: 21px;
		font-size: 18px;
		line-height: 21px;
	}
	.table-tr{
		cursor: pointer;
	}
	.table-tr:hover {
		background-color: #F2F2F2;

	}
	

	.selectPage{
		line-height: 50px;
		color: white;
		background-color:  green;
		font-size: 25px;
	}
	
	#matchView{
		position:fixed;
		width: 870px;
		height: 685px;
		margin: 0 auto;
		top: 18%;
		left: 29%;
		background-color: #FFF;
		border-radius: 15px;
		display: none;
		z-index: 1;
	}
	
	
	.view-table-div{
	
		margin: 0 auto;
		width: 100%;
		height:70%;
		margin-top: 30px;
	}
	
     .page_area{
     	width: 100%;
     	height: 130vh;
     }
     #able{
     	width: 50px;
     	height: 35px;
     	border-radius: 5px;
     	background-color: green;
     	color:white;
     }
     #disable{
     width: 50px;
     	height: 35px;
     	border-radius: 5px;
     	background-color: red;
     	color:white;
     }
    input{
    	height: 20px;
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
		MyPage
	</div>
	<section>
	<!-- 내용 작성 -->
		<hr style="border:3px solid #2c3c57;margin:0 auto;margin-bottom:30px;padding:0;">
		<!-- center -->
		
			<div style="width:85%;background-color:white;margin:0 auto;overflow:hidden;">
				<div style="width:20%;height:300px;text-align:left;display:inline-block;float:left;">
					<div style="font-size:30px;font-weight:bolder;color:#2c3c57;margin:0;margin-bottom:10px;">MyPage</div>
					<hr style="width:80%;border:2px solid #2c3c57;margin-right:20%;padding:0;">
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu1" style="color:#3366cc;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">계정관리</a>
					</div>
					<div style="margin-bottom:15px;">
						<a class="side_a" id="side_menu2" href="/reservationsList" style="color:#2c5c57;font-weight:bolder;font-size:18px;text-decoration:none;cursor:pointer;">결제내역</a>
					</div>
					
				</div>
			
		<div id="divpwd" style="width:78%;height:500px; border-left:1px solid silver;display:inline-block;overflow:hidden; ">
				<div class="tab-content" >
	            <!-- 탭컨텐츠 제목 -->
	               		<br><br><br>
						<p class="content-header">비밀번호 재확인</p>
						<div class="underline"></div>
						<!-- 글쓰기 버튼 -->
						<div class="btn-wrapper" style="margin: 0 auto; margin-top:50px;margin-bottom:0px; text-align:center;width: 100%;">
							<div style="width: 90%;padding-left: 70px;">
								
									<input type="password" id="checkpwd" name="pwd" style="width: 300px;height:40px;left: 300px;">
									<button type="button" id="pwd" style="border:none;background-color: green;width: 50px;height: 45px;color:white;">									
										<span style="color:white;height:80%;width: 100%;display: inline;font-size: 15px; vertical-align:middle; "> 확인 </span> 
									</button>
								
							</div>
						</div>
					</div>
			</div>
			<script type="text/javascript"> //비밀번호 확인하는 if문
				$("#pwd").click(function () {
					var pwd1 = '${member.pwd}';
					var pwd = $("#checkpwd").val();
					if(pwd1==pwd){
						$("#divpwd").css("display","none");
						$("#mypage").css("display","block");
					}else{
						alert("비밀번호가 일치하지 않습니다.");
					}
				});
				
			</script>
				<div id="mypage" style="width:78%;border-left:1px solid silver;display:inline-block;overflow:hidden;display: none;">
					<div class="tab-content" >
	            <!-- 탭컨텐츠 제목 -->
	               			<br><br><br>
							<p class="content-header">계정 관리</p>
							<div class="underline"></div>
							
							<!-- 매치 게시판 출력 테이블 -->
								<div id="table-wraper">
									<form action="/updateMember" method="post">
										<input type="hidden" name="id" value="${member.id }">
									<table id="matchlist-table"  style="width: 100%;">
										<tr>
											<th class="th">아이디</th>
											<th class="th">${member.id } </th>
											<th class="th">이름</th>
											<th class="th">${member.name } </th>
										</tr>
										<tr>
											<th class="th">비밀번호</th>
											<th class="th" ><input type="password" id="repwd"  value="${member.pwd }"><br><span id="extext1"></span></th>
											<th class="th">비밀번호 재확인</th>
											<th class="th"><input type="password" id="repwd1" name="repwd" value="${member.pwd }"><br><span id="extext2"></span></th>	
										</tr>
										<tr>
											<th class="th">아이디 찾기 힌트</th>
											<th class="th">
												<select name="pwdHint">
								           			<option>선택하세요</option>
								           			<option value="가장 좋아하는 색상">가장 좋아하는 색상</option>
								           			<option value="가장 좋아하는 연예인">가장 좋아하는 연예인</option>
								           			<option value="내가 나온 초등학교 이름">내가 나온 초등학교 이름</option>
								           		</select>
											</th>
											<th class="th">아이디 찾기 정답</th>
											<th class="th">
												<input type="text" name="pwdHintAnswer" value="${member.pwdHintAnswer }">
											</th>																						
										</tr>
										<tr>
											<th class="th" >휴대전화</th>
											<th class="th" >
												<input type="text" name="phone" id="phone" value="${member.phone }" style="width:150px;"><br>
												<span id="extext4"></span>
											</th>
											<th class="th">가입일</th>
											<th class="th">${member.enrollDate }</th>
										</tr>
									</table>
										<br>
						           		<input type="reset" value="취소하기" class="button1" onclick="rset();"style="border:none;background-color: green;width: 150px;height: 50px;color:white;">
						           		<input type="submit" value="수정하기" class="button1" id="btn1" style="border:none;background-color: green;width: 150px;height: 50px;color:white;">
									</form>
								</div>
	               		</div>
					<div style="width:100%;height:100px;"></div>
				</div>
			</div>
	</section>
	<script>
 		var result =[true,true,true]
 		$(document).ready(function() {
 			var option = '${member.pwdHint}';
 			$("option").each(function () {
				if($(this).val()==option){
					$(this).prop("selected",true);
				}
			});
			
			$("#repwd").blur(function () {
				var pwd = $("#repwd").val();
				var text = /^[a-z][a-z0-9]{5,17}$/i;
				if(pwd==''){
					$('#extext1').html('');
				}else{
					if(!text.test(pwd)){
						$("#extext1").html('영어 대/소문자+숫자 6~18');
						$("#extext1").css('color','red');
						$("#extext1").css('fontSize','15px');
						result[0]=false;
						return false;
					}else{
						$('#extext1').html('');
						
						return true;
					};
					
				};
			});
			
			$('#repwd1').blur(function () {
				var pwd = $('#repwd').val();
				var pwd1 = $('#repwd1').val();
				if(pwd1==''){
					$('#extext2').html('');
				}else{					
					if(!(pwd==pwd1)){
						$('#extext2').html('비밀번호를 확인하세요');
						$('#extext2').css('color','red');
						$("#extext2").css('fontSize','15px');
						result[1]=false;
						return false;
					}else{
						$('#extext2').html('');
						
						return true;
					};				
				}
			});
			
			
			
			$('#phone').blur(function () {
				var phone = $('#phone').val();
				var text = /^[0-9]{3}-[0-9]{3,4}-[0-9]{3,4}$/;
				if(phone==''){
					$('#extent4').html('');
				}else{
					if(!text.test(phone)){
						$('#extext4').html('첫번째는2~3개숫자,두번째는 3~4개숫자');
						$('#extext4').css('color','red');
						$("#extext4").css('fontSize','15px');
						result[2]=false;
						return false;
					}else{
						$('#extext4').html('');
						
						return true;
					};
				};
			});
			
			$('#btn1').click(function(event){
	               for(var i=0;i<result.length;i++){
	                    console.log(result[i]);
	                        if(!result[i]){
	                            alert("입력을 확인하세요");
	                            event.isDefaultPrevented;
	                            return false;
	                        };
	                };
	        });
		});
 	</script>   
 	<script>
 		function rset() {
 			$('#extext1').html('');
 			$('#extext2').html('');
 			$('#extext4').html('');
		}
 	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
				