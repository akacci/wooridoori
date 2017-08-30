<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
	#cl-dashboard{display: none;} 
	#Authentication{
		margin: 50px;
	}
</style>
<script type="text/javascript">
	$(function() {
		setInterval("timer()",1000);		//3-minutes
		setTimeout("timeout()", 180000);			
	});
	
	var num=${authNum};
	
	/* Auth timeout */
	function timeout(){
		num="";
	}
	
	/* Auth timer */
	var time=180;	
	function timer(){		//3-minutes
		if(time%60>=10){		//x:xx
			remain_t="<font color='red'>"+Math.floor(time/60)+":"+(time%60)+"</font>"	//remain time
		}
		else{			//x:0x
			remain_t="<font color='red'>"+Math.floor(time/60)+":0"+(time%60)+"</font>"	//remain time
		}
		document.all.time.innerHTML=remain_t;
		time--;
		if(time<0){
			clearInterval();
			document.all.time.innerHTML="Retry to E-mail Authentication";
		}
	}
	
	/* e-mail auth */
	function check(){
		var form=document.authenForm;
		
		if(!form.authNum.value){
			alert("Please input authentication number");
			return false;
		}else if(form.authNum.value!=num){
			alert("Worng authentication number");		
			form.authNum.value="";
			return false;		
		}else if(form.authNum.value==num){
			alert("Authenticated!!");
			opener.f.auth.innerHTML="Authenticated";
			opener.f.auth.value="Authenticated";
			opener.f.auth.style="color:blue";
			opener.location.href="javascript:first_step();";
			window.close();
		}	
		
		
	}
	
</script>
</head>
<body>
<div id="Authentication" >
<fieldset style="width: 300px;">
	<legend>Guide Authentication</legend>
	<form method="post" name="authenForm" onsubmit="return check();">
	 	<input type="text" name="authNum">
	 	<b id="time"></b>
	 	<br><br>
		<input type="submit" value="Authentication">
	</form>
</fieldset>
</div>

	 

</body>
</html>
