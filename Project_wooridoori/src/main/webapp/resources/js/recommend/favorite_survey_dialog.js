$(function(){
	
	sessionLogin();
	selectAreaCodeName();
	selectCat2Code();
	selectStayCode();
	
	/*favorite_survey dialog*/
	$("#favorite_survey").dialog({
	  	autoOpen: false,
	  	modal: true,
	  	resizable: false,
	  	width: 400,
	  	height: 450,
	  	buttons:{
	  		"확인":function(){
	  			insertPreference();
	  			selectPreferenceOfArea();
	  			selectPreferenceOfPurpose();
	  			selectPreferenceOfStay();
	  			$("#favorite_survey").dialog("close");
	  		},
	  		"취소":function(){
	  			$("#favorite_survey").dialog("close");
	  		}
	  	}
	});
	
	/*선호도 조사 클릭 시 dialog open*/
	$(".span_aTag_Controller").click(function(){
		//로그인 했을 경우만 open
		if($(this).attr("name") == "_3"){
			if($("#login_val").val() == "YES"){
				$("#favorite_survey").attr("style", "visibility:visible");
				$("#favorite_survey").dialog("open");
			}else alert("로그인을 해주세요!!!");
		}
	});
	
});

function sessionLogin(){
	
	$.ajax({
		url:"sessionlogin.wd",
		type: "post",
		success:function(resData){
			var login = resData.substr(0, resData.indexOf(",")).trim();
			$("#login_val").val(login);
		}
	});
}

/*지역 코드 조회*/
function selectAreaCodeName(){
	$.ajax({
		url:"selectareacode.wd",
		type:"post",
		success:function(resData){
			var data = JSON.parse(resData);
			
			var html  = "<option>선택하세요</option>";
			
			for(var i = 0; i < data.length; i++){
				html += "<option value='"+data[i].areacode+"'>"+data[i].areaname+"</option>";
			}
			
			$("#sel_area").empty().html(html);
		}
	});
}


/*한국에 온 목적 코드,이름 조회*/
function selectCat2Code(){
	
	$.ajax({
		url:"selectcontentcodename.wd",
		type:"post",
		success:function(resData){
			var data = JSON.parse(resData);
			
			var html  = "<option>선택하세요</option>";
			
			for(var i = 0; i < data.length; i++){
				html += "<option value='"+data[i].cat2+"'>"+data[i].cat2_name+"</option>";
			}
			html += "<option value='A0206'>Business</option>";
			
			$("#sel_purpose").empty().html(html);
		}
	});
	
}

/*숙박 코드,이름 조회*/
function selectStayCode(){
	
	$.ajax({
		url:"selectstaycode.wd",
		type:"post",
		success:function(resData){
			var data = JSON.parse(resData);
			
			var html  = "<option>선택하세요</option>";
			
			for(var i = 0; i < data.length; i++){
				html += "<option value='"+data[i].cat3+"'>"+data[i].cat3_name+"</option>";
			}
			
			$("#sel_stay").empty().html(html);
		}
	});
	
}

/*선호도 조사 추가*/
function insertPreference(){
	
	var areacode = $("#sel_area").val();
	var age = $("input[type=radio][name=chk_age]:checked").val();
	var purpose = $("#sel_purpose").val();
	var person = $("input[type=radio][name=chk_cnt]:checked").val();
	var stay = $("#sel_stay").val();
	
	$.ajax({
		url:"selectinsertpreference.wd",
		type:"post",
		data: {"areacode":areacode,"age":age, "purpose":purpose, "person":person, "stay":stay},
		success:function(){
			
		}
	});
	
}

/*선호도 조사 후 지역 추천*/
function selectPreferenceOfArea(){
	$.ajax({
		url: "selectpreferenceofarea.wd",
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

/*선호도 조사 후 목적으로 테마 추천*/
function selectPreferenceOfPurpose(){
	$.ajax({
		url: "selectpreferenceofpurpose.wd",
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
					$("#thema .tour_title").eq(i).text(s_data[i].title);
				}
			}
			
		}
	});
}

/*선호도 조사 후 추천하고 싶은곳 -> 숙박지 추천*/
function selectPreferenceOfStay(){
	$.ajax({
		url: "selectpreferenceofstay.wd",
		type: "post",
		success:function(data){
			var s_data = JSON.parse(data);
			
			for(var i = 0; i < s_data.length; i++){
				$("#non_favorite #contentid").eq(i).val(s_data[i].contentid);
				$("#non_favorite .select_img").eq(i).attr("src", s_data[i].firstimage);
				$("#non_favorite .select_img").eq(i).onError = function(){
					this.src = "/Project_wooridoori/resources/image/Recommend/no_image.png";
				}
				if(s_data[i].firstimage == null){
					$("#non_favorite .select_img").eq(i).onError = function(){
						this.src = "/Project_wooridoori/resources/image/Recommend/no_image.png";
					}
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
