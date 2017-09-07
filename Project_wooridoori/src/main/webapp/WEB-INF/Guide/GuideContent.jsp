<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="<%=request.getContextPath() %>"  />
<!-- Google Map -->

<!-- <script  async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBUrN36lFlYIarTCd5zdh0iev8CJiNTshk&callback=initMap"></script>
 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCd4AIIG7caN6x_v-qyPXoSwfg7EuDqbds&callback=initMap" async defer></script>
<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
<!-- date picker  -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


 <!-- AdminLTE -->
<!--   <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="../../bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="../../bower_components/Ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
 -->


<style type="text/css">
	#cl-dashboard{display: none;} 
	#title{
		margin-left: 100px;
		margin-bottom: 30px;
		margin-top: 30px;
		font-size: 23pt;
		font-weight: bold;
	}
	#mainArea, #reservationArea{
		display: inline;
	}
	#reservationArea{
		width: 240px;
		height:100px;
		margin-left:50px;
		padding-left:60px;
		padding-top:10px;
		border: 1px solid #dddddd;
		position: absolute;
	}
	#mainArea{
		padding-left: 100px;
		float:left;
		width: 800px;
	}
	#content,  hr, #mainArea{
		margin-left: 100px;
		margin-bottom: 30px;
		margin-top: 30px;
	}
	#mainArea{
		margin-top: -20px;
	}
 	#top{
		margin-left: 100px;
    	margin-top: 50px;
		background-repeat: no-repeat;
		width: 1200px;
		height: 400px;
		overflow: hidden;
		background-size: cover;
		background-position: center;
		padding-top: 50px;
		padding-left: 20px;
	} 
	#top img{
		z-index: 3;
		display: inline;
		position: relative;
	}
	#top b{
		z-index: 2;
		font-size: 14pt;
		color: white;
		display: inline;
		position: relative;
		background-color: gray;
		opaci
	}
	#topImg{
    	margin-top: 50px;
    	width: 1200px;
	}
	
	.top_info img{
		max-height: 50px;
	}
	.top_info{
		height: 60px;
		margin-left: 80px;
		display: inline;
	}
	.top_info2{
		color: gray;
	}
	.top_info3{
		font-size: 12pt;
	}
	#guide{
		max-height:55px;
	 	border-radius: 50%;
		border-top-left-radius: 50% 50%;
	  	border-top-right-radius: 50% 50%;
	  	border-bottom-right-radius: 50% 50%;
	  	border-bottom-left-radius: 50% 50%; 
	  }
	.replyform{
	 	display: none; 
		background-color: #e9e9e9; 
		margin-top : 10px;
		padding-left: 10px; 
		padding-top: 0px;
		width: 800px;
	}
	#reserveBtn{
		background-color: #AFD9E0;
		width:150px;
		height:40px;
		text-align: center;
		position: relative;
		padding-left: 30px;
		padding-right: 30px;
		padding-top: 10px;
		padding-bottom: 10px;
		cursor: pointer;
		display: inline;
	}
	#reserveTxt{
		position: relative;
	}
	#tour_info1, #tour_info2{
		display: inline;
		position: relative;
	}
	#replyArea{
		margin-top: 50px;
		padding-left: -100px;
		margin-bottom: 100px;
	}
	.contentImg img, .contentImg{
		width: 700px;
		margin-top: 40px;
		display: inline;
		position: relative;
	}
	.prev{
		display: inline;
		font-size: 54pt;
		color: white;
		font-weight:bold;
		margin-left: 20px;
		margin-top: -250px;
		position: absolute;
		cursor: pointer;
		z-index: 2;
		display: none;
	}
	 .next{
		display: inline;
		font-size: 54pt;
		color: white;
		font-weight:bold;
		margin-left: 650px;
		margin-top: -250px;
		position: absolute;
		cursor: pointer;
		display: none;
	}
	.hash:HOVER{
		cursor: pointer;
	}
	#hash_g{
		margin-top: 160px;
	}
</style>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		//title img
 		
/* 		lat=parseFloat($("#meetNgreet").attr("lat"));	// *= is String to number
		lng=parseFloat($("#meetNgreet").attr("lng"));
		var addr=$("#meetNgreet").attr("addr");
		initMap(lat, lng, addr); 
		 */
		
		setTimeout(initMap(),100);
		 
		var img=$("#top").attr("path");
		var path="save/GuidePreview/"+img;
		$("#top").css("background-image","url('"+path+"')");
		
		$(".reply").click(function(){
			$(".replyform").toggle();
		});
		
		
		/* content image slider */
	 	$(".contentImg").hide();
		$(".contentImg:first").show();		//default
		$(".contentImg").hover(function(){
			if($(this).nextAll(".contentImg").length>0){			
				$(".next").show();
				$(".next").click(function(){
					$(this).parent().hide();
					$(this).parent().next().show();
				 });		
			}else{
				$(".next").hide();				
			}
			if($(this).prevAll(".contentImg").length>0){
				$(".prev").show();
				$(".prev").click(function(){
					$(this).parent().hide();
				 	$(this).parent().prev().show(); 
				});
			}else{
				$(".prev").hide();					
			}			
		},function(){
			$(".next").hide();
			$(".prev").hide();			
		});

		
	   $( "#datepicker" ).datepicker({
		   beforeShowDay: noSundays,
		   dateFormat: "yy-mm-dd",
		   minDate: 0
		});

	   /* Hash tag search */
	   $(".hash").click(function(){
	   		var addr="${addr}";
 	   		var hash=$(this).children("b").attr("hash");
	   		location.href="hashSearch.wd?addr="+addr+"&hash="+hash;   
	   	});
	   
	   
	   /* Rate */
	   $("#rater").click(function(){
		   var score=parseFloat($(this).rateit('value'));
		   var id="${sessionScope.id}";
		   var num="${num}";
		//   $('.rateit').rateit('readonly',!$('.rateit').rateit('readonly'));
		   
			if(id.length==0){
				alert("로그인 후 투표가 가능합니다.");
			}
			else{
				/* ajax */
	 		   var rUrl="guideRate.wd";
				$.ajax({
	        		url:rUrl,
	        		data:{id:id, score:score,num:num},
	        		type:'POST',
	        		success:function(data){	
	        			if(data>0){
	        				alert("다시 투표 하였습니다.");
	        			}
	        			else{
	        				alert("투표 하였습니다.");
	        			}
			      	}
		   		}); 
			}
	   });	   
	   
	   
	   /* Reply insert */
	   $("#replyAdd").click(function(){
		   var rpUrl="replyInsertProc.wd";
		   var name="${sessionScope.name}";
		   var id="${sessionScope.id}";
		   var num="${gdto.seq_guide}";
		   var r_content=$("#r_content").val();
			$.ajax({
        		url:rpUrl,
        		data:{m_id:id, name:name, num:num, gr_content:r_content},
        		type:'POST',
        		success:function(data){	
        			if(data==="ok"){
        				alert("댓글이 등록되었습니다.");
        				$("#r_content").attr("value","");
        			}
        			//댓글리스트 출력 컨트롤러에서 아작스 요청시 한번에
		      	}
	   		});			
	   });
	   
	   /* Reservation btn */
	   
	});

	   
	function noSundays(date) {
	      return [date.getDay() != 0, ''];
	}

</script>

<c:set var="root" value="<%=request.getContextPath() %>"  />
<body>
	<header style="z-index: inherit;">
		<%@ include file= "../layout/top.jsp" %>
	</header>
	<!-- top -->
	<c:forTokens items="${i.gb_preview_imgpath}" delims="," var="imgPath">
		<div id="top" path="${gdto.gb_preview_imgpath }">
			 <b>${gdto.gb_category_addr }</b>			
		</div>
	</c:forTokens>
	
	
	<!-- title -->
	<div id="title">
		${gdto.gb_title }
	</div>
	<hr width="1200px;">
	<!-- content -->
	<div id="content">
		<div class="top_info">
			<img src="${root }/Guide_img/theme.png">
			<b class="top_info2">여행 테마</b>
			<b class="top_info3">${gdto.gb_theme }</b>
		</div>
		<div class="top_info">
			<img src="${root }/Guide_img/meet_time.png">
			<b class="top_info2">만나는 시간</b>
			<b class="top_info3">${gdto.gb_meet_time }</b>
		</div>
		<div class="top_info">
			<img src="${root }/Guide_img/time_.png">
			<b class="top_info2">소요 시간</b>
			<b class="top_info3">${gdto.gb_time }</b>
		</div>
		<div class="top_info">
			<img src="${root }/Guide_img/lang.png">
			<b class="top_info2">언어</b>
			<b class="top_info3">${gdto.gb_language }</b>
		</div>
	</div>
	<hr width="1200px;">
	
	<br>	
	<div id="mainArea">
		<!-- content body -->
		<span id="content_body">
			<span>
				<img src="save/GuideFace/${gdto.imagepath}" id="guide"  >
				&nbsp;	<a href="" id="name" >${gdto.gb_name }</a>
				<div class="rateit" id="rate" data-rateit-value="${gdto.gb_score }" data-rateit-readonly="true" ></div>
									
			</span><br>	<br>
			<span>
				<b class="top_info2">여행 소개</b> <br>	<br>
				${gdto.gb_content }	
			</span>
		</span>
		<!-- 코스소개 -->
		
		

		
		<span id="location">
			${gdto.gb_address}
		</span>
		
<%-- 		<span id="meetNgreet" lat="${gdto.gb_lat }" lng="${gdto.gb_lon }" addr="${gdto.gb_address_name}">
			${gdto.gb_address_name}
		</span>
	
		
		
		<span id="price">
			${gdto.gb_price}
		</span>
		
			 --%>
			 
		<span id="score">
			${gdto.gb_score}
		</span>
		
		<span id="service">
			${gdto.gb_service}
		</span>
		
		<!-- preview image slider -->
		<c:forTokens items="${gdto.gb_preview_imgpath}" delims="," var="imgPath" varStatus="i" >
			<div class="contentImg">
				<img src="save/GuidePreview/${imgPath }" >	
				<span class="prev"><</span>
				<span class="next">></span>
			</div>
		</c:forTokens>
		
		
		<br><br><br>
		<div>
			<div id="tour_info1"  class="col-xs-6">
				<img src="${root }/Guide_img/flag.png" width="13px;">
				<b>만나는 장소</b><br>
				${gdto.gb_address_name}
				<div id="map" style="height:300px; width: 300px;"  ></div>
			</div>	
			<div id="tour_info2" class="col-xs-6">
				<img src="${root }/Guide_img/flag.png" width="13px;">
				<b>주변 가이드 (radius:5km)</b><br><br>
				<div id="nMap" style="height:300px; width: 300px;"  ></div>
			</div>
			<img src="${root }/Guide_img/time_t.png" width="13px;">
				<b>만나는 시간</b>
				${gdto.gb_meet_time }
				<br><br>
				<img src="${root }/Guide_img/flag.png" width="13px;">
				<b>제공 서비스</b>
				${gdto.gb_service}
		</div>
		<br>
		
		<p>예약일: <input type="text" id="datepicker" class="form-control" style="width: 220px;"></p>
		<br><br><br>
		
		<div id="hash_g">
			<c:forTokens items="${gdto.gb_keyword}" delims="#" var="hash" varStatus="i" >
				<a class="hash">#<b hash="${hash }">${hash }</b></a>
			</c:forTokens>
		</div>
		<!-- reply -->
	<%-- 	<div id="page">
			<c:import url="https://www.myrealtrip.com/offers/2007"/>
		</div> --%>
		
	<br>
		<!-- reply -->
		<div id="replyArea">
		<a class="reply" style="cursor: pointer;">Reply : 0</a></b>
		
					<div class="replyform" align="left"	 style="background-color: #f5f5f5; margin-top : 10px;padding-left: 10px; padding-top: 0px;" >
					<!--Reply List  -->					
						<br>
						<c:forEach items="${grList}" var="l" >
							<b>${l.name }(${l.m_id })</b>&nbsp;&nbsp;&nbsp;&nbsp;
							<b style="color: gray;font-size: 8pt;"> <fmt:formatDate value="${l.cre_date }" pattern="yyyy-MM-dd HH:mm"/></b>	
							&nbsp;&nbsp;
							
						<%-- 	<a class="updateA" style="cursor: pointer;">Update</a> | 
							<a href="replyDeleteAction.jay?pk=${l.pk }&num=${l.num}&pageNum=${pageNum}&replyOn=on">Delete</a> --%>
						
							<br>
							<span class="rcont">${l.gr_content }</span>
							<div class="updateReply" ></div>
							<br>
							<hr style="border: 1px solid ;margin-left: -10px; color:#e4e4e4;">			
						</c:forEach>
					
						<!--Reply Update  -->
				<!-- 	<form class="rlfrm" action="replyInsertProc.wd?replyOn=on"	 method="post"> -->
				
						<!-- Reply Input -->
						<div class="form-horizontal">
							<div class="form-group">
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" name="nickname" value="${sessionScope.name }" size="7" 
										class="form-control" readonly="readonly" style="width: 100px;  display: inline;">
								<div class="rateit" id="rater"></div>
								<br>	
								<div class="col-xs-10">
									<textarea  rows="3" cols="74" id="r_content" class="form-control" 
												style="margin-left: 5px;" ></textarea>		
								</div> 
								<div  class="col-xs-2">
									<input type="hidden" name="num" value="${dto.num }">
									<input type="hidden" name="pageNum" value="${pageNum}">
									<input type="button" value="Add" id="replyAdd" class="btn btn-info btn-sm" style=" width: 60px;height: 70px;">
								</div>
							</div>
						</div>
					<!-- </form> -->
				</div>
		</div>
	


	</div>
	
		
	<!-- reserve area -->
	<div id="reservationArea">
		<b style="font-size: 14pt;">￦<fmt:formatNumber value="${gdto.gb_price}" pattern="#,###" /></b> / 1인 <br><br>
		<div id="reserveBtn"><b id="reserveTxt">예약하기</b> </div>
	</div>
	<!-- Reservation Data -->

		<div id="dialog_jsp" >
			<c:import url="GuideReservation.jsp">
				<c:param name="gr_thema" value="${gdto.gb_title}"/>
				<c:param name="gr_name" value="${sessionScope.name}"/>				
				<c:param name="address_name" value="${gdto.gb_address_name}"/>
				<c:param name="gr_price" value="${gdto.gb_price}"/>
				<c:param name="gr_addr" value="${gdto.gb_address}"/>
				<c:param name="gr_meet_time" value="${gdto.gb_meet_time}"/>
				<c:param name="gr_id" value="${sessionScope.id}"/>
				<c:param name="gr_tel" value="${tel }"/>
				<c:param name="gr_category_addr" value="${addr }"/>
				<c:param name="seq_guide" value="${gdto.seq_guide }"/>
			</c:import>
		</div>
	
	

</body>

<!--  -->
<script>
	/* Draw map */
	function initMap(i) {
	    // 목표 위치
		var myLatLng = {lat: parseFloat("${gdto.gb_lat}"), lng: parseFloat("${gdto.gb_lon}")};
		var markerTitle = "${gdto.gb_address_name}";
	   	// 지도 정보
	   	if(i!=1){
		    var map = new google.maps.Map(document.getElementById('map'),{
	     		center: myLatLng,
		     	scrollwheel: false,
	      		zoom: 14
		    });
			// 마커 정보
			var marker = new google.maps.Marker({
		      map: map,
		      position:  myLatLng,
		      title: markerTitle
		    }); 
		
	   	
			//nearest
		    var nMap = new google.maps.Map(document.getElementById('nMap'),{
			      center: myLatLng,
				  scrollwheel: false,
			      zoom: 12
			    });
		    var nLatLng;
		    var locations = [      ];
		    var nSize=parseInt("${fn:length(nList)}");
		    <c:forEach items="${nList}" var="nList">
		    	nLatLng = {lat: parseFloat("${nList.gb_lat}"), lng: parseFloat("${nList.gb_lon}")};    
		    	locations.push(nLatLng);
		    </c:forEach>
		    var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
		    var nMarkers = locations.map(function(location, i) {
		          return new google.maps.Marker({
		            position: location,
		            label: labels[i % labels.length]
		          //title:
		          });
		        });
		    var markerCluster = new MarkerClusterer(nMap, nMarkers,
		            {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
		  	//draw radius
		    var circle  = new google.maps.Circle({
		        center: myLatLng,
		        radius: 5000,
		        strokeColor: "red",
		        strokeOpacity: 0.8,
		        strokeWeight: 1,
		        fillColor: "yellow",
		        fillOpacity: 0.2
		      });
		    circle .setMap(nMap);


		
	   	}
		if(i==1){
		    var map2 = new google.maps.Map(document.getElementById('map2'),{
			      center: myLatLng,
				  scrollwheel: false,
			      zoom: 14
			    });
			  var marker = new google.maps.Marker({
			      map: map2,
			      position:  myLatLng,
			      title: markerTitle
			    }); 
		}
	}
</script>
</html>
