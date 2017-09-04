<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
      	top: 15%;
        height: 70%;
        width: 70%; 
        left: 15%
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel { 
        position: absolute;
        margin:14%; 
        padding:0; 
        z-index: 1;
        background-color: rgba(0,0,0,0); 
        /* border: 1px solid #999; */
        font-family: 'Roboto','sans-serif'; 
        line-height: 0px; 
        white-space: pre-line;
        
      }
      .btn_drop{
        background-color: rgba(0,0,0,0); 
      	border-style: none; 
      	outline: none; 
      }
      .btn_drop:HOVER{
      	background-color: gray;
      }
	  .material-icons{
	  	font-size: 48px;
	  	color: black;
	  }
	  
    </style> 
	

   
  </head>
  <body>
     <div id="floating-panel">
      <button class="btn_drop" id="dropFood" onclick="dropFood()"> 
        <i class="material-icons">restaurant_menu</i>
      </button>
      
      <button class="btn_drop" id="dropHotel" onclick="dropHotel()"> 
        <i class="material-icons">hotel</i>
      </button>
      
      <button class="btn_drop" id="dropTourist" onclick="dropTourist()">
		<i class="material-icons">favorite</i>
      </button>
      
      <button class="btn_drop" id="dropShopping" onclick="dropShopping()">
		<i class="material-icons">shopping_cart</i>
	  </button>
	  
      <button class="btn_drop" id="dropLeports" onclick="dropLeports()">
		<i class="material-icons">rowing</i>
	  </button>
      
      <button class="btn_drop" id="dropCulture" onclick="dropCulture()">
        <i class="material-icons">account_balance</i>
      </button>
      
      <span style="vertical-align: text-top; font-size: 24px;
      font-weight: bold;" id="title"></span> 
    </div> 
    <div id="map" style="height: 400px;">맵맵맵맵맵맵맵맵맵맵맵맵맵맵</div>   
    <div>
    	
    </div>
    <script> 
    	var btn_title;
 		var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
		
 		var infos_name = [];
 		var infos_image = [];
 		var infos_addr = [];
 		var infos_tel = [];
 		var infos_dist = [];
 		
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
        //초기 위치
        var current_lat = 37.568477; 
        var current_lng = 126.981611; 
        
 		
	  function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 16,
          center: {lat: current_lat, lng: current_lng}
        });
        
      new google.maps.Marker({
            position: {lat: current_lat, lng: current_lng}
          }).setMap(map); 
      
       /*  map.addListener('dragend', function() {
           	current_lat = map.getCenter().lat();
           	current_lng = map.getCenter().lng();
    	}); */
	  }

        

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
	
	    					console.log("name : "+infos_name[i]+i+"///index : "+index);

	        				i=i+1;
	    				}
    					
        			}); 
        			 
        		}
        	});
        }
        
       
      function dropFood(){
    	 marker_icon = "resources/image/marker/free-map-marker-icon-dark.png"; 
    	 getData(39,current_lng,current_lat);
    	 flushMarkers(food_markers_position, food_marker_objs);
    	 
    	 btnClickEffect();
		 $("#dropFood").children().css("color","black");
       } 
      
      function dropHotel(){
     	 marker_icon = "resources/image/marker/free-map-marker-icon-blue-darker.png"; 
    	 getData(32,current_lng,current_lat);
    	 flushMarkers(hotel_markers_position, hotel_marker_objs);
    	 
    	 btnClickEffect();
		 $("#dropHotel").children().css("color","blue");
      } 

      function dropTourist(){ 
     	 marker_icon = "resources/image/marker/free-map-marker-icon-red.png"; 
    	 getData(12,current_lng,current_lat);
         flushMarkers(tourist_markers_position, tourist_marker_objs);
         
         btnClickEffect();
		 $("#dropTourist").children().css("color","red");
      } 
      
      function dropShopping(){
      	 marker_icon = "resources/image/marker/free-map-marker-icon-orange.png"; 
     	 getData(38,current_lng,current_lat);
         flushMarkers(shopping_markers_position, shopping_marker_objs);
         
         btnClickEffect();
		 $("#dropShopping").children().css("color","orange");
       } 
      
      function dropLeports(){
      	 marker_icon = "resources/image/marker/free-map-marker-icon-pink.png"; 
     	 getData(28,current_lng,current_lat);
         flushMarkers(leports_markers_position, leports_marker_objs);
         
         btnClickEffect();
		 $("#dropLeports").children().css("color","hotpink");
       } 
      
      function dropCulture(){
      	 marker_icon = "resources/image/marker/free-map-marker-icon-green.png"; 
     	 getData(14,current_lng,current_lat);
         flushMarkers(culture_markers_position, culture_marker_objs);
         
         btnClickEffect();
		 $("#dropCulture").children().css("color","green");
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
            
        	
            
            //각 마커에 infowindow 등록
            var infowindow = new google.maps.InfoWindow({ 
    			content: '<img border="0" SRC="'+infos_image[index]+'"'
    			+'width="225" height="150">'
    			+'<div style="white-space: pre-line; word-break:break-all; width:225px;"><hr><b>'
    			+infos_name[index]+'</b><hr><b>주소 ('+infos_dist[index]+'m)</b><br>' 
    			+infos_addr[index]+'<hr><b>전화번호</b><br>'
    			+infos_tel[index]+'<hr></div>'
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
    </script>
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDXnqdeIyxuYo7_IQ_Fub4Ty8APZMXrn3A&libraries=places&callback=initMap">
    </script>
  </body>
</html>