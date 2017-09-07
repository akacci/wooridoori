<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<title>Insert title here</title>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.ajax-cross-origin.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/content_detail.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/detail.css"/>

<script type="text/javascript">
	$(function() {
		
		$(".content_detail .menu").click(
				function() {
					var find_info = $(this).parent().children(".info");
					find_info.toggle();
					if (find_info.css("display") == "none") {
						$(this).children("span").children("i").removeClass(
								"fa fa-caret-up");
						$(this).children("span").children("i").addClass(
								"fa fa-caret-down");
					}
					if (find_info.css("display") == "block") {
						$(this).children("span").children("i").removeClass(
								"fa fa-caret-down");
						$(this).children("span").children("i").addClass(
								"fa fa-caret-up");
					}
				});
		var contentId = ${cdata.contentid};
		var contentTypeid = ${cdata.contenttypeid};
		var mapx = ${cdata.mapx};
		var mapy = ${cdata.mapy};
		var data = {contentid : contentId, contenttypeid : contentTypeid, x : mapx, y : mapy};
		var title = "${cdata.title}";
		//var appKey = "4e235220-bbba-3ed6-a61d-7dfd07f58a39";
		
		content_writer(data);
		
		
		var mIcon=["SKY_A0038","SKY_A0101,08","SKY_A0202,09","SKY_A0303,10","SKY_A0412,40","SKY_A0513,41", "SKY_A0614,42","SKY_A0718" ,"SKY_A0821","SKY_A0932","SKY_A1004","SKY_A1129","SKY_A1226","SKY_A1327", "SKY_A1428" ];
		 /* 현재날씨 */
		 	var root=$("#weather").attr("root");
		   var Wurl="http://apis.skplanetx.com/weather/current/minutely?version=1&lat="+mapy+"&lon="+mapx+"&city=&county=&village=&appKey="+appKey;
		   $.ajax({
		      url:Wurl,
		      type:"GET",
		      dataType:"JSON",
		      cache:false,
		      success:function(data){
		    	 console.log(data);
		         var path=data.weather.minutely[0].sky.code;	
		         var weather= data.weather.minutely[0].sky.name;
		         var temp=data.weather.minutely[0].temperature.tc;
		         var img;
		         for(var i=0;i<mIcon.length;i++){
		        	 if(mIcon[i].indexOf(path)>=0){
		        		 if(mIcon[i].indexOf(",")>=0){	//am pm		
		       	 			img=mIcon[i].substring(mIcon[i].indexOf(path)+7,mIcon[i].indexOf(","));
		        		 }
		        		 else{
			       	 		img=mIcon[i].substring(mIcon[i].indexOf(path)+7,mIcon[i].length);
		        		 }
		        	 }
		         }
		         $("#weather").append("<b style='font-size:15pt'>현재 ["+title+"]</b><br><img src='"+root+"/weather/"+img+".png' width='100px' style='vertical-align:middle;'><b style='color:green; font-size:25pt'>"+temp.substring(0,temp.length-3)+"°C</b> <hr>");
		         
		      },complete : function(data) {
		         //alert("complete");
		       },error : function(xhr, status, error) {
		            //alert("error"+error);
		        }
		   });  
		   
		   var fIcon=["SKY_S0038","SKY_S0101,08","SKY_S0202,09","SKY_S0303,10","SKY_S0412,40","SKY_S0513,41", "SKY_S0614,42","SKY_S0718" ,"SKY_S0821","SKY_S0932","SKY_S1004","SKY_S1129","SKY_S1226","SKY_S1327", "SKY_S1428" ];  
		   /* 2day forecast */
			var Furl="http://apis.skplanetx.com/weather/forecast/3days?version=1&lat="+mapy+"&lon="+mapx+"&city=&county=&village=&foretxt=Y&appKey="+appKey;
			$.ajax({
			      url:Furl,
			      type:"GET",
			      dataType:"JSON",
			      cache:false,
			      success:function(data){
				     var time=data.weather.forecast3days[0].timeRelease;
			    	 var fTime=parseInt(time.substring(time.length-8,time.length-6));
			    	 var d = new Date();
			    	 var ta_path,tp_path,ta2_path,tp2_path;
			    	 // timeRelease + n = tommorow  
			    	 if(fTime<7){
			    		 ta_path=data.weather.forecast3days[0].fcst3hour.sky.code25hour;
				         tp_path=data.weather.forecast3days[0].fcst3hour.sky.code37hour;
			    		 ta2_path=data.weather.forecast3days[0].fcst3hour.sky.code49hour;
				         tp2_path=data.weather.forecast3days[0].fcst3hour.sky.code61hour;
			    	 }else if(fTime<13){
			    		 ta_path=data.weather.forecast3days[0].fcst3hour.sky.code19hour;
				         tp_path=data.weather.forecast3days[0].fcst3hour.sky.code31hour;
			    		 ta2_path=data.weather.forecast3days[0].fcst3hour.sky.code43hour;
				         tp2_path=data.weather.forecast3days[0].fcst3hour.sky.code55hour;
			    	 }else if(fTime<16){
			    		 ta_path=data.weather.forecast3days[0].fcst3hour.sky.code16hour;
				         tp_path=data.weather.forecast3days[0].fcst3hour.sky.code28hour;
			    		 ta2_path=data.weather.forecast3days[0].fcst3hour.sky.code40hour;
				         tp2_path=data.weather.forecast3days[0].fcst3hour.sky.code52hour;
			    	 }else if(fTime<23){
			    		 ta_path=data.weather.forecast3days[0].fcst3hour.sky.code10hour;
				         tp_path=data.weather.forecast3days[0].fcst3hour.sky.code22hour;
			    		 ta2_path=data.weather.forecast3days[0].fcst3hour.sky.code34hour;
				         tp2_path=data.weather.forecast3days[0].fcst3hour.sky.code46hour;
			    	 }
			         
			         var tempH=data.weather.forecast3days[0].fcstdaily.temperature.tmax2day;
			         var tempM=data.weather.forecast3days[0].fcstdaily.temperature.tmin2day;
			         var tempH2=data.weather.forecast3days[0].fcstdaily.temperature.tmax3day;
			         var tempM2=data.weather.forecast3days[0].fcstdaily.temperature.tmin3day;
			         var ta_img,tp_img,ta2_img,tp2_img;
			         
			         for(var i=0;i<fIcon.length;i++){
			        	 if(fIcon[i].indexOf(ta_path)>=0){
			        		 if(fIcon[i].indexOf(",")>=0){	//tommorw am		
			       	 			ta_img=fIcon[i].substring(fIcon[i].indexOf(ta_path)+7,fIcon[i].indexOf(","));
			       	 		 }
			        		 else{
				       	 		ta_img=fIcon[i].substring(fIcon[i].indexOf(ta_path)+7,fIcon[i].length);
				       	 	 }
			        	 }
			        	 if(fIcon[i].indexOf(tp_path)>=0){
			        		 if(fIcon[i].indexOf(",")>=0){	//tommrow pm		
			       	 				tp_img=fIcon[i].substring(fIcon[i].indexOf(tp_path)+7,fIcon[i].indexOf(","));			        		
			        		 }
			        		 else{
			        			 tp_img=fIcon[i].substring(fIcon[i].indexOf(tp_path)+7,fIcon[i].length);
			        		 }
			        	 }
			        	 if(fIcon[i].indexOf(ta2_path)>=0){
			        		 if(fIcon[i].indexOf(",")>=0){	//two days after tommrow am		
			       	 			ta2_img=fIcon[i].substring(fIcon[i].indexOf(ta2_path)+7,fIcon[i].indexOf(","));
			       	 		 }
			        		 else{
				       	 		ta2_img=fIcon[i].substring(fIcon[i].indexOf(ta2_path)+7,fIcon[i].length);
				       	 	 }
			        	 }
			        	 if(fIcon[i].indexOf(tp2_path)>=0){
			        		 if(fIcon[i].indexOf(",")>=0){	//two days after tommrow pm		
			       	 				tp2_img=fIcon[i].substring(fIcon[i].indexOf(tp2_path)+7,fIcon[i].indexOf(","));			        		
			        		 }
			        		 else{
			        			 tp2_img=fIcon[i].substring(fIcon[i].indexOf(tp2_path)+7,fIcon[i].length);
			        		 }
			        	 }
			         } 
			         $("#weather").append("내일 오전  /  오후<br><img src='"+root+"/weather/"+ta_img+".png' width='70px;'>/ <img src='"+root+"/weather/"+tp_img+".png' width='70px;'><br><b style='color:red; font-size:22pt;'>"+parseFloat(tempH).toFixed(0)+"°C</b> / <b style='color:blue; font-size:22pt;'>"+parseFloat(tempM).toFixed(0)+"°C</b><hr>");
			         $("#weather").append("모레 오전  /  오후<br><img src='"+root+"/weather/"+ta2_img+".png' width='70px;'>/ <img src='"+root+"/weather/"+tp2_img+".png' width='70px;'><br><b style='color:red; font-size:22pt;'>"+parseFloat(tempH2).toFixed(0)+"°C</b> / <b style='color:blue; font-size:22pt;'>"+parseFloat(tempM2).toFixed(0)+"°C</b><br>");
			      },complete : function(data) {
			         //alert("complete");
			       },error : function(xhr, status, error) {
			            //alert("error"+error);
			        }
			   });   
		   
		   
		  var pIcon=["SKY_W0038","SKY_W0101,08","SKY_W0202,09","SKY_W0303,10","SKY_W0418","SKY_W0721","SKY_W0912,40","SKY_W1021","SKY_W1104","SKY_W1213,41","SKY_W1332" ];

	});
	//초기 위치
	var current_lng = ${cdata.mapx};
	var current_lat = ${cdata.mapy};

</script>
<style type="text/css">
	#weather{
		text-decoration: blink;
		font-weight: bold;
		font-size: 8pt;
	}
	
	.inpt {
		height:10px;
	}
	
	
</style>
</head>
<header> 
         <%-- <jsp:include page= "../layout/wtopmenu.jsp"/> --%>
         <%@include file="../layout/top.jsp"%>
</header>
<body>
	<div style="position:fixed; right: 2.5%; bottom: 8%; width:17.5%; background-color: #ffffff; z-index: -1;">
		<div id="weather" root="<%=request.getContextPath()%>" style="font-size: 12pt; color:black; border-style: groove; border-width: 1px; border-color: black; text-align: center; box-shadow: 5px 5px 5px 0px gray;"></div>
	</div>
	
	<div id="div_detail">
		<div class="content_detail">
			<h2>${cdata.title}</h2>
		</div>
		<div class="content_detail">
			<img src="${cdata.firstimage}" width="100%">
		</div>
		<div class="content_detail">
			<div class="weather"></div>
		</div>
		<div class="content_detail">
			<h3 class="menu basic_m"><a>기본정보</a><span><i id="i" class="fa fa-caret-up" style="float: right;margin-right: 10px;"></i></span></h3>
			<div class="info basic_info"></div>
		</div>
		<div class="content_detail">
			<h3 class="menu basic_m"><a>상세정보</a><span><i class="fa fa-caret-up" style="float: right;margin-right: 10px;"></i></span></h3>
			<div class="info detail_info"></div>
		</div>
		<div class="content_detail"> 
			<h3 class="menu basic_m"><a>지도</a><span><i class="fa fa-caret-down" style="float: right;margin-right: 10px;"></i></span></h3>
			<div style="font-size: 24px; text-align:center; margin:0 auto;
		      font-weight: bold;" id="title">지도에 표시할 테마를 지정해 주세요.</div> 
			
			<div id="floating-panel">
			  <span class="space" style="line-height: 30px"></span>
			  
			  <button class="btn_drop" id="moveToOriginalMarker" onclick="moveToOriginalMarker()"> 
		        <i class="material-icons">my_location</i>
		      </button>
		       
		      <button class="btn_drop" id="dropFood" onclick="dropFood()"> 
		        <i class="material-icons">restaurant_menu</i>
		      </button>
		       
		      <button class="btn_drop" id="dropHotel" onclick="dropHotel()"> 
		        <i class="material-icons">hotel</i>
		      </button>
		      
		      <button class="btn_drop" id="dropTourist" onclick="dropTourist()">
				<i class="material-icons">favorite</i>
		      </button>
		      
		      <button class="btn_drop" id="dropShopping" onclick="dropShopping()">
				<i class="material-icons">shopping_cart</i>
			  </button>
			  
		      <button class="btn_drop" id="dropLeports" onclick="dropLeports()">
				<i class="material-icons">rowing</i>
			  </button>
		      
		      <button class="btn_drop" id="dropCulture" onclick="dropCulture()">
		        <i class="material-icons">account_balance</i>
		      </button>  
    		</div> 
    
    		<div style="height: 400px;" id="map"></div> 
			<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
    		<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDXnqdeIyxuYo7_IQ_Fub4Ty8APZMXrn3A&libraries=places&callback=initMap"></script>
    
			<script>
				function initMap() {
				    map = new google.maps.Map(document.getElementById('map'), {
				      zoom: 12,
				      center: {lat: current_lat, lng: current_lng}
				    });
				    
				new google.maps.Marker({
				    position: {lat: current_lat, lng: current_lng}
				  }).setMap(map); 
	
				/*  map.addListener('dragend', function() {
				   	current_lat = map.getCenter().lat();
				   	current_lng = map.getCenter().lng();
				}); */
				}
			</script>
		</div>
		
		
		<div class="content_detail" style="width: 60%; margin-left: 17.5%; overflow: hidden">
			<ul class="list"></ul> 
			<a href="searchlist.wd">리스트로 ㄱㄱ</a>
		</div>
		
	</div>
	
	<footer>  
		<%@ include file="./wfooter.jsp"%>
	</footer>
	
</body>
<footer>
         <%-- <jsp:include page= "../layout/wfooter.jsp"/> --%>
         <%@include file="../layout/wfooter.jsp"%>
</footer>
</html>