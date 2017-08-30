<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#div_detail{width: 743px;margin-left: auto;margin-right: auto;padding: 10px;padding-left: auto;padding-right: auto;}
#div_detail .content_detail{width: 100%;margin-left: auto;margin-right: auto;margin-bottom: 10px;padding: 10px;}
#div_detail .content_detail h3{border-bottom: 2px solid black;background-color: #e6e6e6;color: black;padding: 5px;margin-top: 10px;cursor: pointer;}
#div_detail .content_detail h3 a{color: black}
#div_detail .content_detail h3:hover{background-color: #cccccc}

</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.ajax-cross-origin.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/content_detail.js"></script>
<script type="text/javascript">
	var contentId = ${cdata.contentid};
	var contentTypeid = ${cdata.contenttypeid};
	var mapx = ${cdata.mapx};
	var mapy = ${cdata.mapy};
	var data = {contentid:contentId,contenttypeid:contentTypeid,x:mapx,y:mapy};
	content_writer(data);
</script>
</head>
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
			<h3 class="menu"><a>지도</a><span><i class="fa fa-caret-down" style="float: right;margin-right: 10px;"></i></span></h3>
			<div class="info map_info" id="map_info" style="height: 400px;"></div>
			<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDinVBIQ_6J72u5Ti9A4YHmCcsXoVZJFgE&callback=initMap"></script>
			<script>
				var map;
				var x = ${cdata.mapx};
				var y = ${cdata.mapy};
				function initMap() {
					map = new google.maps.Map(document.getElementById('map_info'), {
					center: {lat: parseFloat(y), lng: parseFloat(x)},
					zoom: 15
					});
				var marker = new google.maps.Marker({
					position: {lat: parseFloat(y), lng: parseFloat(x)},
					map: map
					});
				}
			</script>
		</div>
		<div class="content_detail">
		
		</div>
		<div class="content_detail">
		
		</div>
	</div>
</body>
</html>