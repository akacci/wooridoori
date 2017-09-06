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
		max-height: 230px;
		overflow:hidden;
		text-align: center;
		float: right;
	}
	#footer{
		
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
					+".jpg' style='width:650px;height:250px;display:inline;'><br>");

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
		<%@ include file= "../layout/wtopmenu.jsp" %>
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
	<br>
	<div id="footer">
	  <footer class="container-fluid text-center">
      <%@ include file= "../layout/wfooter.jsp" %>
  	 </footer> 
	</div>

   
</body>

</html>
