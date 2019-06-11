<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KS 이용 약관</title>
	<script
      src="http://code.jquery.com/jquery-3.4.0.slim.min.js"
      integrity="sha256-ZaXnYkHGqIhqTbJ6MB4l9Frs/r7U4jlx7ir8PJYBqbI="
      crossorigin="anonymous">
    </script>
<!-- 로그인 공통css -->
<link rel="stylesheet" href="/css/login/loginAll.css">
</head>
	 <style>
        #maindiv{
            text-align: center;
            position: relative;
            margin: 0 auto;
            width: 100%;
        }
        #div{
            /*position: absolute;
            top: 100px;
            left: 600px;*/
            max-width : 600px;
            margin : 0 auto;
            padding-top :100px;
            text-align:center;
        }
        input[type=checkbox] { display:none; }
		
		input[type=checkbox] + label { 
		
		display: inline-block; 
		
		cursor: pointer; 
		
		line-height: 22px; 
		
		padding-left: 22px; 
		
		background: url('/img/checkbox3.png') left/22px no-repeat; 
		
		}
		
		input[type=checkbox]:checked + label { background-image: url('/img/checkbox4.png'); }
		
		.t_wrap{
			margin : 0 auto;
			width: 600px;
			height:150px;
			border: 1px solid black;
			overflow-y: scroll;
			text-align: left;
			background-color: white;
			font-size: 13px;
			
		}
		.button{
			background-color:#2c3c57;
			width: 100px;
			height: 50px; 
			border:none;
			color:white;
			font-size:16px;
		}
		
		
		form{
			text-align: left;
		}
		.div{
			margin: 0 auto;
			text-align: center;

		}

    </style>
<body>
	<div style="height:900px;" id="maindiv">
        <div id="div">
          	<a href="/"><img src="/img/header_logo.png" style="margin-bottom: 50px;"></a><br>
          	<form action="/views/login/insert1.jsp" method="post">
          	
          	<input type="checkbox" id="box1" onclick="checkAll();" class="checkbox"><label for="box1"><h3>이용약관,개인정보 수집 및 이용,개인정보취급위탁에 모두 동의함.</h3></label><br>
			<input type="checkbox" id="box2" name="checkRow" class="checkbox"><label for="box2"><h3>KS풋살파크 홈페이지 이용약관 안내(필수)</h3></label>
			
			<div class="t_wrap">
							<p>제 1 장 총 칙</p>
							<p class="mt">제 1 조 (목적) </p>
							<p>이 약관은 전기 통신 사업 법령 및 정보 통신망 이용 촉진등에 관한 법령에 의하여 HM스포츠 (이하 "회사"라 한다)가 제공하는 홈페이지 서비스(이하 "서비스"라 한다)의 이용조건 및 절차에 관한 사항을 규정함을 목적으로 합니다.</p>
							<p class="mt">제 2 조 (약관의 공지 및 준용)</p>
							<p>①이 약관의 내용은 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력을 발생합니다. </p>
							<p>②회사는 이 약관을 임의로 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지함으로써 효력을 발생합니다.</p>
							<p class="mt">제 3 조 (약관 외 준칙) </p>
							<p>이 약관에 명시되지 않은 사항은 전기 통신 기본법,전기 통신 사업법, 정보 통신망 이용촉진등에 관한 법률 및 기타 관련법령의 규정에 의합니다.</p>
							<p class="mt">제 4 조 (용어의 정의) </p>
							<p>이 약관에서 사용하는 용어의 정의는 다음과 같습니다. </p>
							<p>-회원 : 회사와 서비스 이용계약을 체결하고 이용자 아이디를 부여받은 자. </p>
							<p>-아이디(ID) : 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 문자와 숫자의 조합</p>
							<p>-비밀번호 : 회원의 비밀 보호를 위해 회원 자신이 설정한 문자와 숫자의 조합 </p>
							<p>-운영자 : 서비스의 전반적인 관리와 원활한 운영을 위하여 회사에서 선정한 사람 </p>
							<p>-해지 : 회사 또는 회원이 서비스 개통 후 이용계약을 해약 하는 것</p>
							<p>제 2 장 서비스 이용계약</p>
							<p class="mt">제 5 조 (이용계약의 성립) </p>
							<p>-"이용약관에 동의 하십니까?" 라는 이용신청시의 물음에 회원이 "예" 단추를 누르면 이 약관에 동의하는 것으로 간주됩니다. </p>
							<p>-이용계약은 회원의 이용신청에 대하여 회사가 심사 후 승낙함으로써 성립합니다.</p>
							<p class="mt">제 6 조 (이용신청) </p>
							<p>-이용신청은 온라인으로 회사 소정의 가입신청 양식에서 요구하는 사항을 기록하여 신청합니다. </p>
							<p>-온라인 가입신청 양식에 기재하는 모든 회원 정보는 실제 데이터인 것으로 간주하며 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며, 서비스 사용의 제한을 받을 수 있습니다.</p>
							<p class="mt">제 7 조 : 회원정보 사용에 대한 동의</p>
							<p>-회원의 개인 정보에 대해서는 회사의 개인정보 보호정책이 적용됩니다.</p>
							<p>-회사가 제6조에 따라 신청서에 기재를 요구하는 회원의 개인정보는 본 이용계약의 이행과 본 이용계약상의 서비스제공을 위한 목적으로 이용합니다. </p>
							<p>-회원이 회사 및 회사와 제휴한 서비스들을 편리하게 이용할 수 있도록 하기 위해 회원 정보는 회사와 제휴한 업체에 제공될 수 있습니다. 단, 회사는 회원 정보 제공 이전에 제휴 업체, 제공 목적, 제공할 회원 정보의 내용 등을 사전에 공지하고 회원의 동의를 얻어야 합니다. </p>
							<p>-회원은 회원정보 수정을 통해 언제든지 개인 정보에 대한 열람 및 수정을 할 수 있습니다.</p>
							<p>-회원이 이용신청서에 회원정보를 기재하고, 회사의 본 약관에 따라 이용신청을 하는 것은 회사가 본 약관에 따라 이용신청서에 기재된 회원정보를 수집, 이용 및 제공하는 것에 동의하는 것으로 간주됩니다.</p>
							<p class="mt">제 8 조 (이용신청의 승낙) </p>
							<p>-회사는 회원이 제 6 조에서 정한 모든 사항을 정확히 기재하여 이용신청을 하였을 때 제2호, 제3호의 경우를 예외로 하여 승낙할 수 있습니다. </p>
							<p>-회사는 다음 각 호의 1에 해당하는 이용신청에 대하여는 승낙을 유보할 수 있습니다. </p>
							<p>㉮설비에 여유가 없는 경우 </p>
							<p>㉯기술상 지장이 있는 경우 </p>
							<p>㉰기타 회사의 사정상 이용승낙이 곤란한 경우 </p>
							<p>③회사는 다음 각 호의 1에 해당하는 이용신청에 대하여는 이를 승낙하지 아니 할 수 있습니다. </p>
							<p>㉮이름이 실명이 아닌 경우 </p>
							<p>㉯다른 사람의 명의를 사용하여 신청한 경우 </p>
							<p>㉰이용신청시 필요내용을 허위로 기재하여 신청한 경우 </p>
							<p>㉱사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우 </p>
							<p>㉲기타 회사가 정한 이용신청요건이 미비되었을 때</p>
							<p class="mt">제 9 조 (계약사항의 변경) </p>
							<p>회원은 이용신청시 기재한 사항이 변경되었을 경우에는 온라인으로 수정을 해야 하고 미변경으로 인하여 발생되는 문제의 책임은 회원에게 있습니다.</p>
							<p>제 3 장 계약당사자의 의무</p>
							<p class="mt">제 10조 (회사의 의무) </p>
							<p>①회사는 서비스 제공과 관련해서 알고 있는 회원의 신상정보를 본인의 승낙없이 제 3자에게 누설, 배포하지 않습니다.단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우에는 그러하지 않습니다.</p>
							<p>②1항의 범위내에서, 회사는 업무와 관련하여 회원 전체 또는 일부의 개인정보에 관한 통계 자료를 작성하여 이를 사용할 수 있고, 서비스를 통하여 회원의 컴퓨터에 쿠키를 전송할 수 있습니다.이 경우 회원은 쿠키의 수신을 거부하거나 쿠키의 수신에 대하여 경고하도록 사용하는 컴퓨터의 브라우져의 설정을 변경할 수 있습니다.</p>
							<p class="mt">제 11 조 (회원의 의무) </p>
							<p>①회원은 서비스를 이용할 때 다음 각 호의 행위를 하지 않아야 합니다. </p>
							<p>㉮다른 회원의 ID를 부정하게 사용하는 행위 </p>
							<p>㉯서비스에서 얻은 정보를 회사의 사전승낙 없이 회원의 이용이외의 목적으로 복제하거나 이를 출판 및 방송 등에 사용하거나 제3자에게 제공하는 행위 </p>
							<p>㉰회사는의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 행위 </p>
							<p>㉱공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위 </p>
							<p>㉲범죄와 결부된다고 객관적으로 판단되는 행위 </p>
							<p>㉳기타 관계법령에 위배되는 행위 </p>
							<p>②회원은 이 약관에서 규정하는 사항과 서비스 이용안내 또는 주의사항을 준수하여야 합니다. </p>
							<p>③회원은 내용별로 회사가 서비스 공지사항에 게시하거나 별도로 공지한 이용제한 사항을 준수하여야 합니다. </p>
							<p>④회원은 회사의 사전 승낙없이는 서비스를 이용하여 영업활동을 할 수 없으며, 영업활동의 결과와 회원이 약관에 위반한 영업활동을 이용하여 발생한 결과에 대하여 회사는 책임을 지지 않습니다. 회원은 이와 같은 영업활동에 대하여 회사에 대하여 손해배상의무를 집니다. </p>
							<p>⑤회원은 회사의 명시적인 동의가 없는 한 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도,증여할 수 없으며, 이를 담보로 제공할 수 없습니다.</p>
							<p>제 4 장 서비스 이용</p>
							<p class="mt">제 12 조 (회원 아이디(ID)와 비밀번호 관리에 대한 회원의 의무) </p>
							<p>①아이디(ID)와 비밀번호에 관한 모든 관리책임은 회원에게 있습니다. 회원에게 부여된 아이디(ID)와 비밀번호의 관리소홀,부정사용에 의하여 발생하는 모든 결과에 대한 책임은 회원에게 있습니다. </p>
							<p>②자신의 아이디(ID)가 부정하게 사용된 경우 회원은 반드시 회사에 그 사실을 통보해야 합니다.</p>
							<p class="mt">제 13조 (정보의 제공) </p>
							<p>회사는 회원이 서비스 이용 중 필요가 있다고 인정되는 다양한 정보에 대해서 전자우편이나 서신우편 등의 방법으로 회원에게 제공할 수 있으며 회원은 원치 않을 경우 가입신청메뉴와 회원정보수정 메뉴에서 정보 수신거부를 할 수 있습니다.</p>
							<p class="mt">제 14 조 (회원의 게시물) </p>
							<p>회사는 회원이 게시하거나 등록하는 서비스내의 내용물이 다음 각 호의 1에 해당한다고 판단되는 경우에 사전통지 없이 삭제할 수 있습니다. </p>
							<p>①다른 회원 또는 제3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우 </p>
							<p>②공공질서 및 미풍양속에 위반되는 내용인 경우 </p>
							<p>③범죄적 행위에 결부된다고 인정되는 내용일 경우 </p>
							<p>④회사의 저작권, 제 3 자의 저작권 등 기타 권리를 침해하는 내용인 경우 </p>
							<p>⑤회사에서 규정한 게시기간을 초과한 경우 </p>
							<p>⑥회원이 자신의 홈페이지와 게시판에 음란물을 게재하거나 음란사이트를 링크하는 경우 </p>
							<p>⑦기타 관계법령에 위반된다고 판단되는 경우</p>
							<p class="mt">제 15 조 (게시물의 저작권) </p>
							<p>서비스에 게재된 자료에 대한 권리는 다음 각 호와 같습니다. </p>
							<p>①게시물에 대한 권리와 책임은 게시자에게 있으며 회사는 게시자의 동의 없이는 이를 서비스내 게재 이외에 영리적 목적으로 사용하지 않습니다. 단, 비영리적인 경우에는 그러하지 아니하며 또한 회사는 서비스내의 게재권을 갖습니다. </p>
							<p>②회원은 서비스를 이용하여 얻은 정보를 가공, 판매하는 행위등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.</p>
							<p class="mt">제 16 조 (서비스 이용시간) </p>
							<p>①서비스의 이용은 회사의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 다만 정기 점검 등의 필요로 회사가 정한 날이나 시간은 그러하지 않습니다.</p>
							<p>②회사는 서비스를 일정범위로 분할하여 각 범위별로 이용가능 시간을 별도로 정할 수 있습니다. 이 경우 그 내용을 사전에 공지합니다.</p>
							<p class="mt">제 17조 (서비스 이용 책임) </p>
							<p>회원은 회사에서 권한 있는 사원이 서명한 명시적인 서면에 구체적으로 허용한 경우를 제외하고는 서비스를 이용하여 불법상품을 판매하는 영업활동을 할 수 없으며 특히 해킹,돈벌기 광고,음란사이트를 통한 상업행위, 상용S/W 불법배포 등을 할 수 없습니다. 이를 어기고 발생한 영업활동의 결과 및 손실, 관계기관에 의한 구속 등 법적 조치등에 관해서는 회사가 책임을 지지 않습니다.</p>
							<p class="mt">제 18 조 (서비스 제공의 중지) </p>	
							<p>①회사는 다음 각 호에 해당하는 경우 서비스 제공을 중지할 수 있습니다. </p>
							<p>가.서비스용 설비의 보수 등 공사로 인한 부득이한 경우 </p>
							<p>나.전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우</p>
							<p>다.기타 불가항력적 사유가 있는 경우 </p>
							<p>②회사는 국가비상사태, 정전, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 때에는 서비스의 전부 또는 일부를 제한하거나 정지할 있습니다.</p>
							<p>제 5 장 계약해지 및 이용제한</p>
							<p class="mt">제 19 조 (계약해지 및 이용제한) </p>
							<p>①회원이 이용계약을 해지하고자 하는 때에는 회원 본인이 온라인을 통해 회사에 해지 신청을 하여야 합니다. </p>
							<p>②회사는 회원이 다음 각 호의 1에 해당하는 행위를 하였을 경우 사전통지 없이 이용계약을 해지하거나 또는 기간을 정하여 서비스 이용을 중지할 수 있습니다. </p>
							<p>가.타인의 서비스 ID 및 비밀번호를 도용한 경우</p>
							<p>나.서비스 운영을 고의로 방해한 경우 </p>
							<p>다.가입한 이름이 실명이 아닌 경우 </p>
							<p>라.같은 사용자가 다른 ID로 이중등록을 한 경우 </p>
							<p>마.공공질서 및 미풍양속에 저해되는 내용을 고의로 유포시킨 경우 </p>
							<p>바.회원이 국익 또는 사회적 공익을 저해할 목적으로 서비스이용을 계획 또는 실행하는 경우 </p>
							<p>사.타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우 </p>
							<p>아.서비스의 안정적 운영을 방해할 목적으로 다량의 정보를 전송하거나 광고성 정보를 전송하는 경우 </p>
							<p>자.정보통신설비의 오작동이나 정보 등의 파괴를 유발시키는 컴퓨터 바이러스 프로그램 등을 유포하는 경우 </p>
							<p>차.회사, 다른 회원 또는 제3자의 지적재산권을 침해하는 경우 </p>
							<p>카.정보통신윤리위원회 등 외부기관의 시정요구가 있거나 불법선거운동과 관련하여 선거관리위원회의 유권해석을 받은 경우</p>
							<p>타.타인의 개인정보, 이용자ID 및 비빌번호를 부정하게 사용하는 경우 </p>
							<p>파.회사의 서비스 정보를 이용하여 얻은 정보를 회사의 사전 승낙없이 복제 또는 유통시키거나 상업적으로 이용하는 경우</p>
							<p>하.회원이 자신의 홈페이지와 게시판에 음란물을 게재하거나 음란사이트 링크하는 경우 </p>
							<p>거.본 약관을 포함하여 기타 회사가 정한 이용조건에 위반한 경우 </p>
							<p>너. 장기간 휴면 가입자에 대하여 통지할 경우 그 통지 기간 내에도 서비스이용에 대한 의사표현을 하지 않은 경우 전 항 규정에 의해 이용제한을 하고자 할 경우에는 제한의 종류 및 기간 등 구체적 기준은 회사의 공지, 서비스안내, 세부규칙 등에 별도로 정하는 바에 의한다.</p>
							<p class="mt">제 20 조 이용제한의 해제 절차</p>
							<p>①회사는 이용제한을 하고자 하는 경우에는 그 사유, 일시 및 기간을 정하여 서면 또는 전화 등의 방법을 이용하여 해당 회원 또는 대리인에게 통지합니다.</p>
							<p>②다만, 회사는이 긴급하게 이용을 중지해야 할 필요가 있다고 인정하는 경우에는 전항의 과정없이 서비스 이용을 제한할 수 있습니다.</p>
							<p>③제 21조 1항 규정에 의하여 서비스 이용중지를 통지 받은 회원 또는 그 대리인은 이용중지에 대하여 이의가 있을 경우 이의 신청을 할 수 있습니다.</p>
							<p>④회사는 이용중지 기간 중에 그 이용중지 사유가 해소된 것이 확인된 경우에 한하여 이용중지 조치를 즉시 해제합니다.</p>
							<p>제 6 장 손해배상 등</p>
							<p class="mt">제 21 조 이용제한의 해제 절차</p>
							<p>①회사는 이용제한을 하고자 하는 경우에는 그 사유, 일시 및 기간을 정하여 서면 또는 전화 등의 방법을 이용하여 해당 회원 또는 대리인에게 통지합니다.</p>
							<p>②다만, 회사는이 긴급하게 이용을 중지해야 할 필요가 있다고 인정하는 경우에는 전항의 과정없이 서비스 이용을 제한할 수 있습니다.</p>
							<p>③제 21조 1항 규정에 의하여 서비스 이용중지를 통지 받은 회원 또는 그 대리인은 이용중지에 대하여 이의가 있을 경우 이의 신청을 할 수 있습니다.</p>
							<p>④회사는 이용중지 기간 중에 그 이용중지 사유가 해소된 것이 확인된 경우에 한하여 이용중지 조치를 즉시 해제합니다.</p>
							<p class="mt">제 22 조 (손해배상) </p>
							<p>회사는 서비스 요금이 무료인 동안의 서비스 이용과 관련하여 회사의 고의, 과실에 의한 것이 아닌 한 회원에게 발생한 어떠한 손해에 관하여도 책임을 지지 않습니다</p>
							<p class="mt">제 23 조 (면책조항) </p>
							<p>①회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다. </p>
							<p>②회사는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다. </p>
							<p>③회사는 회원이 서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며 그밖에 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.</p>
							<p>④회사는 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.</p>
							<p class="mt">제 24조 (관할법원) </p>
							<p>요금 등 서비스 이용으로 발생한 분쟁에 대해 소송이 제기될 경우 회사의 본사 소재지를 관할하는 법원을 전속 관할법원으로 합니다.</p>
							<p class="mt">[부칙] </p>
							<p>(시행일) 이 약관은 2018년 7월 31일부터 시행합니다.</p>
						</div>
						<br>
						
			<input type="checkbox" id="box3" name="checkRow" class="checkbox"><label for="box3"><h3>개인정보 수집 및 이용에 대한 안내(필수)</h3></label>
			
			<div class="t_wrap">
							<p>KS스포츠(이하 회사)는 회원으로 가입한 이용자의 개인정보 보호를 위해 구체적 방침을 명시한 개인정보 보호정책을 제정하여 준수합니다.<br>본 보호정책은 관계 법령의 변경 및 회사이 제공하는 서비스의 내용변경에 따라 바뀔 수 있으므로 KS스포츠 홈페이지를 방문 시 수시로 확인하시기 바랍니다.</p>
							<p class="mt">1.수집하는 개인정보의 항목</p>
							<p>회사는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.</p>
							<p class="mt">수집항목</p>
							<p>이름 , 로그인ID , 비밀번호 , 휴대전화번호 , 서비스 이용기록 , 접속 IP 정보</p>
							<p class="mt">개인정보 수집방법</p>
							<p>홈페이지(회원가입)</p>
							<p class="mt">2.개인정보의 수집 및 이용목적</p>
							<p>회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.</p>
							<p class="mt">서비스 제공에 관한 계약 이행</p>
							<p>서비스 제공에 따른 콘텐츠 제공</p>
							<p class="mt">회원 관리</p>
							<p>회원제 서비스 이용에 따른 본인확인, 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달</p>
							<p class="mt">마케팅 및 광고에 활용</p>
							<p>이벤트 등 광고성 정보 전달, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계</p>
							<p class="mt">3.개인정보의 보유 및 이용기간</p>
							<p>회사는 원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.</p>
							<p>보존 항목 : 서비스 이용기록 , 접속 IP 정보</p>
							<p>보존 근거 : 3년 보관후 미사용시 삭제</p>
							<p>보존 기간 : 3년</p>
							<p>그리고 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.
							</p><p>계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)</p>
							<p>대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)</p>
							<p>소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래등에서의 소비자보호에 관한 법률)</p>
						</div>
			<br>
			
			<input type="checkbox" id="box4" name="checkRow" class="checkbox"><label for="box4"><h3>개인정보 취급위탁 안내(필수)</h3></label>
			
			<div class="t_wrap">
							<p>회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.</p>

							<p class="mt">- 이용자들이 사전에 동의한 경우</p>
							<p>- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우</p>

							<p class="mt">수집한 개인정보의 위탁<br>회사는 서비스 이행을 위해 아래와 같이 외부 전문업체에 위탁하여 운영하고 있습니다.</p>
							<p>- 위탁 대상자 : 주식회사 케이에프엔</p>
							<p>- 위탁업무 내용 : 홈페이지 관리 및 시스템 관리</p>
							<p></p>
						</div>
        	<br>
        	<div class="div">
	        	<input type="button" value="비동의" class="button" onclick="mainpage();" style="background-color:gray;">
	        	<input type="submit" value="동의" class="button" onclick="return nextpage();">
        	</div>
        	<br><br>
        	</form>
        </div>
        <br>
    </div>
    
	<script>
		function checkAll() {
			if($("#box1").is(':checked')){
				$("input[name=checkRow]").prop("checked",true);
			}else{
				$("input[name=checkRow]").prop("checked",false);
			}
			
		}
		function mainpage() {
			location.href="/";
		}
		function nextpage() {
			var flag =false;
			var values = document.getElementsByName("checkRow");
			var count = 0;
			for(var i=0;i<values.length;i++){
				if(values[i].checked){
					count++;
				}
			}
				if(count<3){
					alert("체크 사항을 확인하세요");
				}else{
					flag = true;
				}
				return flag;
			}
		
	</script>
</body>
</html>