<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script><!-- 구글차트 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>Simple Sidebar - Start Bootstrap Template</title>
    <!-- Bootstrap core CSS -->
    <link href="resources/css/mypage.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/css/simple-sidebar.css" rel="stylesheet">

</head>
   <header> 
         <%-- <jsp:include page= "../layout/wtopmenu.jsp"/> --%>
         <%@include file="../layout/top.jsp"%>
   </header>
<body style="height: 945px; margin-top: 55px;">     
 
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
                    <a href="javascript:void(0)" onclick="guideReservation()">Guide Reservation</a>
                </li>
                <li> 
                    <a href="javascript:void(0)" onclick="guideReuest()">Guide Request</a>
                </li>

                <li>
                    <a onclick="changePage('qna.wd')" href="#">QnA</a>
                </li>
				<c:if test="${sessionScope.ID eq 'admin'}">
					<li>
	                    <a onclick="changePage('admin.wd')" href="#">관리자페이지</a>
	                </li>
					<li>
	                    <a onclick="changePage('adminQnAList.wd')" href="#">QnA관리자페이지</a>
	                </li>
	                <li>
	                    <a onclick="changePage('adminMemberList.wd')" href="#">전체회원관리페이지</a>
	                </li>
				</c:if>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->
         
        <div id="sidebar-wrapper2" style="text-align: center; display: table;">
         <div style="display: table-cell; vertical-align: middle;">
         <b style="color: black;">▶</b> 
         </div>
        </div> 
 		
 		<script type="text/javascript">

 			$(function(){
 				$("#page").load("userInfo.wd");
 				var data1 = ${data1}+"";
 				if(data1!=null && data1.length != 0){

 					changePage(data1);
 					data1=null;
 				}
 				var data2 = ${data2}+"";
 				if(data2!=null && data2.length != 0){
 					var searchkey = '<c:out value="${searchkey}"/>';
 					var currentPage = "&currentPage="+'<c:out value="${currentPage}"/>';
 					var data3 = data2+searchkey+currentPage;
 					changePage(data3);
 					data2=null;
 				}
 				
 			});
 			


 			function userInfo(){
 				$("#page").load("userInfo.wd");  	
 			} 
			function Recommend_Info()
 			{
 				$("#page").load("re_mypage.wd");
 			}
			function guideReservation(){
 				$("#page").load("guideReservationList.wd");
 			}
 			function guideReuest(){
 				$("#page").load("selectRequestList.wd");
 			}
		    function qnaBoard(){
		        $("#page").load("qna.wd"); 
		    }
			function changePage(data){
				$("#page").load(data);
			}
 		</script>
 		
        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid" id="page">
            	
            </div>
        </div> 
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->


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