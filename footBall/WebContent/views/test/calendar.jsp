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
<body>
	<!-- 기존 코드 -->
	<table width="600px;"
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
