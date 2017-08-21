<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function myFunction() {
	    var x = document.getElementById("Demo");
	    if (x.className.indexOf("w3-show") == -1) {
	        x.className += " w3-show";
	    } else { 
	        x.className = x.className.replace(" w3-show", "");
	    }
	}
</script>
<style type="text/css">
	.bar-item{
		color: white;
		text-decoration: none;
		font-size: 24px;
	};
</style>
</head>
<body>

<div class="w3-bar w3-colorless">
  <div class="w3-bar-item"><a class="bar-item" href="wooriMain.wd?wbody_url=test.wd">London</a></div>
  <div class="w3-bar-item bar-item"><a class="bar-item" href="#" style="text-decoration: none;">Paris</a></div>
  <div class="w3-bar-item bar-item"><a class="bar-item" href="#" style="text-decoration: none;">Dokyo</a></div>

<div class="w3-dropdown-click" style="float: right">
 <button onclick="myFunction()" class="w3-btn w3-colorless w3-xlarge w3-text-white">
 	<i class="fa fa-bars"></i>
 	</button>
  <div id="Demo" class="w3-dropdown-content w3-bar-block w3-border w3-animate-opacity" style="right:0; margin-right:24px; ">
    <a href="#" class="w3-bar-item w3-button">Link1</a>
    <a href="#" class="w3-bar-item w3-button">Link2</a>
    <a href="#" class="w3-bar-item w3-button">Link3</a>
  </div>
</div>

<div style="float:right">
  <div class="w3-bar-item">
  <a  class="bar-item" href="test.wd">로그인 
  <img src="resources/image/profile.png" width="35" height="35" style="vertical-align:text-bottom;"> </a>
  </div>
</div>


</div>
</body>
</html>