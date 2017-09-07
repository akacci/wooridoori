<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
관리자 페이지
<hr>
<c:forEach var="i" items="${mlist}">
	${i.name} / ${i.m_id} / ${i.e_mail} / ${i.tel} / ${i.guide} / ${i.cre_date}
	<br> 
</c:forEach>
</body>
</html>