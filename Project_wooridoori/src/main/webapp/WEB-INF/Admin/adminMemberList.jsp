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
<link rel="stylesheet" type="text/css" href='resources/css/adminMemberList.css?t=<%=System.currentTimeMillis()%>'>
<title>전체회원관리페이지</title>
</head>
<body>
	<div>
		<div class="allmem_table" >
			<c:forEach var="am" items="${mlist}" varStatus="i">
			<div class="allmem_row">
				<span class="allmem_cellcol">${am.num }</span>
				<span class="allmem_cellcol">${am.m_id }</span>
				<span class="allmem_cellcol">${am.name }</span>
				<span class="allmem_cellcol">${am.password }</span>
				<span class="allmem_cellcol">${am.e_mail }</span>
				<span class="allmem_cellcol">${am.nation }</span>
				<span class="allmem_cellcol">${am.tel}</span>
				<span class="allmem_cellcol">${am.guide}</span>
				<span class="allmem_cellcol">${am.imagepath }</span>
				<span class="allmem_cellcol">${am.cre_date }</span>
				<span class="allmem_cellcol">${am.upd_date }</span>
			</div>
			</c:forEach>
		</div>
	
	
	</div>
</body>
</html>