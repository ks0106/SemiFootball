<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/common/pageCss.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	.select-cell{
		background-color:#2c3c57;
		color:white;
		font-weight:bold;
		text-align:center;
	}
	.past{
		font-size:18px;
		width:78px;
		height:63px;
	 	border: 1px solid darkgray;
	 	cursor: pointer;
	 	color:lightgray;
		text-align:center;
	 }
	.future{
		font-size:18px;
		width:78px;
		height:63px;
		border: 1px solid darkgray;
		cursor: pointer;
		text-align:center;
	}
/* js달력 css */
	.this_month{
		font-size: 30px;
		display: inline-block; 
		margin: 0 auto; 
		margin-right: 60px; 
		margin-left: 60px;
	}
	.week{
		font-size:18px;
		width:78px;
		height:63px;
		text-align:center;
	}
</style>
<body>
<!-- jquery -->

<!-- js -->
	<script type="text/javascript">
	        var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
	        var date = new Date();//today의 Date를 세어주는 역할
	        var yCheck = date.getFullYear();
	        var mCheck = date.getMonth();
	        var dCheck = date.getDate();
	        var checkMonth = new Date(date.getFullYear(),date.getMonth(),date.getDate());
	        function prevCalendar() {//이전 달
	        // 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
	        //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
	        //getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
	         today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
	         buildCalendar(); //달력 cell 만들어 출력 
	        }
	 
	        function nextCalendar() {//다음 달
	            // 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
	            //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
	            //getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
	            /* 마지막 날에 다음달로 넘기면 두 달 넘어가는 현상 today.getDate()에 -1을 해서 해결함 */
	             today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate()-1);
	             buildCalendar();//달력 cell 만들어 출력
	        }
	        function buildCalendar(){//현재 달 달력 만들기
	            var doMonth = new Date(today.getFullYear(),today.getMonth(),1);
	            //이번 달의 첫째 날,
	            //new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
	            //new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
	            //왜냐면 getMonth()는 0~11을 반환하기 때문
	            var lastDate = new Date(today.getFullYear(),today.getMonth()+1,0);
	            //이번 달의 마지막 날
	            //new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
	            //day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
	            //대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
	            var tbCalendar = document.getElementById("calendar");
	            //날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
	            var tbCalendarYM = document.getElementById("tbCalendarYM");
	            //테이블에 정확한 날짜 찍는 변수
	            //innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
	            //new를 찍지 않아서 month는 +1을 더해줘야 한다. 
	            if(today.getMonth()+1 > 9){
		             tbCalendarYM.innerHTML = today.getFullYear() + "." + (today.getMonth() + 1); 
	            }else{
		             tbCalendarYM.innerHTML = today.getFullYear() + ".0" + (today.getMonth() + 1); 	            	
	            }	 
	             /*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
	            while (tbCalendar.rows.length > 2) {
	            //열을 지워줌
	            //기본 열 크기는 body 부분에서 2로 고정되어 있다.
	                  tbCalendar.deleteRow(tbCalendar.rows.length-1);
	                  //테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
	                //30일 이후로 담을달에 순서대로 열이 계속 이어진다.
	             }
	             var row = null;
	             row = tbCalendar.insertRow();
	             //테이블에 새로운 열 삽입//즉, 초기화
	             var cnt = 0;// count, 셀의 갯수를 세어주는 역할
	            // 1일이 시작되는 칸을 맞추어 줌
	             for (i=0; i<doMonth.getDay(); i++) {
	             /*이번달의 day만큼 돌림*/
	             /* 앞자리 빈공간 만듦 */
	                  cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
	                  cell.className = 'past';
	                  cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
	             }
	            /*달력 출력*/
	             for (i=1; i<=lastDate.getDate(); i++) { 
	     	        var testMonth = new Date(today.getFullYear(),today.getMonth(),i);
	             //1일부터 마지막 일까지 돌림
	             	if(testMonth < checkMonth){
		                  cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
		                  cell.className = 'past';
		                  cell.innerHTML = i;//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
		                  cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
	             	}else{
		                  cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
		                  cell.className = 'future';
		                  cell.innerHTML = i;//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
		                  cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할	             		
	             	}
	              if (cnt % 7 == 1) {/*일요일 계산*/
	                  //1주일이 7일 이므로 일요일 구하기
	                  //월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
	                cell.innerHTML = "<font color=red>" + i
	                //1번째의 cell에만 색칠
	            }    
	              if (cnt%7 == 0){/* 1주일이 7일 이므로 토요일 구하기*/
	                  //월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
	                  cell.innerHTML = i
	                  //7번째의 cell에만 색칠
	                   row = calendar.insertRow();
	                   //토요일 다음에 올 셀을 추가
	              }
	              /*오늘의 날짜 표시*/
	              if (today.getFullYear() == date.getFullYear()
	                 && today.getMonth() == date.getMonth()
	                 && i == date.getDate()) {
	                  //달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
	                //cell.bgColor = "#FAF58C";//셀의 배경색을 노랑으로 
	                cell.classList.add('select-cell');
	                cell.classList.add('future');
	                cell.classList.remove('past');
	               }
	            }
	        }
	</script>
	</head>
	<body>
	<table id="calendar" align="center" style="background-color:rgb(240,240,240);">
	    <tr><!-- label은 마우스로 클릭을 편하게 해줌 -->
	    	<td align="center" colspan="7" style="height:80px;">
				<div onclick="prevCalendar()" id="prev_month" style="width: 84px; height: 84px; display: inline-block; margin: 0 auto;float:left;cursor:pointer;">
		        	<img src="/img/prev_gray.png" width="30px" height="30px" style="margin-top:25px;">
				</div>
	        	<div id="tbCalendarYM" class="this_month" style="margin-top:18px;">
       		        yyyy.mm
	        	</div>
				<div onclick="nextCalendar()" id="next_month" style="width: 84px; height: 84px; display: inline-block; margin: 0 auto;float:right;cursor:pointer;">
		        	<img src="/img/next_gray.png" width="30px" height="30px" style="margin-top:25px;">
				</div>
			</td>
	    </tr>
	    <!-- 요일 -->
	    <tr>
	        <td class="week"><font color ="red">일</td>
	        <td class="week">월</td>
	        <td class="week">화</td>
	        <td class="week">수</td>
	        <td class="week">목</td>
	        <td class="week">금</td>
	        <td class="week">토</td>
	    </tr> 
	</table>
	<!-- 날짜 함수 호출 -->
	<script language="javascript" type="text/javascript">
	    buildCalendar();//
	</script>	
	
	<script>
		$(document).on("click",".future",function(){
			$(this).addClass('select-cell');
			$(this).parents('tr').siblings().children('td').removeClass('select-cell');
			$(this).siblings('td').removeClass('select-cell');
		});
	</script>

</body>
</html>
