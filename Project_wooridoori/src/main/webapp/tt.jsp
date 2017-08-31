<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>

<style type="text/css">
	.list{
		width: 100%;
		height: 100px;
		list-style: none;
		padding-left: 0px;
		margin: 0;
		padding: 0;
	} 
	.country-item{
		width: 100%;
		height: 100px;
		float: left;
		margin: 5px;
		overflow: hidden;
		
	}
	.list img { display: inline-block; min-width: 100%; min-height: 100%; 
	-ms-interpolation-mode: bicubic; /* Better image scaling in IE */ }

</style>
</head>
<body>
	<ul class='list'>
		<li class='country-item'>
		<a class='country-link'>서울</a>
		<img src="resources/image/hill.jpg" onclick="test()">
		</li>
	</ul>
	
	<ul class='list'>
		<li class='country-item'>
		<a class='country-link'>경기도</a>
		</li>
	</ul>
		
	<ul class='list'>
		<li class='country-item'>
		<a class='country-link'>강원도</a>
		</li>
	</ul>
		
	<ul class='list'>
		<li class='country-item'>
		<a class='country-link'>부산</a>
		</li>
	</ul>
	
	<script type="text/javascript">
		function test()
		{
			alert("gg");
			$(".country-item img").slideDown("slow",function(){
				
			});
			
			
		}
	</script>
</body>
</html>