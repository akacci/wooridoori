/*
 * CONTENT_DETAIL.JS 
 */
function content_writer(data){
	basic_writer(data.contentid, data.contenttypeid);
	detail_writer(data.contentid, data.contenttypeid);
	weater_writer(data.x, data.y);
}
function basic_writer(contentid, contenttypeid){
	var contentId = contentid;
	var contentTypeId = contenttypeid;
	var key_data = "ohelTML%2FebWtWdtXdLCnZdIG7KRH8mN7N%2BwAiIv1%2BWmyR5RcCtksbUK3aYiYbsbTxrQ7BpvdMRRBBtiIVLaJZQ%3D%3D";
	var url_data = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+key_data+"&contentId="+contentId+"&defaultYN=Y&mapinfoYN=Y&firstImageYN=Y&addrinfoYN=Y&overviewYN=Y&MobileOS=ETC&MobileApp=AppTesting";
	$.ajax({
		url:url_data,
		success:function(data){
			console.log("basic");
			console.log(data);
			var content = $(data).find("item");
			$(".basic_info").html(content.find("overview").text());
		}
	});
}
function detail_writer(contentid, contenttypeid){
	var contentId = contentid;
	var contentTypeId = contenttypeid;
	var key_data = "ohelTML%2FebWtWdtXdLCnZdIG7KRH8mN7N%2BwAiIv1%2BWmyR5RcCtksbUK3aYiYbsbTxrQ7BpvdMRRBBtiIVLaJZQ%3D%3D";
	var url_data = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey="+key_data+"&contentId="+contentId+"&contentTypeId="+contentTypeId+"&MobileOS=ETC&MobileApp=AppTesting";
	$.ajax({
		url:url_data,
		success:function(data){
			var content = $(data).find("item");
			var	TOURIST_ATTRACTION = 12;	//관광지
			var	CULTURE = 14;	//문화시설
			var	FESTIVAL = 15;	//행사.공연.축제
			var	TRAVELING_COURSE = 25;	//여행코스
			var	LEPORTS = 28;	//레포츠
			var	HOTAL = 32;	//숙박
			var	SHOPPING = 38;	//쇼핑
			var	RESTAURANT = 39;	//음식점
			var str = "";
			console.log("detail");
			console.log(data);
			
			if(contentTypeId==TOURIST_ATTRACTION){	//관광지
				if(content.find("infocenter").text().length != 0 && content.find("infocenter").text() != null){
					str += "<b>&nbsp&nbsp문의 및 안내</b><br>"+content.find("infocenter").text()+"<br><br>";
				}if(content.find("accomcount").text().length != 0 && content.find("accomcount").text() != null){
					str += "<b>&nbsp&nbsp수용인원</b> : "+content.find("aaccomcount").text()+"<br><br>";
				}if(content.find("usetime").text().length != 0 && content.find("usetime").text() != null){
					str += "<b>&nbsp&nbsp이용시간</b><br>"+content.find("usetime").text()+"<br><br>";
				}if(content.find("restdate").text().length != 0 && content.find("restdate").text() != null){
					str += "<b>&nbsp&nbsp쉬는날</b><br>"+content.find("restdate").text()+"<br><br>";
				}if(content.find("parking").text().length != 0 && content.find("parking").text() != null){
					str += "<b>&nbsp&nbsp주차시설</b><br>"+content.find("parking").text()+"<br><br>";
				}
	
				$(".detail_info").html(str);
			}else if(contentTypeId==CULTURE){	//문화시설
				if(content.find("infocenterculture").text().length != 0 && content.find("infocenterculture").text() != null){
					str += "<b>&nbsp&nbsp문의 및 안내</b><br>"+content.find("infocenterculture").text()+"<br><br>";
				}if(content.find("accomcountculture").text().length != 0 && content.find("accomcountculture").text() != null){
					str += "<b>&nbsp&nbsp수용인원</b> : "+content.find("accomcountculture").text()+"<br><br>";
				}if(content.find("parkingculture").text().length != 0 && content.find("parkingculture").text() != null){
					str += "<b>&nbsp&nbsp주차시설</b><br>"+content.find("parkingculture").text()+"<br><br>";
				}if(content.find("usefee").text().length != 0 && content.find("usefee").text() != null){
					str += "<b>&nbsp&nbsp이용요금</b><br>"+content.find("usefee").text()+"<br><br>";
				}if(content.find("usetimeculture").text().length != 0 && content.find("usetimeculture").text() != null){
					str += "<b>&nbsp&nbsp이용시간</b><br>"+content.find("usetimeculture").text()+"<br><br>";
				}if(content.find("parkingculture").text().length != 0 && content.find("parkingculture").text() != null){
					str += "<b>&nbsp&nbsp주차시설</b><br>"+content.find("parkingculture").text()+"<br><br>";
				}if(content.find("parkingfee").text().length != 0 && content.find("parkingfee").text() != null){
					str += "<b>&nbsp&nbsp주차요금</b><br>"+content.find("parkingfee").text()+"<br><br>";
				}
				
				$(".detail_info").html(str);
			}else if(contentTypeId==FESTIVAL){	//행사.공연.축제
				if(content.find("eventstartdate").text().length != 0 && content.find("eventstartdate").text() != null){
					str += "<b>&nbsp&nbsp시작일</b><br>"+content.find("eventstartdate").text()+"<br><br>";
				}if(content.find("eventenddate").text().length != 0 && content.find("eventenddate").text() != null){
					str += "<b>&nbsp&nbsp종료일</b><br>"+content.find("eventenddate").text()+"<br><br>";
				}if(content.find("playtime").text().length != 0 && content.find("playtime").text() != null){
					str += "<b>&nbsp&nbsp공연시간</b><br>"+content.find("playtime").text()+"<br><br>";
				}if(content.find("usetimefestival").text().length != 0 && content.find("usetimefestival").text() != null){
					str += "<b>&nbsp&nbsp이용요금</b><br>"+content.find("usetimefestival").text()+"<br><br>";
				}if(content.find("program").text().length != 0 && content.find("program").text() != null){
					str += "<b>&nbsp&nbsp프로그램</b><br>"+content.find("program").text()+"<br><br>";
				}if(content.find("subevent").text().length != 0 && content.find("subevent").text() != null){
					str += "<b>&nbsp&nbsp부대행사</b><br>"+content.find("subevent").text()+"<br><br>";
				}if(content.find("eventplace").text().length != 0 && content.find("eventplace").text() != null){
					str += "<b>&nbsp&nbsp장소</b><br>"+content.find("eventplace").text()+"<br><br>";
				}if(content.find("placeinfo").text().length != 0 && content.find("placeinfo").text() != null){
					str += "<b>&nbsp&nbsp장소정보</b><br>"+content.find("placeinfo").text()+"<br><br>";
				}
				
				$(".detail_info").html(str);
			}else if(contentTypeId==TRAVELING_COURSE){	//여행코스
				
				
				$(".detail_info").html(str);
			}else if(contentTypeId==LEPORTS){	//레포츠
				
				
				$(".detail_info").html(str);
			}else if(contentTypeId==HOTAL){		//숙박
				
				
				$(".detail_info").html(str);
			}else if(contentTypeId==SHOPPING){	//쇼핑
				
				
				$(".detail_info").html(str);
			}else if(contentTypeId==RESTAURANT){//음식점
				
				
				$(".detail_info").html(str);
			}
		}
	});
}
function weater_writer(x, y){
	var longitude = x;
	var latitude = y;
	var Wurl="http://apis.skplanetx.com/weather/current/minutely?version=1&lat="+latitude+"&lon="+longitude+"&city=&county=&village=&appKey=32235c48-92ac-3a82-bf93-7fbee73f7069";
	$.ajax({
		/*http://apis.skplanetx.com/weather/current/minutely?version=1&lat=1&lon=1&city=&county=&village=&appKey=32235c48-92ac-3a82-bf93-7fbee73f7069,32235c48-92ac-3a82-bf93-7fbee73f7061 */
		url:Wurl,
		type:"GET",
		dataType:"JSON",
		cache:false,
		success:function(data){
			var result = data.result.message;
			var city= data.weather.minutely[0].station.name;
			var weather= data.weather.minutely[0].sky.name;
			$(".content_detail .weather").text(city+"의 날씨는 ["+weather+"] 입니다.");
					
		},complete : function(data) {
			//alert("complete");
	    },error : function(xhr, status, error) {
			//alert("error"+error);
		}
	});
}










var btn_title;
	var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

	var infos_name = [];
	var infos_image = [];
	var infos_addr = [];
	var infos_tel = [];
	var infos_dist = [];
	var infos_contentid = [];
	
	//음식점
var food_markers_position=[];
	var food_marker_objs = [];
   //숙박
	var hotel_markers_position = [];
   var hotel_marker_objs = [];
   //관광지
   var tourist_markers_position = [];
   var tourist_marker_objs = [];
//쇼핑
var shopping_markers_position = [];
   var shopping_marker_objs = [];
//레포츠
var leports_markers_position = [];
   var leports_marker_objs = [];
//문화시설
var culture_markers_position = [];
   var culture_marker_objs = [];
   
   ///////
   var empty_markers_position = [];
   var empty_marker_objs = [];
   
   //clear를 위한 markers변수 
   var markers = [];
   var infos = [];
   var marker;
   var marker_icon;
   var markerCluster;
var map;



function getData(contentType,lng,lat){
  
  var Url="http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?"
  		+"ServiceKey=zp2z%2FnHsZIFM2BHnRojSdiYzKfscMUNQrST3SeiQk77cAiTnDhWPadoAtEurbNfy3eCaIC3xUQCZJd4zpCbi6g%3D%3D"
  		+"&mapX="+lng+"&mapY="+lat+"&radius=999999&arrange=E&MobileOS=ETC&MobileApp=AppTesting"
  		+"&contentTypeId="+contentType+"&numOfRows=26";
  var searched_lat;
  var searched_lng;
  var name;
  var image;
  var address; 
  var tel;
  var dist;
  var contentid;
  
  var i=0;
  
  	$.ajax({
  		url: Url,
  		async: false,
  		success : function(xml){
  			console.log(xml);
  			var name = $(xml).find('item').each(function(index){
  				
  				name = $(this).find('title').text();
  				image = $(this).find('firstimage2').text();
  				address = $(this).find('addr1').text();
  				tel = $(this).find('tel').text();
  				dist = $(this).find('dist').text();
  				contentid = $(this).find('contentid').text();
  				
  				searched_lat = $(this).find('mapy').text();
  				searched_lng = $(this).find('mapx').text();
  				
  				//사진, 주소가 유효한 것만
  				if(image!="" && address!="")
					{
  					
      				
      				if(contentType==39)
      				{
      					btn_title="음식점";
      					food_markers_position[i]={lat: parseFloat(searched_lat), lng: parseFloat(searched_lng)};
      				}
      				if(contentType==32)
      				{
      					btn_title="숙박";
      					hotel_markers_position[i]={lat: parseFloat(searched_lat), lng: parseFloat(searched_lng)};
      				}
      				if(contentType==12)
      				{
      					btn_title="관광지";
      					tourist_markers_position[i]={lat: parseFloat(searched_lat), lng: parseFloat(searched_lng)};
      				}
      				if(contentType==38)
      				{
      					btn_title="쇼핑";
      					shopping_markers_position[i]={lat: parseFloat(searched_lat), lng: parseFloat(searched_lng)};
      				}
      				if(contentType==28)
      				{
      					btn_title="레포츠";
      					leports_markers_position[i]={lat: parseFloat(searched_lat), lng: parseFloat(searched_lng)};
      				}
      				if(contentType==14)
      				{
      					btn_title="문화시설";
      					culture_markers_position[i]={lat: parseFloat(searched_lat), lng: parseFloat(searched_lng)};
      				}
      				
      				infos_name[i]=name;
  					infos_image[i]=image;
  					infos_tel[i]=tel;
  					infos_addr[i]=address;
  					infos_dist[i]=dist;
  					infos_contentid[i]=contentid;

  					console.log("name : "+infos_name[i]+i+"///index : "+index);

      				i=i+1;
  				}
					
  			}); 
  			 
  		}
  	});
  }
  

	function moveToOriginalMarker(){
		//클릭시 모든 infowindow 닫고 이동
		for(var i = 0; i < infos.length; i++)
		{
			infos[i].close();
		}
		map.panTo({lat: current_lat, lng: current_lng});
	}
	
function dropFood(){
	 marker_icon = "resources/image/marker/free-map-marker-icon-dark.png"; 
	 getData(39,current_lng,current_lat);
	 flushMarkers(food_markers_position, food_marker_objs);
	 
	 btnClickEffect();
	 $("#dropFood").children().css("color","black");
	 printList(food_markers_position);
 } 

function dropHotel(){
	 marker_icon = "resources/image/marker/free-map-marker-icon-blue-darker.png"; 
	 getData(32,current_lng,current_lat);
	 flushMarkers(hotel_markers_position, hotel_marker_objs);
	 
	 btnClickEffect();
	 $("#dropHotel").children().css("color","blue");
	 printList(hotel_markers_position);
} 

function dropTourist(){ 
	 marker_icon = "resources/image/marker/free-map-marker-icon-red.png"; 
	 getData(12,current_lng,current_lat);
   flushMarkers(tourist_markers_position, tourist_marker_objs);
   
   btnClickEffect();
	 $("#dropTourist").children().css("color","red");
	 printList(tourist_markers_position);
} 

function dropShopping(){
	 marker_icon = "resources/image/marker/free-map-marker-icon-orange.png"; 
	 getData(38,current_lng,current_lat);
   flushMarkers(shopping_markers_position, shopping_marker_objs);
   
   btnClickEffect();
	 $("#dropShopping").children().css("color","orange");
	 printList(shopping_markers_position);
 } 

function dropLeports(){
	 marker_icon = "resources/image/marker/free-map-marker-icon-pink.png"; 
	 getData(28,current_lng,current_lat);
   flushMarkers(leports_markers_position, leports_marker_objs);
   
   btnClickEffect();
	 $("#dropLeports").children().css("color","hotpink");
	 printList(leports_markers_position);
 } 

function dropCulture(){
	 marker_icon = "resources/image/marker/free-map-marker-icon-green.png"; 
	 getData(14,current_lng,current_lat);
   flushMarkers(culture_markers_position, culture_marker_objs);
   
   btnClickEffect();
	 $("#dropCulture").children().css("color","green");
	 printList(culture_markers_position);
 }  

function printList(empty_markers_position)
{//${cdata.title}
	var li="";

	for(var i = 0; i<empty_markers_position.length; i++)
	{
	li=
		li+"<li style='height:150px'>"
		+"<img src='"+infos_image[i]+"' style='float:left; margin-right: 10px; width:195px; height:130px'/>"
		+"<div class='info'>"
		+"<h3 class='title' style='margin:0'><a style='cursor:pointer;' href='detail.wd?contentid="+infos_contentid[i]+"'>"+infos_name[i]
		+"( "+infos_dist[i]+"m )"+"</a></h3>"
		+"<p class='addr'>"+infos_addr[i]+"</p>"
		+"<p class='tel'>"+infos_tel[i]+"</p>"
		+"</div></li><hr>";
	}
	
	$(".list").html(li);
	

}


function btnClickEffect()
{
	  $("#title").text(btn_title);
	  //버튼 클릭시 공통으로 적용되는 css처리 
    $("i").css("color","black"); 
}

function flushMarkers(empty_markers_position, empty_marker_objs)
{
    clearMarkers(food_marker_objs);
	clearMarkers(hotel_marker_objs);
	clearMarkers(tourist_marker_objs);
	clearMarkers(shopping_marker_objs);
    clearMarkers(culture_marker_objs);
    clearMarkers(leports_marker_objs);
	  
	
     for(var i=0; i<empty_markers_position.length; i++){
     addMarkers(empty_markers_position[i], i, empty_marker_objs);
   }
     addMarkerCluster(empty_marker_objs);
	   
}


function addMarkerCluster(markers)
{
	//Add a marker clusterer to manage the markers.
  	
	markerCluster = new MarkerClusterer(map, markers,
  {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'
	,minimumClusterSize: 3, zoomOnClick : true});
	
}
  
function addMarkers(position, index, markers){
	  
	  markers.push(marker=new google.maps.Marker({
          position: position,
          label: labels[index % labels.length],
          animation: google.maps.Animation.DROP,
          icon: marker_icon               
        }) ); 
      marker.setMap(map);
      
      console.log(index+'this lat is'+position.lat);
      
      var tel="";
		
      if(infos_tel[index]!=(""))
	  {
		tel="<br><br><b>전화번호</b><br>"+infos_tel[index];
	  }
       
      //각 마커에 infowindow 등록
      var infowindow = new google.maps.InfoWindow({ 
    	
			content: '<div style="white-space: pre-line; word-break:break-all; width:150px;">'
			+'<b>'+infos_name[index]+'</b><br>' 
			+'<img style="display:block;" border="0" SRC="'+infos_image[index]+'"'
			+'width="150" height="100">'
			+'<br><b>주소 ('+infos_dist[index]+'m)</b><br>' 
			+infos_addr[index]+tel
			+'</div>'
			
		}); 
      infos[index]=infowindow;
      
      //마커 클릭이벤트
  	google.maps.event.addListener(markers[index], 'click', function(){
  		
  		//마커 클릭시 모든 infowindow 닫고 클릭한 마커로 이동
  		for(var i = 0; i < infos.length; i++)
  		{
  			infos[i].close();	
  		}
  		map.panTo(position);

  		infos[index].open(map,markers[index]);
  		
  		
  	});
    }


function clearMarkers(markers) {
    for (var i = 0; i < markers.length; i++) {
      markers[i].setMap(null);
    }

    if (markerCluster) {
  	  markerCluster.clearMarkers(); 
      }
    markers = []; 
    
	  food_marker_objs=[]; 
	  hotel_marker_objs=[];
	  tourist_marker_objs=[];
	  
	  shopping_marker_objs=[]; 
	  leports_marker_objs=[];
	  shopping_marker_objs=[];
  }