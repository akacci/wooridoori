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
	margin-top: 60px;
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
.qna_container .qna_list .qna_div{
	border-bottom: 1px solid #aaa;
	padding: 10px 0;
}
.qnalist_arrange li{
	list-style:none;
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(function(){
	$(".qna_content").hide();
	
	$(".show_contents").click(function(){
		$(this).parent().find(".qna_content").toggle();
	});
})

</script>
</head>
<body>
	<div class="qna_container">
		<div><h3>문의내역</h3><input class="qna_btn" style="float: right;" type="button" value="질문작성하기" onclick="changePage('qnawrite.wd')"></div>
		<div class="qna_list">
			<div class="qna_div"><span class="qno">번호</span><span class="qkind">문의</span><span class="qtitle" style="text-align: center;">제목</span><span class="qdate">날짜</span><span class="qcheck">답변여부</span></div>
			<c:forEach var="data" items="${list}" varStatus="i">
			<div class="qna_div"><span class="qno">${data.num}</span><span class="qkind"><c:choose>
						<c:when test="${data.kind==1}"><font style="color:#3c8dbc;">[일반문의]</font></c:when>
						<c:when test="${data.kind==2}"><font style="color:#f56954;">[회원문의]</font></c:when>
						<c:when test="${data.kind==3}"><font style="color:#00a65a;">[신고]</font></c:when>
					</c:choose></span>
					<span class="qtitle show_contents" style="cursor: pointer;"><c:if test="${data.acheck eq 'Y'}"><font style="font-weight: bolder;">[답변완료]</font></c:if>${data.title}</span>
					<span class="qdate"><fmt:formatDate value="${data.wdate}" pattern="YY.MM.dd"/></span>
					<span class="qcheck">${data.acheck}
					<c:if test="${data.acheck eq 'Y'}">
						(<fmt:formatDate value="${data.adate}" pattern="YY.MM.dd"/>)
					</c:if>
					</span>
					<div class="qna_content" style="padding: 5px 10px;border-top: 1px solid #aaa;">
				${data.content}
			</div>
					</div>
			
			</c:forEach>
			</div>
		<div class="qnalist_arrange">
			<ul style="text-decoration: none;">
			<c:if test="${startPage>1 }">
				<li style="float: left;"><a onclick="changePage('qna.wd?pageNum=${startPage-1}')"><&nbsp;</a></li>
			</c:if> 
			<c:forEach var="pg" begin="${startPage}" end="${endPage }">
				<li style="float: left;"><a onclick="changePage('qna.wd?pageNum=${pg}')">${pg }</a>&nbsp;</li>
			</c:forEach>
			<c:if test="${endPage<totalPage}">
				<li style="float: left;"><a onclick="changePage('qna.wd?pageNum=${endPage+1}')">&nbsp;></a></li>
			</c:if>
			</ul>
		</div>
	</div>
</body>
</html>