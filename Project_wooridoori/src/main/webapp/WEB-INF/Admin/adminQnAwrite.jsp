<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
.qna_write .table{border-spacing:0;border-collapse:collapse}td,th{padding:0}
.qna_write .table td, .qna_write .table th{background-color:#fff!important}
.qna_write .btn{display:inline-block;padding:6px 12px;margin-bottom:0;font-size:14px;font-weight:400;line-height:1.42857143;text-align:center;white-space:nowrap;vertical-align:middle;-ms-touch-action:manipulation;touch-action:manipulation;cursor:pointer;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;background-image:none;border:1px solid transparent;border-radius:4px}
.qna_write .btn:hover{background-color: #aaa;}
.qna_write .btn.active.focus,.qna_write .btn.active:focus,.qna_write .btn.focus,.qna_write .btn:active.focus,.qna_write .btn:active:focus,.qna_write .btn:focus{outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}
.qna_write .btn.focus,.qna_write .btn:focus,.qna_write .btn:hover{color:#333;text-decoration:none}
.qna_write .btn.active,.qna_write .btn:active{background-image:none;outline:0;-webkit-box-shadow:inset 0 3px 5px rgba(0,0,0,.125);box-shadow:inset 0 3px 5px rgba(0,0,0,.125)}
.qna_write .btn.disabled, .qna_write .btn[disabled],.qna_write fieldset[disabled] .btn{cursor:not-allowed;filter:alpha(opacity=65);-webkit-box-shadow:none;box-shadow:none;opacity:.65}
</style>
</head>
<body>
<div class="qna_write" style="width: 800px; margin-left: auto;margin-right: auto;">
<h3>QnA</h3>
<form action="answer_qnawrite.wd" id="frm_qna">
<table class="table table-striped">
<tr>
	<td width="100px;">No</td>
	<td>${data.num}</td>
</tr>
<tr>
	<td>Writer</td>
	<td>${data.writer}</td>
</tr>
<tr>
	<td>Title</td>
	<td>${data.title}</td>
</tr>
<tr>
	<td colspan="2">내용</td>
</tr>
<tr>
	<td colspan="2">${data.content}</td>
</tr>
<tr>
	<td colspan="2">
	</td>
</tr>
<tr>
	<td colspan="2">답변쓰기</td>
</tr>
<tr>
	<td colspan="2">
		<textarea id="content_qna" name="content_qna" rows="10" style="width: 100%;"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2"">
		<span style="float:right"><input type="submit" class="btn write_qna" value="작성하기"> </span>
	</td>
</tr>
</table>
</form>
</div>
<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "content_qna", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
              }
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $(".write_qna").click(function(){
    	  $.ajax({
    		  url: 'answer_qnawrite.wd',
    		  success: function(){
    			  
    		  }
    	  });
      });   
});
</script>
</body>
</html>