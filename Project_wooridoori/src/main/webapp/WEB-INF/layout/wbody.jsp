
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var latitude=1;
	var longitude=1;
	var Wurl="http://apis.skplanetx.com/weather/current/minutely?version=1&lat="+latitude+"&lon="+longitude+"&city=&county=&village=&appKey=32235c48-92ac-3a82-bf93-7fbee73f7069";
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
	<div id="weather"></div>
</body>
</html>
