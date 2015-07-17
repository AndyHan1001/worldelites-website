<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
  <head>
  <title>Load map with navigation bar module</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <style>
  .dd_waypoint,.dd_itinerary,dd_singleStep{float:left; width:100%;}
  .dd_itinerary li{float:left; width:100%;}
  .bcw a{text-decoration:none; color:#069;}
  
  .dd_messageContainer{display:none;}
  .dd_messageContainer{font-size:12px;}
  
  .dd_waypoint{display:none;}
  .dd_itinerary{display:none;}
  .dd_avoidTraffic{display:none;}
  .dd_trafficTime{display:none;}
  .dd_selectorTitleBar{display:none;}
  
	
  .dd_tripSummary{float:left;width:158px; mini-height:130px; padding:10px; background-color:#f8f8fa; border: 1px solid #d9d9d9}
  .dd_tripSummary span{font-size:12px;}
  
  .dd_routeSelectOption{float:left;width:158px; mini-height:130px; padding:10px; background-color:#f8f8fa; border: 1px solid #d9d9d9}
  .dd_routeSelectOption *{font-size:12px;}  

  </style>
  <script src="<%= path2 %>/resources/MapCode/jquery.js" type="text/javascript"></script>
	 <script type="text/javascript">
	 	var mapControlUrl = "http://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0"
    </script>
    <script src="<%= path2 %>/resources/MapCode/Scripts/MicrosoftAjaxV7API.js" type="text/javascript"></script>
    <script src="<%= path2 %>/resources/MapCode/Scripts/MicrosoftAjaxV7isdk.js" type="text/javascript"></script>

  
  <script type="text/javascript" src="http://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0"></script>
  <script type="text/javascript">
var map = null;
var searchManager = null;
var locations = [];
var markers   = [];
      var directionsManager;
      var directionsErrorEventObj;
      var directionsUpdatedEventObj; 

var skey="";
var zom = 10;

var lat = ${lat};
var lng = ${lng};
var sid=${sid};


var u_lat = ${u_lat};
var u_lng = ${u_lng};
var u_sid=${u_sid};

  function getMap()
  {
	var options = {
		zoom: zom,
		center: new Microsoft.Maps.Location(lat, lng),
		credentials: "AgSUF9Yd94J8pov18nW2xLzrRPcwvvUXhFVQvc17hGoNWLd6M3a4U08EQmSCNtUo",
		mapTypeId: Microsoft.Maps.MapTypeId.road,
		center: new Microsoft.Maps.Location((lat+u_lat)/2,(lng+u_lng)/2)
	}
	
	map = new Microsoft.Maps.Map(document.getElementById('myMap'),options);
	showApartMent();
  }

function showApartMent()
{
	locations.push([u_lat,u_lng,'<%= path2 %>/resources/MapCode/ico_unt.png',u_sid,100]);
	locations.push([lat,lng,'<%= path2 %>/resources/MapCode/ico_apt.png',sid,101]);
	for(var i = 0; i < locations.length; i++) {
		makeMarker(locations[i]);
	}
}
function makeMarker(location) {
	var lat 	 = location[0];
	var long     = location[1];
	var icon     = location[2];
	var id       = location[3];
	var type     = location[4];
	var position = new Microsoft.Maps.Location(lat, long);
	var marker   = new Microsoft.Maps.Pushpin(position, {icon: icon, width: 30, height: 48});
	map.entities.push(marker);
	Microsoft.Maps.Events.addHandler(marker, 'mouseover', function() {getImage(id, position, marker, type)});
}

function getImage(id, position, marker, type) {
		switch(parseInt(type)) {
		case 100:
			jQuery.ajax({
				"url": "getSchoolById.html",
				"type": "post",
				"data": "id="+id,
				"success" : function(data) {
					var infoboxOptions = {showCloseButton: true, zIndex: 0, offset: new Microsoft.Maps.Point(0, 40), showPointer: true};
					var defaultInfobox = new Microsoft.Maps.Infobox(position, infoboxOptions);
					defaultInfobox.setOptions({
						htmlContent: '<div class="row bcw" style="max-height:110px;overflow:hidden;padding:10px;width:200px; background-color:#fff">'+data.name+'</div>',
						visible: true
					});
					Microsoft.Maps.Events.addHandler(map, 'click', function() {defaultInfobox.setOptions({visible: false});});
					Microsoft.Maps.Events.addHandler(map, 'viewchangestart', function() {defaultInfobox.setOptions({visible: false});});
					map.entities.push(defaultInfobox);
				}
			});
		break;
		case 101:
			jQuery.ajax({
				"url": "getApartmentById.html",
				"type": "post",
				"data": "id="+id,
				"success" : function(data) {
					var infoboxOptions = {showCloseButton: true, zIndex: 0, offset: new Microsoft.Maps.Point(0, 40), showPointer: true};
					var defaultInfobox = new Microsoft.Maps.Infobox(position, infoboxOptions);
					defaultInfobox.setOptions({
						htmlContent: '<div class="row bcw" style="max-height:110px;overflow:hidden;padding:10px;width:200px; background-color:#fff">'+data.name+'</div>',
						visible: true
					});
					Microsoft.Maps.Events.addHandler(map, 'click', function() {defaultInfobox.setOptions({visible: false});});
					Microsoft.Maps.Events.addHandler(map, 'viewchangestart', function() {defaultInfobox.setOptions({visible: false});});
					map.entities.push(defaultInfobox);
				}
			});

	}
}

//键盘上下执行的函数
function keychang(up) {
	if("up" == up) {
		if(indexLi == 1) {
			indexLi = $("#results").find("tr").not(".bg-warning").length;
		} else {
			indexLi--;
		}
	} else {
		if(indexLi ==  $("#results").find("tr").not(".bg-warning").length) {
			indexLi = 1;
		} else {
			indexLi++;
		}
	}
	$("#results").find("tr").not(".bg-warning").eq(indexLi-1).addClass("bg-info").siblings().removeClass("bg-info");
}
$(document).keydown(function(e) {
	if(e.keyCode == 38) {			//向上
		$("#result").scrollTop($("#result").scrollTop()-25);
		keychang("up");
	} else if(e.keyCode == 40) {	//向下
		$("#result").scrollTop($("#result").scrollTop()+25);
		keychang();
	} else if(e.keyCode == 13) {	//回车
		var coordinate = new Array();
		coordinate     = $("#results").find("tr").not(".bg-warning").eq(indexLi-1).text().split("^");
		$("#keyword").val(coordinate['0']);
		if(coordinate['1'] && coordinate['2']) {
			setLocation(coordinate['1'], coordinate['2'], coordinate['3'], coordinate['4'], coordinate['5']);
		}
		$("#result").hide();
	}
	e.stopPropagation();
});


  function createSearchManager() 
  {
      map.addComponent('searchManager', new Microsoft.Maps.Search.SearchManager(map)); 
      searchManager = map.getComponent('searchManager'); 
  }
  function LoadSearchModule(s)
  {
	skey=s;
	parent.htmlcument.getElementById("directionsItinerary").innerHTML="";
    Microsoft.Maps.loadModule('Microsoft.Maps.Search', { callback: searchRequest });

  }
  function searchRequest() 
  { 
    createSearchManager(); 
    var what =skey; 
    var userData = { name: 'WorldElite', id: '10001' }; 
    //var where = 'boston, ma'; 
    var request = 
        { 
            what: what, 
            count: 10, 
            startIndex: 0, 
            bounds: map.getBounds(), 
            callback: search_onSearchSuccess, 
            errorCallback: search_onSearchFailure, 
            userData: userData 
        }; 
    searchManager.search(request); 
  } 
  function search_onSearchSuccess(result, userData) 
  { 
    map.entities.clear(); 
    var searchResults = result && result.searchResults; 
    if (searchResults) { 
        for (var i = 0; i < searchResults.length; i++) { 
            search_createMapPin(searchResults[i]); 
        } 
        if (result.searchRegion && result.searchRegion.mapBounds) { 
            map.setView({ bounds: result.searchRegion.mapBounds.locationRect }); 
        } 
        else 
        { 
            alert('No results returned, Please try after sometime.'); 
        } 
		showApartMent();
    } 
  } 
  function search_createMapPin(result) 
  { 
    if (result) { 
        var pin = new Microsoft.Maps.Pushpin(result.location, null); 
        Microsoft.Maps.Events.addHandler(pin, 'mouseover', function () { search_showInfoBox(result) }); 
        map.entities.push(pin); 
    } 
  } 
  function search_showInfoBox(result) 
  { 
    if (currInfobox) { 
        currInfobox.setOptions({ visible: true }); 
        map.entities.remove(currInfobox); 
    } 
    currInfobox = new Microsoft.Maps.Infobox( 
        result.location, 
        { 
            title: result.name, 
            description: [result.address, result.city, result.state, result.country, result.phone].join(' '), 
            showPointer: true, 
            titleAction: null, 
            titleClickHandler: null 
        }); 
    currInfobox.setOptions({ visible: true }); 
    map.entities.push(currInfobox); 
  } 
  function search_onSearchFailure(result, userData) 
  { 
    alert('Search failed'); 
  } 
  
  
  
  
  
  
  
  
  
      function createDirectionsManager()
      {
          var displayMessage;
          if (!directionsManager) 
          {
              directionsManager = new Microsoft.Maps.Directions.DirectionsManager(map);
              displayMessage = 'Directions Module loaded\n';
              displayMessage += 'Directions Manager loaded';
          }
          directionsManager.resetDirections();
          directionsErrorEventObj = Microsoft.Maps.Events.addHandler(directionsManager, 'directionsError', function(arg) { alert("no result"); });
          directionsUpdatedEventObj = Microsoft.Maps.Events.addHandler(directionsManager, 'directionsUpdated', function() { });
      }
      
      function createDrivingRoute()
      {
        if (!directionsManager) { createDirectionsManager(); }
        directionsManager.resetDirections();
        // Set Route Mode to driving 
        directionsManager.setRequestOptions({ routeMode: Microsoft.Maps.Directions.RouteMode.driving });
        var seattleWaypoint = new Microsoft.Maps.Directions.Waypoint({location: new Microsoft.Maps.Location(u_lat, u_lng)});
        directionsManager.addWaypoint(seattleWaypoint);
        var tacomaWaypoint = new Microsoft.Maps.Directions.Waypoint({location: new Microsoft.Maps.Location(lat, lng) });
        directionsManager.addWaypoint(tacomaWaypoint);
        // Set the element in which the itinerary will be rendered
        directionsManager.setRenderOptions({ itineraryContainer: document.getElementById('directionsItinerary') });
        directionsManager.calculateDirections();
      }

      function createDirectionsDriving() {
        if (!directionsManager)
        {
          Microsoft.Maps.loadModule('Microsoft.Maps.Directions', { callback: createDrivingRoute });
        }
        else
        {
          createDrivingRoute();
        }
       }
	   
	   
	function createTransitRoute()
	{
        if (!directionsManager) { createDirectionsManager(); }
        directionsManager.resetDirections();
        directionsManager.setRequestOptions({ routeMode: Microsoft.Maps.Directions.RouteMode.transit });
        var seattleWaypoint = new Microsoft.Maps.Directions.Waypoint({ location: new Microsoft.Maps.Location(u_lat, u_lng) });
        directionsManager.addWaypoint(seattleWaypoint);
        var bellevueWaypoint = new Microsoft.Maps.Directions.Waypoint({ location: new Microsoft.Maps.Location(lat, lng) });
        directionsManager.addWaypoint(bellevueWaypoint);
        // Set the element in which the itinerary will be rendered
        directionsManager.setRenderOptions({ itineraryContainer: document.getElementById('directionsItinerary') });
        directionsManager.calculateDirections();
      }

	
 	function createDirectionsTransit()
      {
        if (!directionsManager)
        {
          Microsoft.Maps.loadModule('Microsoft.Maps.Directions', { callback: createTransitRoute });
        }
        else
        {
          createTransitRoute();
        }
      }
	   
	   
	   
      function createWalkingRoute()
      {
        if (!directionsManager) { createDirectionsManager(); }
        directionsManager.resetDirections();
        // Set Route Mode to walking 
        directionsManager.setRequestOptions({ routeMode: Microsoft.Maps.Directions.RouteMode.walking });
        var seattleWaypoint = new Microsoft.Maps.Directions.Waypoint({ location: new Microsoft.Maps.Location(u_lat, u_lng)});
        directionsManager.addWaypoint(seattleWaypoint);
        var redmondWaypoint = new Microsoft.Maps.Directions.Waypoint({ location: new Microsoft.Maps.Location(lat, lng) });
        directionsManager.addWaypoint(redmondWaypoint);
        // Set the element in which the itinerary will be rendered
        directionsManager.setRenderOptions({ itineraryContainer: document.getElementById('directionsItinerary') });
        directionsManager.calculateDirections();
      }

      function createDirectionsWalking()
      {
        if (!directionsManager)
        {
          Microsoft.Maps.loadModule('Microsoft.Maps.Directions', { callback: createWalkingRoute });
        }
        else
        {
          createWalkingRoute();
        }
      }
	   
  </script>
  </head>
  <body onLoad="getMap();" style="padding:0; margin:0;">
    <div id='myMap' style="position:relative; width:900px; height:650px;"></div>

    <div style="position:absolute;bottom:0;left:0;background-image:url(<%= path2 %>/resources/MapCode/oblank.png)">
        <input type="image" src="<%= path2 %>/resources/MapCode/ico_walk.png" value="Walking" onClick="createDirectionsWalking();" />
        <input type="image" src="<%= path2 %>/resources/MapCode/ico_driv.png" value="Driving" onClick="createDirectionsDriving();" />
        <input type="image" src="<%= path2 %>/resources/MapCode/ico_tran.png" value="Transit" onClick="createDirectionsTransit();" />
    </div>
    <div style="position:absolute; bottom:0;right:0;background-image:url(<%= path2 %>/resources/MapCode/oblank.png)">
        <input width=30 type="image" src="<%= path2 %>/resources/MapCode/ico_food.png" value="food" onClick="LoadSearchModule('food');" />
        <input width=30 type="image" src="<%= path2 %>/resources/MapCode/ico_hotel.png" value="hotel" onClick="LoadSearchModule('hotel');" />
        <input width=30 type="image" src="<%= path2 %>/resources/MapCode/ico_subway.png" value="subway" onClick="LoadSearchModule('subway');" />
        <input width=30 type="image" src="<%= path2 %>/resources/MapCode/ico_bank.png" value="bank" onClick="LoadSearchModule('bank');" />
        <input width=30 type="image" src="<%= path2 %>/resources/MapCode/ico_hospital.png" value="hospital" onClick="LoadSearchModule('hospital');" />
        <input width=30 type="image" src="<%= path2 %>/resources/MapCode/ico_gas.png" value="gas" onClick="LoadSearchModule('gas');" />
        <input width=30 type="image" src="<%= path2 %>/resources/MapCode/ico_coffee.png" value="coffee" onClick="LoadSearchModule('coffee');" />
        <input width=30 type="image" src="<%= path2 %>/resources/MapCode/ico_cinema.png" value="cinema" onClick="LoadSearchModule('cinema');" />
        <input width=30 type="image" src="<%= path2 %>/resources/MapCode/ico_shop.png" value="shop" onClick="LoadSearchModule('shop');" />
    </div>
    <div id="directionsItinerary" style="position:absolute; top:0; right:0; width:200px; height:650px;"></div>
  </body>