var areaOfList = new Array();
var cat2OfList = new Array();

$(function(){
	
	var areaName = menuAreaName();
	var themaName = menuThemaName();
	
	$(".span_aTag_Controller").click(function(){
		$("#re_smenu").css("z-index","2");
		$("#re_body").css("z-index","1");
		
		var n = $(this).attr("name");
		if(n=="_1"){
			$("#list_theme").hide();
			$("#list_classification").toggle();	
		}else if(n=="_2"){
			$("#list_classification").hide();
			$("#list_theme").toggle();
		}			
	});
		
	$(document).on("mouseover", ".filter_item", function(){
		var idx_filter = $(this).index();
		var _f = $("._filter_tag").attr("name");
		
		if(_f!="_tag"){
			$(this).append($("<span class='_tag'> ◁</span>"));	
		}
		
		var areaCode;
		var themaCode;
		
		$(this).unbind("click").bind("click",function(){	
			var v = $(this).attr("val");
			var n = $(this).attr("name");
			var menu_division = $(this).attr("division");
			var link_detail;
			var tmp;
			
			/*menu area, thema 구분*/
			if(menu_division == "area"){	
				link_detail = "tlist.wd?areaname=";
				for(var i = 0; i < areaName.length; i++){
					if(i==n){
						tmp = areaName[i];
					}
				}
			}else{
				link_detail = "category.wd?cat2_name=";
				for(var i = 0; i < themaName.length; i++){
					if(i==n){
						tmp = themaName[i];
					}
				}
			}
			
			/*append class _filter_tag _tag_a*/
			if(v == "n"){
				var html = "<span class='_filter_tag' name='_tag' index='"+n+"'>&nbsp;&nbsp;<a href='javascript:location.href=\""+link_detail+tmp+"\"'>#"+tmp+"</a></span>";
				$("#View").append(html);
				$(this).append($("<span class='_tag_a'> ◀</span>"));
				$(this).attr("val","y");
				
				$("#recommend_main").attr("style", "display:none");
				$("#recommend_detail").attr("style", "visibility:visible");
				
				/*menu에서 지역 클릭시 select list*/
				if(menu_division == "area" && (areaCode != "undefined" || areaCode != "")){
					areaCode = $(this).attr("code");
				}
				if(menu_division == "thema" && (themaCode != "undefined" || themaCode != "")){
					themaCode = $(this).attr("code");
				}
				
				selectCodeOfTourList(areaCode, themaCode, 0);
				
				var cnt = 1;
				
				/*더보기 클릭 시*/
				$(document).on("click","#btn_more",function(){
					cnt++;
					var end = 20 * cnt;
					
					selectCodeOfTourList(areaCode, themaCode, end);
				});
				
			}
			
			/*remove class ._filter_tag,._tag_a */
			if(v == "y"){
				var tagIndex = $("#View").find("._filter_tag").length;
				
				for(var i = 0; i < tagIndex; i++){
					var val_filter_tag = $("._filter_tag").eq(i).attr("index");
					if(n==val_filter_tag){
						$("#View").find("._filter_tag").eq(i).remove();
					}
				}
				
				if(menu_division == "area"){
					areaOfList = new Array();
					selectCodeOfTourList(areaCode, themaCode, 0);
				}
				if(menu_division == "thema"){
					cat2OfList = new Array();
					selectCodeOfTourList(areaCode, themaCode, 0);
				}
				
				$(this).find("._tag_a").remove();
				$(this).attr("val","n");
			}
			
			$("#list_classification").hide();
			$("#list_theme").hide();
		});				
	}).on("mouseout", function(){
		$(this).find("._tag").remove();
	});	
	
	$(".filter_tag_exit").click(function(){
		$(this).find("._tag_a").remove();
		$(this).attr("val","n");
	});
	
});

/*menu area code*/
function menuAreaName(){
	var str = new Array();
	
	$.ajax({
		url: "selectareacode.wd",
		type: "post",
		success:function(resData){
			var data = JSON.parse(resData);
			
			var html = "<ul id='list_classification' class='filter_item_list_classification'>";
			for(var i = 0; i < data.length; i++){
				html += "<li class='filter_item' division='area' name='"+i+"' val='n' code='"+data[i].areacode+"'>"+data[i].areaname+"</li>";
				str.push(data[i].areaname); 
			}
			html += "</ul>";
			
			$("#area_ul").html(html);
			$("#list_classification").hide();
		}
	});
	
	return str;
}

/*menu thema name*/
function menuThemaName(){
	var str = new Array();
		
	$.ajax({
		url: "selectcontentcodename.wd",
		type: "post",
		success:function(resData){
			var data = JSON.parse(resData);
			
			var html = "<ul id='list_theme' class='filter_item_list_theme'>";
			for(var i = 0; i < data.length; i++){
				html += "<li class='filter_item' division='thema' name='"+i+"' val='n' code='"+data[i].cat2+"'>"+data[i].cat2_name+"</li>";
				str.push(data[i].cat2_name);
			}
			html += "</ul>";
			
			$("#content_ul").html(html);
			$("#list_theme").hide();
		}
	});
		
	return str;
}

/*menu 지역 테마 클릭 시 data list*/
function selectCodeOfTourList(areacode, themacode, end){
	if(areacode != null || areacode != "") areaOfList.push(areacode);
	if(themacode != null || themacode != "") cat2OfList.push(themacode);
	if(end == null || end == "" || end == 0) end = 20;
	
	var dataList = {"areacode": areaOfList, "themacode": cat2OfList, "end": end};
	
	$.ajax({
		url: "selectcodeoftourlist.wd",
		type: "post",
		async: false,
		data: dataList,
		success:function(resData){
			var data = JSON.parse(resData);
			
			var no_image = "/Project_wooridoori/resources/image/Recommend/no_image.png";
			var html = "";
			for(var i = 0; i < data.length; i++){
				html += '<div class="select_box_div">';
				html += '<input type="hidden" value="'+i+'" id="cnt">';
				html += '<input type="hidden" class="contentid" id="contentid" value="'+data[i].contentid+'">';
				html += '<div class="select_tourbox">';
				html +=	'<img class="select_img" src="'+data[i].firstimage+'" onError="this.src=\''+no_image+'\'">';
				html += '</div>';
				html += '<div class="div_hover_box">';				
				html += '<div class="select_blockA">';
				html +=	'<span class="first_trip_click" name="first_trip" value="Y">';
				html += '<img src="/Project_wooridoori/resources/image/Recommend/Check-icon.png" class="btn_first_trip">';
				html +=	'</span>';
				html += '</div>';
				html += '<div class="select_blockB">';
				html += '<ul class="select_box_ul">';
				html += '<li><span class="tour_title">'+data[i].title+'</span></li>'
				html += '<li>';
				html += '<div id="totla_score" class="rateit"></div>';
				html += '</li>';
				html += '<li>';							
				html += '<div class="_ccimg"><img class="ccimg" name="cc_name" src="/Project_wooridoori/resources/image/Recommend/cc_img_1.png">추천</div>';
				html += '<div class="_jcimg"><img class="jcimg" name="jc_name" src="/Project_wooridoori/resources/image/Recommend/jc_img_1.png">즐겨찾기</div>';
				html += '</li>';				
				html += '</ul>';
				html += '</div>';								 
				html += '</div>';
				html += '</div>';
			}
			
			if(data.length > 0){
				$("#recommend_detail #list").empty().html(html);
				$("#recommend_detail .rateit").rateit();
				$("#recommend_detail .div_hover_box").hide();
				$("#recommend_detail #div_more").attr("css", "visibility:visible");
			}else{
				html += "<span style='align:center;font-weight:bold;font-size:24pt;margin-top:100px;left:45%;'>조회된 데이터가 없습니다.</span>";
				$("#recommend_detail #list").empty().html(html);
			}
			
			for(var i = 0; i < data.length; i++){
				$("#recommend_detail .select_img").eq(i).onError = function(){
					this.src = no_image;
				}
				if(data[i].title != null){
					$("#recommend_detail .tour_title").eq(i).text(data[i].title);
				}
			}
		}
	});
}
