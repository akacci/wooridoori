<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA</title>
<style type="text/css">
.qna_container {
	width: 800px;
	margin-left: auto;
	margin-right: auto;
}

.qna_container .qna_title {
	background-color: #313131;
	color: white;
	padding: 5px 10px;
}

.qna_container .qna_contents {
	padding: 5px 10px 20px 10px;
}

.qna_container .qna_contents radio {
	margin: 0 10px 0 5px;
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
		<h3>QnA</h3>
		<form action="qnaaction.wd" method="post">
		<input type="hidden" value="${sessionScope.ID_NUM}" name="id_num">
			<div class="qna_title">문의종류</div>
			<div class="qna_contents">
				<input class="qna_radio" type="radio" name="kind" value="1" checked>일반문의
				<input class="qna_radio" type="radio" name="kind" value="2">회원문의
				<input class="qna_radio" type="radio" name="kind" value="3">신고
			</div>
			<div class="qna_title">제목</div>
				<div class="qna_contents"><input type="text" name="title" style="width:400px;" placeholder="제목을 입력하세요." required></div>	
			<div class="qna_title">내용</div>
				<div class="qna_contents"><textarea rows="10" name="content" style="width: 100%;" placeholder="문의내용을 입력하세요." required></textarea></div>
			<div style="float:right;">
				<input class="qna_btn" type="submit" value="작성하기">
			</div>
		</form>
	</div>
</body>
</html>