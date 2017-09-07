<%@page import="com.wooridoori.dto.MemberDTO"%>
<%@page import="org.springframework.beans.factory.parsing.Location"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
<style type="text/css">
	th{
		width:100px;
	}
	
	input.hidden {
	    position: absolute;
	    left: -9999px;
	}

	#profile-image1 {
	    cursor: pointer;
	    width: 100px;
	    height: 100px;
		border:2px solid #03b1ce ;
	}
	
	.tital{ font-size:16px; font-weight:500;}
	.bot-border{ border-bottom:1px #f8f8f8 solid;  margin:5px 0  5px 0}	
	 
	 .container{
	 	display: block; vertical-align: middle; margin-left:20%;
	 }
</style>
</head>
<body>
<c:set var="loginok" value='<%=session.getAttribute("LOGIN")%>'></c:set>


<div class="container">
	<div class="row">
		<h2>&nbsp;&nbsp;&nbsp;&nbsp;User Information</h2>
        
    </div>
    
       <div class="col-md-7 " style="clear:left;">

<div class="panel panel-default">
  <div class="panel-heading">  <h4 >User Profile</h4></div>
   <div class="panel-body">
       
    <div class="box box-info">
        
            <div class="box-body">
                     <div class="col-sm-6">
                     <div  align="center"> <img alt="User Pic" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" id="profile-image1" class="img-circle img-responsive"> 
                
                <input id="profile-image-upload" class="hidden">
				
				<div style="color:#999;" >profile image</div>
                <!--Upload Image Js And Css-->             
                </div>
              
              <br>
    
              <!-- /input-group -->
            </div>
            <div class="col-sm-6">
            <h4 style="color:#00b1b1;">${dto.name} </h4>
              <span><p>더 킹 그레이트 제너럴</p></span>            
            </div>
            <div class="clearfix"></div>
            <hr style="margin:5px 0 5px 0;">
    
              
			<div class="col-sm-5 col-xs-6 tital " >Name:</div><div class="col-sm-7 col-xs-6 ">${dto.name}</div>
			     <div class="clearfix"></div>
			<div class="bot-border"></div>
			
			<div class="col-sm-5 col-xs-6 tital " >Id:</div><div class="col-sm-7"> ${dto.m_id }</div>
			  <div class="clearfix"></div>
			<div class="bot-border"></div>
			
			<div class="col-sm-5 col-xs-6 tital " >E-mail:</div><div class="col-sm-7"> ${dto.e_mail}</div>
			  <div class="clearfix"></div>
			<div class="bot-border"></div>
			
			<div class="col-sm-5 col-xs-6 tital " >Nationality</div><div class="col-sm-7">${dto.nation}</div>
			  <div class="clearfix"></div>
			<div class="bot-border"></div>
			
			<div class="col-sm-5 col-xs-6 tital " >Tel</div><div class="col-sm-7">${dto.tel}</div>
			  <div class="clearfix"></div>
			<div class="bot-border"></div>
			<fmt:formatDate value="${dto.cre_date}" pattern="yyyy-MM-dd HH:mm" var="date"/>
			<div class="col-sm-5 col-xs-6 tital " >Create date</div><div class="col-sm-7">${date}</div>
			  <div class="clearfix"></div>
			<div class="bot-border"></div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div> 
    </div> 
  </div>
</div>  

</div>


</body>
</html>