$(function(){
	var chart;
	var chartVarN;
	var chartVarY;
	
	$(".div_hover_box").hide();
	
    /*dialog*/
    $("#detail_tour").dialog({
	  	autoOpen: false,
	  	modal: true,
	  	resizable: false,
	  	width: 800,
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
    	$("#m_id").val("");
    	$("#pre_review").val("");
    	$("#rateit_write").rateit("value", "");
    	
    	chartVarN = chartVisitData($("#dialog_review_write #contentid").val(), "N");
  		chartVarY = chartVisitData($("#dialog_review_write #contentid").val(), "Y");
    	new Highcharts.Chart(scoreChart(chartVarN, chartVarY));
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
			dialog_review(contentid);
			
			if(!$(".rateit").has(e.target).length){
				sessionLoginId();
				$("#detail_tour").dialog("open");
			}else if(!$("._ccimg").has(e.target).length){
				alert(2);
				/*sessionLoginId();
				$("#detail_tour").dialog("open");*/
			}else if(!$("._jcimg").has(e.target).length){
				alert(3);
			}
			
		}
	});
}

/*dialog_review data*/ 
function dialog_review(contentid){
	$.ajax({
		url: "todialogreview.wd",
		type: "post",
		data: {"contentid": contentid},
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
			$("#dialog_review_read").html(html);

			/*rateit reset 후 setting*/
			$(".rateit").rateit();
			$(".rateit").rateit("readonly", true);
		    $("#rateit_write").rateit("readonly", false);
		    for(var j = 0; j < data.length; j++){
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

