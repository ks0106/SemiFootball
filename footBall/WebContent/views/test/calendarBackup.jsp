<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.GregorianCalendar"%>
<%@ page import="java.util.Locale"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("utf-8");
	String month = request.getParameter("month");
	String years = request.getParameter("years");
	int y;
	int m;
	int d;
	Calendar tDay = Calendar.getInstance();
	if(month == null){
		y = tDay.get(Calendar.YEAR);
		m = tDay.get(Calendar.MONTH);		
	}else{
		y = Integer.parseInt(years);
		m = Integer.parseInt(month);
	}
	d = tDay.get(Calendar.DATE);
	int yCheck = tDay.get(Calendar.YEAR);
	int mCheck = tDay.get(Calendar.MONTH);
	Calendar dSet = Calendar.getInstance();
	dSet.set(y, m, 1);
	int yo = dSet.get(Calendar.DAY_OF_WEEK);
	int last_day = dSet.getActualMaximum(Calendar.DATE);
	System.out.println("last_day값 :"+last_day);	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.0.js"
	integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/common/pageCss.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	$(document).ready(function() {
		$('#prev_month').click(function() {
			<%=m = m - 1%>
			console.log(<%=m%>);
		});
		$('#next_month').click(function() {
			<%=m = m + 1%>
			console.log(<%=m%>);
		});
		$('.future').click(function(){
			$(this).addClass('select-cell');
			$(this).parents('tr').siblings().children('td').removeClass('select-cell');
			$(this).siblings('td').removeClass('select-cell');
		});
	});
</script>
<style>
	.select-cell{
		background-color:#2c3c57;
		color:white;
		font-weight:bold;
	}
	.past{
		font-size:18px;
		width:83px;
		height:68px;
	 	border: 1px solid darkgray;
	 	cursor: pointer;
	 	color:lightgray;
	 }
	 .future{
		font-size:18px;
		width:83px;
		height:68px;
	 	border: 1px solid darkgray;
	 	cursor: pointer;
	 }
</style>
	<!-- js -->
    <style type="text/css">
        td{
            width: 50px;
            height: 50px;
            text-align: center;
            border:2px border-color:#3333FF;
        }
        .this_month{
			font-size: 30px;
			display: inline-block; 
			margin: 0 auto; 
			margin-right: 60px; 
			margin-left: 60px;
        }
    </style>
<body>

	<script type="text/javascript">
	        var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
	        var date = new Date();//today의 Date를 세어주는 역할
	        var yCheck = date.getFullYear();
	        var mCheck = date.getMonth();
	        var dCheck = date.getDate();
	        var checkMonth = new Date(date.getFullYear(),date.getMonth(),date.getDate()-1);
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
	             tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월"; 
	 
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
	             //1일부터 마지막 일까지 돌림
	             	if(doMonth < checkMonth){
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
	<table id="calendar" border="3" align="center" style="border-color:#3333FF ">
	    <tr><!-- label은 마우스로 클릭을 편하게 해줌 -->
	    	<td align="center" colspan="7" style="height:80px;">
				<div id="prev_month" style="width: 40px; height: 40px; display: inline-block; margin: 0 auto;float:left;">
		        	<label onclick="prevCalendar()">
			        	<img src="/img/prev_gray.png" width="30px" height="30px">
		        	</label>
				</div>
	        	<div id="tbCalendarYM" class="this_month">
       		        yyyy년 m월
	        	</div>
				<div id="next_month" style="width: 40px; height: 40px; display: inline-block; margin: 0 auto;float:right;">
		        	<label onclick="nextCalendar()">
			        	<img src="/img/next_gray.png" width="30px" height="30px">
		        	</label>
				</div>
			</td>
	    </tr>
	    <!-- 요일 -->
	    <tr>
	        <td style="font-size:18px;width:83px;height:68px;border: 1px solid darkgray;"><font color ="red">일</td>
	        <td style="font-size:18px;width:83px;height:68px;border: 1px solid darkgray;">월</td>
	        <td style="font-size:18px;width:83px;height:68px;border: 1px solid darkgray;">화</td>
	        <td style="font-size:18px;width:83px;height:68px;border: 1px solid darkgray;">수</td>
	        <td style="font-size:18px;width:83px;height:68px;border: 1px solid darkgray;">목</td>
	        <td style="font-size:18px;width:83px;height:68px;border: 1px solid darkgray;">금</td>
	        <td style="font-size:18px;width:83px;height:68px;border: 1px solid darkgray;">토</td>
	    </tr> 
	</table>
	<!-- 날짜 함수 호출 -->
	<script language="javascript" type="text/javascript">
	    buildCalendar();//
	</script>








	<!-- 기존 코드 -->
	<table width="600px"
		style="background-color: rgb(235, 235, 235); padding: 0; border: 1px solid silver;">
		<tr>
			<td align="center" colspan="7">
				<div id="cal_title"
					style="width: 367px; height: 40px; margin: 0 auto; margin-bottom: 15px;">
					<!-- 이전달 -->
					<div id="prev_month" style="width: 40px; height: 40px; display: inline-block; margin: 0 auto;float:left;">
						<%if(m == 0){ %>
							<a href="/views/test/calendar.jsp?month=<%=m + 11%>&years=<%=y-1%>" target="_self"><img src="/img/prev_gray.png" width="30px" height="30px"></a>
						<%}else{ %>
							<a href="/views/test/calendar.jsp?month=<%=m - 1%>&years=<%=y%>" target="_self"><img src="/img/prev_gray.png" width="30px" height="30px"></a>
						<%} %>
					</div>
					<!-- 이번달 -->
					<div id="this_month"
						style="font-size: 30px; display: inline-block; margin: 0 auto; margin-right: 60px; margin-left: 60px;"><%=y%>. <%=(m + 1)%></div>
					<!-- 다음달 -->
					<div id="next_month" style="width: 40px; height: 40px; cursor: pointer; display: inline-block; margin: 0 auto;float:right;">
						<%if(m == 11){ %>
							<a href="/views/test/calendar.jsp?month=<%=m - 11%>&years=<%=y+1%>" target="_self"><img src="/img/next_gray.png" width="30px" height="30px"></a>
						<%}else{ %>
							<a href="/views/test/calendar.jsp?month=<%=m + 1%>&years=<%=y%>" target="_self"><img src="/img/next_gray.png" width="30px" height="30px"></a>
						<%} %>
					</div>
				</div>
			</td>
		</tr>
		<!-- 요일 -->
		<tr style="text-align: center;">
			<%
			String[] a = { "일", "월", "화", "수", "목", "금", "토" };
			for (int i = 0; i < 7; i++) {%>
			<td style="width:83px;height:68px;font-size:18px;"><%=a[i]%></td>
			<%}%>
		</tr>
		<!-- 첫번째 주 빈공간 -->
		<tr style="text-align: center;">
			<%for (int k = 1; k < yo; k++) {%>
			<td style="border: 1px solid darkgray;width:83px;height:68px;"></td>
			<%}%>
		<!-- 두번째~마지막 주 -->
			<%for (int j = 1; j <= last_day; j++) {%>
				<%if(j != d){ %>
					<%if(j < d){ %>
						<%if(yCheck == y){ %>
							<%if(mCheck == m){ %>
								<td class="past"><%=j%>
							<%}else{ %>
								<%if(mCheck > m){ %>
									<td class="past"><%=j%>
								<%}else{ %>
									<td class="future"><%=j%>
								<%} %>
							<%} %>
						<%}else if(yCheck > y){ %>
							<td class="past"><%=j%>
						<%}else{%>
							<td class="future"><%=j%>
						<%} %>
					<%}else{ %>
						<td class="future"><%=j%>
					<%} %>
				<%}else{ %>
					<%if(yCheck == y){ %>
						<%if(mCheck == m){ %>
						<td class="select-cell future"><%=j%>
						<%}else{ %>
							<%if(mCheck > m){ %>
								<td class="past"><%=j%>
							<%}else{ %>
								<td class="future"><%=j%>
							<%} %>
						<%} %>	
					<%}else if(yCheck > y){ %>
						<td class="past"><%=j%>
					<%}else{%>
						<td class="future"><%=j%>
					<%} %>
				<%} %>
			<%if ((yo + j - 1) % 7 == 0 && j != last_day) {%>
			</td>
		</tr>
		<!-- 마지막 주 빈공간 -->
		<tr style="border: 1px solid darkgray; text-align: center;width:83px;height:68px;">
			<%}
			}%>
		</tr>
	</table>
	
	
	
</body>
</html>
