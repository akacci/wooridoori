<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function goHome(){
		location.href = "wooriMain.wd";
	}
</script>
<style type="text/css">
	.bar-item-t{
		display: inline;
		margin-left: 20px;
		font-size: 24pt;
		float: left;
		padding-top: 12px;!important 
	}
	.bar-item-t a{ 
		text-decoration: none; color: white;
	}
	.bar-item-t a:HOVER{
		color: gray;
	} 
	
	.bar-item-icon{
		display: inline;
		padding-top: 16px; 
		margin-right: 10px;
		float: right;
	}
	.bar-item-icon button{
		background-color: rgba(0,0,0,0); border-style: none; outline-style: none; cursor: pointer;

	}  
	
	
	/* 드롭다운 메뉴! ---------------------------------------------------------------------------------*/
	
	.dropbtn {
    background-color: #4CAF50;
    color: white;
    border: none;
    cursor: pointer;
	}
	
	.dropdown {
	    display: inline-block;
	    position: relative;
	}
	
	.dropdown-content {
	    display: none;
	    position: absolute;
	    right: 0;
	    background-color: #f9f9f9;
	    min-width: 160px;
	    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	    z-index: 99999999999999999999;
	}
	
	.dropdown-content a {
	    color: black;
	    padding: 12px 16px;
	    text-decoration: none;
	    display: block;
	}
	
	.dropdown-content a:hover {background-color: #f1f1f1}
	
	.dropdown:hover .dropdown-content {
	    display: block;
	}
	
	.dropdown:hover .dropbtn {
	    background-color: gray;
	}
</style>
</head>  
<body style="margin: 0;">
	<div style="top:0; width:100%; height: 70px; background-color: #313131; margin:0; min-width: 900px;">
		<div class="bar-item-t">
			<a href="#">더</a>
		</div> 
		<div class="bar-item-t">
			<a href="#">그레이트</a> 
		</div>
		<div class="bar-item-t">
			<a href="recommend.wd">수잔</a>
		</div>  
		
		<div class="bar-item-icon dropdown">
			<button class="dropbtn">
				<img src="resources/image/top/menubar_white.png" width="40px" height="35px">
			</button>
			<div class="dropdown-content">
			    <a href="#">Link 1</a>
			    <a href="#">Link 2</a>
			    <a href="#">Link 3</a>
			</div>
		</div>
		
		<div class="bar-item-icon">
			<button onclick="goHome()"> 
				<img src="resources/image/top/home_white.png" width="40px" height="35px">
			</button>
		</div> 
		
		<div class="bar-item-t" style="float: right;">
			<a href=""> 
				login
			</a>  
		</div>
		 
		<div class="bar-item-t" style="float: right;">
			<a href="mypage.wd">MY</a>
		</div>
	</div>
</body>
</html>