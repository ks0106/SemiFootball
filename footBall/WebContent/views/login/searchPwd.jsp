<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KS 비밀 번호 찾기</title>
<script
	src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous">
</script>
<!-- 로그인 공통css -->
<link rel="stylesheet" href="/css/login/loginAll.css">
<!-- 아이디/패스워드 찾기 공통css -->
<link rel="stylesheet" href="/css/login/loginSearchAll.css">
</head>
	<style>
	  	/* 스크롤바 제어 */
		body{
			overflow:hidden;
		}
        .countTimeTxt{
        	color:gray;
        }
        .countTimeMinute{
        	color:gray;
        }
        .countTimeSecond{
        	color:gray;
        }



        
	</style>
<body>
	<div>
		<div style="text-align:center;">
			<img  src="/img/header_logo.png" style="width:100px;">
		</div>
		<div id="pwdsearch">
	        <form>
	        	<table>
	        		<tr>
	        			<td colspan="2" style="text-align: center;"><h2>비밀번호 찾기</h2></td>
	        		</tr>
	        		<tr>
	        			<td class="searchTdTitle">이름</td>
	        		</tr>
	        		<tr>
		        		<td><input class="searchInput" type="text" name="name" id="name"></td>
	        		</tr>
	        		<tr>
	        			<td class="searchTdTitle">아이디</td>
	        		</tr>
	        		<tr>
		        		<td><input class="searchInput" type="text" name="id" id="id" ></td>
	        		</tr>
	        	</table>
				<div style="text-align:center;">
		        	<input type="reset" value="취소" class="resetBtn">
		        	<input type="button" value="인증" id="sub"  class="okBtn">
			        <br>
		        	<div id="mint">
			        	<span class="countTimeMinute" ></span><span class="countTimeTxt">분</span>
			         	<span class="countTimeSecond" ></span><span class="countTimeTxt">초</span>
		        	</div>
		        </div>
	         	<div id="layerPopup">
			      <p id="checkMsg">인증 시간이 초과 되었습니다.</p>
			      <button type="button" class="closeBtn">닫기</button>
			    </div>
	        </form>
		</div>
        	
		<form>
        	<table id="pwd" style="visibility: hidden;">
        		<tr>
        			<td colspan="2" style="text-align: center;"><h2>비밀번호 변경</h2></td>
        		</tr>
        		<tr>
        			<td style="text-align: right;" colspan="3"><span id="extext1"></span></td>
        		</tr>
        		<tr>
        			<td class="searchTdTitle">비밀번호</td>
        		</tr>
        		<tr>
        		<td><input class="searchInput" type="password" name="repwd" id="repwd"></td>
        		</tr>
        		<tr>
        			<td style="text-align: right;" colspan="3"><span id="extext2"></span></td>
        		</tr>
        		<tr>
        			<td class="searchTdTitle">비밀번호 재입력</td>
        		</tr>
        		<tr>
	        		<td><input class="searchInput" type="password" name="repwd1" id="repwd1"></td>
        		</tr>
        	</table>
			<div style="text-align:center;">
     	 			<input type="reset" value="취소" class="resetBtn">
       			<input type="button" value="확인" id="researchpwd" class="okBtn">
  			</div>        	
		</form>
        	<input type="hidden" id="randomNum" value="1"> <!--ajax로 servlet호출한뒤 servlet에서 받은 난수 저장용 -->
        	<input type="hidden" id="randomNum1" value="2"> <!--메일에서 jsp호출해서 웹소켓 에서 받은 난수 저장용 -->
        	
        <!--  <fieldset>
		<textarea rows="10" cols="50" readonly="true" id="messageWindow"></textarea>
			<br/>
			<input id="inputMessage" type="text"/>
			<input type="submit" value="send" onclick="send()" />
		</fieldset>-->
        
		</div>
	
	<script type="text/javascript"> //비밀번호 찾기 아작스 호출
		
		$("#sub").click(function () {
			var name = $("#name").val();
			 id = $("#id").val();
			
			$.ajax({
					url : "/searchPwd",
					data : {name:name,id:id},
					method: "POST",
					dataType : "json",
					success : function (data) {
							if(data==null){								
								alert("일치하는 회원이 없습니다.");
								opener.location.href="/views/login/login.jsp";
								self.close();
							}else{
							 	$("#randomNum").val(data);
								alert("입력하신 이메일로 인증 전송");
								$check();
								//webSocket.send($("#randomNum").val());
							 
							}
					
							
					},
					erorr : function () {
						
					}
			
				});
			
			});
		
		$("#researchpwd").click(function () { //비밀번호 변경
			var repwd = $("#repwd").val();
			
			$.ajax({
				url : "/reSearchPwd",
				data : {repwd:repwd,id:id},
				method: "POST",
				dataType : "json",
				success : function (data) {
						if(data==0){	
							alert("비밀번호 변경 실패.");
							opener.location.href="/views/login/login.jsp";
							self.close();
						}else{	 	
							alert("비밀번호 변경 성공");
							self.close();
						}	
				},
				erorr : function () {
					
				}
		
			});
		});
	</script>
	<script type="text/javascript"> //비밀번호 재변경 정규식
		var result = [false,false];
		$(document).ready(function () {
			$("#layerPopup").hide(); //인증초과 div태크 숨김
			$("#mint").hide();//인증시간 분 span태그 숨김
			
			
			$("#repwd").blur(function () {
				var pwd = $("#repwd").val();
				var text = /^[a-z][a-z0-9]{5,17}$/i;
				if(pwd==''){
					$('#extext1').html('');
				}else{
					if(!text.test(pwd)){
						$("#extext1").html('영어 대/소문자+숫자 6~18자리');
						$("#extext1").css('color','red');
						$("#extext1").css('font-size','15px');
						
						return false;
					}else{
						$('#extext1').html('');
						result[1]='true';
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
						$('#extext2').html('비밀번호가 일치하지 않습니다.');
						$('#extext2').css('color','red');
						$('#extext2').css('font-size','15px');
						return false;
					}else{
						$('#extext2').html('');
						result[2]='true';
						return true;
					};				
				}
			});
			$('#pwdsub').click(function(event){
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
	<script type="text/javascript"> //웹소켓 연결 
		var random = document.getElementById("randomNum1");
		var webSocket = new WebSocket('ws://192.168.10.58:80/footBall/broadcasting');
		var inputMessage = document.getElementById('inputMessage');
		webSocket.onerror = function (event) {
			onError(event)
		};
		webSocket.onopen = function (event) {
			onOpen(event)
		};
		webSocket.onmessage = function (event) {
			onMessage(event)
		};
		function onMessage(event) {
			//textarea.value += "상대 :"+event.data+"\n";
			random.value = event.data; 
			$val();
		}
		function onOpen(event) {
			//textarea.value += "연결 성공\n ";
		}
		function onError(event) {
			alert(event.data);
		}
		function send() {
			//1111111
			textarea.value += "나 :" + inputMessage.value + "\n";
			webSocket.send(inputMessage.value);
			inputMessage.value="";
		}
		
	</script>
	<script type="text/javascript">
		
		$check = function (){
			$("#mint").show();//인증시간 분 span태그 show
	      var minute = 1;
	      var second = 59;
	      
	      $(".countTimeMinute").html(minute);
	      $(".countTimeSecond").html(second);
	   
	        timer = setInterval(function(){
	         $(".countTimeMinute").html(minute);
	         $(".countTimeSecond").html(second);
	        
	         if(second == 0 && minute == 0){
	            $("#layerPopup p").html("인증 시간이 초과 되었습니다.");
	            $("#layerPopup").show();
	            clearInterval(timer);
	            //self.close();
	         }else{
	            second--;
	            
	            if(second < 0){
	               minute--;
	               second = 59
	            }
	         }
	      },1000);   
	  	
		}
   
	   $("#layerPopup button").click(function(){
	       $("#layerPopup").hide();
	          self.close();
	       
	   });
				$val = function () {
					
					var randomNum = $("#randomNum").val();
					var randomNum1 = $("#randomNum1").val();
						console.log(randomNum);
						console.log(randomNum1);
					if(randomNum==randomNum1){
						
						$("#pwd").css("visibility","visible");
						$("#mint").hide();
						clearInterval(timer);
						$("#pwdsearch").hide();
				}
				};
			
	</script>
</body>
</html>