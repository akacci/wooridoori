<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="<%=request.getContextPath() %>"  />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>


<!-- Currency rate for cross domain -->
<script type="text/javascript" src="${root}/dist/jquery.ajax-cross-origin.min.js"></script>
<!-- Google Map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCd4AIIG7caN6x_v-qyPXoSwfg7EuDqbds" async defer></script>
 <!-- rate  -->
<script src="${root }/gjunge-rateit.js-937fff8/scripts/jquery.rateit.js" type="text/javascript" charset="UTF-8"></script>
<link rel="stylesheet" type="text/css" href="${root }/gjunge-rateit.js-937fff8/scripts/rateit.css">

       

<style type="text/css">
	#cl-dashboard{display: none;} 
	ul, li{
		 list-style:none;
	}
	/*상단 표시  */
	.top_g{
		background-image: url("/wooridoori/Guide_img/seoul.jpg"); 	/* 지역이미지 경로 */
		height: 350px;
		background-position: center;
    	background-size: cover; 
    	width: 1050px;
    	background-repeat: no-repeat;
    	margin-left: 150px;
    	margin-top: 50px;
		position: relative;
    	z-index: 3;
	}
	#hash{
		font-size:10pt;
		color:white;
		font-weight:bold;
		z-index: 9;
		position: relative;
		top: 200px;
		left: -120px;
		margin-right: 10px;
		background-color: rgba( 10, 10, 10, 0.5 );
	}	
	#hash:HOVER {
		color: white;
		font-weight:bold;
		background-color: rgba( 200, 200, 255, 0.5 );	
	}
	#city{
		font-size: 30pt;
		font-weight: bold;
		color:white;
		position: relative;
		z-index: 9;
		top: 0px;
		left: 0px;
		cursor: pointer;
	}
	#korea{
		font-size: 12pt;
		color:white;
		z-index: 9;
		position: relative;
		top: 80px;
		left: 80px;
	}
	#comment{
		font-size: 10pt;
		font-weight: bold;
		color:white;
		z-index: 9;
		position: relative;
		top: 0px;
		left: 0px;
	}
	/* 메뉴 */
	#m .menu a{cursor:pointer;
		font-size: 10pt;
	}
	#m .menu .submenu{display:none;}

	#m{
	/* 	border: 1px solid #dedede; */
		margin-left: 147px;
    	margin-top: 20px;
    	width: 300px;
    	height: 100px;
	}
	#weather{
		text-decoration: blink;
		font-weight: bold;
		font-size: 8pt;
	}

	/* 리스트 */
	.list{
		border: 1px solid #dedede;
		margin-left: 470px;
    	margin-top: 20px;
    	margin-bottom:0px;
    	width: 740px;
	}
	#content{
		padding: 10px;
		padding-left:280px;
		padding-right:20px;
	
    	margin-bottom:-10px;
	}	
	.g_user{
		float: left;
	}
	.hash b{
		font-family: monospace;
		font-size: 10pt;		
	}
	.hash b:HOVER{
		cursor: pointer;
	}
	#price{
		font-family: fantasy;
		font-size: 13pt;
		font-weight: bold;
	 	float: right; 
		padding-right:0px;
	}
	.price_d{
		font-family: sans-serif;
		font-size: 11pt;
	/* 	float: right; */
	}
	#g_time_img,#g_time{
		font-family: monospace;
		float: right;
	}
	.form-horizontal{
		margin-left: 5px;
	}
 	#guide{
		max-height:35px;
	 	border-radius: 50%;
		border-top-left-radius: 50% 50%;
	  	border-top-right-radius: 50% 50%;
	  	border-bottom-right-radius: 50% 50%;
	  	border-bottom-left-radius: 50% 50%; 
	  }
	#title:HOVER, .g_user:HOVER{
		font-weight: bold;
		cursor: pointer;
	} 
	.g_user{
		height:100%;
		width: 235px;
		overflow: hidden;
		position: relative;
	}
	.contentImg{
		display: inline;
		height:159px;
		width: 235px; 
		overflow: hidden;
		position: absolute;
	}
	#currency{
		font-size: 10pt;
	}
	.prev{
		display: inline;
		font-size: 24pt;
		color: white;
		font-weight:bold;
		margin-left: 0px;
		margin-top: 50px; 
		position: absolute;
		cursor: pointer;
		z-index: 2;
		display: none;  
	}
	 .next{
		display: inline;
		font-size: 24pt;
		color: white;
		font-weight:bold;
 		margin-left: 210px;
		margin-top: 50px; 
		position: absolute;
		cursor: pointer;
	  	display: none;  
	}
	#bottom_g{
		margin-bottom: 80px;
	}
	.rateit{
		color:yellow; 
	}
	#loc_sel{
		display: none;
	}
	.submenu li a{
		font-size: 14pt;
		font-weight: bold;
		color: gray;
	}
	.submenu li a:HOVER{
		font-size: 17pt;
		font-weight: bold;
		color: gray;
	}
	.menu a{
		font-size: 20pt;
		font-weight: bold;
		color: black;
	}
	/* exchange */
	.exchange {
	cursor: pointer;
	}
	
	.popupLayer {
		position: absolute;
		display: none;
		background-color: #eeeeee;
		border: solid 2px #d0d0d0;
		width: 350px;
		height: 170px;
		padding: 10px;
	}
	.popupLayer div {
		position: absolute;
		top: 5px;
		right: 5px
	}
	#write{
		margin-left: 1100px;
	}
	#bottom_g{
		margin-bottom: 200px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		if(("${addr}")=="서울특별시"){
			$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/seoul.jpg')");	
			$("#comment").append("대한민국의 심장 [Hi Seoul]");
		}
		else if(("${addr}")=="경기도"){
			$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/gg.jpg')");	
			$("#comment").append("세계속의 경기도 [Global Inspiration]");
		}
		else 		if(("${addr}")=="인천광역시"){
			$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/ic.jpg')");
			$("#comment").append("동북아시아의 허브 [Fly Incheon]");
		}
		else 		if(("${addr}")=="강원도"){
			$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/gw.jpg')");
			$("#comment").append("산과 바다의 어울림 [Get in the Kangwon]");
		}
		else 		if(("${addr}")=="충청북도"){
			$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/cb.jpg')");
			$("#comment").append("생명과 태양의 땅 [Bio Valley & Solar Valley]");
		}
		else		if(("${addr}")=="충청남도"){
			$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/cn.jpg')");
			$("#comment").append("대한민국 역사의 중심지 [Heart of Korea]");
		}
		else		if(("${addr}")=="대전광역시"){
			$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/dj.jpg')");
			$("#comment").append("교통과 과학의 중심지 [It's Daejeon]");
		}
		else		if(("${addr}")=="전라북도"){
			$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/jb.jpg')");
			$("#comment").append("쳔넌의 비상 [We Make History]");
		}
		else		if(("${addr}")=="전라남도"){
			$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/jn.jpg')");
			$("#comment").append("생명의 땅 [Full of Life]");
		}
		else		if(("${addr}")=="경상북도"){
			$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/kb.jpg')");	
			$("#comment").append("한반도의 백두대간 [Pride GyeongBuk]");
		}
		else		if(("${addr}")=="경상남도"){
			$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/kn.jpg')");
			$("#comment").append("문명의 중심지[Feel GyeongNam]");
		}
		else		if(("${addr}")=="대구광역시"){
			$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/dg.jpg')");	
			$("#comment").append("조선의 도회지 [Colorful Daegu]");
		}
		else		if(("${addr}")=="울산광역시"){
			$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/ulsan.jpg')");		
			$("#comment").append("하늘도 물도 맑은 축복의 땅 [Ulsan for you]");
		}
		else		if(("${addr}")=="부산광역시"){
			$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/bs.jpg')");	
			$("#comment").append("사람과 기술, 문화로 융성하는 부산 [Dynamic Busan]");
		}
		else		if(("${addr}")=="제주특별자치도"){
			$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/jj.jpg')");
			$("#comment").append("신비의 섬 [Only Jeju Island]");
		}
		else		if(("${addr}")=="광주광역시"){
			$(".top_g").css("background-image","url('${root}/Guide_img/Location_info/kj.jpg')");	
			$("#comment").append("문화의 수도 [Tour Partner Gwangju]");
		}
		
		
		 $(".menu").children("a").click(function(){
		        $(this).next().slideToggle();	//ul	            
	        });
		 
		 /* image slider */
/*  		 $(".g_user").hide();
		 $(".contentImg img:first-child").show();
		 $("#prev, #next").hide();
		 $(".g_user").hover(function(){
			 $(this).next("#prev").show();
			 $(this).next("#prev").next("#next").show();
		 },function(){
			 $(this).next("#prev").hide();
			 $(this).next("#prev").next("#next").hide();
		 });
		 
		  */
		var lat;
		var lng;
		 
		/* Select Lat,Lon of map */
		$address =$("#city").attr("addr");
		var url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + $address + "&key=AIzaSyCd4AIIG7caN6x_v-qyPXoSwfg7EuDqbds";
		$.ajax({
			url : url ,
			dataType : "json" ,
			type : "post" ,
			async:false,
			success : function(data) {
				lat = data.results[0].geometry.location.lat;
				lng = data.results[0].geometry.location.lng;
			} ,
			error : function (xh, code, msg) {
				alert("주소양식이 적절하지 않습니다.");
			}
		});
		
		 
		 
		 
 		 var mIcon=["SKY_A0038","SKY_A0101,08","SKY_A0202,09","SKY_A0303,10","SKY_A0412,40","SKY_A0513,41", "SKY_A0614,42","SKY_A0718" ,"SKY_A0821","SKY_A0932","SKY_A1004","SKY_A1129","SKY_A1226","SKY_A1327", "SKY_A1428" ];
		 /* 현재날씨 */
 		 	var root="${root}";
			var city=($("#city").attr("addr")).substring(0,2);
		/* 	var county="용산구";
			var village="갈월동"; */
		   var Wurl="http://apis.skplanetx.com/weather/current/minutely?version=1&lat="+lat+"&lon="+lng+"&city=&county=&village=&appKey=e08ba558-1e6b-326b-986e-9526ca7a0532";
		   $.ajax({
		      url:Wurl,
		      type:"GET",
		      dataType:"JSON",
		      cache:false,
		      async:false,
		      success:function(data){
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
		         $("#weather").append(city+" 현재	: <b style='color:green;'>"+temp.substring(0,temp.length-3)+"℃</b> ["+weather+"] <img src='"+root+"/weather/"+img+".png' width='25px;'><br>");
		         
		      },complete : function(data) {
		         //alert("complete");
		       },error : function(xhr, status, error) {
		            //alert("error"+error);
		        }
		   });  
		   
		   var fIcon=["SKY_S0038","SKY_S0101,08","SKY_S0202,09","SKY_S0303,10","SKY_S0412,40","SKY_S0513,41", "SKY_S0614,42","SKY_S0718" ,"SKY_S0821","SKY_S0932","SKY_S1004","SKY_S1129","SKY_S1226","SKY_S1327", "SKY_S1428" ];  
		   /* 2day forecast */
 			var Furl="http://apis.skplanetx.com/weather/forecast/3days?version=1&lat="+lat+"&lon="+lng+"&city=&county=&village=&foretxt=Y&appKey=5c3c93ac-4dfc-3678-b291-a4b92caea652";
			$.ajax({
			      url:Furl,
			      type:"GET",
			      dataType:"JSON",
			      cache:false,
			      async:false,
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
			         $("#weather").append("내일 오전/오후	: <b style='color:red;'>"+parseFloat(tempH).toFixed(0)+"℃</b>/<b style='color:blue;'>"+parseFloat(tempM).toFixed(0)+"℃</b><img src='"+root+"/weather/"+ta_img+".png' width='30px;'>/<img src='"+root+"/weather/"+tp_img+".png' width='25px;'><br>");
			         $("#weather").append("모레 오전/오후	: <b style='color:red;'>"+parseFloat(tempH2).toFixed(0)+"℃</b>/<b style='color:blue;'>"+parseFloat(tempM2).toFixed(0)+"℃</b><img src='"+root+"/weather/"+ta2_img+".png' width='30px;'>/<img src='"+root+"/weather/"+tp2_img+".png' width='25px;'><br>");
			      },complete : function(data) {
			         //alert("complete");
			       },error : function(xhr, status, error) {
			            //alert("error"+error);
			        }
			   });   
		   
		   
		  var pIcon=["SKY_W0038","SKY_W0101,08","SKY_W0202,09","SKY_W0303,10","SKY_W0418","SKY_W0721","SKY_W0912,40","SKY_W1021","SKY_W1104","SKY_W1213,41","SKY_W1332" ];
		   /* 중기예보 */
 		var Purl="http://apis.skplanetx.com/weather/forecast/6days?version=1&lat="+lat+"&lon="+lng+"&city=&county=&village=&foretxt=Y&appKey=e08ba558-1e6b-326b-986e-9526ca7a0532";
		$.ajax({
		      url:Purl,
		      type:"GET",
		      dataType:"JSON",
		      cache:false,
		      async:false,
		      success:function(data){
		         var a_path=data.weather.forecast6days[0].sky.amCode3day;
		         var p_path=data.weather.forecast6days[0].sky.pmCode3day;
		         var tempH=data.weather.forecast6days[0].temperature.tmax3day;
		         var tempM=data.weather.forecast6days[0].temperature.tmin3day;	
		         var time=data.weather.forecast6days[0].timeRelease;
		         var a_img,p_img;
		         for(var i=0;i<pIcon.length;i++){
		        	 if(pIcon[i].indexOf(a_path)>=0){
		        		 if(pIcon[i].indexOf(",")>=0){	//am pm		
		       	 			a_img=pIcon[i].substring(pIcon[i].indexOf(a_path)+7,pIcon[i].indexOf(","));
		        		 }
		        		 else{
			       	 		a_img=pIcon[i].substring(pIcon[i].indexOf(a_path)+7,pIcon[i].length);
		        		 }
		        	 }
		        	 if(pIcon[i].indexOf(p_path)>=0){
		        		 if(pIcon[i].indexOf(",")>=0){	//tommrow pm		
		       	 				p_img=pIcon[i].substring(pIcon[i].indexOf(p_path)+7,pIcon[i].indexOf(","));			        		
		        		 }
		        		 else{
		        			 p_img=pIcon[i].substring(pIcon[i].indexOf(p_path)+7,pIcon[i].length);
		        		 }
		        	 }
		         }
	
		         $("#weather").append("글피 오전/오후	: <b style='color:red;'>"+tempH+"℃</b>/<b style='color:blue;'>"+tempM+"℃</b><img src='"+root+"/weather/"+a_img+".png' width='25px;'>/<img src='"+root+"/weather/"+p_img+".png' width='25px;'><br>");
		       },complete : function(data) {
		         //alert("complete");
		       },error : function(xhr, status, error) {
		            //alert("error"+error);
		        }
		   });   
		
		// Go to content
		$("#title, .g_user").click(function(){
			var num=$(this).attr("num");
			var addr="${addr}";
			location.href="guideContent.wd?num="+num+"&addr="+addr;
		});
		
		
		//	exim currency (CORS problem)
/* 		var rate_KtoU,rate_KtoE,rate_KtoC,rate_KtoJ,rate_KtoUK;
 		var ccurl =
 			"https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=Avm51DeaHc8RmKifWkWgOFmw7UseHsZY&data=AP01&searchdate=20170825";		
	
		    $.ajax({
		        crossOrigin: true, 
		        url: ccurl,	
		        context: {},
				success:function(data){
					var obj=JSON.parse(data);
					$("#currency").append("<img src=\'./Guide_img/us.png\'><b> 미국  "+obj[29].cur_unit+"	$");
					rate_KtoU=(obj[29].deal_bas_r).replace(",","");
					$("#currency").append((1000/parseFloat(rate_KtoU)).toFixed(2)+"	: \￦1000<br></b>");
					//
					for(var i=1;i<=2;i++){
						$("#price_d"+i).append(" ($"+(parseFloat($("#price_d"+i).attr("pri"+i))/parseFloat(rate_KtoU)).toFixed(2)+")" );
					}
					$("#currency").append("<img src=\'./Guide_img/ch.png\'><b> 중국  "+obj[7].cur_unit+"	¥");
					rate_KtoC=(obj[7].deal_bas_r).replace(",","");
					$("#currency").append((1000/parseFloat(rate_KtoC)).toFixed(2)+"	: \￦1000<br></b>");
					
					$("#currency").append("<b><img src=\'./Guide_img/eu.png\'> 유럽  "+obj[11].cur_unit+"	€");
					rate_KtoE=(obj[11].deal_bas_r).replace(",","");
					$("#currency").append((1000/parseFloat(rate_KtoE)).toFixed(2)+"	: \￦1000<br>");
					
					$("#currency").append("<b><img src=\'./Guide_img/jp.png\'> 일본  "+(obj[18].cur_unit).substring(0,3)+"	¥");
					rate_KtoJ=(obj[18].deal_bas_r).replace(",","");
					$("#currency").append((1000/parseFloat(rate_KtoJ)).toFixed(2)+"	: \￦1000<br>");
					
					$("#currency").append("<b><img src=\'./Guide_img/uk.png\'> 영국  "+obj[14].cur_unit+"	£");
					rate_KtoUK=(obj[14].deal_bas_r).replace(",","");
					$("#currency").append((1000/parseFloat(rate_KtoUK)).toFixed(2)+"	: \￦1000<br>");
					
				},error:function(xhr, status, error) {
		           alert("error: "+error);
		        
				}
			});   */
		    
 
	
		
		// YQL Currency	
/* 		var Curl_KtoU="http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%3D%22KRWUSD%22&format=xml&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
		var Curl_KtoE="http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%3D%22KRWEUR%22&format=xml&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
		var Curl_KtoC="http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%3D%22KRWCNY%22&format=xml&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
		var Curl_KtoJ="http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%3D%22KRWJPY%22&format=xml&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
		var Curl_KtoP="http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%3D%22KRWPHP%22&format=xml&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
 */
  		var Curl="https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22KRW%22%2C%22USD%22%2C%22PHP%22%2C%22EUR%22%2C%22CNY%22%2C%22JPY%22%2C%22GBP%22)&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
		//대만 TWD
		var utok_size="${fn:length(list)} ";
		utok_size=parseInt(utok_size);
		var i=0;
		var utok=0;
		var php,eur,cny,jpy,gbp;
		$.ajax({
			url:Curl,
			type:"GET",
			dataType:"XML",
			success:function(data){				
				$(data).find("results").find("rate").each(function(){
					var rate=$(this).find("Ask").text();	
					if(i==0){
						$("#currency").append("<b><img src='./Guide_img/us.png'> 미국   USD	$");
						$("#currency").append((1000/parseFloat(rate)).toFixed(2)+"	: ￦1000<br>");
						utok=1000/(parseFloat(rate));
						for(var j=1;j<=utok_size;j++){		// Loop of list size 
							$("#price_d"+j).append(" ($"+(parseInt($("#price_d"+j).attr("pri"+j))/parseFloat(rate)).toFixed(1)+")");
						}
					}
					else if(i==2){
						php=(parseFloat(utok)*parseFloat(rate)).toFixed(2);
						$("#currency").append("<b><img src='./Guide_img/ph.png'> 필리핀 PHP	₱");
						$("#currency").append(php+"	: ￦1000<br>");	
					}
					else if(i==3){
						eur=(parseFloat(utok)*parseFloat(rate)).toFixed(2);
						$("#currency").append("<b><img src='./Guide_img/eu.png'> 유럽   EUR	€");
						$("#currency").append(eur+"	: ￦1000<br>");
					}
					else if(i==4){
						cny=(parseFloat(utok)*parseFloat(rate)).toFixed(2);
						$("#currency").append("<b><img src='./Guide_img/ch.png'> 중국   CNY	¥");
						$("#currency").append(cny+"	: ￦1000<br>");
						
					}
					else if(i==5){
						jpy=(parseFloat(utok)*parseFloat(rate)).toFixed(2);
						$("#currency").append("<b><img src='./Guide_img/jp.png'> 일본   JPY	¥");
						$("#currency").append(jpy+"	: ￦1000<br>");
			
					}
					else if(i==6){
						gbp=(parseFloat(utok)*parseFloat(rate)).toFixed(2);
						$("#currency").append("<b><img src='./Guide_img/uk.png'> 영국   GBP	£");
						$("#currency").append(gbp+"	: ￦1000<br>");
						
					}
					++i;
				});				
			} 			
			
		
		});  
		

		
		
		/* Exchange */
		
		$(".exchange").click(function(e)
		{
			var sWidth = window.innerWidth;
			var sHeight = window.innerHeight;

			var oWidth = $('.popupLayer').width();
			var oHeight = $('.popupLayer').height();

			// 레이어가 나타날 위치를 셋팅한다.
			var divLeft = e.pageX + 10;
			var divTop = e.pageY + 150;

			// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
			if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
			if( divTop + oHeight > sHeight ) divTop -= oHeight;

			// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
			if( divLeft < 0 ) divLeft = 0;
			if( divTop < 0 ) divTop = 0;

			$('.popupLayer').css({
				"top": divTop,
				"left": divLeft,
				"position": "absolute"
			})
			$('.popupLayer b').empty();
			$(".popupLayer").append("<b><img src='./Guide_img/ph.png'> 필리핀");
			$('.popupLayer').append("<b> (PHP	₱"+(parseInt($(this).prev().attr("pri"))/1000*parseFloat(php)).toFixed(1)+")<br></b>");
			
			$(".popupLayer").append("<b><img src='./Guide_img/eu.png'> 유럽");
			$('.popupLayer').append("<b> (EUR	€"+(parseInt($(this).prev().attr("pri"))/1000*parseFloat(eur)).toFixed(1)+")<br></b>");
			
			$(".popupLayer").append("<b><img src='./Guide_img/ch.png'> 중국");
			$('.popupLayer').append("<b> (CNY	¥"+(parseInt($(this).prev().attr("pri"))/1000*parseFloat(cny)).toFixed(1)+")<br></b>");
			
			$(".popupLayer").append("<b><img src='./Guide_img/jp.png'> 일본");
			$('.popupLayer').append("<b> (JPY	¥"+(parseInt($(this).prev().attr("pri"))/1000*parseFloat(jpy)).toFixed(1)+")<br></b>");
			
			$(".popupLayer").append("<b><img src='./Guide_img/uk.png'> 영국");
			$('.popupLayer').append("<b> (GBP	£"+(parseInt($(this).prev().attr("pri"))/1000*parseFloat(gbp)).toFixed(1)+")<br></b>");
			
						
			$('.popupLayer').show();
		

		});		
		
	/* 	$.ajax({
			url:Curl_KtoU,
			type:"GET",
			dataType:"XML",
			success:function(data){
				rate_KtoU=$(data).find("results").find("rate").find("Ask").text();
				$("#currency").append("<b><img src='./Guide_img/us.png'> 미국   USD	$");
				$("#currency").append(1/(parseFloat(rate_KtoU)).toFixed(1)+"	: ￦1000<br>");
				for(var i=1;i<=2;i++){		// Loop of list size 
					$("#price_d"+i).append(" ($"+(parseInt($("#price_d"+i).attr("pri"+i))*parseFloat(rate_KtoU)).toFixed(1)+")");
				}
			}
		}); 
		$.ajax({
			url:Curl_KtoE,
			type:"GET",
			dataType:"XML",
			success:function(data){
				$("#currency").append("<b><img src='./Guide_img/eu.png'> 유럽   EUR	€");
				rate_KtoE=$(data).find("results").find("rate").find("Ask").text();
				$("#currency").append((parseFloat(rate_KtoE)*1000).toFixed(1)+"	: ￦1000<br>");
			}
		});
		$.ajax({
			url:Curl_KtoC,
			type:"GET",
			dataType:"XML",
			success:function(data){
				$("#currency").append("<b><img src='./Guide_img/ch.png'> 중국   CNY	¥");
				rate_KtoC=$(data).find("results").find("rate").find("Ask").text();
				$("#currency").append((parseFloat(rate_KtoC)*1000).toFixed(1)+"	: ￦1000<br>");
			}
		});
		$.ajax({
			url:Curl_KtoJ,
			type:"GET",
			dataType:"XML",
			success:function(data){
				
				$("#currency").append("<b><img src='./Guide_img/jp.png'> 일본   JPY	¥");
				rate_KtoJ=$(data).find("results").find("rate").find("Ask").text();
				$("#currency").append((parseFloat(rate_KtoJ)*1000).toFixed(1)+"	: ￦1000<br>");
			}
		}); 
		$.ajax({
			url:Curl_KtoP,
			type:"GET",
			dataType:"XML",
			success:function(data){
				$("#currency").append("<b><img src='./Guide_img/ph.png'> 필리핀 PHP	₱");
				rate_KtoP=$(data).find("results").find("rate").find("Ask").text();
				$("#currency").append((parseFloat(rate_KtoP)*1000).toFixed(1)+"	: ￦1000<br>");
			}
		}); */
		
		
		
		
		
		
		/* content image slider */
	 	$(".contentImg").hide();
		$(".contentImg:first-child").show();		//default image
		$(".contentImg").hover(function(){
			if($(this).nextAll(".contentImg").length>0){			
				$(this).children(".next").show();
				$(".next").click(function(){
					$(this).parent().hide();
					$(this).parent().next().show();
				 });		
			}else{
				$(".next").hide();				
			}
			if($(this).prevAll(".contentImg").length>0){
				$(this).children(".prev").show();
				$(".prev").click(function(){
					$(this).parent().hide();
				 	$(this).parent().prev().show(); 
				});
			}else{
				$(".prev").hide();					
			}			
		},function(){
			$(this).children(".next").hide();
			$(this).children(".prev").hide();			
		}); 
 
		   /* Hash tag search */
		   $(".hash").click(function(){
		   		var addr="${addr}";
	 	   		var hash=$(this).children("b").attr("hash");
		   		location.href="hashSearch.wd?addr="+addr+"&hash="+hash;   
		   	});
		
		/* Area  */
		$("#city").click(function(){
			$("#loc_sel").click();
			//$("#loc_sel").css("display","inline");
			
		});
		
		
		
	});

	function closeLayer( obj ) {
		$(obj).parent().parent().hide();
	}

	
	
	
</script>
</head>
<body>		

	<header style="z-index: inherit;">
		<%@ include file= "../layout/top.jsp" %>
	</header>
	
	 
	 
	 <!--상단 표시  -->
		<div class="top_g">				<!-- 시,도,군      (상단)
											한줄 설명
											해시태그  -->
			<span id="korea">대한민국<br>
				<span id="city" addr="${addr }" lat="${lat }"  lng="${lng }" > ${addr } 	<br>
					<span id="comment"></span>
				</span>
			</span>
			
			<select name="loc_sel" id="loc_sel">
			    <option value="서울특별시">서울특별시</option>
			     <option value="경기도">경기도</option>
			      <option value="인천광역시">인천광역시</option>
			       <option value="강원도">강원도</option>
			        <option value="충청북도">충청북도</option>
			         <option value="충청남도">충청남도</option>
			          <option value="대전광역시">대전광역시</option>
			           <option value="전라북도">전라북도</option>
			            <option value="전라남도">전라남도</option>
			             <option value="광주광역시">광주광역시</option>
			        <option value="제주도">제주도</option>
			         <option value="경상북도">경상북도</option>
			          <option value="경상남도">경상남도</option>
			           <option value="대구광역시">대구광역시</option>
			            <option value="부산광역시">부산광역시</option>
			             <option value="울산광역시">울산광역시</option>
			</select>
			
			
			<a href="" class="hash" id="hash">#남산</a>
			<a href="" class="hash" id="hash">#경복궁</a>
			<a href="" class="hash" id="hash">#강남</a>	
			<a href="" class="hash" id="hash">#한강</a>	
			<a href="" class="hash" id="hash">#여의도</a>	
		</div>
		
		<c:if test="${sessionScope.id ne null }">	
			<input type="button" id="write" value="가이드 등록하기" class="btn btn-info btn-xs" onclick="location.href='guideAuthentic.wd?addr=${addr}'">
		</c:if>
	
		<!-- 메뉴와 리스트는 같은 div  -->
		<div class="form-horizontal" id="bottom_g">
			<div class="form-group">
			
				<!--메뉴  -->
				<div id="m" class="col-xs-3"  >	
			    	<!-- Currency -->
			    	<pre><span  id="currency"></span></pre>
			    	<!-- weather -->
			    	<pre><span id="weather" root="${root }"></span></pre>	
					<!-- menu -->
					<ul>
			        <li class="menu">
			            <a><img src="${root }/Guide_img/list_img.png" alt="가이드 테마" width="10px"/>가이드 테마</a>
			            <ul class="submenu">
			                <li><a href="themeSearch.wd?theme=문화재&addr=${addr }">문화재</a></li>
			                <li><a href="themeSearch.wd?theme=체험(예술)&addr=${addr }">체험(예술)</a></li>
			                <li><a href="themeSearch.wd?theme=체험(레져)&addr=${addr }">체험(레져)</a></li>
			                <li><a href="themeSearch.wd?theme=식도락&addr=${addr }">식도락</a></li>
			                <li><a href="themeSearch.wd?theme=자연&addr=${addr }">자연</a></li>
			            </ul>
			        </li>
			 
			        <li class="menu">
			            <a><img src="${root }/Guide_img/list_img.png" alt="예약 시점" width="10px"/>예약 시점</a>
			            <ul class="submenu">
			                <li>1주 이내</li>
			                <li>1개월</li>
			                <li>6개월</li>
			            </ul>
			        </li>
			    	</ul>
			</div>
				
	
		
		
			<!-- 리스트 -->
			<c:forEach items="${list }" var="i" varStatus="stat">
				<div class="list" class="form-group">
					<c:forTokens items="${i.gb_preview_imgpath}" delims="," var="imgPath">
						<div class="contentImg" >						
							<img src="save/GuidePreview/${imgPath}"  class="g_user"   num="${i.seq_guide}">
							<span class="prev"><</span>
							<span class="next">></span>
						</div>
					</c:forTokens>
						
						
						
						<div id="content" class="form-group">
							<img src="save/GuideFace/${i.imagepath}" id="guide"  >
							<a href="" id="name" >${i.gb_name }</a><br><br>
							<span id="title"  num="${i.seq_guide}">${i.gb_title }</span>
							<br><br>
							
							<div class="rateit" data-rateit-value="${i.gb_score }" data-rateit-readonly="true"></div>
<%-- 							<c:forEach begin="0" end="4" >
								<img src="${root }/Guide_img/star.png">
							</c:forEach> --%>
							<span id="rate">(${rater[stat.index] })</span>
							
							<img src="${root }/Guide_img/time.png"width="18px" id="g_time_img"><span id="g_time">${i.gb_time }</span>
							<br>
							
							<span id="price">
								<fmt:formatNumber type="currency" currencySymbol="￦" value="${i.gb_price }"  />
								<span class="price_d" id="price_d${stat.count}" pri${stat.count}="${i.gb_price }" pri="${i.gb_price }">
								</span>	
								<img src="${root }/Guide_img/exchange.png" width="23px;" class="exchange">
							</span>
							<c:forTokens items="${i.gb_keyword}" delims="#" var="hash" varStatus="i" >
								<a class="hash">#<b hash="${hash }">${hash } </b></a>
							</c:forTokens>	
						

<%-- 								<fmt:parseNumber var="dollar" value="${i.gb_price/1100 }" integerOnly="true" />					
								(&#36;${dollar }) --%>
												
						</div>
					
				</div>
				</c:forEach>
			</div>
		</div>

	<!-- Exchage Layer -->
	<div class="popupLayer">
		Currency Rate<br>
		<div>
			<span onClick="closeLayer(this)" style="cursor:pointer;font-size:1.5em" title="닫기">X</span>
		</div>
		<span class="exl"></span>
	</div>



	<!-- 페이징처리 -->
	<div style="margin-left: 350px; margin-bottom: 100px;" class="text-center" >
		<ul class="pagination">
			<!-- 이전(첫블럭이 아니면 보이게하기) -->
			<c:if test="${startPage>1}">
				<li><a href="guideList.wd?pageNum=${startPage-1 }&addr=${addr}"> ◀</a></li>
			</c:if>
			<c:forEach begin="${startPage }" end="${endPage }" step="1" var="i">
				<li><c:if test="${currentPage==i }">
						<a style="color: red" href="guideList.wd?pageNum=${i }&addr=${addr}">${i }</a>
					</c:if> <c:if test="${currentPage!=i }">
						<a style="color: black" href="guideList.wd?pageNum=${i }&addr=${addr}">${i }</a>
					</c:if></li>
			</c:forEach>

			<!-- 다음 (마지막 블럭이 아니면보이기):클릭시 현재페이지는
					 다음블럭의 startPage 로 가려면 어떻게 주어야할까요 -->
			<c:if test="${endPage<totalPage }">
				<li><a href="guideList.wd?pageNum=${endPage+1 }&addr=${addr}"> ▶</a></li>
			</c:if>
		</ul>
	</div>


	<footer class="container-fluid text-center">
      <%@ include file= "../layout/wfooter.jsp" %>
   </footer> 
		
</body>
</html>
