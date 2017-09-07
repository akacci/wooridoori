$(function(){
	
	$("#recommend_detail").hide();
	$(".check_img").hide();

	firstAreaData(); //처음 화면에 나오는 지역 데이터
	firstThemaData(); //처음 화면에 나오는 테마 데이터
	firstFavoriteRecommendData(); //처음 화면에 나오는 추천하고 싶은곳 데이터	
	
	/*image slider*/
	var num = 0;
	var slideWidth = $(".select_box_div").width();
	var slideLength;
	
	$("div.slider a.slide_left").click(function(e){
		var topClass = $(e.target).parent().parent().parent();
		num++;
		if (num >= 1){
			num = 0;
			alert("시작입니다!");
		} else {
			$("#"+topClass.attr("id")+" .select_box_div").animate({left:'+='+slideWidth},100);
		}
	});
	
	$("div.slider a.slide_right").click(function(e){
		var topClass = $(e.target).parent().parent().parent();
		slideLength = $("#"+topClass.attr("id")+" .select_box_div").length
		num--;
		if (num <= "-"+(slideLength-1)){
			num = -(slideLength-2);
			alert("끝입니다!");
		} else {
			$("#"+topClass.attr("id")+" .select_box_div").animate({left:'-='+slideWidth},100);
		}
	});
	
	/*firsttrip, bookmark, preference, grade point ajax*/
	var re_val = 0;
	var fir_val = "x";
	var ja_val = "x";
	var cc_val = "x";
	$(".rateit").click(function(e){		
		re_val = $(this).rateit('value');
		var index = $(this).attr("inx");
		var _contentid = $(".contentid:eq("+index+")").attr("value");
		select_data(re_val,fir_val,ja_val,_contentid,cc_val);
		/*$(".rateit").rateit();
	    $("#rateit_false").rateit("readonly", false);
	     for(var j = 0; j < data.length; j++){
	        $("#rateit_"+j).rateit("readonly", true);
	        $("#rateit_"+j).rateit("value",data[j].pre_score);
	     }*/
	});
	
	$(".first_trip_click").click(function(e){
		e.stopPropagation();
		fir_val = $(this).attr("value");		
		var index = $(this).attr("inx");
		var _contentid = $(".contentid:eq("+index+")").attr("value");
		if(fir_val=="n")
		{
			/*$(".check_img").show();*/
			$(this).find(".glyphicon glyphicon-check").css("color","red");
			fir_val = $(this).attr("value","y");
		}
		if(fir_val=="y")
		{
			/*$(".check_img").hide();*/
			$(this).find(".glyphicon glyphicon-check").css("color","black");
			fir_val = $(this).attr("value","n");
		}
		fir_val = $(this).attr("value");
		select_data(re_val,fir_val,ja_val,_contentid,cc_val);
	});
	$("._jcimg").click(function(e){
		e.stopPropagation();
		ja_val = $(this).attr("value");
		var index = $(this).attr("inx");		
		_contentid = $(".contentid:eq("+index+")").attr("value");
		if(ja_val=="n")
		{
			$(this).css("color","blue");
			$(this).find(".jcimg").attr("src","resources/image/Recommend/jc_img_2.png");
			ja_val = $(this).attr("value","y");
		}
		if(ja_val=="y")
		{
			$(this).css("color","black");
			$(this).find(".jcimg").attr("src","resources/image/Recommend/jc_img_1.png");
			ja_val = $(this).attr("value","n");
		}
		ja_val = $(this).attr("value");
		select_data(re_val,fir_val,ja_val,_contentid,cc_val);
	});
	$("._ccimg").click(function(e){
		e.stopPropagation();		
		cc_val = $(this).attr("value");
		var index = $(this).attr("inx");
		_contentid = $(".contentid:eq("+index+")").attr("value");
		alert(_contentid);
		if(cc_val == 'n')
		{
			$(this).css("color","red");
			$(this).find(".ccimg").attr("src","resources/image/Recommend/cc_img_2.png");
			cc_val = $(this).attr("value","y");
		}
		if(cc_val == 'y')
		{
			$(this).css("color","black");
			$(this).find(".ccimg").attr("src","resources/image/Recommend/cc_img_1.png");
			cc_val = $(this).attr("value","n");
		}
		cc_val = $(this).attr("value");
		alert(cc_val);
		select_data(re_val,fir_val,ja_val,_contentid,cc_val);
		
	});
	
});

/*처음 로딩시 지역 데이타*/
function firstAreaData(){
	$.ajax({
		url: "re_body_area.wd",
		type: "post",
		success:function(data){
			var s_data = JSON.parse(data);
			
			for(var i = 0; i < s_data.length; i++){
				$("#area #contentid").eq(i).val(s_data[i].contentid);
				$("#area .select_img").eq(i).attr("src", s_data[i].firstimage);
				$("#area .select_img").eq(i).onError = function(){
					this.src = "/Project_wooridoori/resources/image/Recommend/no_image.png";
				}
				$("#area .first_trip").eq(i).attr("value","n");
				$("#area .cc_img").eq(i).attr("value","n");
				
				$("#area ._ccimg:eq("+i+")").attr("inx",i);
				$("#area .rateit:eq("+i+")").attr("inx",i);
				$("#area ._jcimg:eq("+i+")").attr("inx",i);
				$("#area .btn_first_trip:eq("+i+")").attr("inx",i);
				if(s_data[i].title != null){
					$("#area .tour_title").eq(i).text(s_data[i].title);
				}
			}
			
		}
	});
}

/*처음 로딩시 테마 데이타*/
function firstThemaData(){
	$.ajax({
		url: "re_body_thema.wd",
		type: "post",
		success:function(data){
			var s_data = JSON.parse(data);
			
			for(var i = 0; i < s_data.length; i++){
				$("#thema #contentid").eq(i).val(s_data[i].contentid);
				$("#thema .select_img").eq(i).attr("src", s_data[i].firstimage);
				$("#thema .select_img").eq(i).onError = function(){
					this.src = "/Project_wooridoori/resources/image/Recommend/no_image.png";
				}
				$("#thema .first_trip").eq(i).attr("value","n");
				$("#thema .cc_img").eq(i).attr("value","n");
				
				$("#thema ._ccimg:eq("+i+")").attr("inx",i);
				$("#thema .rateit:eq("+i+")").attr("inx",i);
				$("#thema ._jcimg:eq("+i+")").attr("inx",i);
				$("#thema .btn_first_trip:eq("+i+")").attr("inx",i);
				if(s_data[i].title != null){
					if(s_data[i].title.length >= 10){
					    return s_data[i].title.substr(0,10)+"...";
					}
					$("#thema .tour_title").eq(i).text(s_data[i].title);
				}
			}
			
		}
	});
}

/*처음 로딩시 추천하고 싶은곳 데이터*/
function firstFavoriteRecommendData(){
	$.ajax({
		url: "re_body_nonfavorite.wd",
		type: "post",
		success:function(data){
			var s_data = JSON.parse(data);
			
			for(var i = 0; i < s_data.length; i++){
				$("#non_favorite #contentid").eq(i).val(s_data[i].contentid);
				$("#non_favorite .select_img").eq(i).attr("src", s_data[i].firstimage);
				$("#non_favorite .select_img").eq(i).onError = function(){
					this.src = "/Project_wooridoori/resources/image/Recommend/no_image.png";
				}
				$("#non_favorite .first_trip").eq(i).attr("value","n");
				$("#non_favorite .cc_img").eq(i).attr("value","n");
				
				$("#non_favorite ._ccimg:eq("+i+")").attr("inx",i);
				$("#non_favorite .rateit:eq("+i+")").attr("inx",i);
				$("#non_favorite ._jcimg:eq("+i+")").attr("inx",i);
				$("#non_favorite .btn_first_trip:eq("+i+")").attr("inx",i);
				if(s_data[i].title != null){
					$("#non_favorite .tour_title").eq(i).text(s_data[i].title);
				}
			}
			
		}
	});
}

function select_data(re_val,fir_val,ja_val,_contentid,cc_val){
	
	$.ajax({
		url : "select_data.wd",
		type : "post",
		data : {"grade_point": re_val, "firsttrip":fir_val,"bookmark":ja_val,"contentid":_contentid,"pre_rence":cc_val},
		success : function(data){
			alert("저장되었습니다");
			
		}
	});
}