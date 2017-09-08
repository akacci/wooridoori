<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="<%=request.getContextPath() %>"  />

<script type="text/javascript"   src="<%=request.getContextPath()%>/resources/js/member.js"></script>
<link rel="stylesheet" type="text/css"   href='resources/css/loginform.css'>
<!-- tabs  -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <!-- 
<script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<!-- 1.preview pic  2.div to pic -->
<script src="${root }/dist/jquery.cropit.js"></script>
<script src="${root }/dist/html2canvas.js"></script>

<script type="text/javascript">
   $(function(){
      $(".login").click(function(){
         var log = $("#logb").attr("class");
         console.log(log);
         create_logform(log);
         $(".log_dialog").css("display","block");
      });
      $(window).click(function(event){
         if(event.target.className == 'log_dialog'){
            $(".log_dialog").css("display","none");
         };
      });
   });
   function goHome(){
      location.href = "wooriMain.wd";
   }
</script>
<style type="text/css">
.w3-bar-item #log{
   cursor: pointer;

}
.log_dialog {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
/* The Modal (background) */
.logform {
    position: fixed;
    width: 363px;

    top: 50%;
    left: 50%;
      transform: translate(-50%, -50%);
    background-color: #ddd;
}

/* The Close Button */

.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}
</style>
<style type="text/css">
   .bar-item-t{
      display: inline;
      margin-left: 20px;
      font-size: 18pt;
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
      padding-top: 12px; 
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
   <div style="top:0; width:100%; height: 60px; background-color: #313131; margin:0; min-width: 900px;">
      <div class="bar-item-t">
         <a href="tlist.wd">TourList</a>
      </div> 
      <div class="bar-item-t">
         <a href="#">Guide</a> 
      </div>
      <div class="bar-item-t">
         <a href="recommend.wd">Recommend</a>

      </div>  
       
      <div class="bar-item-icon dropdown">
         <button class="dropbtn">
            <img src="resources/image/top/menubar_white.png" width="35px" height="30px">
         </button>
         <div class="dropdown-content">
             <a href="#">Link 1</a>
             <a href="#">Link 2</a>
             <a href="#">Link 3</a>
         </div>
      </div>
      
      <div class="bar-item-icon">
         <button onclick="goHome()"> 
            <img src="resources/image/top/home_white.png" width="35px" height="30px">
         </button>
      </div> 
      
      <div class="bar-item-t" style="float: right; margin-right: 20px">
         <a class="login" href="#"> 
            <c:if test="${sessionScope.LOGIN eq 'NO' or empty sessionScope.LOGIN}"><b id="logb" class="log_in" style="color: white">LOGIN</b></c:if>
            <c:if test="${sessionScope.LOGIN eq 'YES'}"><b id="logb" class="log_out" style="color: white">LOGOUT</b></c:if>
         </a>  
      </div>
       
      <div class="bar-item-t" style="float: right;">
      	
      <c:if test="${!empty sessionScope.LOGIN and sessionScope.LOGIN eq 'YES'}">
        <a href="mypage.wd">MY</a>
      </c:if>
      </div>
   </div>
   <div class="log_dialog">
   <div class="logform">
   
   
   </div>
</div>
</body>
</html>