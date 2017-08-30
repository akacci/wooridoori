<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
	#cl-dashboard{display: none;}
	table{
		border: 2px groove gray;
	}
	tr,th,td{
		font-size: 10pt;
		border-bottom: 1px solid gray;
		border-right: 1px dotted green;
	}
	a:LINK {
		text-decoration: none;
		font-size: 10pt;
		color: black;
	}
	a:HOVER {
		text-decoration: underline;
		color: red;
	} 
</style>
</head>
<body>
${sessionScope.id}
${sessionScope.idsave}


	<div style="margin-left: 40px;">
<form action="login.wd" method="post">
	 <fieldset style="width: 360px;">
		<legend>		
		<h1 class="w3-xxxlarge w3-text-blue"><b> Login</b></h1>
		</legend>
	 	<table  class="table table-bordered">
	 		<tr>
	 			<th width="100" bgcolor="#b0e0e6">ID</th>
	 			<td width="250">
	 				<div class="form-inline">
	 				<input type="text" value="${sessionScope.id}" name="m_id" 
	 				class="form-control" required="required"
	 				style="width: 120px;" placeholder="아이디">
	 				&nbsp;&nbsp;
	 				<input type="checkbox" name="idsave"
	 				  value="yes" class="form-control"  <c:if test="${sessionScope.idsave!=null && sessionScope.idsave.equals(yes)}">"checked"</c:if>>
	 				  save ID
	 				 
	 				</div>
	 			</td>
	 		</tr>
	 		<tr>
	 			<th width="100" bgcolor="#b0e0e6">Password</th>
	 			<td width="250">
	 				<input type="password" name="password" 
	 				class="form-control" required="required"
	 				style="width: 120px;" placeholder="password">
	 				
	 			</td>
	 		</tr>
	 		<tr>
	 			<td colspan="2" align="center" bgcolor="#ddd">
	 				<input type="submit" value="Login"
	 				  class="btn btn-danger btn-sm"
	 				   style="width: 100px;">
	 				 
	 				<input type="button" value="Regist"
	 				  class="btn btn-primary btn-sm"
	 				   style="width: 100px;"
	 				   onclick="location.href='layoutSero.jsp?main=member/memberForm.jsp'">   
	 			</td>
	 		</tr>
	 	</table>
	 </fieldset>
</form>
</div>
</body>
</html>
