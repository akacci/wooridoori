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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
				<span class="allmem_colhead4">이메일</span>
				<span class="allmem_colhead5">국적</span>
				<span class="allmem_colhead6">전화번호</span>
				<span class="allmem_colhead7">가이드유무</span>
				<span class="allmem_colhead8">가입일</span>
				<span class="allmem_colhead9">최종수정일</span>
				<span class="allmem_colhead10">탈퇴</span>
			</div>
		<c:forEach var="am" items="${mlist}" varStatus="i">
			<div class="allmem_row">
				<span class="allmem_cellcol1">${am.num }</span>
				<span class="allmem_cellcol2">${am.m_id }</span>
				<span class="allmem_cellcol3">${am.name }</span>
				<span class="allmem_cellcol4">${am.e_mail }</span>
				<span class="allmem_cellcol5">${am.nation }</span>
				<span class="allmem_cellcol6">${am.tel}</span>
				<span class="allmem_cellcol7">${am.guide}</span>
				<span class="allmem_cellcol8">${am.cre_date }</span>
				<span class="allmem_cellcol9">${am.upd_date }</span>
				<span class="allmem_cellcol10"><button class="qna_write" onclick="location.href='deleteMember.wd?wnum=${am.num}'">회원정보삭제</button></span>
			</div>
		</c:forEach>
		</div>
		<div class="wlist_bottom">
			<c:if test="${depth eq '0'}">	
			<div class="wlist_arrange">
				<div class="wlist_arrange2" style="width: 420px; height: auto;">
				<ul style="width: 100%; height: 50px;">
				<c:if test="${startPage>1 }">
					<li style="float: left;"><a href="adminMemberList.wd?pageNum=${startPage-1 }"><&nbsp;&nbsp;</a></li>
				</c:if> 
				<c:forEach var="pg" begin="${startPage}" end="${endPage }">
					<li style="float: left;"><a href="adminMemberList.wd?pageNum=${pg}">${pg }</a>&nbsp;&nbsp;&nbsp;</li>
				</c:forEach>
				<c:if test="${endPage<totalPage}">
					<li style="float: left;"><a href="adminMemberList.wd?pageNum=${endPage+1 }">&nbsp;></a></li>
				</c:if>
				</ul>
				</div>
			</div>
			</c:if>
			<form action="wSearch.wd" method="get" class="wlist_search">
				<div style="width:100%; float: right;" >
					<input type="search" id="searchkey" name="searchkey" value="${searchkey}" 
					style="width: 150px; border: 1px solid gray; height: 25px;" class="w3-large" title="검색">
					<button type="submit" id="submitbtn" class="w3-large w3-text-black" style="margin-left:-3px; cursor: pointer;">
					<i class="fa fa-search" ></i></button>
				</div>
			</form>			
		</div>	
	</div>	
</body>
</html>