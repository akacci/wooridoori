$(function(){
	
	/*favorite_survey dialog*/
	$("#favorite_survey").dialog({
	  	autoOpen: false,
	  	modal: true,
	  	resizable: false,
	  	width: 400,
	  	height: 400,
	  	buttons:{
	  		"확인":function(){
	  			
	  			$("#favorite_survey").dialog("close");
	  		},
	  		"취소":function(){
	  			$("#favorite_survey").dialog("close");
	  		}
	  	}
	});
	
	/*선호도 조사 클릭 시 dialog open*/
	$(".span_aTag_Controller").click(function(){
		if($(this).attr("name") == "_3"){
			$("#favorite_survey").attr("style", "visibility:visible");
			
			$("#favorite_survey").dialog("open");
		}	
	});
	
});