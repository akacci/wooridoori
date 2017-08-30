<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- 크로스도메인 해결 플러그인 -->
       


<style type="text/css">
	#cl-dashboard{display: none;} 
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
    	z-index: 1;
	}
	#hash{
		font-size:10pt;
		color:white;
		font-weight:bold;
		z-index: 9;
		position: relative;
		top: 200px;
		left: -20px;
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
		margin-left: 160px;
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
	#list{
		border: 1px solid #dedede;
		margin-left: 500px;
    	margin-top: 20px;
    	margin-bottom:0px;
    	width: 710px;
	}
	#content{
		padding: 10px;
		padding-left:200px;
		padding-right:20px;
		margin-left: 40px;
    	margin-bottom:-10px;
	}	
	#g_user{
		float: left;
	}
	#package{
		font-family: monospace;
		font-size: 10pt;
		
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
	#title:HOVER, #g_user:HOVER{
		font-weight: bold;
		cursor: pointer;
	} 
</style>
<c:set var="root" value="<%=request.getContextPath() %>"  />
<script type="text/javascript">
	$(document).ready(function(){
		 $(".menu").children("a").click(function(){
		        $(this).next().slideToggle();	//ul	            
	        });	 	 
 		 var mIcon=["SKY_A0038","SKY_A0101,08","SKY_A0202,09","SKY_A0303,10","SKY_A0412,40","SKY_A0513,41", "SKY_A0614,42","SKY_A0718" ,"SKY_A0821","SKY_A0932","SKY_A1004","SKY_A1129","SKY_A1226","SKY_A1327", "SKY_A1428" ];
		 /* 현재날씨 */
 		 	var root=$("#weather").attr("root");
			var city="서울";
			var county="용산구";
			var village="갈월동";
		   var Wurl="http://apis.skplanetx.com/weather/current/minutely?version=1&lat=&lon=&city="+city+"&county="+county+"&village="+village+"&appKey=4e235220-bbba-3ed6-a61d-7dfd07f58a39";
		   $.ajax({
		      url:Wurl,
		      type:"GET",
		      dataType:"JSON",
		      cache:false,
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
		         $("#weather").append(city+" 현재	: <b style='color:green;'>"+temp.substring(0,temp.length-3)+"°C</b> ["+weather+"] <img src='"+root+"/weather/"+img+".png' width='30px;'><br>");
		         
		      },complete : function(data) {
		         //alert("complete");
		       },error : function(xhr, status, error) {
		            //alert("error"+error);
		        }
		   });  
		   
		   var fIcon=["SKY_S0038","SKY_S0101,08","SKY_S0202,09","SKY_S0303,10","SKY_S0412,40","SKY_S0513,41", "SKY_S0614,42","SKY_S0718" ,"SKY_S0821","SKY_S0932","SKY_S1004","SKY_S1129","SKY_S1226","SKY_S1327", "SKY_S1428" ];  
		   /* 2day forecast */
 			var Furl="http://apis.skplanetx.com/weather/forecast/3days?version=1&lat=&lon=&city="+city+"&county="+county+"&village="+village+"&foretxt=Y&appKey=4e235220-bbba-3ed6-a61d-7dfd07f58a39";
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
			         $("#weather").append("내일 오전/오후	: <b style='color:red;'>"+parseFloat(tempH).toFixed(0)+"°C</b>/<b style='color:blue;'>"+parseFloat(tempM).toFixed(0)+"°C</b><img src='"+root+"/weather/"+ta_img+".png' width='30px;'>/<img src='"+root+"/weather/"+tp_img+".png' width='30px;'><br>");
			         $("#weather").append("모레 오전/오후	: <b style='color:red;'>"+parseFloat(tempH2).toFixed(0)+"°C</b>/<b style='color:blue;'>"+parseFloat(tempM2).toFixed(0)+"°C</b><img src='"+root+"/weather/"+ta2_img+".png' width='30px;'>/<img src='"+root+"/weather/"+tp2_img+".png' width='30px;'><br>");
			      },complete : function(data) {
			         //alert("complete");
			       },error : function(xhr, status, error) {
			            //alert("error"+error);
			        }
			   });   
		   
		   
		  var pIcon=["SKY_W0038","SKY_W0101,08","SKY_W0202,09","SKY_W0303,10","SKY_W0418","SKY_W0721","SKY_W0912,40","SKY_W1021","SKY_W1104","SKY_W1213,41","SKY_W1332" ];
		   /* 중기예보 */
 		var Purl="http://apis.skplanetx.com/weather/forecast/6days?version=1&lat=&lon=&city="+city+"&county="+county+"&village="+village+"&foretxt=Y&appKey=53a83a8a-6a67-3026-aa64-97d8851d6223";
		$.ajax({
		      url:Purl,
		      type:"GET",
		      dataType:"JSON",
		      cache:false,
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
	
		         $("#weather").append("글피 오전/오후	: <b style='color:red;'>"+tempH+"°C</b>/<b style='color:blue;'>"+tempM+"°C</b><img src='"+root+"/weather/"+a_img+".png' width='30px;'>/<img src='"+root+"/weather/"+p_img+".png' width='30px;'><br>");
		       },complete : function(data) {
		         //alert("complete");
		       },error : function(xhr, status, error) {
		            //alert("error"+error);
		        }
		   });   
		
		// Go to content
		$("#title, #g_user").click(function(){
			var num=$(this).attr("num");
			location.href="guideContent.wd?num="+num;
		});
		
		
		//	exim currency
		var rate_KtoU,rate_KtoE,rate_KtoC,rate_KtoJ,rate_KtoUK;
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
			});  
		    
 
	
		
/*		// YQL Currency	
		var Curl_KtoU="https:https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22USD%22%2C%22KRW%22)&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
		var Curl_KtoE="http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%3D%22KRWEUR%22&format=xml&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
		var Curl_KtoC="http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%3D%22KRWCNY%22&format=xml&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
		var Curl_KtoJ="http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%3D%22KRWJPY%22&format=xml&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
		var Curl_KtoP="http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%3D%22KRWPHP%22&format=xml&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
		//대만 TWD
 		$.ajax({
			url:Curl_KtoU,
			type:"GET",
			dataType:"XML",
			success:function(data){
				rate_KtoU=$(data).find("results").find("rate").find("Ask").text();
				$("#currency").append("<b><img src='./Guide_img/us.png'> 미국   USD	$");
				$("#currency").append((parseFloat(rate_KtoU)*1000).toFixed(1)+"	: ￦1000<br>");
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
		});
		*/
	});


	
	
</script>
</head>
<body>		
	<input type="button" id="write" value="write" class="btn btn-info btn-xs" onclick="location.href='guideAuthentic.wd'">
	 <%-- 	<img src="${root }/Guide_img/seoul.jpg" width="300px">  --%>
	 <!--상단 표시  -->
		<div class="top_g">				<!-- 시,도,군      (상단)
											한줄 설명
											해시태그  -->
			<span id="korea">대한민국<br>
				<span id="city"> 서울 <br>
					<span id="comment">대한민국의 심장</span>
				</span>
			</span>
			
			<a href="" id="hash">#남산</a>
			<a href="" id="hash">#경복궁</a>
			<a href="" id="hash" >#강남</a>	
			<a href="" id="hash" >#한강</a>	
			<a href="" id="hash" >#여의도</a>	
		</div>
	

		<!-- 메뉴와 리스트는 같은 div  -->
		<div class="form-horizontal">
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
			                <li>문화재</li>
			                <li>체험(예술)</li>
			                <li>체험(레져)</li>
			                <li>식도락</li>
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
				<div id="list" class="form-group">
					
						<img src="save/GuidePreview/${i.gb_preview_imgpath}" style="max-height:150px; max-width:220px; " id="g_user"  num="${i.seq_guide}">
						<div id="content" class="form-group">
							<img src="save/GuideFace/${i.imagepath}" id="guide"  >
							<a href="" id="name" >${i.gb_name }</a><br>
							<span id="title"  num="${i.seq_guide}">${i.gb_title }</span>
							<br><br>
							<c:forEach begin="0" end="4" >
								<img src="${root }/Guide_img/star.png">
							</c:forEach>
							<span id="rater">(30)</span>
							<img src="${root }/Guide_img/time.png"width="18px" id="g_time_img"><span id="g_time">${i.gb_time }</span>
							<br>
							<span id="package">${i.gb_keyword }</span> &nbsp;&nbsp;&nbsp;
							</span>				
							<span id="price">
								<fmt:formatNumber type="currency" currencySymbol="￦" value="${i.gb_price }"  />
								<span class="price_d" id="price_d${stat.count}" pri${stat.count}="${i.gb_price }">
								</span>	
							</span>
<%-- 								<fmt:parseNumber var="dollar" value="${i.gb_price/1100 }" integerOnly="true" />					
								(&#36;${dollar }) --%>
												
						</div>
					
				</div>
				</c:forEach>
			</div>
		</div>
		<div id="pa"></div>
	
		
		
		
</body>
</html>
