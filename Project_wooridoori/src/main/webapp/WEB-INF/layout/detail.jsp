<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		content_writer(data);
	});
	//초기 위치
	var current_lng = ${cdata.mapx};
	var current_lat = ${cdata.mapy};

</script>
</head>
<header> 
         <%-- <jsp:include page= "../layout/wtopmenu.jsp"/> --%>
         <%@include file="../layout/wtopmenu.jsp"%>
</header>
<body>

	<div id="div_detail">
		<div class="content_detail">
			<h2>${cdata.title}</h2>
		</div>
		<div class="content_detail">
			<img src="${cdata.firstimage}">
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
			  <span class="space" style="line-height: 45px"></span>
			  
			  <button class="btn_drop" id="moveToOriginalMarker" onclick="moveToOriginalMarker()"> 
		        <i class="material-icons">my_location</i>
		      </button>
		        
		      <span class="space" style="line-height: 105px"></span>
		       
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
				      zoom: 16,
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
		
		<ul class="list"></ul>
		
		
		<div class="content_detail">
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