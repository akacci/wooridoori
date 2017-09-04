<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.contents{
	margin-top: 60px;
	margin-bottom: 33px;
	width: 850px;
	margin-left: auto;
	margin-right: auto;
}
#div_detail {
	width: 850px;
	margin-left: auto;
	margin-right: auto;
	padding: 10px;
	padding-left: auto;
	padding-right: auto;
}
#div_detail .content_detail {
	width: 100%;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 10px;
	margin-top: 20px;
	padding: 10px;
}
#div_detail .tab{
	width: 25%;
	float: left;
	font-size: 20px;
	text-align: center;
	cursor: pointer;
	padding: 5px;
}
#div_detail .tab:hover{
	background-color: #ddd;
}
#div_detail .preview{
	border: 1px solid red;
	height: 220px;
	margin-top: 30px;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<header>
		<%@ include file="../layout/wtopmenu.jsp"%>
	</header>
	<div class="contents">
		<div id="div_detail">
			<span class="tab">전체</span>
			<span class="tab">QnA질문</span>
			<span class="tab">회원정보</span>
			<span class="tab">+a</span>
		</div>
		<div id="div_detail">
			<div class="preview"></div>
			<div class="preview"></div>
			<div class="preview"></div>
		</div>
	</div>
	<footer>
		<%@ include file="../layout/wfooter.jsp"%>
	</footer>
</body>
</html>