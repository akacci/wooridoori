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
<style type="text/css">
</style>
<title>전체회원관리페이지</title>
</head>
<body>
	<div class="mtable_cover">
		<div class="allmem_table" >
			<div class="allmem_headrow">
				<span class="allmem_colhead1">회원번호</span>
				<span class="allmem_colhead2">회원 ID</span>
				<span class="allmem_colhead3">이름</span>
				<span class="allmem_colhead4">비밀번호</span>
				<span class="allmem_colhead5">이메일</span>
				<span class="allmem_colhead6">국적</span>
				<span class="allmem_colhead7">전화번호</span>
				<span class="allmem_colhead8">가이드유무</span>
				<span class="allmem_colhead9">가입일</span>
				<span class="allmem_colhead10">최종수정일</span>
				<span class="allmem_colhead11">탈퇴</span>
			</div>
		<c:forEach var="am" items="${mlist}" varStatus="i">
			<div class="allmem_row">
				<span class="allmem_cellcol1">${am.num }</span>
				<span class="allmem_cellcol2">${am.m_id }</span>
				<span class="allmem_cellcol3">${am.name }</span>
				<span class="allmem_cellcol4">${am.password }</span>
				<span class="allmem_cellcol5">${am.e_mail }</span>
				<span class="allmem_cellcol6">${am.nation }</span>
				<span class="allmem_cellcol7">${am.tel}</span>
				<span class="allmem_cellcol8">${am.guide}</span>
				<span class="allmem_cellcol9">${am.cre_date }</span>
				<span class="allmem_cellcol10">${am.upd_date }</span>
				<span class="allmem_cellcol11"><button class="qna_write" onclick="location.href='deleteMember.wd?wnum=${am.num}'">회원정보삭제</button></span>
			</div>
		</c:forEach>
		</div>
	</div>	
</body>
</html>