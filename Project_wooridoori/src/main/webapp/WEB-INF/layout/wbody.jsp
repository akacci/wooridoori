<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var latitude=1;
	var longitude=1;
	var Wurl="http://apis.skplanetx.com/weather/current/minutely?version=1&lat="+latitude+"&lon="+longitude+"&city=&county=&village=&appKey=32235c48-92ac-3a82-bf93-7fbee73f7061";
	$.ajax({
		/*http://apis.skplanetx.com/weather/current/minutely?version=1&lat=1&lon=1&city=&county=&village=&appKey=32235c48-92ac-3a82-bf93-7fbee73f7069 */
		url:Wurl,
		type:"GET",
		dataType:"JSON",
		cache:false,
		success:function(data){
			var result = data.result.message;
			var city= data.weather.minutely[0].station.name;
			var weather= data.weather.minutely[0].sky.name;
			$("#weather").text(city+"의 날씨는 ["+weather+"] 입니다.");
			
			
		},complete : function(data) {
			//alert("complete");
    	},error : function(xhr, status, error) {
            //alert("error"+error);
     	}
	});
});
</script>

</head>
<body>
<div style="margin-left: 9%; margin-top: 5%;" >
	<img src="resources/image/woori.png" width="200" height="60" style="margin-top: 20px">
</div>
<div style="margin-left: 10%;">
	<input type="text" style="border:none;width: 550px;" class="w3-xlarge" title="검색">
	<button class="w3-xlarge" style="background-color: white; border:none; margin-left:-3px; cursor: pointer;"><i class="fa fa-search" ></i></button>
</div>
	<div id="weather">
	</div>
</body>
</html>
