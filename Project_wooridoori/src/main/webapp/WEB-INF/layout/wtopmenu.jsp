<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
   function myFunction() {
       var x = document.getElementById("Demo");
       if (x.className.indexOf("w3-show") == -1) {
           x.className += " w3-show";
       } else { 
           x.className = x.className.replace(" w3-show", "");
       }
   }
$(document).ready(function(){
    $('#activeModal').on("click", function () {
        $.ajax({
             url: "loginform.wd",
             success: function(data){
             }
        });
    });
 
    // selectboxChange();
});
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="w3-bar w3-colorless">
  <div class="w3-bar-item"><a href="wooriMain.wd?wbody_url=test.wd" style="color: white;">London</a></div>
  <div class="w3-bar-item"><a href="#" style="color: white;">Paris</a></div>
  <div class="w3-bar-item"><a href="#" style="color: white;">Dokyo</a></div>
<div class="w3-dropdown-click" style="float: right">

 <button onclick="myFunction()" class="w3-btn w3-colorless w3-xlarge w3-text-white">
    <i class="fa fa-bars"></i>
    </button>
  <div id="Demo" class="w3-dropdown-content w3-bar-block w3-border w3-animate-opacity" style="right:0">
    <a href="wooriMain.wd?wbody_url=test.wd" class="w3-bar-item w3-button">Link 1</a>
    <a href="#" class="w3-bar-item w3-button">Link 2</a>
    <a href="#" class="w3-bar-item w3-button">Link 3</a>
  </div>
</div>
	<div style="float: right;">
	<a class="" data-toggle="modal" data-target="#myModal" id="activeModal" href="loginform.wd">Log in/Sign up</a>
	</div>
	<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog" style="width: 380px;margin-top: 130px;margin-bottom: 0px;">
        <div class="modal-content" style=";margin-left: auto;margin-right: auto;">
        
        </div>
    </div>
</div>
</div>
</body>
</html>