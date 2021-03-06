$(function(){

	var chartVarN;
	var chartVarY;
	
	$(".div_hover_box").hide();
	
    /*dialog*/
    $("#detail_tour").dialog({
	  	autoOpen: false,
	  	modal: true,
	  	resizable: false,
	  	width: 820,
	  	height: 800,
	  	open: function(){
	  		$(".ui-widget-overlay").off("click");
	  		$(".ui-widget-overlay").on("click", function(){
	  			$("#detail_tour").dialog("close");
	  		});
	  	}
	});
    
    /*hover event*/
    $(document).on("mouseenter", ".select_box_div", function(e){
		var topClass = $(e.target).parent().parent().parent().parent().parent().parent();
		var inx;
		
		if(topClass.attr("id") == "recommend_detail"){
			inx = $(this).children("#cnt").val();
		}else {
			inx = $(this).children("#cnt").val() - 1;
		}
		
		if(topClass.attr("id") != "" || topClass.attr("id") != null){
			$("#"+topClass.attr("id")+" .div_hover_box").eq(inx).slideDown("slow");
		}else{
			$(".div_hover_box").eq(inx).slideDown("slow");
		}
	
      	/*dialog open*/
      	$(this).unbind("click").bind("click", function(e){
      		$("#re_smenu").css("z-index","1");
			$("#re_body").css("z-index","2");
			
      		var contentid = $(this).find("#contentid").val();
      		
      		/*dialog_img, dialog_content, dialog_reivew data*/
      		dialog_content(contentid, e);
      		
      		/*dialog chart*/
      		chartVarN = chartVisitData(contentid, "N");
      		chartVarY = chartVisitData(contentid, "Y");
      		new Highcharts.Chart(scoreChart(chartVarN, chartVarY));
      		
      	});
      }).on("mouseleave", ".select_box_div", function(e){
		var topClass = $(e.target).parent().parent().parent().parent().parent().parent();
		var inx;
		
		if(topClass.attr("id") == "recommend_detail"){
			inx = $(this).children("#cnt").val();
		}else {
			inx = $(this).children("#cnt").val() - 1;
		}
		
		if(topClass.attr("id") != "" || topClass.attr("id") != null){
			$("#"+topClass.attr("id")+" .div_hover_box").eq(inx).slideUp("slow");
		}else{
			$(".div_hover_box").eq(inx).slideUp("slow");
		}
      });
    
    /*dialog_review_write 확인버튼 click event*/
    $("#insert_btn").unbind("click").bind("click", function(){
    	review_insert();
    	dialog_review($("#dialog_review_write #contentid").val(),5);
    	$("#m_id").val("");
    	$("#pre_review").val("");
    	$("#rateit_write").rateit("value", "");
    	
    	chartVarN = chartVisitData($("#dialog_review_write #contentid").val(), "N");
  		chartVarY = chartVisitData($("#dialog_review_write #contentid").val(), "Y");
    	new Highcharts.Chart(scoreChart(chartVarN, chartVarY));
    });
    
    //더보기 버튼
    var btnMore_cnt = 1;
    $(document).on("click", "#review_dialog_btn", function(){
    	btnMore_cnt++;
    	dialog_review($("#dialog_review_write #contentid").val(), 5*btnMore_cnt);
    	
    	/*if( reply_length < 5*btnMore_cnt){
    		alert("마지막 댓글입니다");
    	}*/
    });
    
});

function sessionLoginId(){
	$.ajax({
		url:"sessionloginid.wd",
		type:"post",
		success:function(resData){
			var id = resData.substr(0, resData.indexOf(","));
			var login = resData.substr(resData.indexOf(",")+1, resData.length);
			$("#m_id_dialog").val(id);
			$("#visit_yn").val(login.substr(0,1).trim());
		}
	});
}

function scoreChart(chartVarN, chartVarY){
	$("#score_chart").highcharts({
	  	    chart: {
	  	        type: "area"
	  	    },
	  	    title: {
	  	        text: ""
	  	    },
	  	    credits:{
	  	    	enabled: false
	  	    },
	  	    xAxis: {
	  	        allowDecimals: false,
	  	        title: {
	  	        	text: "인원수"
	  	        },
	  	        labels: {
	  	            formatter: function () {
	  	                return this.value + "명";
	  	            }
	  	        }
	  	    },
	  	    yAxis: {
	  	        title: {
	  	            text: "평점"
	  	        },
	  	        labels: {
	  	            formatter: function () {
	  	                return this.value + "점";
	  	            }
	  	        }
	  	    },
	  	    tooltip: {
	  	    	headerFormat: ''
	  	    },
	  	    plotOptions: {
	  	        area: {
	  	            pointStart: 1,
	  	            marker: {
	  	                enabled: false,
	  	                symbol: 'circle',
	  	                radius: 2,
	  	                states: {
	  	                    hover: {
	  	                        enabled: true
	  	                    }
	  	                }
	  	            }
	  	        }
	  	    },
		    navigation: {
		    	buttonOptions: {
		    		enabled: false
		    	}
		    },
	  	    series: [{
	  	    		data: chartVarN,
	  	  	    	name: '방문객 평점',
	  	  	    	color: '#F15F5F'
	  	    	},
	  	    	{
	  	    		data: chartVarY,
	  	    		name: '예상 평점',
	  	    		color: '#FAED7D',
	  	    	}]
	    });
}

/*dialog_img, dialog_content data*/
function dialog_content(contentid, e){
	$.ajax({
		url: "tourinquiry_one.wd",
		type: "post",
		data: {"contentid": contentid},
		success: function(resData){
			var data = JSON.parse(resData);
			var no_image = "/Project_wooridoori/resources/image/Recommend/no_image.png";
			$("#top_img").attr("src",data.firstimage);
			$("#span_title").text(data.title);
			$("#span_addr").text(data.addr1);
			$("#frm_review #contentid").val(contentid);
			
			$("#top_img").onError = function(){
				this.src = no_image;
			}
			
			/*total score rateit*/
			totalScore(contentid);
			/*dialog_review data list*/
			dialog_review(contentid, 5);
			
			sessionLoginId();
			$("#detail_tour").dialog("open");
			
		}
	});
}

/*dialog_review data*/ 
function dialog_review(contentid, end){
	$.ajax({
		url: "todialogreview.wd",
		type: "post",
		data: {"contentid": contentid, "end": end},
		success: function(resData){
			var data = JSON.parse(resData);
			
			var html = "";
			for(var i = 0; i < data.length; i++){
				html += "아이디 : <b>"+data[i].m_id+"</b>&nbsp;&nbsp;&nbsp;&nbsp;";
				html += "평점 : <span class='rateit' id='rateit_"+i+"'></span>";
				html += "<br>"
				html += "한줄평 : <span class='review'>"+data[i].pre_review+"</span>";
				html += "<br><br>"
			}
			
			//더보기 버튼 추가
			if(data.length > 0){
				html += "<div id='btn_div'><button class='form-control' id='review_dialog_btn'>더보기</button></div>";
			}
			
			$("#dialog_review_read").html(html);

			/*rateit reset 후 setting*/
			$(".rateit").rateit();
			$("#rateit_write").rateit("readonly", false);
		    for(var j = 0; j < data.length; j++){
		    	$("#rateit_"+j).rateit("readonly", true);
		    	$("#rateit_"+j).rateit("value",data[j].pre_score);
		    }
			
		}
	});
}

/*dialog_review_write data insert*/
function review_insert(){
	var contentid = $("#frm_review #contentid").val();
	$("#pre_score").val($("#rateit_write").rateit("value"));

	var frm_data = $("#frm_review").serialize();
	
	if($("#pre_review").val() != ""){
		$.ajax({
			url: "insertreview.wd",
			type: "post",
			data: frm_data,
			success: function(){
				dialog_review(contentid);
			}
		});
	}else{
		$("#review_msg").html("<b style='color:red;font-size:14pt;'>&nbsp;&nbsp;* 한줄평을 입력하세요</b>");
		setTimeout(function() {
			$("#review_msg").empty();
		}, 5000);
	}
}

/*total_score data*/
function totalScore(contentid){
	
	$.ajax({
		url: "totalscore.wd",
		type: "post",
		data: {"contentid": contentid},
		success: function(resData){
			var html = "";
			html += "평점 : " + resData;
			html += "<span class='rateit' id='total_score'></span>";
			
			$("#total_socre_div").html(html);
			$("#total_score").rateit();
			$("#total_score").rateit("value", resData);
			$("#total_score").rateit("readonly", true);
		}
	});
	
}

/*chart visit_yn data*/
function chartVisitData(contentid, visit_yn){
	var str = new Array();
	
	$.ajax({
		url: "visit_yn.wd",
		type: "post",
		async: false,
		data: {"contentid": contentid, "visit_yn": visit_yn},
		success: function(resData){
			var data = JSON.parse(resData.toLowerCase());
			for(var i = 0; i < data.length; i++){
				str.push(parseFloat(data[i].pre_score));
			}
		}
	});
	
	return str;
}

