<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script><!-- 구글차트 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<c:if test="${sessionScope.ID eq 'admin'}">
<script type="text/javascript">
$(function(){
	var data = '${data}';
	$("#page").load(data);
});
</script>
</c:if>

    <title>Simple Sidebar - Start Bootstrap Template</title>

	
    <!-- Bootstrap core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/css/simple-sidebar.css" rel="stylesheet">

</head>
   <header> 
         <%-- <jsp:include page= "../layout/wtopmenu.jsp"/> --%>
         <%@include file="../layout/top.jsp"%>
   </header>
<body style="height: 945px; margin-top: 55px; z-index: -100">    
 
    <div id="wrapper"> 

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
            
                <li class="sidebar-brand">
                    <a href="#">
                    	<img src="resources/image/main/profile.png" width="30" height="30">The Suzan Maestro
                    </a>
                </li>  
                <li>
                    <hr style="border: 0.3px double black;"> 
                    <a onclick="userInfo()" href="#">사용자 정보</a>
                </li>
                <li>
                    <a href="javascript:void(0)" onclick="Recommend_Info()">Recommend Page</a> 
                </li>
                <li> 
                    <a href="#">Overview</a>
                </li>
                <li>
                    <a href="#">Events</a>
                </li>
                <li>
                    <a href="#">About</a>
                </li>
                <li>
                    <a href="#">Services</a>
                </li>
                <li>
                    <a onclick="qnaBoard()" href="#">QnA</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->
         
        <div id="sidebar-wrapper2" style="text-align: center; display: table;">
         <div style="display: table-cell; vertical-align: middle;">
         <b style="color: black;">▶</b> 
         </div>
        </div> 
 		
 		<script type="text/javascript">
 			function userInfo(data){
 				$("#page").load(data); 
 				
 			} 
 			function Recommend_Info()
 			{
 				$("#page").load("re_mypage.wd")
 			}
      function qnaBoard(){
        $("#page").load("qna.wd"); 
      }
 		</script>
 		
        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid" id="page">
           		
                <h1>Simple Sidebar</h1>
                <p>This template has a responsive menu toggling system. The menu will appear collapsed on smaller screens, and will appear non-collapsed on larger screens. When toggled using the button below, the menu will appear/disappear. On small screens, the page content will be pushed off canvas.</p>
                <p>Make sure to keep all page content within the <code>#page-content-wrapper</code>.</p>
                <a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">Toggle Menu</a>
            </div>
        </div> 
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Bootstrap core JavaScript -->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/popper/popper.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>

    var b = 0;
    
    $("body").mousemove(function(e){
   		if(e.pageX<30&&b==0)
   		{
           e.preventDefault();
           $("#wrapper").toggleClass("toggled");
           b=1;
   		}
   		if(e.pageX>250&&b==1)
   	    {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
            b=0;
   	    }
    });
    
   	$("sidebar-wrapper").mouseleave(function(){
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
   	}); 
    </script>

</body>
<footer>
         <%-- <jsp:include page= "../layout/wfooter.jsp"/> --%>
         <%@include file="../layout/wfooter.jsp"%>
</footer>
</html>