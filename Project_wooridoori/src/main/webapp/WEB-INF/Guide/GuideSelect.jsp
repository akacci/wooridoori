<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="root" value="<%=request.getContextPath() %>"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>


<style type="text/css">
	#cl-dashboard{display: none;} 
	#title{
		font-size: 23pt;
		margin-left: 50px;
		margin-top: 100px;
	}
	#selectMap{
		margin-left: 60px;
		margin-top: 30px;
		display: inline;
		
	}
	#intro{
		display: inline;
		max-height: 630px;
		overflow:hidden;
		text-align: center;
		float: right;
	}
	#space{
		margin-bottom: 50px;		
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		
		var loc=new Array();	//area array
		/* City select */
 		var Curl="http://openapi.nsdi.go.kr/nsdi/eios/service/rest/AdmService/admCodeList.xml?&authkey=8be59419a5070ca1495620";
		$.ajax({
			url:Curl,
			type:"GET",
			dataType:"XML",
			success:function(data){
					$(data).find("admVOList").each(function(){
						if($(this).children("lowestAdmCodeNm").text()!=""){
					//		$(".city").append("<span value='"+$(this).children("admCode").text()+"'>"+$(this).children("lowestAdmCodeNm").text()+"</span><br>");							
							loc.push($(this).children("lowestAdmCodeNm").text());
						}
					});
			}
		}); 
		/* Select map */
		$("map area").hover(function(){
			var root=$("#map").attr("root");
			var num=$(this).attr("num");
			var area=$(this).attr("class");
			
			$("#map").attr("src",root+"/Guide_img/Location/"+area+".png");
			$("#intro").empty();
			$("#intro").append("<b style='font-size: 16pt;color:gray;'> "+loc[num]+
								"</b><b> 지역에</b><b style='color:red;'> "+getCount(loc[num])+
								"</b><b>건의 여행이 있습니다. </b><br> 정보를 보려면 지역을 클릭하세요.<br>");

			
			
	/* 		$("#intro").append("<div style='display:inline; max-height:200px;background-image:url('"
								+root+"/Guide_img/Location_info/seoul.jpg')';>"
								+"</div>"); */
			$("#intro").append("<img src='"+root+"/Guide_img/Location_info/"+area
					+".jpg' style='width:650px;height:350px;display:inline;'><br><br>");

			if((loc[num])=="서울특별시"){	
				$("#intro").append("<b style='z-index:1;'>서울특별시(서울特別市)는 대한민국의 수도이자 최대 도시이다.<br> "+
				"백제의 첫 수도인 위례성이었고, 고려 때는 남경(南京)이었으며,<br> 조선의 수도가 된 이후로 현재까지 대한민국의 정치·경제·사회·문화의 중심지 역할을 해오고 있다.<br> 동서 간의 거리는 36.78 km, 남북 간의 거리는 30.3 km이며, 넓이는 605.25 km²이다.<br> 도시의 중앙으로 한강이 흐르고,<br> 북한산, 관악산, 도봉산, 불암산, 인능산, 인왕산, 청계산 등 산으로 둘러싸인 분지 지형의 도시이다.<br></b>");
			}
			else if((loc[num])=="경기도"){
				$("#intro").append("대한민국에서 가장 인구가 많은 광역자치단체<br>"+

						"한반도 중부에 있는 도이자 한국의 수도권. <br>다른 도의 이름은 고려~조선시대 지역 내의 대표 도시 두 곳의 첫글자를 딴 것이지만<br>" +

						"강원도, 황해도와 더불어 남북 분단된 3개의 도 중 하나이다.<br> 물론 북한이 변경한 행정구역으로는 휴전선 이북의 경기도 지역은<br> 황해북도와 강원도로 흡수시켰기 때문에 북한 입장에서 분단된 도는 강원도 뿐이다.<br> 반대로 남한이 변경한 행정구역에서도 남한령이 된 황해도 지역은 경기도로 흡수했으나<br> 현재는 인천광역시에 속한다.<br>"+

						"경기도는 현재 대한민국에서 무려 28개 시가 있어 시가 가장 많고,<br> 대한민국의 도(道) 중에서는 가평군, 양평군, 연천군 단 세 곳만이 군인, 군이 가장 적은 도이기도 하다.<br> 그나마도 양평군도 인구가 10만명을 넘어 시승격을 추진중인 상황으로,<br> 만일 양평군까지 시로 승격한다면 경기도에서 군은 연천군과 가평군 단 두 곳만 남는다.<br>");
			}
			else 		if((loc[num])=="인천광역시"){
				$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/ic.jpg')");				
				$("#intro").append("한반도 중서부에 위치한 광역시.<br>"+
						"수도 서울특별시와 인접하고 인천국제공항과 인천항이 있어<br> 수도권의 관문도시이자 항구도시로 기능하며,<br>"+
						"국내외 대부분의 항공사는 국제선 허브공항을 인천국제공항으로 삼고 있다.<br> 관내에는 인천경제자유구역이 있으며, <br>"+
						"이를 담당하기 위해 산하 외청으로 인천경제자유구역청을 두고 있다.<br>"+
						"면적은 약 1,062㎢으로 서울이나 부산보다 넓으며<br> 2016년을 기해 울산광역시를 넘어서 한국 최대의 면적을 가진 광역시가 되었다.<br>");
			}
			else 		if((loc[num])=="강원도"){
				$("#intro").append("한반도 중동부에 있는 도. 경기도, 충청북도, 경상북도와 맞닿는다.<br>"+
						" 휴전선 이북 지역을 제외한 실질 행정구역은 7시 11군으로 총 18개 시군으로 이루어진다.<br>"+
						"2016년 4월 기준 인구는 약 154만 8천여 명이다(외국인 제외).<br>"+
						"실질적으론 휴전선 이남만 관리하고 있지만<br> 법률상으론 휴전선 이북에도 강원도의 행정구역이 설정되어 있다.<br>"+
						"그래서 경기도와 더불어 남북으로 분단된 도 2개 중 하나다.<br>"+
						" 참고로 북한의 행정구역상으로는 강원도가 유일하게 분단된 도다.<br> 북한은 휴전선 이북의 경기도 지역을 황해북도나 강원도로 흡수해 버려서<br> 북한의 행정구역상 휴전선 이북 지역에는 경기도에 속하는 지역이 사라졌기 때문이다.<br>");
			}
			else 		if((loc[num])=="충청북도"){
				$("#intro").append("한국의 중/남부에 위치해있는 도.<br>"+
						"충청도의 한쪽 날개.<br> 경기도, 강원도, 대전광역시, 세종특별자치시, 충청남도, 경상북도, 전라북도와 인접하고 있다.<br>"+
						"인구는 약 158만여명으로, 강원도와 비슷하거나 약간 적었으나 최근 역전되었다.<br>"+
						"강원도, 전라북도, 제주특별자치도와 함께 광역시를 배출하지 못한 도(道) 중 하나.<br>"+
						"애초에 도 전체 인구가 158만인데 광역시 하나 나오면 충북 전체 인구가 50만 이하가 된다.<br>"+
						"충청권 연합의 정치력으로 2012년 세종특별자치시를 배출했으나,<br> 충청북도에서 세종시로 편입된 곳은 구 청원군 부용면(현 세종특별자치시 부강면)이 유일하다.<br>");

			}
			else		if((loc[num])=="충청남도"){
				$("#intro").append("한반도 중서남부에 위치한 도.<br>"+
						"기도, 충청북도, 대전광역시, 전라북도, 인천광역시 등과 인접해있다.<br>"+
						"도청소재지는 홍성군시(내포신도시)이며,<br> 최대도시는 특례시인 천안시다.<br>"+
						"인구는 약 210만 명, 면적은 8,598km²이다.<br> 산하에 8시 7군의 기초자치단체가 있다.<br>"+
						"충청'남도'라는 이름과는 달리,<br> 실제로는 충청도의 남부가 아니라 '서부'에 있다.<br>"+
						" '충청서도'라고 해도 무방할 정도.<br> 실제로 조선 때 현 충청남도는 '충청우도'로,<br>"+
						"충청북도는 '충청좌도'로 불렸다.<br>"+
						"조선 때 '좌·우도' 개념은 북쪽을 위로 해 그려지는 일반적인 지도상의 동·서 개념이 아니고,<br>"+
						"임금이 있는 한양에서 남쪽을 바라볼 때 충청남도 쪽이 우도, 충청북도 쪽이 좌도인 것.<br>");
			}
			else		if((loc[num])=="대전광역시"){
				$("#intro").append("대한민국 중부에 있는 광역시이다.<br>"+
						"충청권 제1의 도시로 중부지방과 영·호남을 잇는 교통의 요지이자,<br>"+
						"대덕연구단지가 조성된 한국 최대의 과학기술도시이며,<br>"+
						"관세청, 대한민국 특허청, 통계청, 중소기업청, 조달청, 문화재청, 산림청, 병무청, 국가기록원 등<br>"+
						"정부대전청사가 위치한 행정도시다.<br>"+
						"또 3군 본부와 인접해 있고,<br> 육군 교육사령부, 국군 의무학교, 합동군사대학교 등이 위치해 군사도시의 기능도 수행하고 있다.<br>");
		
				}
			else		if((loc[num])=="전라북도"){
				$("#intro").append("호남 북부에 위치한 도.<br>"+
						"충청북도, 충청남도, 경상북도, 경상남도, 전라남도와 인접하고 있다.<br>"+
						"2015년의 인구는 약 187만.<br> 도청 소재지는 전주시이며 서부 신시가지(완산구 효자로)에 도청이 위치해 있다.<br>"+
						"현재 슬로건은 '한국 속의 한국, 생동하는 전라북도'다.<br>"+
						" 단위의 행정구역으로는 최초로 연구개발특구를 조성하게 되었으며<br> 새만금개발사업의 중심 지역이다.<br>"+
						"또한 탄소산업과 농업 기술의 중심지로 도약하고 있는 곳이다.<br>"+
						"관광업 역시 성행하고 있는 중. 강원도, 충청북도, 제주특별자치도와 함께<br> 광역시를 배출하지 못한 도(道) 중 한 곳이다.<br>");
				
			}
			else		if((loc[num])=="전라남도"){
				$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/jn.jpg')");
				$("#intro").append("생명의 땅 [Full of Life]");
			}
			else		if((loc[num])=="경상북도"){
					$("#intro").append("영남 중북부에 있는 도.<br> 인구는 2,702,210명(2016.07)이다.<br>"+
					"북쪽으로는 강원도, 서쪽으로는 충청북도,<br> 남쪽으로는 대구광역시, 울산광역시, 경상남도, 서남쪽으로는 전라북도와 인접하고 있다.<br>"+
					"면적은 약 19,031km²로, 대한민국의 광역자치단체 중에서 가장 넓다.<br> 대구와 경북의 이름을 따서 대경권이라 이름붙여진다.<br>"+
					"도청 소재지는 대구에 있었다가 2016년 2월 22일에 안동시로 이전했으며,<br> 도 내 최대 도시는 남동쪽에 위치한 포항시다.<br>");
	
					}
			else		if((loc[num])=="경상남도"){
				$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/kn.jpg')");
				$("#intro").append("문명의 중심지[Feel GyeongNam]");
			}
			else		if((loc[num])=="대구광역시"){
				$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/dg.jpg')");	
				$("#intro").append("조선의 도회지 [Colorful Daegu]");
			}
			else		if((loc[num])=="울산광역시"){
				$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/ulsan.jpg')");		
				$("#intro").append("하늘도 물도 맑은 축복의 땅 [Ulsan for you]");
			}
			else		if((loc[num])=="부산광역시"){
				$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/bs.jpg')");	
				$("#intro").append("사람과 기술, 문화로 융성하는 부산 [Dynamic Busan]");
			}
			else		if((loc[num])=="제주특별자치도"){
				$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/jj.jpg')");
				$("#intro").append("신비의 섬 [Only Jeju Island]");
			}
			else		if((loc[num])=="광주광역시"){
				$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/kj.jpg')");	
				$("#intro").append("문화의 수도 [Tour Partner Gwangju]");
			}
			
								
		});

		$("map area").click(function(){
			var area=loc[$(this).attr("num")];	// seleted city			
			location.href="guideList.wd?addr="+area;
		});
		
	
		
	});
	
	
	function getCount(addr){
		var Lurl="getLocalGuide.wd?addr="+addr;
		var cnt = '0';
		$.ajax({
			url:Lurl,
			async: false,
    		type:'POST',
			success:function(data){
				cnt=data;
			}
		}); 
		return cnt;
	}	

</script>
</head>
<body>

	<header>
		<%@ include file= "../layout/top.jsp" %>
	</header>
	<div class="city">
		
	</div>
	
	
	<div id="title">
		<b>가이드 받고 싶은 지역을 선택하세요.</b><br>
	</div>
	
	<!-- Map -->
	<span id="selectMap">
		<img style="display: inline;"root="${root }" src="${root }/Guide_img/Location/map.png" width="645" height="596"  usemap="#guideMap"  id="map">
		<map name="guideMap">
		
		  <!-- Seoul -->
		  <area shape="circle" coords="209,122,16" class="seoul" num="0">
		   <!-- Busan -->
		   <area shape="poly" coords="363,376,400,350,  409,358,404,376, 394,393,366,387 " class="bs" num="1">
		<!-- Dae gu -->
		 <area shape="poly" coords=" 353,286,345,288,  337,298,334,297,  326,300,332,306,
		   327,312,331,318, 327,321,327,327,  340,325,344,316,  343,317,355,316,  361,299 " class="dg" num="2">
		  <!-- Incheon -->
		  <area shape="poly" coords="154,133,185,141,  193,117,182,113, 156,128 " class="ic" num="3">
		  <!-- Kwang ju -->
		  <area shape="poly" coords="178,337,188,387, 202,385,209,378, 201,369,291,371 " class="kj" num="4">
		  <!-- Dae jeon -->
		  <area shape="circle" coords="242,250,12" class="dj" num="5">
		  <!-- Ulsan -->
		   <area shape="poly" coords="407,356,380,336, 381,327,391,316, 403,318,407,322,  425,328  " class="ulsan" num="6">
			<!-- Geyoung gi -->
		  <area shape="poly" coords="143,96,177,117,  220,44,254,95" class="gg" num="8">
		  <area shape="poly" coords="180,137,205,193,  272,161,265,117"class="gg" num="8">
		  <area shape="poly" coords="222,104,255,95,  230,129,255,116" class="gg"  num="8">
		  <area shape="circle" coords="23,86,15" class="gg"  num="8">
		  <!-- Kang won -->
		  <area shape="poly" coords="219,42,261,84,  347,64,323,10" class="gw" num="9">
		  <area shape="poly" coords="261,84,269,118,  370,94,346,59"class="gw" num="9">
		  <area shape="poly" coords="269,118,273,163,  397,136,370,94" class="gw"  num="9">	
		  <area shape="poly" coords="273,163,352,174,  413,163,397,136" class="gw"  num="9">		  
		
		   <!-- Choong buk -->
		  <area shape="poly" coords="234,191,152,247,  243,203,235,220,  241,236,259,242 ,  
			  251,260,261,266,  269,285,284,283, 298,266,283,256,  281,225,315,197,  
			  327,200,345,175, 322,160,249,177   " class="cb" num="10">
		   <!-- Choong nam -->
		  <area shape="poly" coords="135,185,152,247,  241,237,236,193" class="cn"  num="11">
		  <area shape="poly" coords="152,247,181,286,  234,276,229,243"class="cn"  num="11">
		  <area shape="circle" coords="251,276,11" class="cn" num="11" >	
		
		
		
		  <!-- Jeon buk -->
		  <area shape="poly" coords="273,292,179,309,  162,326,160,344,  170,361,185,349,  
		  		197,344,210,347,  215,359,259,359, 266,348,266,333 , 266,312,284,298,  
		  		282,288,267,283, 251,289,240,287, 234,276,218,278,  199,274,184,286 " class="jb" num="12">
			<!-- Jeon nam -->
		  <area shape="poly" coords="159,348,128,380,  120,469,165,486,  284,448,273,396,   
		  		261,376,204,387,   189,390,176,386, 176,361 " class="jn" num="13">		   
		   <area shape="poly" coords="176,361,178,371,  185,367,192,368,    204,368,212,376, 
		   			204,387,273,396,   257,361,248,356,  215,362,208,346, 
		   			203,350,193,346, 184,355 " class="jn" num="13">
		   <!-- Geyong buk -->
		  <area shape="poly" coords="327,202,312,197,  276,227,284,235, 284,258,302,264, 
		  		285,287,287,299,   298,308,313,315,  311,324,327,326,  328,303,325,301,   
		  		333,292,341,292,  353,285,361,290,  362,299,357,305, 355,316,343,321,  
		  		342,328,345,330,   361,333,375,327, 384,325,389,317,  402,318,407,321,   
		  		415,321,424,323,  434,276,417,284,  415,280,417,277,  411,253,422,233, 
		  		415,217,423,208,  411,164,399,173,  395,177,387,173,  366,174,361,173,  
		  		358,177,350,176,  334,185,  " class="kb" num="14">
		  <area shape="circle" coords="533,124,8 " class="kb" num="14">		
		   <!-- Geyong nam -->
		  <area shape="poly" coords="284,299,272,308, 360,334,266,337, 266,348,260,359,  
			  277,397,295,436,  365,418,366,378,  388,360,398,349,  391,341,380,333,  
			  378,325,362,332,  346,332,336,326,  328,327,309,326,  309,313,300,306    " class="kn" num="15">
		<area shape="poly" coords=" 359,335,281,349,  273,317,305,312, 308,329,348,329  " class="kn" num="15">  
		   			
		   <!-- Jeju -->
		  <area shape="poly" coords="130,559,138,594, 215,560,202,540,  138,555 " class="jj" num="16">
		</map>
	</span>
	
	<div id="intro">
		
	</div>
	<div id="space"></div>
	<br>
	<div id="footer">
	  <footer class="container-fluid text-center">
      <%@ include file= "../layout/wfooter.jsp" %>
  	 </footer> 
	</div>

   
</body>

</html>
