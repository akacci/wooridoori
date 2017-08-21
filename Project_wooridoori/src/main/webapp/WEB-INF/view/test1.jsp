<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href='<c:url value="css/main.css"/>'>
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>

</head>


<body>

<div class="w3-container w3-black2" style="white-space: pre-line; width: 100px; word-break:break-all;">
	안녕ㄴ녀f녀녀d녀zz녕szzzzzzzzzzzzzzzzzzzzzzzzzzz3333zzzzzzzzzzzz3zzzzzzz
	zzzzzzzzzzzzzzff
	zff
	zzzzzzzzzzzzzzz
</div>

<div class="w3-container">
  <h2>Slideshow Caption</h2>
  <p>Add a caption text for each image slide with the w3-display-* classes (topleft, topmiddle, topright, bottomleft, bottommiddle, bottomright or middle).</p>
</div>

<div class="w3-content fixed">

<div class="fixed mySlides w3-animate-opacity ">
  <img src="resources/image/dawn.jpg" style="width:100%">
  <div class="w3-display-bottomleft w3-large w3-container w3-padding-16 w3-black2">
    새벽입니다핳하하핳하핳핳핳하핳
  </div>
</div>

<div class="fixed mySlides w3-animate-opacity">
  <img src="resources/image/hill.jpg" style="width:100%">
  <div class="fixed w3-container w3-black w3-display-bottomright w3-padding-16">
    	ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
    	ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
  </div>
</div>

<div class="w3-display-container mySlides w3-animate-opacity">
  <img src="resources/image/winter.jpg" style="width:100%">
  <div class="w3-display-topleft w3-large w3-container w3-padding-16 w3-black">
  	  겨울
  </div>
</div>

<div class="w3-display-container mySlides w3-animate-opacity">
  <img src="resources/image/다리.jpg" style="width:100%">
  <div class="w3-display-topright w3-large w3-container w3-padding-16 w3-black">
   	forest
  </div>
</div>

<div class="w3-display-container mySlides w3-animate-opacity">
  <img src="resources/image/dawn.jpg" style="width:100%">
  <div class="w3-display-middle w3-large w3-container w3-padding-16 w3-black">
    dawn!
  </div>
</div>

<button class="w3-button w3-display-left w3-black" onclick="plusDivs(-1)">&#10094;</button>
<button class="w3-button w3-display-right w3-black" onclick="plusDivs(1)">&#10095;</button>

</div>


</body>
</html>
