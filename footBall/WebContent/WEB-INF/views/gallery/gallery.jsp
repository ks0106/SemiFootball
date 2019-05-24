<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 동영상CSS  -->
<link rel="stylesheet" href="/css/common/pageCss.css">

</head>
<body>
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!--헤더 밑 영상  -->
	<div id="continer">
	<div id="mv">
		<video id="video01" class="pblock" autoplay playsinline muted loop title> 
			<source src="/img/page3.mp4" type="video/mp4"> 
		</video>
	</div>
	<!--영상 위 페이지 타이틀 -->
		<div id="title">
			갤러리
		</div>
	</div>
	<!-- 내용 -->
	<section class="page_area">
		<div style="width:80%; margin:0 auto; text-align:center">
			<div id="photo-wrapper" style = "padding:100px"></div>
			<div id="photo-btn-container">
				<button currentCount="0" totalCount="${totalCount }" value="" id="more-btn" >더보기</button>
				<c:if test="${not empty sessionScope.member}">
					
				</c:if>
				<button id="write-btn">글쓰기</button>
			</div>
		</div>
	</section>
	<script>
		$("#write-btn").click(function(){
			location.href="/galleryWriteFrm";
		});//글 작성 페이지로 이동
		
		$(document).ready(function(){
			fn_more(1);
			$("#more-btn").click(function(){
				fn_more($(this).val());
			});
		}); //누를때마다 5개씩 더 보여줌
		
		function fn_more(start){
			var param = {start:start};
			$.ajax({
				url : "/photoMore",
				data : param,
				type : "post",
				dataType : "json",
				success : function(data){ // 포토 객체를 5개 받아옴 (리스트 형태)
					var html = "";
					for(var i in data){
						var p = data[i]; //포토 객체를 p에 저장
						html += "<div style = 'width: 800px; margin:0 auto;'>";
						html += "<img src='/upload/photo/"+p.filename+"' width: '100%'>";
						html += "<p class='caption'>"+p.photoContent+"</p></div>";
					}
					// 사진 출력
					$("#photo-wrapper").append(html);
					//value, currentCount 세팅
					$("#more-btn").val(Number(start)+5);
					$("#more-btn").attr("currentCount", Number($("#more-btn").attr("currentCount"))+data.length); // 현재값을 가져와서 넘어온 데이터의 길이를 더함
					// totalCount와 currentCount값을 비교 마지막에 더보기 버튼 비활성화를 위함.
					var totalCount = $("more-btn").attr("totalCount");
					var crrentCount = $("#more-btn").attr("currentCount");
					if(totalCount == currentCount){
						$("#more-btn").attr("idsabled", true);
						$("#more-btn").css("cursor", "not-allowed"); //마우스가 버튼에 올려왔을때 마우스 포인터 모양을 바꿈
					}
				},
				error : function(){
					console.log("ajax 처리 실패");
				}
			});
		}
	</script>
</body>
</html>