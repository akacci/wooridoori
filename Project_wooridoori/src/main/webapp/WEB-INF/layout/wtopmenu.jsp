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
</head>
<body>

<div class="w3-bar w3-colorless">
  <div class="w3-bar-item"><a href="#">London</a></div>
  <div class="w3-bar-item"><a href="#">Paris</a></div>
  <div class="w3-bar-item"><a href="#">Dokyo</a></div>

<div class="w3-dropdown-click" style="float: right">
 <button onclick="myFunction()" class="w3-btn w3-colorless w3-xlarge">
 	<i class="fa fa-bars"></i>
 	</button>
  <div id="Demo" class="w3-dropdown-content w3-card-4 w3-animate-opacity">
    <a href="#" class="w3-bar-item w3-button">Link 1</a>
    <a href="#" class="w3-bar-item w3-button">Link 2</a>
    <a href="#" class="w3-bar-item w3-button">Link 3</a>
  </div>
</div>
</div>
</body>
</html>