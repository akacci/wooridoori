<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA</title>
<style type="text/css">
.qna_container {
	width: 800px;
	margin-top: 20px;
	margin-left: auto;
	margin-right: auto;
}
.qna_container .qna_list{
	margin-top: 20px;
}
.qna_container .qna_list .qno{
	display: inline-block;
	width: 60px;
	text-align: center;
}
.qna_container .qna_list .qkind{
	display: inline-block;
	width: 120px;
	text-align: center;
}
.qna_container .qna_list .qtitle{
	display: inline-block;
	width: 350px;
}
.qna_container .qna_list .qdate{
	display: inline-block;
	width: 150px;
	text-align: center;
}
.qna_container .qna_list .qcheck{
	display: inline-block;
	width: 100px;
	text-align: center;
}
.qna_container .qna_btn {
        text-align:center;
        height: 42px;
        padding: 1px 10px;
        border: 1px solid #313131;
        background: transparent;
        -moz-border-radius: 2px;
        -webkit-border-radius: 2px;
        border-radius: 2px;
        cursor: pointer;
}
.qna_container .qna_btn:hover {
	background-color: #313131;
	color: #fff;
	-moz-transition: all 0.2s;
	-o-transition: all 0.2s;
	-webkit-transition: all 0.2s;
	transition: all 0.2s;
}
</style>
</head>
<body>
	<div class="qna_container">
		<div>문의내역<input style="float: right;" type="button" value="질문작성하기" onclick="userInfo('qnawrite.wd')"></div>
		<div class="qna_list" style="border: 1px solid red;">
			<div><span class="qno">번호</span><span class="qkind">문의</span><span class="qtitle" style="text-align: center;">제목</span><span class="qdate">날짜</span><span class="qcheck">답변여부</span></div>
		<c:forEach var="data" items="${list}" varStatus="i">
			<div><span class="qno">${data.num}</span><span class="qkind"><c:choose><c:when test="${data.kind==1}">[일반문의]</c:when><c:when test="${data.kind==2}">[회원문의]</c:when><c:when test="${data.kind==3}">[신고]</c:when></c:choose></span><span class="qtitle">${data.title}</span><span class="qdate"><fmt:formatDate value="${data.wdate}" pattern="YY.MM.dd HH:mm"/></span><span class="qcheck">${data.acheck}</span></div>
		</c:forEach>
		</div>
		<div class="tlist_arrange">
						<ul style="text-decoration: none;">
						<c:if test="${startPage>1 }">
							<li style="float: left;"><a href="#" onclick="userInfo('qna.wd?pageNum=${startPage-1}')"><&nbsp;</a></li>
						</c:if> 
						<c:forEach var="pg" begin="${startPage}" end="${endPage }">
							<li style="float: left;"><a href="#" onclick="userInfo('qna.wd?pageNum=${pg}')">${pg }</a>&nbsp;</li>
						</c:forEach>
						<c:if test="${endPage<totalPage}">
							<li style="float: left;"><a href="#" onclick="userInfo('qna.wd?pageNum=${endPage+1}')">&nbsp;></a></li>
						</c:if>
						</ul>
					</div>
	</div>
</body>
</html>