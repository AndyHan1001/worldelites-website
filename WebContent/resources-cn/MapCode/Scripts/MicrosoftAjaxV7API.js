//----------------------------------------------------------
// Copyright (C) Microsoft Corporation. All rights reserved.
// owner: hegoya, v-sapand
// Discription : All API's for V7 mapcontrol
//----------------------------------------------------------
// MicrosoftAjaxV7API.js

var map = null;
var credentails = null;
var directionsManager = null;
var ua = navigator.userAgent
//Global hash/array for script debugging purposes
var globalCache = [];
var virtualPath = '';
var sdsQueryKey;
var sdsEnvironmentName;

function GetCode(func)
{
	var s = func.toString();
	var start = s.indexOf('{') + 1;
	var end = s.lastIndexOf('}');
	return s.substring(start, end).trim();
}

function ShowJSCode(code) {
    //document.getElementById("javascriptcode").value = "try{\r\n" + code + "\r\n}\r\ncatch(err){\r\n\talert( 'Error Message:' + err.message);\r\n}";
    var element = document.getElementById("javascriptcode");
    if (element) {
    element.value = code;
    }
}

function ShowBuildNumber() {
    if (typeof(Microsoft) != 'undefined')
    {
        document.getElementById("buildnumber").innerHTML = "<font color='green'> V7 Build: " + Microsoft.Maps.Map.getVersion() + "</br> Source: http://dev.virtualearth.net </font>";
    }
    else
    {
        document.getElementById("buildnumber").innerHTML = "<font color='red'> V7 Build: " + " Unable to load mapcontrol" + "</font>" ;
    }
}

function RunCode() {

    // clearing directions itienary
    document.getElementById("directionsItinerary").innerHTML = "";
    // hide the html code div if it is visible
    HideCode();
    var script = document.getElementById("javascriptcode").value; 
    
    if (script.indexOf(".Map(document.getElementById('SDKmap')") !=-1)
        script = 'DisposeMap();' + script;
    else if (map == null) {
        displayAlert('Unable to perform action, no active map found'); return;
    }
        

    script = "displayAlert('');" + script;
    
    script = "try{\r\n" + script + "\r\n}\r\ncatch(err){\r\n\tdisplayAlert( 'Error Message:' + err.message);\r\n}";
    
    var key = "credentials: 'Your Bing Maps Key'";

    if (script.indexOf(key) > -1) {

        // fetch the keys from the server
        GetCredentails();

        // fetch the SDS query key from the server
        GetSDSQueryKey();

        if (credentails)
        {
            // update the keys placeholder with actual keys
            script = script.replace(key, credentails);
        }
        else
        {
            // in case the credentials are not fetched from server display alert 
            script = script + "displayAlert('Unable to get the key');";
        }
    }
    
    try
    {
        with(window)
        {
            window.eval(script);
        }
    }
    catch(er)
    {
       displayAlert( 'Error Message:' + er.message); 
    }
}

function GetCredentails()
{
    if (credentails == null)
    {
        var xmlhttp = GetXmlHttp();
        xmlhttp.open("GET", virtualPath + "/ISDK/GetCredentails", false);
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4) {
                credentails = "credentials: '" + xmlhttp.responseText + "'";
            }
        }
        xmlhttp.send(null);
        if (xmlhttp.responseText) {
            credentails = "credentials: '" + xmlhttp.responseText + "'";
        }
    }
}

function setUpLoadMap(mapControlUrl, market) {
    
    var retVal = "function createMap() \n" +
        "{ \n" +
            "map = new Microsoft.Maps.Map(document.getElementById(\"SDKmap\"), {credentials: 'Your Bing Maps Key'}); \n" +
        "} \n" +
        "var mapRequest = '" + mapControlUrl + "&mkt=" + market + "&onscriptload=createMap'; \n" +
        "var mapscript = document.createElement('script'); \n" +
        "mapscript.type = 'text/javascript'; \n" +
        "mapscript.src = mapRequest; \n" +
        "document.body.appendChild(mapscript); \n";
    return retVal;
}

function GetSDSQueryKey() {
    if (sdsQueryKey == null) {
        var xmlhttp = GetXmlHttp();
        xmlhttp.open("GET", virtualPath + "/ISDK/GetSDSQueryKey", false);
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4) {
                sdsQueryKey = xmlhttp.responseText;
            }
        }
        xmlhttp.send(null);
        if (xmlhttp.responseText) {
            sdsQueryKey = xmlhttp.responseText;
        }
    }
}

function GetSDSEnvironmentName() {
    if (sdsEnvironmentName == null) {
        var xmlhttp = GetXmlHttp();
        xmlhttp.open("GET", virtualPath + "/ISDK/GetSDSEnvName", false);
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4) {
                sdsEnvironmentName = xmlhttp.responseText;
            }
        }
        xmlhttp.send(null);
        if (xmlhttp.responseText) {
            sdsEnvironmentName = xmlhttp.responseText;
        }
    }
}

function ReplaceGlobals(code) {
    GetSDSEnvironmentName();
    if (code.indexOf('sdsEnvironmentName') > -1) {
        code = code.replace('sdsEnvironmentName', sdsEnvironmentName);
    }
    return code;
}

var message = "loaded:";
function OnModuleDownload(msg) {
    message = message + ',' + msg;
    window.status = message;
}


function SearchServiceCallback(result)
{
    var output = document.getElementById("SDKalertmessage");
    if (output)
    {
        while (output.hasChildNodes()) {
            output.removeChild(output.lastChild); 
        }   
    }
    var resultsHeader = document.createElement("h5");
    output.appendChild(resultsHeader);
    ClearMap();
    if (result &&
    result.resourceSets &&
    result.resourceSets.length > 0 &&
    result.resourceSets[0].resources &&
    result.resourceSets[0].resources.length > 0) 
    {
        resultsHeader.innerHTML = "Bing Maps REST Search API  <br/>  Found location " + result.resourceSets[0].resources[0].name;
        var bbox = result.resourceSets[0].resources[0].bbox;
        var viewBoundaries = Microsoft.Maps.LocationRect.fromLocations(new Microsoft.Maps.Location(bbox[0], bbox[1]), new Microsoft.Maps.Location(bbox[2], bbox[3]));
        map.setView({ bounds: viewBoundaries});
        var location = new Microsoft.Maps.Location(result.resourceSets[0].resources[0].point.coordinates[0], result.resourceSets[0].resources[0].point.coordinates[1]);
        var pushpin = new Microsoft.Maps.Pushpin(location);
        map.entities.push(pushpin);
    }
    else
    {
        if (typeof (response) == 'undefined' || response == null)
        {
            alert("Invalid credentials or no response");
        }
        else 
        {
            if (typeof (response) != 'undefined' && response && result && result.errorDetails)
            {
                resultsHeader.innerHTML = "Message :"  + response.errorDetails[0];
            }
                alert("No results for the query");
            
        }
    }
} 

function CallRestService(request) 
{
    var script = document.createElement("script");
    script.setAttribute("type", "text/javascript");
    script.setAttribute("src", request);
    document.body.appendChild(script);
}

function ClearMap()
{
    for(var i=map.entities.getLength()-1;i>=0;i--) 
    {
        var entity = map.entities.get(i);
        if (entity instanceof Microsoft.Maps.Polyline || entity instanceof Microsoft.Maps.Polygon || entity instanceof Microsoft.Maps.Pushpin) {
            map.entities.removeAt(i);
        }
    }
}


function RouteCallback(result)
{ 
                
    var output = document.getElementById("SDKalertmessage");
    
    if (output)
    {
        while (output.hasChildNodes()) {
            output.removeChild(output.lastChild); 
        }   
        var resultsHeader = document.createElement("h5");
        var resultsList = document.createElement("ol");
        output.appendChild(resultsHeader);
        output.appendChild(resultsList);
    }
    ClearMap();

    if (result && result.resourceSets && result.resourceSets.length > 0 && result.resourceSets[0].resources && result.resourceSets[0].resources.length > 0) 
    {
    // alert(result.resourceSets[0].resources[0].routeLegs[0].endLocation.name);
    resultsHeader.innerHTML = "Bing Maps REST Route API  <br/>  Route from " + result.resourceSets[0].resources[0].routeLegs[0].startLocation.name + " to " + result.resourceSets[0].resources[0].routeLegs[0].endLocation.name;
    var resultsListItem = null;
                   
    for (var i = 0; i < result.resourceSets[0].resources[0].routeLegs[0].itineraryItems.length; ++i)
    {
        resultsListItem = document.createElement("li");
        resultsList.appendChild(resultsListItem);
        resultStr = result.resourceSets[0].resources[0].routeLegs[0].itineraryItems[i].instruction.text;
        resultsListItem.innerHTML = resultStr;
    }
    var bbox = result.resourceSets[0].resources[0].bbox; 
    var viewBoundaries = Microsoft.Maps.LocationRect.fromLocations(new Microsoft.Maps.Location(bbox[0], bbox[1]), new Microsoft.Maps.Location(bbox[2], bbox[3]));
    map.setView({ bounds: viewBoundaries}); 
    var routeline = result.resourceSets[0].resources[0].routePath.line; var routepoints = new Array(); 
    for (var i = 0; i < routeline.coordinates.length; i++) 
    { 
        routepoints[i]=new Microsoft.Maps.Location(routeline.coordinates[i][0], routeline.coordinates[i][1]);
    } 
    var routeshape = new Microsoft.Maps.Polyline(routepoints, {strokeColor:new Microsoft.Maps.Color(200,0,0,200)}); 

    var startPushpinOptions = {icon: virtualPath + '/Content/greenpushpin.png', width: 32, height: 32, anchor: new Microsoft.Maps.Point(1, 30) }; 
    var startPin= new Microsoft.Maps.Pushpin(new Microsoft.Maps.Location(routeline.coordinates[0][0], routeline.coordinates[0][1]), startPushpinOptions); 

    var endPushpinOptions = {icon: virtualPath + '/Content/redpushpin.png', width: 32, height: 32, anchor: new Microsoft.Maps.Point(1, 30)}; 
    var endPin= new Microsoft.Maps.Pushpin(new Microsoft.Maps.Location(routeline.coordinates[routeline.coordinates.length-1][0], routeline.coordinates[routeline.coordinates.length-1][1]), endPushpinOptions); 
    map.entities.push(startPin); 
    map.entities.push(endPin); 
    map.entities.push(routeshape); 
}

else
{
    if (typeof(result.errorDetails) != 'undefined')
    {
        resultsHeader.innerHTML = result.errorDetails[0];
    }
        alert("No Route found");
    }
}
            
function SearchCompleted(response)
{
    var output = document.getElementById("ve_results");
    while (output.hasChildNodes()) {
        output.removeChild(output.lastChild); 
    }   
    var resultsHeader = document.createElement("h5");
    var resultsList = document.createElement("ol");
    output.appendChild(resultsHeader);
    output.appendChild(resultsList);
    ClearMap();

    if (typeof(response.SearchResponse.Phonebook) != 'undefined' && typeof(response.SearchResponse.Phonebook) != null && typeof(response.SearchResponse.Phonebook.Results) != 'undefined')
    {
        var results = response.SearchResponse.Phonebook.Results;
                
        // Display the results header.
        resultsHeader.innerHTML = "Bing API Version "
        + response.SearchResponse.Version
        + "<br />Phonebook results for "
        + response.SearchResponse.Query.SearchTerms
        + "<br />Displaying "
        + (response.SearchResponse.Phonebook.Offset + 1)
        + " to "
        + (response.SearchResponse.Phonebook.Offset + results.length)
        + " of "
        + response.SearchResponse.Phonebook.Total
        + " results<br />";
        
        // Display the Phonebook results.
        var resultsListItem = null;
        var resultStr = "";
        var locations = [];
        var location;
        var pushpin;
        for (var i = 0; i < results.length; ++i)
        {
            resultsListItem = document.createElement("li");
            resultsList.appendChild(resultsListItem);
            resultStr = results[i].Business
            + "<br />"
            + results[i].Address
            + "<br />"
            + results[i].City
            + ", "
            + results[i].StateOrProvince
            + "<br />"
            + results[i].PhoneNumber
            + "<br />";
            
        // Replace highlighting characters with strong tags.
        resultsListItem.innerHTML = resultStr;

        location = new Microsoft.Maps.Location(results[i].Latitude, results[i].Longitude);
        pushpin = new Microsoft.Maps.Pushpin(location, {text: (i+1).toString()});
        map.entities.push(pushpin);
        locations.push(location);
        }
        var bbox = Microsoft.Maps.LocationRect.fromLocations(locations);
        map.setView({bounds:bbox});
    }
    else
    {
        if (response.errorDetails)
        {
            resultsHeader.innerHTML = "Message :"  + response.errorDetails[0];
        }
            alert("No results for the query");
    }
}


function startdragDetails(e) {

    displayAlert("Event Info - start drag <br/>" + "Start Latitude/Longitude: " + e.entity.getLocation() ); 
}

function ondragDetails(e) {

    displayAlert("Event Info - drag <br/>" + "Current Latitude/Longitude: " + e.entity.getLocation() ); 

}

function enddragDetails(e) {
    displayAlert("Event Info - end drag <br/>" + "Drop Latitude/Longitude: " + e.entity.getLocation() ); 
}

function ToggleDiv(imgId, divId)
{
    var e = document.getElementById(divId);
    if(e.style.display == 'block')
    {
        document.getElementById(imgId).src= virtualPath+ '/Content/expand.gif';
        document.getElementById(imgId).alt = "Show";
        e.style.display = 'none';
    }
    else
    {
        document.getElementById(imgId).src = virtualPath + '/Content/collapse.gif';
        document.getElementById(imgId).alt = "Hide";
        e.style.display = 'block';
    }
}

function DisposeMap()
{
    if (typeof (map) != 'undefined' && map != null) 
    { 
        map.dispose(); 
    } 
}

var loadAllModules0 = "map.LoadModules('layers',OnModuleDownload,' 1 layers');\n		    map.LoadModules('traffic',OnModuleDownload,'2 traffic');map.LoadModules('find',OnModuleDownload,'3 find');map.LoadModules('routing',OnModuleDownload,'4 routing');map.LoadModules('3d',OnModuleDownload,'5 3d');map.LoadModules('controls',OnModuleDownload,'6 navcontrol');map.LoadModules('birdseye',OnModuleDownload,'7 birdseye');map.LoadModules('tiles',OnModuleDownload,'8 tiles');";
var loadAllModules = "map.LoadModules('layers,traffic,find,routing,3d,controls,birdseye,tiles',OnModuleDownload,'all modules are loaded');";
var constrcode1 = "map = new Microsoft.Maps.Map(document.getElementById('SDKmap'), null); "
var constrcode2 = " \nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key'});"
var loadMap1 = setUpLoadMap(window.mapControlUrl, "ngt");
var loadMap2 = setUpLoadMap(window.mapControlUrl, "ru-ru,fr-fr");
var loadMap3 = setUpLoadMap(window.mapControlUrl, "fr-fr,ngt");
var loadMap4 = setUpLoadMap(window.mapControlUrl, "ngt,fr-fr");


var constrcode3 = "\nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', enableClickableLogo: false});"
var constrcode4 = "\nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', enableSearchLogo: false});"
var constrcode5 = "\nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', width: 650, height: 450});"
var constrcode6 = "\nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', showDashboard: false});"
var constrcode7 = " \nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key',showMapTypeSelector:false});"
var constrcode8 = "\nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', showScalebar: false});"
var constrcode9 = "\nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', showCopyright: false});"

var constrcode10 = "\nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', animate: false});"
var constrcode11 = "\nvar boundingBox = Microsoft.Maps.LocationRect.fromLocations(new Microsoft.Maps.Location(47.618594, -122.347618), new Microsoft.Maps.Location(47.620700, -122.347584), new Microsoft.Maps.Location(47.622052, -122.345869)); \nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', bounds: boundingBox});" ;
var constrcode12 = "\nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', center: new Microsoft.Maps.Location(47.609771, -122.2321543125), zoom: 8});"
var constrcode13 = "\nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', labelOverlay: Microsoft.Maps.LabelOverlay.hidden});"
var constrcode14 = "\nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', zoom: 8, center: new Microsoft.Maps.Location(47.609771, -122.2321543125)});";
var constrcode15 = " \nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', center: new Microsoft.Maps.Location(47.59501083000102, -122.33158886957427), zoom: 18, mapTypeId: Microsoft.Maps.MapTypeId.aerial});"
var constrcode16 = " \nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', center: new Microsoft.Maps.Location(47.6215, -122.349329), mapTypeId: Microsoft.Maps.MapTypeId.birdseye, zoom: 18});"

var constrcode17 = " \nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key',useInertia: false});"
var constrcode18 = "\nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', inertiaIntensity: 0.85});"
var constrcode19 = "\nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', tileBuffer: 3});"
var constrcode20 = "\nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', backgroundColor : new Microsoft.Maps.Color(Math.round(255*Math.random()),Math.round(255*Math.random()),Math.round(255*Math.random()),Math.round(255*Math.random())) });"
var constrcode21 = "\nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', disablePanning: true });"
var constrcode22 = "\nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', disableZooming: true });"
var constrcode23 = "\nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', showBreadcrumb: true });"
var constrcode24 = "\nmap = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', disableBirdseye: true });"

var getimageryid = "var imagery=map.getImageryId();\r\ndisplayAlert('Current Map Style: ' + imagery);";
var getheading = "var heading=map.getHeading();\r\ndisplayAlert('Map Heading: ' + heading);"
var getzoomlevelcode = "var zoom=map.getZoom();\r\ndisplayAlert('Current zoom level: ' + zoom);";
var getcenter = "var latlon = map.getCenter();\r\ndisplayAlert('Lat/Long: ' + latlon.latitude +'/' + latlon.longitude);";
var getdiamension = "var height = map.getHeight();  \r\nvar width = map.getWidth(); \r\ndisplayAlert('Map height/Width: ' + height+'/'+width);";
var getviewport = "var x = map.getViewportX(); \r\n var y = map.getViewportY(); \r\ndisplayAlert('Map Viewport X/Y: ' + x + '/' + y);";
var getmode = "var m = map.GetMapMode(); \r\n displayAlert('Current Map mode : ' + m);" ;
var getmeterperpixel = "var meterperpixel=map.getMetersPerPixel(); \r\ndisplayAlert('Map MetersPerPixel: ' + meterperpixel);";
var getmapbound = "var bounds=map.getBounds(); \r\ndisplayAlert('Map bounds: ' +  bounds);";
var locationtopixel = "var locationtopixel=map.tryLocationToPixel(new Microsoft.Maps.Location(45, -120)); \r\ndisplayAlert('Map Location to Pixel : ' + locationtopixel);";
var ismercator = "var mercator=map.isMercator(); \r\ndisplayAlert('Map Mercator Mode: ' +  mercator);";
var isrotationenabled = "var rotationenabled=map.isRotationEnabled(); \r\ndisplayAlert('Map Rotation Enabled: ' + rotationenabled);"
var getzoomrange = "var zoomrange=map.getZoomRange(); \r\ndisplayAlert('Zoom Range For current Map type: ' + zoomrange.min + '-' + zoomrange.max);"

// not covered in the iSDK
var getTargetHeading = "map.setView( { center: new Microsoft.Maps.Location(47.6, -122.33), zoom: 18 });\r\nvar z=map.getTargetHeading();Display('Target Heading : ' + z);";
var tryPixelToLocation = "var z=map.tryPixelToLocation(new Microsoft.Maps.Point(406251292, 687.9142237));Display('Pixel to Location : '+ z);";
var getTargetCenter = "map.setView( { center: new Microsoft.Maps.Location(47.6, -122.33), zoom: 12 });\r\nvar latlon = map.getTargetCenter();\r\Display('Lat/Long : ' + latlon.latitude +'/' + latlon.longitude);";
var getTargetBounds = "map.setView( { center: new Microsoft.Maps.Location(47.6, -122.33), zoom: 18 });\r\nvar z=map.getTargetBounds();Display('Target Bounds : ' + z);";
var getTargetMetersPerPixel = "map.setView( { center: new Microsoft.Maps.Location(47.6, -122.33), zoom: 18 });\r\nvar z=map.getTargetMetersPerPixel();Display('Target MetersPerPixel : ' + z);";	
var getmode = "var m = map.GetMapMode(); Display('Current Map mode : ' + m);";

var setzoomcenter = "map.setView({zoom: 12, center: new Microsoft.Maps.Location(47.609771, -122.2321543125)});";
var setbounds = "map.setView({ bounds: Microsoft.Maps.LocationRect.fromLocations \r\n (new Microsoft.Maps.Location(47.618594, -122.347618),\r\n new Microsoft.Maps.Location(47.620700, -122.347584), \r\n new Microsoft.Maps.Location(47.622052, -122.345869))});";
var setanimation = "map.setView({center: new Microsoft.Maps.Location(47, -122), zoom: 14, animate: false });";
var setmapstyle = "//Microsoft.Maps.MapTypeId.auto: automatic, Microsoft.Maps.MapTypeId.road: road, Microsoft.Maps.MapTypeId.aerial: aerial, Microsoft.Maps.MapTypeId.birdseye: birdeye  \r\nmap.setView({mapTypeId : Microsoft.Maps.MapTypeId.road});";
var setnomapstyle = "map.setView({mapTypeId: Microsoft.Maps.MapTypeId.mercator});";

var addpushpincode1 = "map.entities.clear(); \nvar pushpin= new Microsoft.Maps.Pushpin(map.getCenter(), null); \r\nmap.entities.push(pushpin);";
var addpushpincode2 = "map.entities.clear(); \nvar pushpinOptions = {icon: virtualPath + '/Content/SpaceNeedle.jpg', width: 30, height: 50}; \r\nvar pushpin= new Microsoft.Maps.Pushpin(map.getCenter(), pushpinOptions);\r\nmap.entities.push(pushpin);";
var addpushpincode3 = "map.entities.clear(); \nvar pushpinOptions = {icon: virtualPath + '/Content/poi_custom.png', draggable: true}; \r\nvar pushpin= new Microsoft.Maps.Pushpin(map.getCenter(), pushpinOptions); \r\nmap.entities.push(pushpin); displayAlert('Pushpin is draggable, try it!')";
var addpushpincode4 = "map.entities.clear(); \nvar offset = new Microsoft.Maps.Point(0, 5); \r\nvar pushpinOptions = {icon: virtualPath + '/Content/poi_custom.png', text : '1', visible: true, textOffset: offset}; \r\nvar pushpin= new Microsoft.Maps.Pushpin(new Microsoft.Maps.Location(47.6, -122.33), pushpinOptions); \r\nmap.setView( {center: new Microsoft.Maps.Location(47.6, -122.33), zoom: 10}); \r\nmap.entities.push(pushpin); ";
var addpushpincode5 = "map.entities.clear(); \nvar limit = 50; \nvar bounds=map.getBounds(); \nlatlon = bounds.getNorthwest(); \nvar lat = latlon.latitude - bounds.height/4; \nvar lon = latlon.longitude + bounds.width/4; \nvar latDiff =  bounds.height/2  ; \nvar lonDiff =  bounds.width/2; \r\nvar pushpinOptions = { icon: virtualPath + '/Content/poi_custom.png'}; \r\nfor (var i = 0; i < limit; i++) {  \r\nvar pushpin = new Microsoft.Maps.Pushpin(new Microsoft.Maps.Location(lat - (latDiff * Math.random()), lon + (lonDiff * Math.random())), pushpinOptions); \r\nmap.entities.push(pushpin); }";
var addpushpincode6 = "\nfor(var i=map.entities.getLength()-1;i>=0;i--) {\r\nvar pushpin= map.entities.get(i); \r\nif (pushpin instanceof Microsoft.Maps.Pushpin) { \r\nmap.entities.removeAt(i);  \r\n} ;\r\n } \r\ndisplayAlert('Pushpins removed')";
var addpushpincode7 = "map.entities.clear(); \nvar pushpin= new Microsoft.Maps.Pushpin(map.getCenter(), null); \r\nmap.entities.push(pushpin); \r\npushpin.setLocation(new Microsoft.Maps.Location(47.5, -122.33)); \ndisplayAlert('Pushpin Location Updated to ' + pushpin.getLocation() + '. Pan map to location, if pushpin is not visible');";
var addpushpincode8 = "map.entities.clear(); \nvar pushpinOptions = {icon: virtualPath + '/Content/poi_custom.png'}; \r\nvar pushpin= new Microsoft.Maps.Pushpin(map.getCenter(), pushpinOptions); \r\nmap.entities.push(pushpin); displayAlert('Hiding pushpin in 1 sec...');  \n//settimeout function is used to show visual effect \nsetTimeout('var pushpin= map.entities.get(map.entities.getLength()-1); pushpin.setOptions({visible: false}); displayAlert(\"Pushpin hidden\")', 1000)"; 

var addpushpincode9 = "map.entities.clear(); \nvar pushpin= new Microsoft.Maps.Pushpin(map.getCenter(), null); \npushpinClick= Microsoft.Maps.Events.addHandler(pushpin, 'click', displayEventInfo);  \r\nmap.entities.push(pushpin); \r\ndisplayAlert('Click on newly added pushpin to raise event');";
var addpushpincode10 = "map.entities.clear(); \nvar pushpin= new Microsoft.Maps.Pushpin(map.getCenter(), null); \npushpinOver= Microsoft.Maps.Events.addHandler(pushpin, 'mouseover', displayEventInfo);  \r\nmap.entities.push(pushpin); \r\ndisplayAlert('mouseover on newly added pushpin to raise event');";
var addpushpincode11 = "map.entities.clear(); \nvar pushpinOptions = {icon: virtualPath + '/Content/poi_custom.png', draggable:true}; \r\nvar pushpin= new Microsoft.Maps.Pushpin(map.getCenter(), pushpinOptions); \npushpindragstart= Microsoft.Maps.Events.addHandler(pushpin, 'dragstart', startdragDetails);  \r\nmap.entities.push(pushpin); \r\ndisplayAlert('start dragging newly added pushpin to raise event');";
var addpushpincode12 = "map.entities.clear(); \nvar pushpinOptions = {draggable:true}; \r\nvar pushpin= new Microsoft.Maps.Pushpin(map.getCenter(), pushpinOptions); \npushpindrag= Microsoft.Maps.Events.addHandler(pushpin, 'drag', ondragDetails);  \r\nmap.entities.push(pushpin); \r\ndisplayAlert('drag newly added pushpin to raise event');";
var addpushpincode13 = "map.entities.clear(); \nvar pushpinOptions = {icon: virtualPath + '/Content/poi_custom.png', draggable:true}; \r\nvar pushpin= new Microsoft.Maps.Pushpin(map.getCenter(), pushpinOptions); \npushpindragend= Microsoft.Maps.Events.addHandler(pushpin, 'dragend', enddragDetails);  \r\nmap.entities.push(pushpin); \r\ndisplayAlert('stop dragging newly added pushpin to raise event');";
var addpushpincode14 = "if (pushpindragstart) Microsoft.Maps.Events.removeHandler(pushpindragstart); \nif (pushpindrag) Microsoft.Maps.Events.removeHandler(pushpindrag); \r\ndisplayAlert('event detached');";
var addpushpincode15 = "map.entities.clear(); \nvar pushpinOptions = {width: null, height: null, htmlContent: \"<div style='font-size:12px;font-weight:bold;border:solid 2px;background-color:LightBlue;width:100px;'>Custom Pushpin</div>\"}; \r\nvar pushpin= new Microsoft.Maps.Pushpin(map.getCenter(), pushpinOptions);\r\nmap.entities.push(pushpin);";


var polylinecode1 = "map.entities.clear(); \r\nlatlon = map.getCenter(); \r\nvar polyline = new Microsoft.Maps.Polyline([new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude-0.1), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude-0.1), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude+0.1), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude+0.1)], null); \r\nmap.setView( {zoom:8}); \r\nmap.entities.push(polyline);";
var polylinecode2 = "map.entities.clear(); \r\nlatlon = map.getCenter(); \nvar thickness = Math.round(5*Math.random()+1); \r\nvar options = {strokeColor: new Microsoft.Maps.Color(Math.round(255*Math.random()),Math.round(255*Math.random()),Math.round(255*Math.random()),Math.round(255*Math.random())), strokeThickness: parseInt(thickness) }; \r\nvar polyline = new Microsoft.Maps.Polyline([new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude-0.1), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude-0.1), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude+0.1), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude+0.1)], options); \r\nmap.setView( {zoom:10}); \r\nmap.entities.push(polyline);";
var polylinecode3 = "map.entities.clear(); \r\nlatlon = map.getCenter(); \r\nvar polyline = new Microsoft.Maps.Polyline([new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude-0.1), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude-0.1), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude+0.1), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude+0.1)], null); \r\nmap.setView( {zoom:10}); \r\nmap.entities.push(polyline); \ndisplayAlert('Changing location in 1 second...'); \nlatlon.longitude = latlon.longitude + .05; \n//settimeout function is used to show visual effect \nsetTimeout('var polyline= map.entities.get(map.entities.getLength()-1); polyline.setLocations([new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude+0.1), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude+0.1), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude-0.1), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude-0.1)]); displayAlert(\"Location Updated\")', 1000)"; 
var polylinecode4 = "var polyline= map.entities.get(map.entities.getLength()-1);  \nvar locations = polyline.getLocations(); \nvar thickness = polyline.getStrokeThickness(); \ndisplayAlert('Location: ' + locations.toString() + 'Thickness: ' + thickness); ";
var polylinecode5 = "var polyline= map.entities.get(map.entities.getLength()-1); \n//set the visible property to true to view polyline  \npolyline.setOptions({visible: false}); ";
var polylinecode6 = "for(var i=map.entities.getLength()-1;i>=0;i--) {\r\n\tvar polyline= map.entities.get(i); \r\n\tif (polyline instanceof Microsoft.Maps.Polyline) { \r\n\tmap.entities.removeAt(i);  \r\n}\r\n } \ndisplayAlert('Polylines removed');";

var polygoncode1 = "map.entities.clear(); \r\nlatlon = map.getCenter(); \r\nvar polygon = new Microsoft.Maps.Polygon([new Microsoft.Maps.Location(latlon.latitude, latlon.longitude-0.15), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude-0.05), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude+0.05), new Microsoft.Maps.Location(latlon.latitude, latlon.longitude+0.15), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude+0.05), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude-0.05), new Microsoft.Maps.Location(latlon.latitude, latlon.longitude-0.15)], null);  \r\nmap.setView( {zoom:10}); \r\nmap.entities.push(polygon);";
var polygoncode2 = "map.entities.clear(); \nlatlon = map.getCenter(); \nvar thickness = Math.round(5*Math.random()+1); \r\nvar options = {fillColor: new Microsoft.Maps.Color(Math.round(255*Math.random()),Math.round(255*Math.random()),Math.round(255*Math.random()),Math.round(255*Math.random())), strokeColor: new Microsoft.Maps.Color(Math.round(255*Math.random()),Math.round(255*Math.random()),Math.round(255*Math.random()),Math.round(255*Math.random())), strokeThickness: parseInt(thickness) }; \r\nvar polygon = new Microsoft.Maps.Polygon([new Microsoft.Maps.Location(latlon.latitude, latlon.longitude-0.15), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude-0.05), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude+0.05), new Microsoft.Maps.Location(latlon.latitude, latlon.longitude+0.15), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude+0.05), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude-0.05), new Microsoft.Maps.Location(latlon.latitude, latlon.longitude-0.15)], options); \r\nmap.setView( {zoom:10}); \r\nmap.entities.push(polygon);";
var polygoncode3 = "map.entities.clear(); \nlatlon = map.getCenter(); \r\nvar polygon = new Microsoft.Maps.Polygon([new Microsoft.Maps.Location(latlon.latitude, latlon.longitude-0.15), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude-0.05), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude+0.05), new Microsoft.Maps.Location(latlon.latitude, latlon.longitude+0.15), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude+0.05), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude-0.05), new Microsoft.Maps.Location(latlon.latitude, latlon.longitude-0.15)], null); \r\nmap.setView( {zoom:10}); \r\nmap.entities.push(polygon); \ndisplayAlert('Changing location in 1 second...'); \nlatlon.longitude = latlon.longitude + .05; \n//settimeout function is used to show visual effect \nsetTimeout('var polygon= map.entities.get(map.entities.getLength()-1); polygon.setLocations([new Microsoft.Maps.Location(latlon.latitude, latlon.longitude-0.15), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude-0.05), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude+0.05), new Microsoft.Maps.Location(latlon.latitude, latlon.longitude+0.15), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude+0.05), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude-0.05), new Microsoft.Maps.Location(latlon.latitude, latlon.longitude-0.15)]); displayAlert(\"Location Updated\")', 1000)"
var polygoncode4 = "var polygon= map.entities.get(map.entities.getLength()-1);  \nvar locations = polygon.getLocations(); \nvar thickness = polygon.getStrokeThickness(); \ndisplayAlert('Location: ' + locations.toString() + 'Thickness: ' + thickness);";
var polygoncode5 = "var polygon= map.entities.get(map.entities.getLength()-1); \n//set the visible property to true to view polygon \npolygon.setOptions({visible: false}); ";
var polygoncode6 = "for(var i=map.entities.getLength()-1;i>=0;i--) {\r\n\tvar polygon= map.entities.get(i); \r\n\tif (polygon instanceof Microsoft.Maps.Polygon) { \r\n\tmap.entities.removeAt(i);  \r\n}\r\n } \ndisplayAlert('Polygons removed');";

var polygoncode8 = "map.entities.pop(); \r\nvar polygon = new Microsoft.Maps.Polygon([new Microsoft.Maps.Location(47.78891193391159 ,-122.6017714104164), new Microsoft.Maps.Location(47.28828350488604 ,  -122.5907850822914), new Microsoft.Maps.Location(47.29573511548321 , -121.6953993401039), new Microsoft.Maps.Location(47.78153009205382, -121.7008925041664), new Microsoft.Maps.Location(47.79260246172119 , -122.6017714104164), new Microsoft.Maps.Location(47.78891193391159 , -122.6017714104164)], null); \r\nmap.entities.push(polygon); Display('Changing location'); polygon.setLocations([new Microsoft.Maps.Location(47.78891193391159 ,-122.6017714104164), new Microsoft.Maps.Location(47.28828350488604 ,  -122.5907850822914), new Microsoft.Maps.Location(47.29573511548321 , -123.6953993401039), new Microsoft.Maps.Location(47.78153009205382, -123.7008925041664), new Microsoft.Maps.Location(47.79260246172119 , -122.6017714104164), new Microsoft.Maps.Location(47.78891193391159 , -122.6017714104164)]); alert('clearing polygon'); map.entities.pop(); ";

var addTileLayer1 = "map.entities.clear(); \nvar options = {uriConstructor: 'http://www.microsoft.com/maps/isdk/ajax/layers/lidar/{quadkey}.png', width: 256, height: 256};  \nvar tileSource = new Microsoft.Maps.TileSource(options); \nvar tilelayer= new Microsoft.Maps.TileLayer({ mercator: tileSource}); \nmap.entities.push(tilelayer);  \n//center map to show tile layer \n\rmap.setView( { center: new Microsoft.Maps.Location(48.03, -122.42), zoom: 11});";
var addTileLayer2 = "map.entities.clear(); \nvar options = {uriConstructor: 'http://www.microsoft.com/maps/isdk/ajax/layers/lidar/{quadkey}.png'};  \nvar tileSource = new Microsoft.Maps.TileSource(options); \nvar tilelayer= new Microsoft.Maps.TileLayer({ mercator: tileSource, opacity: 0.4, visible: true, zIndex: 1}); \nmap.setView( { center: new Microsoft.Maps.Location(48.03, -122.42), zoom: 13}); \nmap.entities.push(tilelayer); \ndisplayAlert('TileLayer added with opacity: ' + tilelayer.getOpacity());"
var addTileLayer3 = "for(var i=map.entities.getLength()-1;i>=0;i--) {\r\nvar tileLayer= map.entities.get(i); \r\nif (tileLayer instanceof Microsoft.Maps.TileLayer) { \r\nmap.entities.removeAt(i); \ndisplayAlert('TileLayer removed'); \r\n}\r\n }";
var addTileLayer4 = "map.entities.clear(); var options = {uriConstructor: 'http://www.microsoft.com/maps/isdk/ajax/layers/lidar/{quadkey}.png'}; \nmap.setView( { center: new Microsoft.Maps.Location(48.03, -122.42), zoom: 10});  \nvar tileSource = new Microsoft.Maps.TileSource(options); \nvar tilelayer= new Microsoft.Maps.TileLayer({ mercator: tileSource}); \nmap.entities.push(tilelayer); \nmap.setView({mapTypeId: 'm'}); \ndisplayAlert('Setting Tile layer options in 1 second...'); \n//settimeout function is used to show visual effect \nsetTimeout('var tilelayer= map.entities.get(map.entities.getLength()-1); tilelayer.setOptions({opacity: 0.3, zIndex: 1}); displayAlert(\"Opacity & zIndex set for tilelayer\")', 1000)";
var find = "var query= 'seattle, wa'; \nmap.getCredentials(function(credentials) {\nvar searchRequest = 'http://dev.virtualearth.net/REST/v1/Locations/' + query + '?output=json&jsonp=SearchServiceCallback&key=' + credentials;" +
    "\nvar mapscript = document.createElement('script'); \nmapscript.type = 'text/javascript'; \nmapscript.src = searchRequest; \ndocument.getElementById('SDKmap').appendChild(mapscript); \n});";
var route = "var start= 'Seattle, wa'; var end= 'Portland, OR'; \nmap.getCredentials(function(credentials) {\nvar routeRequest = 'http://dev.virtualearth.net/REST/v1/Routes?wp.0=' + start + '&wp.1=' + end + '&routePathOutput=Points&output=json&jsonp=RouteCallback&key=' + credentials;" +
      "\nvar mapscript = document.createElement('script'); \nmapscript.type = 'text/javascript'; \nmapscript.src = routeRequest; \ndocument.getElementById('SDKmap').appendChild(mapscript); \n});"; 

var disposecode1 = "if (typeof (map) != 'undefined' && map != null) \n{ \n\nmap.dispose(); \nmap = null; \n} \nelse \ndisplayAlert('map is not defined');";

var addtrafficlayer = "var tileSource = new Microsoft.Maps.TileSource({ uriConstructor: 'http://t0.tiles.virtualearth.net/tiles/dp/content?p=tf&a={quadkey}' });" +
    "\nvar tilelayer = new Microsoft.Maps.TileLayer({ mercator: tileSource, opacity: 0.7 }); \nmap.entities.push(tilelayer); \nmap.setView( {zoom: 8}); \ndisplayAlert('Traffic Layer added');";
var deletetrafficlayer = "for (var i = map.entities.getLength() - 1; i >= 0; i--) { \nvar layer = map.entities.get(i); \nif (layer instanceof Microsoft.Maps.TileLayer) {  \nmap.entities.removeAt(i); \n} \n}"

var DefaultInfobox = "map.entities.clear(); \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), null );    \r\n map.entities.push(defaultInfobox);";
var InfoBoxOptions = "map.entities.clear(); \r\n var infoboxOptions = {width :200, height :100, showCloseButton: true, zIndex: 0, offset:new Microsoft.Maps.Point(10,0), showPointer: true, title:'Infobox Title', description:'Infobox description' }; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), infoboxOptions );    \r\n map.entities.push(defaultInfobox);";
var InfoBoxHeightWidth = "map.entities.clear(); \r\n var infoboxOptions = {width :200, height :100}; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), infoboxOptions );    \r\n map.entities.push(defaultInfobox);";
var InfoBoxTitle = "map.entities.clear(); \r\n var infoboxOptions = {title:'Infobox Title', description:'Infobox description'}; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), infoboxOptions );    \r\n map.entities.push(defaultInfobox);";
var InfoboxPointer = "map.entities.clear(); \r\n var infoboxOptions = {showPointer:false}; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), infoboxOptions );    \r\n map.entities.push(defaultInfobox);";
var InfoboxCloseButton = "map.entities.clear(); \r\n var infoboxOptions = {showCloseButton: false}; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), infoboxOptions );    \r\n map.entities.push(defaultInfobox);";
var InfoboxOffset = "map.entities.clear(); \r\n var infoboxOptions = {offset:new Microsoft.Maps.Point(10,0) }; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), infoboxOptions );    \r\n map.entities.push(defaultInfobox);";
var InfoboxZindex = "map.entities.clear(); \r\n var infoboxOptions = {zIndex: 0}; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), infoboxOptions );    \r\n map.entities.push(defaultInfobox);";
var InfoboxTitleClickHandler = "map.entities.clear(); \r\n var infoboxOptions = {title:'Title has Handler',titleClickHandler:titleClick}; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), infoboxOptions );    \r\n map.entities.push(defaultInfobox); \r\n function titleClick() \r\n { \r\n displayAlert('Title Clicked');\r\n }";
var InfoboxActions = "map.entities.clear(); \r\n function handlerEvent1 () \r\n { \r\n displayAlert('Handler1');\r\n } \r\n function handlerEvent2 () \r\n  {  \r\n displayAlert('Handler2'); \r\n } \r\n function handlerEvent3 () \r\n{ \r\n displayAlert('Handler3'); \r\n}\r\n var infoboxOptions = {title:'Infobox Title', description:'Infobox description', actions:[{label: 'Handler1', eventHandler: handlerEvent1}, \r\n {label: 'Handler2', eventHandler: handlerEvent2}, \r\n {label: 'Handler3', eventHandler: handlerEvent3}]  }; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), infoboxOptions );    \r\n map.entities.push(defaultInfobox);";
var InfoboxGetOptions = "map.entities.clear(); \r\n var infoboxOptions = {width :200, height :100, showCloseButton: true, zIndex: 0, offset:new Microsoft.Maps.Point(10,0), showPointer: true, title:'Infobox Title', description:'Infobox description' }; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), infoboxOptions );    \r\n map.entities.push(defaultInfobox); \r\n var title=defaultInfobox.getTitle(); \r\n var loc=defaultInfobox.getLocation(); \r\n var height=defaultInfobox.getHeight(); \r\n var width=defaultInfobox.getWidth(); \r\n var isvisible=defaultInfobox.getVisible(); \r\n var desc=defaultInfobox.getDescription(); \r\n displayAlert('Title: ' + title + '<br>' + 'Discription: ' + desc + '<br>' + 'Width/Height: ' + width/height + '<br>' + 'Visible: ' + isvisible + '<br>' + 'Location: ' + loc + '<br>');";
var InfoboxHideShow = "map.entities.clear(); \r\n var infoboxOptions = {width :200, height :100, showCloseButton: true, zIndex: 0, offset:new Microsoft.Maps.Point(10,0), showPointer: true, title:'Infobox Title', description:'Infobox description' }; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), infoboxOptions );    \r\n map.entities.push(defaultInfobox);\r\ndisplayAlert('Hiding Infobox in 1 sec...'); \r\n//settimeout function is used to show visual effect \nsetTimeout('var defaultInfobox= map.entities.get(map.entities.getLength()-1); defaultInfobox.setOptions({visible:false}); displayAlert(\"InfoBox hidden\")', 1000)";   
var InfoboxGetActions = "map.entities.clear(); \r\n function handlerEvent1 () \r\n { \r\n displayAlert('Handler1');\r\n } \r\n function handlerEvent2 () \r\n  {  \r\n displayAlert('Handler2'); \r\n } \r\n function handlerEvent3 () \r\n{ \r\n displayAlert('Handler3'); \r\n}\r\n var infoboxOptions = {title:'Infobox Title', description:'Infobox description', actions:[{label: 'Handler1', eventHandler: handlerEvent1}, \r\n {label: 'Handler2', eventHandler: handlerEvent2}, \r\n {label: 'Handler3', eventHandler: handlerEvent3}]  }; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), infoboxOptions );    \r\n map.entities.push(defaultInfobox); \r\n var actions= defaultInfobox.getActions(); \r\n var actionStr=''; \r\n for(var cnt=0;cnt<actions.length;cnt++) \r\n{\r\nactionStr=actionStr + '<b> label-</b>' + actions[cnt].label + '<br><b>handler-</b>' + actions[cnt].eventHandler + '<br>' \r\n}\r\n displayAlert(actionStr) ";
var InfoboxGetHtmlContent = "map.entities.clear(); \r\n var infoboxOptions = {width :200, height :100, showCloseButton: true, zIndex: 0, offset:new Microsoft.Maps.Point(10,0), showPointer: true}; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), infoboxOptions );    \r\n map.entities.push(defaultInfobox);\r\n defaultInfobox.setHtmlContent('<div id=\"infoboxText\" style=\"background-color:White; border-style:solid;border-width:medium; border-color:DarkOrange; min-height:100px;width:240px;\"><b id=\"infoboxTitle\" style=\"position:absolute; top:10px; left:10px; width:220px;\">myTitle</b><a id=\"infoboxDescription\" style=\"position:absolute; top:30px; left:10px; width:220px;\">Description</a></div>'); \r\n var content= defaultInfobox.getHtmlContent(); \r\n displayAlert('Custom Infobox added'); ";
var InfoboxGetOffset = "map.entities.clear(); \r\n var infoboxOptions = {width :200, height :100, showCloseButton: true, zIndex: 0, offset:new Microsoft.Maps.Point(10,0), showPointer: true, title:'Infobox Title', description:'Infobox description' }; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), infoboxOptions );    \r\n map.entities.push(defaultInfobox); \r\n var offset= defaultInfobox.getOffset(); \r\n displayAlert(offset); ";
var InfoboxGetShowCloseButton = "map.entities.clear(); \r\n var infoboxOptions = {width :200, height :100, showCloseButton: true, zIndex: 0, offset:new Microsoft.Maps.Point(10,0), showPointer: true, title:'Infobox Title', description:'Infobox description' }; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), infoboxOptions );    \r\n map.entities.push(defaultInfobox); \r\n var showClose= defaultInfobox.getShowCloseButton(); \r\n displayAlert(showClose); ";
var InfoboxGetShowPointer = "map.entities.clear(); \r\n var infoboxOptions = {width :200, height :100, showCloseButton: true, zIndex: 0, offset:new Microsoft.Maps.Point(10,0), showPointer: true, title:'Infobox Title', description:'Infobox description' }; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), infoboxOptions );    \r\n map.entities.push(defaultInfobox); \r\n var showpointer= defaultInfobox.getShowPointer(); \r\n displayAlert(showpointer); ";
var InfoboxGetZIndex = "map.entities.clear(); \r\n var infoboxOptions = {width :200, height :100, showCloseButton: true, zIndex: 0, offset:new Microsoft.Maps.Point(10,0), showPointer: true, title:'Infobox Title', description:'Infobox description' }; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), infoboxOptions );    \r\n map.entities.push(defaultInfobox); \r\n var zindex= defaultInfobox.getZIndex(); \r\n displayAlert(zindex); ";
var InfoboxSetLocation = "map.entities.clear(); \r\n var infoboxOptions = {width :200, height :100, showCloseButton: true, zIndex: 0, offset:new Microsoft.Maps.Point(10,0), showPointer: true, title:'Infobox Title', description:'Infobox description' }; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), infoboxOptions );    \r\n map.entities.push(defaultInfobox); \r\n displayAlert('Now Setting Location'); \r\n defaultInfobox.setLocation(new Microsoft.Maps.Location(47.4, -122.33));";
var InfoboxSetOptions = "map.entities.clear(); \r\n var infoboxOptions = {width :200, height :100, showCloseButton: true, zIndex: 0, offset:new Microsoft.Maps.Point(10,0), showPointer: true, title:'Infobox Title', description:'Infobox description' }; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), null );    \r\n displayAlert('Now Setting Options'); \r\n defaultInfobox.setOptions(infoboxOptions); \r\n map.entities.push(defaultInfobox);";
var InfoboxentityChangedEvent = "map.entities.clear(); \r\n var infoboxOptions = {width :200, height :100, showCloseButton: true, zIndex: 0, offset:new Microsoft.Maps.Point(10,0), showPointer: true, title:'Infobox Title', description:'Infobox description' }; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), null ); \r\n Microsoft.Maps.Events.addHandler(defaultInfobox, 'entitychanged', function () {displayAlert('Infobox Entity Changed');});   \r\n defaultInfobox.setOptions(infoboxOptions); \r\n map.entities.push(defaultInfobox);";
var InfoboxSetHtmlContent = "map.entities.clear(); \r\n var infoboxOptions = {width :200, height :100, showCloseButton: true, zIndex: 0, offset:new Microsoft.Maps.Point(10,0), showPointer: true}; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), infoboxOptions );    \r\n map.entities.push(defaultInfobox);\r\n defaultInfobox.setHtmlContent('<div id=\"infoboxText\" style=\"background-color:White; border-style:solid;border-width:medium; border-color:DarkOrange; min-height:100px;width:240px;\"><b id=\"infoboxTitle\" style=\"position:absolute; top:10px; left:10px; width:220px;\">myTitle</b><a id=\"infoboxDescription\" style=\"position:absolute; top:30px; left:10px; width:220px;\">Description</a></div>'); ";
var InfoboxMouseOverEvent = "map.entities.clear(); \r\n var infoboxOptions = {width :200, height :100, showCloseButton: true, zIndex: 0, offset:new Microsoft.Maps.Point(10,0), showPointer: true, title:'Infobox Title', description:'Infobox description' }; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), null ); \r\n Microsoft.Maps.Events.addHandler(defaultInfobox, 'mouseenter', function () {displayAlert('Infobox Mouse Over');});    \r\n defaultInfobox.setOptions(infoboxOptions); \r\n map.entities.push(defaultInfobox);";
var InfoboxMouseOutEvent = "map.entities.clear(); \r\n var infoboxOptions = {width :200, height :100, showCloseButton: true, zIndex: 0, offset:new Microsoft.Maps.Point(10,0), showPointer: true, title:'Infobox Title', description:'Infobox description' }; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), null ); \r\n Microsoft.Maps.Events.addHandler(defaultInfobox, 'mouseleave', function () {displayAlert('Infobox Mouse out');});   \r\n defaultInfobox.setOptions(infoboxOptions); \r\n map.entities.push(defaultInfobox);";
var InfoboxMouseClickEvent = "map.entities.clear(); \r\n var infoboxOptions = {width :200, height :100, showCloseButton: true, zIndex: 0, offset:new Microsoft.Maps.Point(10,0), showPointer: true, title:'Infobox Title', description:'Infobox description' }; \r\n var defaultInfobox = new Microsoft.Maps.Infobox(map.getCenter(), null ); \r\n Microsoft.Maps.Events.addHandler(defaultInfobox, 'click', function () {displayAlert('Infobox Mouse Click');});   \r\n defaultInfobox.setOptions(infoboxOptions); \r\n map.entities.push(defaultInfobox);";

var greenLayer;
var TestDataGenerator = new function () {

    /*
    * Example data model that may be returned from a custom web service.
    */
    var ExampleDataModel = function (name, latitude, longitude) {
        this.Name = name;
        this.Latitude = latitude;
        this.Longitude = longitude;
    };


    /*
    * This function generates a bunch of random random data with 
    * coordinate information and returns it to a callback function 
    * similar to what happens when calling a web service.
    */
    this.GenerateData = function (numPoints, callback) {
        var data = [], randomLatitude, randomLongitude;

        for (var i = 0; i < numPoints; i++) {
            randomLatitude = Math.random() * 181 - 90;
            randomLongitude = Math.random() * 361 - 180;
            data.push(new ExampleDataModel("Point: " + i, randomLatitude, randomLongitude));
        }

        if (callback) {
            callback(data);
        }
    };
};


function displayInfobox(e) {
    if (e.targetType == "pushpin") {
        showinfobox(e.target);
    }
}

function showinfobox(shape) {
    for (var i = map.entities.getLength() - 1; i >= 0; i--) {
        var pushpin = map.entities.get(i);
        if (pushpin.toString() == '[Infobox]') {
            map.entities.removeAt(i);
        };
    }
    var pix = map.tryLocationToPixel(shape.getLocation(), Microsoft.Maps.PixelReference.control);
    var infoboxOptions = { width: 170, height: 80, showCloseButton: true, zIndex: 10, offset: new Microsoft.Maps.Point(10, 0), showPointer: true, title: shape.title, description: shape.description };
    var defInfobox = new Microsoft.Maps.Infobox(shape.getLocation(), infoboxOptions);
    map.entities.push(defInfobox);
}

function closeInfoBox() {
    var infobox = document.getElementById('infoBox');
    infobox.style.visibility = "hidden";
}

var getdata = "map.setView({zoom: 0, center: new Microsoft.Maps.Location(0, 0), mapTypeId: Microsoft.Maps.MapTypeId.road});  \r\nfunction createClusteredpin(cluster, latlong)\n {\nvar pin = new Microsoft.Maps.Pushpin(latlong, {\r\nicon: virtualPath +'/Content/clusteredpin.png',\r\nanchor: new Microsoft.Maps.Point(8, 8)\r\n});\r\npin.title = 'Cluster pin';\r\npin.description = 'Number of pins : ' + cluster.length ;\r\nMicrosoft.Maps.Events.addHandler(pin, 'click', displayInfobox);\r\nreturn pin;\r\n}\r\n function createPin(data) \n{\r\nvar pin = new Microsoft.Maps.Pushpin(data._LatLong, {\r\nicon: virtualPath +'/Content/nonclusteredpin.png',\r\nanchor: new Microsoft.Maps.Point(8, 8)\r\n});\r\npin.title = 'Single pin';\r\npin.description = 'GridKey: ' + data.GridKey;\r\nMicrosoft.Maps.Events.addHandler(pin, 'click', displayInfobox);\r\nreturn pin;\r\n}\r\nfunction dataCallback(response) \n{\r\nif (response != null) {\r\n//This method is part of dynamically downloaded clustering Module V7ClientSideClustering.js.\r\ngreenLayer.SetData(response); \n\r displayAlert('Clustered pushpins displayed'); }\r\n}";
var registerClustermodule = "Microsoft.Maps.registerModule('clusterModule', virtualPath + '/Scripts/V7ClientSideClustering.js');\r\ndisplayAlert('Clustering Module Registered')";
var loadClustermodule = getdata + "\nfunction customModuleLoaded()\r\n{ \r\nmap.entities.clear(); \r\ndisplayAlert('Cluster Module Loaded. Displaying pushpins in just a moment...');\r\ngreenLayer = new ClusteredEntityCollection(map, {\r\nsinglePinCallback: createPin,\r\nclusteredPinCallback: createClusteredpin\r\n});\r\nTestDataGenerator.GenerateData(100,dataCallback);\r\n}\r\nMicrosoft.Maps.loadModule('clusterModule', { callback: customModuleLoaded });";
var enableClustering = "//This method is part of dynamically downloaded clustering Module V7ClientSideClustering.js.\r\ngreenLayer.SetOptions({ clusteringEnabled: true });\r\ndisplayAlert('Clustering Enabled');";
var disbleClustering = "//This method is part of dynamically downloaded clustering Module V7ClientSideClustering.js.\r\ngreenLayer.SetOptions({ clusteringEnabled: false });\r\ndisplayAlert('Clustering Disabled');";
            			
var query = "var searchQuery = 'pizza, seattle'; \nSearch(searchQuery); \n function Search(searchQuery) { \nvar requestStr = 'http://api.bing.net/json.aspx?AppId=9E767A088B062A637BFD3EFE9C878D85A1B4F6FD&Query=' + searchQuery + "
        + "'&Sources=Phonebook&Version=2.0&Market=en-us&UILanguage=en&Radius=10.0&Phonebook.Count=10&Phonebook.Offset=0&Phonebook.FileType=YP&Phonebook.SortBy=Distance' + "
        + "'&JsonType=callback&JsonCallback=SearchCompleted'; \nCallRestService(requestStr);   \n}";

var showTraffic = "var IstileLayer=false; for(var i=0;i<map.entities.getLength();i++) { \nvar tileLayer= map.entities.get(i); \nif (tileLayer instanceof Microsoft.Maps.TileLayer) {\ntileLayer.setOptions({visible: true}); IstileLayer=true; \n}  \n} if (!IstileLayer) \ndisplayAlert('No Tile Layer Added'); \nelse \ndisplayAlert('Tile Layer is visible'); ";

var HideTraffic = "for(var i=0;i<map.entities.getLength();i++) { \nvar tileLayer= map.entities.get(i); \nif (tileLayer instanceof Microsoft.Maps.TileLayer) {\ntileLayer.setOptions({visible: false}); \ndisplayAlert('Tile Layer Hidden');\n}\n}";

displayInfo = function (e) {
    //	alert(e);
    var c = document.getElementById("SDKalertmessage");
    if (!c) {
        c = document.createElement("div");
        c.id = "counting";
        document.body.appendChild(c);
    }
    c.innerHTML = "Event info - " + e.eventName + "<br><br>";
    if (!e.isTouchEvent) {     
        if (e.originalEvent) {
            c.innerHTML += "Window:" + e.originalEvent.screenX + "(x) " + e.originalEvent.screenY + "(y)<br>";
            c.innerHTML += "client:" + e.originalEvent.clientX + "(x) " + e.originalEvent.clientY + "(y)<br>";
            c.innerHTML += "keys  :" + e.originalEvent.altKey + "(alt) " + e.originalEvent.ctrlKey + "(ctrl) " + e.originalEvent.shiftKey + "(shift)<br>";
        }
    }
    else {
        c.innerHTML += "Window:" + e.pageX + "(x) " + e.pageY + "(y)<br>";
    }
    c.innerHTML += "Target:" + e.targetType + "<br>";
    if (e.latLong != null)
        c.innerHTML += "LatLong:" + e.latLong.Latitude + "(Lat)" + e.latLong.Longitude + "(Long)<br>";
}

displayEventInfo = function (e) {
    
    var obj = e.target;
    var objProperties;
    if (obj.toString() == '[Pushpin]') {
	    objProperties = 'Icon - ' + obj.getIcon();
    }
    var c = document.getElementById("SDKalertmessage");
    if (!c) {
	    c = document.createElement("div");
	    c.id = "counting";
	    document.body.appendChild(c);
    }
    c.innerHTML = "Events info - " + e.eventName + "<br><br>" + "Target  : " + obj.toString() + "<br>" + "Property  : " + objProperties + "<br>";
}

function onviewchange(e) {
var latlon = map.getCenter();
var c = document.getElementById("SDKalertmessage");
if (!c) {
	c = document.createElement("div");
	c.id = "counting";
	document.body.appendChild(c);
}
c.innerHTML = "Events info <br><br>" + "Zoom:" + map.getZoom() + "(ZoomLevel)<br>" + "Map LatLong   :" + latlon.latitude + "(latitude) " + latlon.longitude + "(longitude)<br>";
}

function CopyrightChanged(e) {
    var latlon = map.getCenter();
    var c = document.getElementById("SDKalertmessage");
    if (!c) {
	    c = document.createElement("div");
	    c.id = "counting";
	    document.body.appendChild(c);
    }
    c.innerHTML = "Events info - <br><br>" + "Zoom:" + map.getZoom() + "(ZoomLevel)<br>" + "Zoom:" + map.getCopyrights() + "(CopyrightStr)<br>" + "Map LatLong   :" + latlon.latitude + "(latitude) " + latlon.longitude + "(longitude)<br>";
}

var attachclick;
var attachmapviewchange;
var attachmapviewchangeend;
var attachmapviewchangeStart;
var attachcopyrightchanged;
var attachimagerychanged;
var attachdblclick;
var attachrightclick;
var attachmousedown;
var attachmouseup;
var attachmousemove;
var attachmouseover;
var attachmouseout;
var attachmousewheel;
//var mapviewchange = "Microsoft.Maps.Events.addHandler(map, 'viewchange', function(e)\r\n{\r\nalert('23');\r\n});";
var click = "attachclick = Microsoft.Maps.Events.addHandler(map, 'click',displayInfo); \ndisplayAlert('Perform action on map to fire this event')";
var mapviewchange = "attachmapviewchange = Microsoft.Maps.Events.addHandler(map, 'viewchange', function(e)\r\n{\r\nonviewchange(e);\r\n}); \ndisplayAlert('Perform action on map to fire this event')";
var mapviewchangeend = "attachmapviewchangeend = Microsoft.Maps.Events.addHandler(map, 'viewchangeend', function(e)\r\n{\r\nonviewchange(e);\r\n}); \ndisplayAlert('Perform action on map to fire this event')";
var mapviewchangeStart = "attachmapviewchangeStart = Microsoft.Maps.Events.addHandler(map, 'viewchangestart', function(e)\r\n{\r\nonviewchange(e);\r\n}); \ndisplayAlert('Perform action on map to fire this event')";
var copyrightchanged = "attachcopyrightchanged = Microsoft.Maps.Events.addHandler(map, 'copyrightchanged', function(e)\r\n{\r\nCopyrightChanged(e);\r\n}); \ndisplayAlert('Perform action on map to fire this event')";
var imagerychanged = "attachimagerychanged = Microsoft.Maps.Events.addHandler(map, 'imagerychanged', function(e)\r\n{\r\nonviewchange(e);\r\n}); \ndisplayAlert('Perform action on map to fire this event')";
var dblclick = "attachdblclick = Microsoft.Maps.Events.addHandler(map, 'dblclick',displayInfo); \ndisplayAlert('Perform action on map to fire this event')";
var rightclick = "attachrightclick = Microsoft.Maps.Events.addHandler(map, 'rightclick',displayInfo); \ndisplayAlert('Perform action on map to fire this event')";
var mousedown = "attachmousedown = Microsoft.Maps.Events.addHandler(map, 'mousedown',displayInfo); \ndisplayAlert('Perform action on map to fire this event')";
var mouseup = "attachmouseup = Microsoft.Maps.Events.addHandler(map, 'mouseup',displayInfo); \ndisplayAlert('Perform action on map to fire this event')";
var mousemove = "attachmousemove = Microsoft.Maps.Events.addHandler(map, 'mousemove',displayInfo); \ndisplayAlert('Perform action on map to fire this event')";
var mouseover = "attachmouseover = Microsoft.Maps.Events.addHandler(map, 'mouseover',displayInfo); \ndisplayAlert('Perform action on map to fire this event')";
var mouseout = "attachmouseout = Microsoft.Maps.Events.addHandler(map, 'mouseout',displayInfo); \ndisplayAlert('Perform action on map to fire this event')";
var mousewheel = "attachmousewheel = Microsoft.Maps.Events.addHandler(map, 'mousewheel',displayInfo); \ndisplayAlert('Perform action on map to fire this event')";

var Dclick = "Microsoft.Maps.Events.removeHandler(attachclick); \ndisplayAlert('event detached');";
var Dmapviewchange = "Microsoft.Maps.Events.removeHandler(attachmapviewchange); \ndisplayAlert('event detached');";
var Dmapviewchangeend = "Microsoft.Maps.Events.removeHandler(attachmapviewchangeend); \ndisplayAlert('event detached');";
var DmapviewchangeStart = "Microsoft.Maps.Events.removeHandler(attachmapviewchangeStart); \ndisplayAlert('event detached');";
var Dcopyrightchanged = "Microsoft.Maps.Events.removeHandler(attachcopyrightchanged); \ndisplayAlert('event detached');";
var Dimagerychanged = "Microsoft.Maps.Events.removeHandler(attachimagerychanged); \ndisplayAlert('event detached');";
var Ddblclick = "Microsoft.Maps.Events.removeHandler(attachdblclick); \ndisplayAlert('event detached');";
var Drightclick = "Microsoft.Maps.Events.removeHandler(attachrightclick); \ndisplayAlert('event detached');";
var Dmousedown = "Microsoft.Maps.Events.removeHandler(attachmousedown); \ndisplayAlert('event detached');";
var Dmouseup = "Microsoft.Maps.Events.removeHandler(attachmouseup); \ndisplayAlert('event detached');";
var Dmousemove = "Microsoft.Maps.Events.removeHandler(attachmousemove); \ndisplayAlert('event detached');";
var Dmouseover = "Microsoft.Maps.Events.removeHandler(attachmouseover); \ndisplayAlert('event detached');";
var Dmouseout = "Microsoft.Maps.Events.removeHandler(attachmouseout); \ndisplayAlert('event detached');";
var Dmousewheel = "Microsoft.Maps.Events.removeHandler(attachmousewheel); \ndisplayAlert('event detached');";


var geolocation1 = "\nmap.entities.clear(); \nvar geoLocationProvider = new Microsoft.Maps.GeoLocationProvider(map);  \ngeoLocationProvider.getCurrentPosition(); \ndisplayAlert('Current location set, based on your browser support for geo location API');";
var geolocation2 = "\nmap.entities.clear(); \nvar geoLocationProvider = new Microsoft.Maps.GeoLocationProvider(map);  \ngeoLocationProvider.getCurrentPosition({ showAccuracyCircle: false }); \ndisplayAlert('Current location set, based on your browser support for geo location API');";
var geolocation3 = "\nmap.entities.clear(); \nvar geoLocationProvider = new Microsoft.Maps.GeoLocationProvider(map);  \ngeoLocationProvider.getCurrentPosition({ showAccuracyCirle: true, updateMapView: false }); \ndisplayAlert('Current location set, pan the map to view the marker');";
var geolocation4 = "\nmap.entities.clear(); \nvar geoLocationProvider = new Microsoft.Maps.GeoLocationProvider(map);  \ngeoLocationProvider.getCurrentPosition({ successCallback: function(object) { displayAlert('Success callback invoked, current map center '  + object.center); } }); ";
var geolocation5 = "\nmap.entities.clear(); \nvar geoLocationProvider = new Microsoft.Maps.GeoLocationProvider(map);  \ngeoLocationProvider.getCurrentPosition({ errorCallback: function(object) { displayAlert('Error callback invoked, error code '  + object.errorCode); } }); ";

var normalizeLongt = "var norLongt=Microsoft.Maps.Location.normalizeLongitude(eval(-190));\r\nDisplay('Normalize Longitude : ' + norLongt);";
var fromcorners = "var lr = Microsoft.Maps.LocationRect.fromCorners(\r\nnew Microsoft.Maps.Location(45,-121),\r\nnew Microsoft.Maps.Location(30, -90));\r\nDisplay('North : ' + lr.getNorth() + ' South : ' + lr.getSouth() + ' West : ' + lr.getWest() + ' East : ' + lr.getEast()); ";
var fromEdges = "var lr = Microsoft.Maps.LocationRect.fromEdges(75, -100, 50, -120);\r\nDisplay('North : ' + lr.getNorth() + ' South : ' + lr.getSouth() + ' West : ' + lr.getWest() + ' East : ' + lr.getEast()); ";
var fromlocation = "var lr = Microsoft.Maps.LocationRect.fromLocations(new Microsoft.Maps.Location(45, -121),\r\nnew Microsoft.Maps.Location(30, -90),\r\nnew Microsoft.Maps.Location(20, -100),\r\nnew Microsoft.Maps.Location(43, -130));\r\nDisplay('North : ' + lr.getNorth() + ' South : ' + lr.getSouth() + ' West : ' + lr.getWest() + ' East : ' + lr.getEast()); ";
var push = "map.setView( { center: new Microsoft.Maps.Location(47.6, -122.33), zoom: 8 });\r\nvar MM = Microsoft.Maps;\r\nvar pushpinOptions = {icon: '../../Content/SpaceNeedle.jpg'};\r\nvar pushpin= new MM.Pushpin(new MM.Location(47.7, -122.13), pushpinOptions); \r\nvar polyline = new MM.Polyline([new MM.Location(47.70560423257113, -122.78900809586048), new MM.Location(47.32346629912702, -122.78351499317978), new MM.Location(47.32346629912702, -121.89911551773548)], null); \r\nvar Ec= new Microsoft.Maps.EntityCollection();\r\nEc.push(pushpin);\r\nEc.push(polyline);\r\nmap.entities.push(Ec); Display('Two items pushped'); map.entities.pop(); map.entities.pop();  ";
var pop = "map.setView( { center: new Microsoft.Maps.Location(47.6, -122.33), zoom: 8 });\r\nvar MM = Microsoft.Maps;\r\nvar pushpinOptions = {icon: '../../Content/SpaceNeedle.jpg'};\r\nvar pushpin= new MM.Pushpin(new MM.Location(47.7, -122.13), pushpinOptions); \r\nvar polyline = new MM.Polyline([new MM.Location(47.70560423257113, -122.78900809586048), new MM.Location(47.32346629912702, -122.78351499317978), new MM.Location(47.32346629912702, -121.89911551773548)], null); \r\nvar Ec= new Microsoft.Maps.EntityCollection();\r\nEc.push(pushpin);\r\nEc.push(polyline); \r\nmap.entities.push(Ec); alert('Item pushed'); map.entities.pop(); map.entities.pop(); Display('Item poped');  ";
var get = "map.setView( { center: new Microsoft.Maps.Location(47.6, -122.33), zoom: 8 });\r\nvar MM = Microsoft.Maps;\r\nvar pushpinOptions = {icon: '../../Content/SpaceNeedle.jpg'};\r\nvar pushpin= new MM.Pushpin(new MM.Location(47.7, -122.13), pushpinOptions);\r\nvar polyline = new MM.Polyline([new MM.Location(47.70560423257113, -121.78900809586048), new MM.Location(47.32346629912702, -122.78351499317978), new MM.Location(47.32346629912702, -121.89911551773548)], null); \r\nvar polyline1 = new MM.Polyline([new MM.Location(47.70560423257113, -122.78900809586048), new MM.Location(47.32346629912702, -122.78351499317978), new MM.Location(47.32346629912702, -121.89911551773548)], null); \r\nvar Ec= new Microsoft.Maps.EntityCollection();\r\nEc.push(pushpin);\r\nEc.push(polyline1);\r\nEc.push(polyline);\r\nmap.entities.push(Ec);\r\nDisplay('Entity at index 0 : ' + Ec.get(0) + 'Entity at index 1 : ' + Ec.get(1)); map.entities.pop(); map.entities.pop();";
var insert = "map.setView( { center: new Microsoft.Maps.Location(47.6, -122.33), zoom: 8 });\r\nvar MM = Microsoft.Maps;\r\nvar pushpinOptions = {icon: '../../Content/SpaceNeedle.jpg'};\r\nvar pushpin= new MM.Pushpin(new MM.Location(47.7, -122.13), pushpinOptions);\r\nvar polyline = new MM.Polyline([new MM.Location(47.70560423257113, -121.78900809586048), new MM.Location(47.32346629912702, -122.78351499317978), new MM.Location(47.32346629912702, -121.89911551773548)], null); \r\nvar polyline1 = new MM.Polyline([new MM.Location(47.70560423257113, -122.78900809586048), new MM.Location(47.32346629912702, -122.78351499317978), new MM.Location(47.32346629912702, -121.89911551773548)], null); \r\nvar Ec= new Microsoft.Maps.EntityCollection();\r\nEc.push(pushpin);\r\nEc.push(polyline1);\r\nEc.push(polyline);\r\nmap.entities.push(Ec);\r\nDisplay('Entity at index 0 : ' + Ec.get(0) + 'Entity at index 1 : ' + Ec.get(1));alert('Now Inserting another Pushpin at index 1');\r\nvar pushpin2= new MM.Pushpin(new MM.Location(47.7, -121.13), pushpinOptions);Ec.insert(pushpin2,1);\r\nDisplay('Now Entity at index 1 : ' + Ec.get(1)); map.entities.pop(); map.entities.pop(); map.entities.pop();";
var getlength = "map.setView( { center: new Microsoft.Maps.Location(47.6, -122.33), zoom: 8 });\r\nvar MM = Microsoft.Maps;\r\nvar pushpinOptions = {icon: 'http://gdata-javascript-client.googlecode.com/svn-history/r74/trunk/samples/base/baseOnAMap/pushpin.png'};\r\nvar pushpin= new MM.Pushpin(new MM.Location(47.7, -122.13), pushpinOptions); \r\nvar polyline = new MM.Polyline([new MM.Location(47.70560423257113, -122.78900809586048), new MM.Location(47.32346629912702, -122.78351499317978), new MM.Location(47.32346629912702, -121.89911551773548)], null); \r\nvar Ec= new Microsoft.Maps.EntityCollection();\r\nEc.push(pushpin);\r\nEc.push(polyline);\r\nmap.entities.push(Ec);alert('Total items : '+ Ec.getLength()); map.entities.pop(); map.entities.pop();";
var remove = "map.setView( { center: new Microsoft.Maps.Location(47.6, -122.33), zoom: 8 });\r\nvar MM = Microsoft.Maps;\r\nvar pushpinOptions = {icon: 'http://gdata-javascript-client.googlecode.com/svn-history/r74/trunk/samples/base/baseOnAMap/pushpin.png'};\r\nvar pushpin= new MM.Pushpin(new MM.Location(47.7, -122.13), pushpinOptions);\r\nvar polyline = new MM.Polyline([new MM.Location(47.70560423257113, -121.78900809586048), new MM.Location(47.32346629912702, -122.78351499317978), new MM.Location(47.32346629912702, -121.89911551773548)], null); \r\nvar polyline1 = new MM.Polyline([new MM.Location(47.70560423257113, -122.78900809586048), new MM.Location(47.32346629912702, -122.78351499317978), new MM.Location(47.32346629912702, -121.89911551773548)], null); \r\nvar Ec= new Microsoft.Maps.EntityCollection();\r\nEc.push(pushpin);\r\nEc.push(polyline1);\r\nEc.push(polyline);\r\nmap.entities.push(Ec);\r\nalert('Entity at index 0/1 : ' + Ec.get(0)+ '/' + Ec.get(1));\r\nalert('Now removing Entity pushpin');map.entities.remove(pushpin);\r\nDisplay('Entity at index 0/1 : ' + Ec.get(0) + '/' +  Ec.get(1)) ;";
var removeat = "map.setView( { center: new Microsoft.Maps.Location(47.6, -122.33), zoom: 8 });\r\nvar MM = Microsoft.Maps;\r\nvar pushpinOptions = {icon: '../../Content/SpaceNeedle.jpg'};\r\nvar pushpin= new MM.Pushpin(new MM.Location(47.7, -122.13), pushpinOptions);\r\nvar polyline = new MM.Polyline([new MM.Location(47.70560423257113, -121.78900809586048), new MM.Location(47.32346629912702, -122.78351499317978), new MM.Location(47.32346629912702, -121.89911551773548)], null); \r\nvar polyline1 = new MM.Polyline([new MM.Location(47.70560423257113, -122.78900809586048), new MM.Location(47.32346629912702, -122.78351499317978), new MM.Location(47.32346629912702, -121.89911551773548)], null); \r\nvar Ec= new Microsoft.Maps.EntityCollection();\r\nEc.push(pushpin);\r\nEc.push(polyline1);\r\nEc.push(polyline);\r\nmap.entities.push(Ec);\r\nalert('Entity at index 1 is' + Ec.get(1));\r\nalert('Entity at index 0 is' + Ec.get(0));\r\nalert('Now removing Entity at Index 1'); map.entities.removeAt(1);\r\nDisplay('Entity at index 0/1 : ' + Ec.get(0) + '/' + Ec.get(1));";
var clear = "map.setView( { center: new Microsoft.Maps.Location(47.6, -122.33), zoom: 8 });\r\nvar MM = Microsoft.Maps;\r\nvar pushpinOptions = {icon: '../../Content/SpaceNeedle.jpg'};\r\nvar pushpin= new MM.Pushpin(new MM.Location(47.7, -122.13), pushpinOptions);\r\nvar polyline = new MM.Polyline([new MM.Location(47.70560423257113, -121.78900809586048), new MM.Location(47.32346629912702, -122.78351499317978), new MM.Location(47.32346629912702, -121.89911551773548)], null); \r\nvar polyline1 = new MM.Polyline([new MM.Location(47.70560423257113, -122.78900809586048), new MM.Location(47.32346629912702, -122.78351499317978), new MM.Location(47.32346629912702, -121.89911551773548)], null); \r\nvar Ec= new Microsoft.Maps.EntityCollection();\r\nEc.push(pushpin);\r\nEc.push(polyline1);\r\nEc.push(polyline);\r\nmap.entities.push(Ec);\r\nalert('Total length of Entities' + Ec.getLength());\r\nalert('Clearing all entities');\r\nmap.entities.clear();\r\nDisplay('Total items : ' + Ec.getLength());";
var setoptions = "map.setView( { center: new Microsoft.Maps.Location(47.6, -122.33), zoom: 8 });\r\nvar MM = Microsoft.Maps;\r\nvar pushpinOptions = {icon: '../../Content/SpaceNeedle.jpg'};\r\nvar pushpin= new MM.Pushpin(new MM.Location(47.7, -122.13), pushpinOptions);\r\nvar polyline = new MM.Polyline([new MM.Location(47.70560423257113, -121.78900809586048), new MM.Location(47.32346629912702, -122.78351499317978), new MM.Location(47.32346629912702, -121.89911551773548)], null); \r\nvar polyline1 = new MM.Polyline([new MM.Location(47.70560423257113, -122.78900809586048), new MM.Location(47.32346629912702, -122.78351499317978), new MM.Location(47.32346629912702, -121.89911551773548)], null); \r\nvar Ec= new Microsoft.Maps.EntityCollection();\r\nalert('Setoptions to turn invisible all entities');\r\nEc.setOptions({visible:false});\r\nEc.push(pushpin);\r\nEc.push(polyline1);\r\nEc.push(polyline);\r\nmap.entities.push(Ec);\r\nalert('Total items : ' + Ec.getLength()); map.entities.pop(); map.entities.pop();";
var getvisible = "map.setView( { center: new Microsoft.Maps.Location(47.6, -122.33), zoom: 8 });\r\nvar MM = Microsoft.Maps;\r\nvar pushpinOptions = {icon: '../../Content/SpaceNeedle.jpg'};\r\nvar pushpin= new MM.Pushpin(new MM.Location(47.7, -122.13), pushpinOptions); \r\nvar polyline = new MM.Polyline([new MM.Location(47.70560423257113, -122.78900809586048), new MM.Location(47.32346629912702, -122.78351499317978), new MM.Location(47.32346629912702, -121.89911551773548)], null); \r\nvar Ec= new Microsoft.Maps.EntityCollection();\r\nEc.setOptions({visible:false});\r\nEc.push(pushpin);\r\nEc.push(polyline);\r\nmap.entities.push(Ec);\r\nDisplay('The visibility on entities added : ' +Ec.getVisible());";
var getmapviewcode = "var latlon = map.getCenter();\r\nDisplay('Center is : '+ latlon.latitude + ',' + latlon.longitude +  ', Zoom level is : ' + map.getZoom() + ', Mapmode : ' + map.getMapTypeId());";
var entityadded = "map.entities.clear();\r\nvar MM = Microsoft.Maps; \r\nvar p1 = new MM.Pushpin(new MM.Location(47.616936, -122.392514, 16.86, MM.AltitudeReference.ellipsoid),{text: '1',zindex:-1});\r\nvar p2 = new MM.Pushpin(new MM.Location(47.616936, -122.392514, 16.34, MM.AltitudeReference.ellipsoid),{text: '2',zindex:2});\r\nvar Ec= new Microsoft.Maps.EntityCollection();\r\nMM.Events.addHandler(Ec,'entityadded', fn1);\r\nEc.push(p1);\r\nEc.push(p2);\r\nmap.entities.push(Ec);\r\nfunction fn1(e)\r\n{\r\nDisplay('entity added' + e);\r\n}";
var entityremoved = "map.entities.clear();\r\nvar MM = Microsoft.Maps; \r\nvar p1 = new MM.Pushpin(new MM.Location(47.616936, -122.392514, 16.86, MM.AltitudeReference.ellipsoid),{text: '1',zindex:-1});\r\nvar p2 = new MM.Pushpin(new MM.Location(47.616936, -122.392514, 16.34, MM.AltitudeReference.ellipsoid),{text: '2',zindex:2});\r\nvar Ec= new Microsoft.Maps.EntityCollection();\r\nMM.Events.addHandler(Ec,'entityremoved', fn1);\r\nEc.push(p1);\r\nEc.push(p2);\r\nmap.entities.push(Ec);\r\nalert('Now Removing the entities');\r\nEc.pop();\r\nfunction fn1(e)\r\n{\r\nDisplay('entity Removed' + e);\r\n}";
var entitychanged = "function fn2(e)\r\n{\r\nalert('entity changed');\r\n}\r\nvar MM = Microsoft.Maps; \r\nMM.Events.addHandler(map.entities,'entitychanged', fn2);\r\nvar options = {strokeColor: new MM.Color(255,255,115,0)};\r\nvar polyline = new MM.Polyline([new MM.Location(47.720388418319494, -121.91010184586048), new MM.Location(47.71669276509879, -121.05866141617298), new MM.Location(47.32718975649916, -121.05316825211048)], options); \r\nmap.setView( {center: new Microsoft.Maps.Location(47.71, -121.05), zoom:8});\r\nmap.entities.push(polyline);\r\npolyline.setOptions({strokeColor: new MM.Color(255,25,115,0)});\r\n";


//traffic layer apis
var trafficLayer;
var trafficLayer1 = "function trafficModuleLoaded()\n{\ndisplayAlert('Traffic Module Loaded')\n}\nMicrosoft.Maps.loadModule('Microsoft.Maps.Traffic', { callback: trafficModuleLoaded });";
// set center to New York city
setzoomcenter = 'map.setView({ zoom: 10, center: new Microsoft.Maps.Location(40.73, -73.98) })';

var trafficLayer2 = setzoomcenter + "\n\nMicrosoft.Maps.loadModule('Microsoft.Maps.Traffic', { callback: function() { trafficLayer = new Microsoft.Maps.Traffic.TrafficLayer(map); \n\t\t\t\t\t\t   // show the traffic Layer \n\t\t\t\t\t\t   trafficLayer.show();} \n\t\t\t\t\t\t   });  ";
var trafficLayer3 = "// hide the traffic Layer\ntrafficLayer.hide();";
var trafficLayer4 = "var tileLayer = trafficLayer.getTileLayer();\ntileLayer.setOptions( {opacity: 0.4} );"

//Directions API's
var directionsErrorEventObj;
var detachDirectionsErrorEvent = "if (directionsErrorEventObj)\n{\n" +
    "Microsoft.Maps.Events.removeHandler(directionsErrorEventObj);\n" +
    "directionsErrorEventObj = null;\n" + 
    "}\n";
var directionsUpdatedEventObj;
var detachDirectionsUpdatedEvent = "if (directionsUpdatedEventObj)\n{\n" +
    "Microsoft.Maps.Events.removeHandler(directionsUpdatedEventObj);\n" +
    "directionsupdatedEventObj = null;\n" +
    "}\n";

function showDirectionsError(errorMessage) {
    displayAlert('Directions error encountered');
    alert(errorMessage);
}

function createDirectionsManager() {
    var displayMessage = "";
    if (!directionsManager) {
        directionsManager = new Microsoft.Maps.Directions.DirectionsManager(map);
        displayMessage = 'Directions Module loaded<BR>';
        displayMessage += 'Directions Manager loaded';
    }
    displayAlert(displayMessage);
    directionsManager.resetDirections();
    directionsErrorEventObj = Microsoft.Maps.Events.addHandler(directionsManager, 'directionsError', function (arg) { handleDirectionsError(arg) });
    directionsUpdatedEventObj = Microsoft.Maps.Events.addHandler(directionsManager, 'directionsUpdated', function() { displayAlert('Directions updated') });
}

function resolveDisambiguation(waypointIndex, choiceIndex, disambiguationType) {
    clearDirectionsError();
    clearItinerary();
    var currentWaypoints = directionsManager.getAllWaypoints();
    var disambiguationWaypoint = currentWaypoints[waypointIndex];
    var disambiguationResult = disambiguationWaypoint.getDisambiguationResult();
    if (disambiguationType == 'business') {
        disambiguationWaypoint.setOptions({ address: disambiguationResult.businessSuggestions[choiceIndex].address });
        var latitude = disambiguationResult.businessSuggestions[choiceIndex].location.latitude;
        var longitude = disambiguationResult.businessSuggestions[choiceIndex].location.longitude;
        disambiguationWaypoint.setOptions({ location: new Microsoft.Maps.Location(latitude, longitude) });
        disambiguationWaypoint.setOptions({ businessDetails: { businessName: disambiguationResult.businessSuggestions[choiceIndex].name} });
        disambiguationWaypoint.setOptions({ businessDetails: { phoneNumber: disambiguationResult.businessSuggestions[choiceIndex].phoneNumber} });
    }
    else {
        disambiguationWaypoint.setOptions({ address: disambiguationResult.locationSuggestions[choiceIndex].suggestion });
        var latitude = disambiguationResult.locationSuggestions[choiceIndex].location.latitude;
        var longitude = disambiguationResult.locationSuggestions[choiceIndex].location.longitude;
        disambiguationWaypoint.setOptions({ location: new Microsoft.Maps.Location(latitude, longitude) });
    }
    directionsManager.calculateDirections();
}

function showDisambiguation(arg) {
    var stringToDisplay = "";
    var waypoints = directionsManager.getAllWaypoints();
    var i = 0;
    for (i = 0; i < waypoints.length; i++) {
        stringToDisplay += "<li><b>Waypoint " + (i + 1) + ":</b> " + waypoints[i].getAddress() + "</li>";
        var disambigResult = waypoints[i].getDisambiguationResult();
        if (disambigResult != null) {
            stringToDisplay += "<ol>";
            var j = 0;

            if (disambigResult.businessSuggestions.length > 0) {
                for (j = 0; j < disambigResult.businessSuggestions.length; j++) {
                    var parameterString = "(" + i + ", " + j + ", 'business')";
                    stringToDisplay += "<li><a href=\"javascript:void(0);resolveDisambiguation" + parameterString + ";\">" +
                        disambigResult.businessSuggestions[j].name + "</a><BR>" +
                        disambigResult.businessSuggestions[j].address + "</li>";
                }
            }
            else if (disambigResult.locationSuggestions.length > 0) {
                for (j = 0; j < disambigResult.locationSuggestions.length; j++) {
                    var parameterString = "(" + i + ", " + j + ", 'location')";
                    stringToDisplay += "<li><a href=\"javascript:void(0);resolveDisambiguation" + parameterString + ";\">" +
                        disambigResult.locationSuggestions[j].suggestion + "</a></li>";
                }
            }
            else {
                stringToDisplay += disambigResult.headerText + "\n";
            }

            stringToDisplay += "</ol>";
        }
    }
    var itinerary = document.getElementById("directionsItinerary");
    if (!itinerary) {
        itinerary = document.createElement("div");
        itinerary.id = "directionsItinerary";
        document.body.appendChild(itinerary);
    }
    itinerary.innerHTML = "<ul>" + stringToDisplay + "</ul>";
    showDirectionsError("Message: Disambiguation of waypoints required");
}

function handleDirectionsError(arg) {
    if (arg.responseCode == 12) {
        showDisambiguation(arg);
    }
    else {
        showDirectionsError(arg.message);
    }
}

function showDirectionsError(message) 
{
    var displayString = "Event Info: Directions Error\n" + message;
    alert(displayString);
}

function clearDirectionsError() {
    var c = document.getElementById("SDKalertmessage");
    if (!c) {
        c = document.createElement("div");
        c.id = "SDKalertMessage";
        document.body.appendChild(c);
    }
    c.innerHTML = "&nbsp;";
}

function clearItinerary() {
    var c = document.getElementById("directionsItinerary");
    c.innerHTML = "&nbsp;";
}


var setModeToDriving = "// Set Route Mode to driving \ndirectionsManager.setRequestOptions({ routeMode: Microsoft.Maps.Directions.RouteMode.driving });\n";
var clearDirections = "directionsManager.resetDirections();\n";
var resetDirections = "directionsManager.resetDirections(); displayAlert('Directions cleared');\n";
var createNewYorkWaypoint = "var newyorkWaypoint = new Microsoft.Maps.Directions.Waypoint({ address: '569 Broadway, New York, NY 10012-3211', location: new Microsoft.Maps.Location(40.724418, -73.997743) });\ndirectionsManager.addWaypoint(newyorkWaypoint);\n";
var createScotchPlainsWaypoint = "var scotchplainsWaypoint = new Microsoft.Maps.Directions.Waypoint({ address: '1481 Rahway Rd, Scotch Plains, NJ 07076-2713', location: new Microsoft.Maps.Location(40.609437, -74.382686) });\ndirectionsManager.addWaypoint(scotchplainsWaypoint);\n";
var createSanFranWaypoint = "var sanfranciscoWaypoint = new Microsoft.Maps.Directions.Waypoint({ address: 'San Francisco, CA', location: new Microsoft.Maps.Location(37.779160, -122.420049) });\ndirectionsManager.addWaypoint(sanfranciscoWaypoint);\n";
var createWalnutCreekWaypoint = "var walnutcreekWaypoint = new Microsoft.Maps.Directions.Waypoint({ address: 'Walnut Creek, CA', location: new Microsoft.Maps.Location(37.901180, -122.061628) });\ndirectionsManager.addWaypoint(walnutcreekWaypoint);\n";
var calculateDirectionsCall = "displayAlert('Calculating directions...');\ndirectionsManager.calculateDirections();\n";
var createSeattleWaypoint = "var seattleWaypoint = new Microsoft.Maps.Directions.Waypoint({ address: 'Seattle, WA' });\ndirectionsManager.addWaypoint(seattleWaypoint);\n";
var createTacomaWaypoint = "var tacomaWaypoint = new Microsoft.Maps.Directions.Waypoint({ address: 'Tacoma, WA', location: new Microsoft.Maps.Location(47.255134, -122.441650) });\ndirectionsManager.addWaypoint(tacomaWaypoint);\n";
var setItineraryContainer = "// Set the element in which the itinerary will be rendered\ndirectionsManager.setRenderOptions({ itineraryContainer: document.getElementById('directionsItinerary') });\n";
var genericRouteSetup = createSeattleWaypoint + createTacomaWaypoint + setItineraryContainer;
var genericDrivingSetup = setModeToDriving + genericRouteSetup;

var testDirectionsManager1 = "if (!directionsManager)\n{\nMicrosoft.Maps.loadModule('Microsoft.Maps.Directions', ";
var testDirectionsManager2 = ");\n}\nelse\n{\n";
var testDirectionsManager3 = "\n}";

var directionscode01 = createDirectionsManager + testDirectionsManager1 + "{ callback: createDirectionsManager }" + testDirectionsManager2 +
    "createDirectionsManager();" + testDirectionsManager3;

// create a driving route
var createDrivingDirections = "function createDrivingRoute()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    clearDirections + genericDrivingSetup + calculateDirectionsCall + 
    "}\n\n";
var directionscode02 = createDrivingDirections + testDirectionsManager1 + "{ callback: createDrivingRoute }" + testDirectionsManager2 + "createDrivingRoute();" + 
    testDirectionsManager3;


// Create a transit route
var setModeToTransit = "directionsManager.setRequestOptions({ routeMode: Microsoft.Maps.Directions.RouteMode.transit });\n";
var createBellevueWaypoint = "var bellevueWaypoint = new Microsoft.Maps.Directions.Waypoint({ address: 'Bellevue, WA', location: new Microsoft.Maps.Location(47.610020, -122.187549) });\ndirectionsManager.addWaypoint(bellevueWaypoint);\n";
var genericTransitSetup = setModeToTransit + createSeattleWaypoint + createBellevueWaypoint + setItineraryContainer;
var createTransitDirections = "function createTransitRoute()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    clearDirections + genericTransitSetup + calculateDirectionsCall + 
    "}\n\n";
var directionscode03 = createTransitDirections + testDirectionsManager1 + "{ callback: createTransitRoute }" + testDirectionsManager2 + "createTransitRoute();" +
    testDirectionsManager3;

// Create a walking route
var setModeToWalking = "// Set Route Mode to walking \ndirectionsManager.setRequestOptions({ routeMode: Microsoft.Maps.Directions.RouteMode.walking });\n";
var createRedmondWaypoint = "var redmondWaypoint = new Microsoft.Maps.Directions.Waypoint({ address: 'Redmond, WA', location: new Microsoft.Maps.Location(47.678561, -122.130993) });\ndirectionsManager.addWaypoint(redmondWaypoint);\n";
var genericWalkingSetup = setModeToWalking + createSeattleWaypoint + createRedmondWaypoint + setItineraryContainer;
var createWalkingDirections = "function createWalkingRoute()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    clearDirections + genericWalkingSetup + calculateDirectionsCall + 
    "}\n\n";
var directionscode04 = createWalkingDirections + testDirectionsManager1 + "{ callback: createWalkingRoute }" + testDirectionsManager2 + "createWalkingRoute();" +
    testDirectionsManager3;

// Insert a waypoint into an existing route
var checkIfTwoWaypoints = "if(directionsManager.getAllWaypoints().length < 2)\n{\n" + clearDirections +
    createSeattleWaypoint + createTacomaWaypoint + "\n}\n";
var insertWaypoint = "// Insert a waypoint\n" +
    "directionsManager.addWaypoint(new Microsoft.Maps.Directions.Waypoint({ address: 'Issaquah, WA', location: new Microsoft.Maps.Location(47.530094, -122.033798) }), 1);\n";
var addWaypoint = "function addWaypoint()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    checkIfTwoWaypoints + insertWaypoint + setItineraryContainer + calculateDirectionsCall +
    "}\n\n";
var directionscode05 = addWaypoint + testDirectionsManager1 + "{ callback: addWaypoint }" + testDirectionsManager2 + "addWaypoint();" + testDirectionsManager3;

// delete a waypoint from an existing route
var checkIfThreeWaypoints = "if(directionsManager.getAllWaypoints().length < 3)\n{\n" + clearDirections +
    createSeattleWaypoint + createTacomaWaypoint + createRedmondWaypoint + "\n}\n";
var deleteWaypoint = "// Remove a waypoint \ndirectionsManager.removeWaypoint(0);\n";
var removeWaypoint = "function removeWaypoint()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    checkIfThreeWaypoints + deleteWaypoint + setItineraryContainer + calculateDirectionsCall +
    "}\n\n";
var directionscode06 = removeWaypoint + testDirectionsManager1 + "{ callback: removeWaypoint }" + testDirectionsManager2 + "removeWaypoint();" +
    testDirectionsManager3;

// getallwaypoints
var getAllWaypoints = "function getAllWaypoints()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    "var allWaypoints =  directionsManager.getAllWaypoints();\n" +
    "var numberWaypoints = allWaypoints.length;\nvar addressStr;\n" +
    "if (numberWaypoints > 1) {\n" +
    "addressStr = 'Waypoints: <br>';" +
    "for (var cnt = 0; cnt < numberWaypoints; cnt++)\n{\n addressStr = addressStr + '<br>' + allWaypoints[cnt].getAddress();\n}\n" +
    "}\nelse\n{\n" +
    "addressStr = 'No Waypoints have been created';\n" +
    "}\n" + 
    "displayAlert(addressStr);" +
    "}\n\n";
var directionscode08 = getAllWaypoints + testDirectionsManager1 + "{ callback: getAllWaypoints }" + testDirectionsManager2 + "getAllWaypoints();" +
    testDirectionsManager3;

// Show business disambiguation
var businessDisambiguationWaypoint = "var mcdonaldsWaypoint = new Microsoft.Maps.Directions.Waypoint({ address: 'mcdonalds' });\ndirectionsManager.addWaypoint(mcdonaldsWaypoint);\n";
var businessDisambiguationExample = createDirectionsManager + "\n" + handleDirectionsError + "\n" + showDisambiguation + "\n" + resolveDisambiguation + "\n" +
    "function businessDisambiguationExample()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    clearDirections + createSeattleWaypoint + businessDisambiguationWaypoint + setItineraryContainer + setModeToDriving + calculateDirectionsCall +
    "}\n\n";
var directionscode24 = businessDisambiguationExample + testDirectionsManager1 + "{ callback: businessDisambiguationExample }" + testDirectionsManager2 +
    "businessDisambiguationExample();" + testDirectionsManager3;

// Show location disambiguation
var createAmbiguousSunnyvaleWaypoint = "var ambiguousSunnyvaleWaypoint = new Microsoft.Maps.Directions.Waypoint({ address: '500 Mathilda Ave, Sunnyvale, CA' });\ndirectionsManager.addWaypoint(ambiguousSunnyvaleWaypoint);\n";
var createNonAmbiguousSunnyvaleWaypoint = "var nonambiguousSunnyvaleWaypoint = new Microsoft.Maps.Directions.Waypoint({ address: '241 Charles St, Sunnyvale, CA' });\ndirectionsManager.addWaypoint(nonambiguousSunnyvaleWaypoint);\n";
var locationDisambiguationExample = createDirectionsManager + "\n" + handleDirectionsError + "\n" + showDisambiguation + "\n" + resolveDisambiguation + "\n" +
    "function locationDisambiguationExample()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    clearDirections + createAmbiguousSunnyvaleWaypoint + createNonAmbiguousSunnyvaleWaypoint + setItineraryContainer + setModeToDriving + calculateDirectionsCall +
    "}\n\n";
var directionscode25 = locationDisambiguationExample + testDirectionsManager1 + "{ callback: locationDisambiguationExample }" + testDirectionsManager2 +
    "locationDisambiguationExample();" + testDirectionsManager3;

//set request options
var avoidHighways = "routeAvoidance: Microsoft.Maps.Directions.RouteAvoidance.avoidLimitedAccessHighway";
var setKilometers = "distanceUnit: Microsoft.Maps.Directions.DistanceUnit.kilometers";
var setRequestOptions = "function setRequestOptions()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    "directionsManager.setRequestOptions({ " + setKilometers + ", " + avoidHighways + " });\n" +
    "if (directionsManager.getAllWaypoints().length < 2)\n{\n" +
    createSanFranWaypoint + createWalnutCreekWaypoint +
    "}\n" +
    setModeToDriving + setItineraryContainer + calculateDirectionsCall + 
    "}\n\n";
var directionscode09 = setRequestOptions + testDirectionsManager1 + "{ callback: setRequestOptions }" + testDirectionsManager2 + "setRequestOptions();" +
    testDirectionsManager3;

//get request options
var getRequestOptions = "function getRequestOptions()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    "var requestOptions = directionsManager.getRequestOptions();\n" + 
    "var requestOptionStr = 'Current Transit Time Type: ' + requestOptions.transitOptions.timeType + '<br>' + " +
    "'Current Route Draggable setting: ' + requestOptions.routeDraggable + '<br>' + " + 
    "'Current Avoid Traffic setting: ' + requestOptions.avoidTraffic + '<br>' + " +
    "'Current Route Mode setting: ' + requestOptions.routeMode + '<br>' + " + 
    "'Current Route Distance Unit setting: ' + (requestOptions.distanceUnit == 0?'kilometers':'miles');\n" +
    "displayAlert(requestOptionStr);\n" + 
    "}\n\n";
var directionscode10 = getRequestOptions + testDirectionsManager1 + "{ callback: getRequestOptions }" + testDirectionsManager2 + "getRequestOptions();" +
    testDirectionsManager3;

//set render options
var setShowManeuverIcons = "displayManeuverIcons: false";
var setDrivingPolyineOptions = "drivingPolylineOptions:{ strokeColor: new Microsoft.Maps.Color(150, 255, 51, 51), strokeThickness: 8 }";
var setRenderOptions = "function setRenderOptions()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    clearDirections +
    "directionsManager.setRenderOptions({\n" + setShowManeuverIcons + ", " + setDrivingPolyineOptions + "});\n" +
    genericDrivingSetup + calculateDirectionsCall +
    "}\n\n";
var directionscode11 = setRenderOptions + testDirectionsManager1 + "{ callback: setRenderOptions }" + testDirectionsManager2 + "setRenderOptions();" +
    testDirectionsManager3;

//get render options
var getRenderOptions = "function getRenderOptions()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    "var renderOptions = directionsManager.getRenderOptions();\n" + 
    "var renderOptionStr = 'Current Waypoint Pushpin Icon: ' +  renderOptions.waypointPushpinOptions.icon  + '<br>' + " + 
    "'Current Waypoint Pushpin width: ' +  renderOptions.waypointPushpinOptions.width + '<br>' + " + 
    "'Current Driving Polyine strokecolor: ' +  renderOptions.drivingPolylineOptions.strokeColor;\n" +
    "displayAlert(renderOptionStr);\n" +
    "}\n\n";
var directionscode12 = getRenderOptions + testDirectionsManager1 + "{ callback: getRenderOptions }" + testDirectionsManager2 + "getRenderOptions();" +
    testDirectionsManager3;

//reset/clear directions
var resetDirections = "function resetDirections()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    "directionsManager.resetDirections();\n" +
    "displayAlert('Directions cleared (Waypoints cleared, map/itinerary cleared, request and render options reset to default values)');\n" +
    "}\n\n";
var directionscode13 = resetDirections + testDirectionsManager1 + "{ callback: resetDirections }" + testDirectionsManager2 + "resetDirections();" + testDirectionsManager3;

var clearDisplay = "function clearDisplay()\n{\n" + 
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    "directionsManager.clearDisplay();\n" +
    "displayAlert('Directions cleared (map/itinerary cleared, Waypoints preserved, request and render options preserved)');\n" +
    "}\n\n";
var directionscode14 = clearDisplay + testDirectionsManager1 + "{ callback: clearDisplay }" + testDirectionsManager2 + "clearDisplay();" + testDirectionsManager3;

// reset directions (clears waypoints only)
var clearWaypoints = "function clearWaypoints()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    "directionsManager.resetDirections({ removeAllWaypoints: true });\n" +
    "var allWaypoints =  directionsManager.getAllWaypoints();\n" +
    "var numberWaypoints = allWaypoints.length;\n" +
    "displayAlert('Directions Waypoints cleared<BR>Num of current waypoints: ' + numberWaypoints);\n" +
    "}\n\n";
var directionscode26 = clearWaypoints + testDirectionsManager1 + "{ callback: clearWaypoints }" + testDirectionsManager2 + "clearWaypoints();" + testDirectionsManager3;

// reset directions (clears Request Options settings only)
var clearRequestOptions = "function clearRequestOptions()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    "directionsManager.resetDirections({ resetRequestOptions: true });\n" +
    "var requestOptions = directionsManager.getRequestOptions();\n" +
    "var requestOptionStr = 'Directions Request Options cleared<BR>Current Route Distance Unit setting: ' + (requestOptions.distanceUnit == 0?'kilometers':'miles');\n" +
    "displayAlert(requestOptionStr);\n" +
    "}\n\n";
var directionscode27 = clearRequestOptions + testDirectionsManager1 + "{ callback: clearRequestOptions }" + testDirectionsManager2 + "clearRequestOptions();" + testDirectionsManager3;

// reset directions (clears Render Options settings only)
var clearRenderOptions = "function clearRenderOptions()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    "directionsManager.resetDirections({ resetRenderOptions: true });\n" +
    "var renderOptions = directionsManager.getRenderOptions();\n" +
    "var renderOptionStr = 'Directions Render Options cleared<BR>Current Driving Polyine strokecolor: ' +  renderOptions.drivingPolylineOptions.strokeColor;\n" +
    "displayAlert(renderOptionStr);\n" +
    "}\n\n";
var directionscode28 = clearRenderOptions + testDirectionsManager1 + "{ callback: clearRenderOptions }" + testDirectionsManager2 + "clearRenderOptions();" + testDirectionsManager3;


//Events
var waypointAddedEventObj;
var waypointRemovedEventObj;
var beforeStepRenderEventObj;
var beforeRouteSelectorRenderEventObj;
var beforeSummaryRenderEventObj;

var detachWaypointAddedEvent = "if(waypointAddedEventObj)\n{\nMicrosoft.Maps.Events.removeHandler(waypointAddedEventObj);\nwaypointAddedEventObj=null;\n}\n";
var detachWaypointRemovedEvent = "if(waypointRemovedEventObj)\n{\nMicrosoft.Maps.Events.removeHandler(waypointRemovedEventObj);\nwaypointRemovedEventObj=null;\n}\n";
var detachBeforeStepRenderEvent = "if(beforeStepRenderEventObj)\n{\nMicrosoft.Maps.Events.removeHandler(beforeStepRenderEventObj);\nbeforeStepRenderEventObj=null;\n}\n";
var detachBeforeRouteSelectorRenderEvent = "if(beforeRouteSelectorRenderEventObj)\n{\nMicrosoft.Maps.Events.removeHandler(beforeRouteSelectorRenderEventObj);\nbeforeRouteSelectorRenderEventObj=null;\n}\n";
var detachBeforeSummaryRenderEvent = "if(beforeSummaryRenderEventObj)\n{\nMicrosoft.Maps.Events.removeHandler(beforeSummaryRenderEventObj);\nbeforeSummaryRenderEventObj=null;\n}\n";

// directions updated
var addDirectionsUpdatedEvent = "function addDirectionsUpdatedEvent()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    clearDirections + genericWalkingSetup + detachDirectionsUpdatedEvent +
    "directionsUpdatedEventObj = Microsoft.Maps.Events.addHandler(directionsManager, 'directionsUpdated', function() { displayAlert('Directions updated event fired!!!') });\n" +
    calculateDirectionsCall +
    "}\n\n";
var directionscode15 = addDirectionsUpdatedEvent + testDirectionsManager1 + "{ callback: addDirectionsUpdatedEvent }" + testDirectionsManager2 + "addDirectionsUpdatedEvent();" +
    testDirectionsManager3;

// directions error
var addDirectionsErrorEvent = "function addDirectionsErrorEvent()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    clearDirections + setModeToDriving + setItineraryContainer + createSeattleWaypoint +
    "var honoluluWaypoint = new Microsoft.Maps.Directions.Waypoint({ address: 'Honolulu, HI', location: new Microsoft.Maps.Location(21.304763, -157.857602)});\n" +
    "directionsManager.addWaypoint(honoluluWaypoint);\n" +
    detachDirectionsErrorEvent +
    "directionsErrorEventObj = Microsoft.Maps.Events.addHandler(directionsManager, 'directionsError', function(arg) { handleDirectionsError(arg)});\n" +
    calculateDirectionsCall +
    "}\n\n";
var directionscode16 = addDirectionsErrorEvent + testDirectionsManager1 + "{ callback: addDirectionsErrorEvent }" + testDirectionsManager2 +
    "addDirectionsErrorEvent();" + testDirectionsManager3;
    
// waypoint added
var addWaypointAddedEvent = "function addWaypointAddedEvent()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    clearDirections + detachWaypointAddedEvent +
    "waypointAddedEventObj = Microsoft.Maps.Events.addHandler(directionsManager, 'waypointAdded', function() { displayAlert('Directions waypointAdded event fired!') });\n" +
    createBellevueWaypoint +
    "}\n\n";
var directionscode17 = addWaypointAddedEvent + testDirectionsManager1 + "{ callback: addWaypointAddedEvent }" + testDirectionsManager2 + "addWaypointAddedEvent();" +
    testDirectionsManager3;

// waypoint removed
var addRemoveWaypointEvent = "function addRemoveWaypointEvent()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    detachWaypointRemovedEvent + checkIfThreeWaypoints +
    "waypointRemovedEventObj = Microsoft.Maps.Events.addHandler(directionsManager, 'waypointRemoved', function() { displayAlert('Directions waypointRemoved event fired!') });\n" +
    "directionsManager.removeWaypoint(0);\n" +
    "}\n\n";
var directionscode18 = addRemoveWaypointEvent + testDirectionsManager1 + "{ callback: addRemoveWaypointEvent }" + testDirectionsManager2 +
    "addRemoveWaypointEvent();" + testDirectionsManager3;

// before step render
var addBeforeStepRenderEvent = "function addBeforeStepRenderEvent()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    clearDirections + detachBeforeStepRenderEvent + 
    "beforeStepRenderEventObj = Microsoft.Maps.Events.addHandler(directionsManager, 'beforeStepRender', function(arg)" +
    "{ arg.handled=true; arg.containerElement.innerHTML = '<div style=background-color:#EEEEEE>' + arg.step.formattedText + '</div>'; });\n" +
    createSanFranWaypoint + createSeattleWaypoint + setModeToDriving + setItineraryContainer + calculateDirectionsCall +
    "}\n\n";
var directionscode19 = addBeforeStepRenderEvent + testDirectionsManager1 + "{ callback: addBeforeStepRenderEvent }" + testDirectionsManager2 +
    "addBeforeStepRenderEvent();" + testDirectionsManager3;

// before route selector render
var addBeforeRouteSelectorRenderEvent = "function addBeforeRouteSelectorRenderEvent()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    clearDirections + detachBeforeRouteSelectorRenderEvent +
    "beforeRouteSelectorRenderEventObj = Microsoft.Maps.Events.addHandler(directionsManager, 'beforeRouteSelectorRender', function(arg)" +
    "{ arg.handled=false; arg.containerElement.innerHTML = '<div style=background-color:#FFCCCC>Choice ' + (arg.routeIndex + 1) + '</div>'; });\n" +
    genericTransitSetup + calculateDirectionsCall +
    "}\n\n";
var directionscode20 = addBeforeRouteSelectorRenderEvent + testDirectionsManager1 + "{ callback: addBeforeRouteSelectorRenderEvent }" + testDirectionsManager2 +
    "addBeforeRouteSelectorRenderEvent();" + testDirectionsManager3;

// before summary render
var addBeforeSummaryRenderEvent = "function addBeforeSummaryRenderEvent()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    clearDirections + detachBeforeSummaryRenderEvent +
    "beforeSummaryRenderEventObj = Microsoft.Maps.Events.addHandler(directionsManager, 'beforeSummaryRender', function(arg)" +
    "{ arg.handled=true; arg.containerElement.innerHTML = '<div style=background-color:#CCCCFF>Summary</div>'; });\n" +
    genericDrivingSetup + calculateDirectionsCall +
    "}\n\n";
var directionscode21 = addBeforeSummaryRenderEvent + testDirectionsManager1 + "{ callback: addBeforeSummaryRenderEvent }" + testDirectionsManager2 +
    "addBeforeSummaryRenderEvent();" + testDirectionsManager3;

//detach all events
var detachEvents = "function detachEvents()\n{\n" +
     "if (!directionsManager) { createDirectionsManager(); }\n" +
     detachDirectionsUpdatedEvent + detachDirectionsErrorEvent + detachBeforeSummaryRenderEvent +
    detachBeforeRouteSelectorRenderEvent + detachWaypointAddedEvent + detachWaypointRemovedEvent +
    detachBeforeStepRenderEvent +
    "displayAlert('All directions events detached');\n" +
    "}\n\n";
var directionscode22 = detachEvents + testDirectionsManager1 + "{ callback: detachEvents }" + testDirectionsManager2 + "detachEvents();" + testDirectionsManager3;
    
//dispose direction object
var disposeDirections = "function disposeDirections()\n{\n" +
    "if (!directionsManager) { createDirectionsManager(); }\n" +
    "directionsManager.dispose();\n" +
    "displayAlert('Directions Manager object disposed');\n" +
    "directionsManager = null;\n" +
    "}\n\n";
var directionscode23 = disposeDirections + testDirectionsManager1 + "{ callback: disposeDirections }" + testDirectionsManager2 + "disposeDirections();" +
    testDirectionsManager3;
 


function AddMessage(s) {
    var ele = document.getElementById("ve_comments");
    if (ele) {
        ele.innerHTML = s + "<br>" + ele.innerHTML;
    }
}

// venue maps
var venueMap = null;
var venueMapDirectoryDiv = null;
var venueMapDirectoryMouseOverHandler = null;
var venueMapDirectoryMouseOutHandler = null;
var venueMapDirectoryMouseClickHandler = null;
var venueMapFactory = null;
var venuemapcode0 = // load venue map 
        "Microsoft.Maps.loadModule('Microsoft.Maps.VenueMaps', \n"+
        "                           { callback: function() { \n" +
        "                                           venueMapFactory = new Microsoft.Maps.VenueMaps.VenueMapFactory(map); \n" +
        //"                                           displayAlert('Venue Maps module Loaded'); \n" +
        "                                       } \n"+
        "                           });";

var venuemapcode1 = // create venue map 
        "if(venueMapFactory) { \n" +
        "   venueMapFactory.create({venueMapId:'bingmapsteam-bellevuesquare', \n"+
        "                               success: function(vm, args) {venueMap = vm;}, \n"+
        "                               error: function(errorCode, args) { displayAlert('venue map not created - Error : ' + errorCode); } }); \n" +
        "}\n" +
        "else { \n" +
        "   displayAlert('venue map is not loaded. cannot create a venue map'); \n" +
        "}";
var venuemapcode2 = // display venue map  
            "Microsoft.Maps.loadModule('Microsoft.Maps.VenueMaps', { callback: function () { \n"+
            "   venueMapFactory = new Microsoft.Maps.VenueMaps.VenueMapFactory(map); \n"+
            "   venueMapFactory.create({ venueMapId: 'bingmapsteam-bellevuesquare', \n"+
            "                               success: function (vm, args) { venueMap = vm; venueMap.show(); map.setView(venueMap.bestMapView); }, \n" +
            "                               error: function (errorCode, args) { displayAlert('venue map not created - Error : ' + errorCode); } \n" +
            "    });\n"+
            "}});"
var venuemapcode3 = // hide venue map  
        "if (venueMap) { \n" +
        "   venueMap.hide(); \n" +
        "   displayAlert('venue map is hidden'); \n" +
        "} \n" +
        "else \n" +
        "   displayAlert('Unable to perform action, no active venue map found');";
var venuemapcode4 = // get current floor 
        "if (venueMap) \n" +
        "   displayAlert('Active floor : ' + venueMap.getActiveFloor()); \n" +
        "else \n" +
        "   displayAlert('Unable to perform action, no active venue map found');";
var venuemapcode5 = // set a new floor 
        "if (venueMap) { \n" +
        "    venueMap.setActiveFloor('Level 2');  \n" +
        "    displayAlert('Active floor changed'); } \n" +
         "else \n" +
        "   displayAlert('Unable to perform action, no active venue map found');";
var venuemapcode6 = // venuemap info 
          "if (venueMap) { \n " +
          "     var venue = 'Name : ' + venueMap.name + '<br/>'  + \n" +
          "                 'Type : ' + venueMap.type + '<br/>' + \n" +
          "                 'Phone:' + venueMap.phoneNumber + '<br/>' + \n" +
          "                 'Address:' + venueMap.address + '<br/>' + \n" +
          "                 'Id:' + venueMap.id + '<br/>' + \n" +
          "                 'YPId:' + venueMap.businessId + '<br/>' + \n" +
          "                 'Location:' + venueMap.center + '<br/>' + \n" +
          "                 'LOD:' + venueMap.bestMapView.zoom + '<br/>' + \n" +
          "                 'Default Floor : ' + venueMap.defaultFloor + '<br/>' + \n" +
          "                 'Floor Header : ' +venueMap.floorHeader + '<br/>'; \n\n " +

          "     for(floorName in venueMap.floors){ \n " +
          "             venue = venue +  '<br/>' + \n" +
          "                     'Floor = '  + venueMap.floors[floorName].name + '<br/>' +\n" +
          "                     'Zoom Range: '  + venueMap.floors[floorName].zoomRange + '<br/>';  \n\n" +

          "             for(var i in venueMap.floors[floorName].primitives){ \n" +
          "                     venue = venue + '<br/>'+ \n" +
          "                             'Name : '  +  venueMap.floors[floorName].primitives[i].name + '<br/>' +\n" +
          "                             'Id : '  +  venueMap.floors[floorName].primitives[i].id + '<br/>' + \n" +
          "                             'YPID: '  + venueMap.floors[floorName].primitives[i].businessId + '<br/>' + \n" +
          "                             'Category Name: '  + venueMap.floors[floorName].primitives[i].categoryName + '<br/>' + \n" +
          "                             'Category Id: '  + venueMap.floors[floorName].primitives[i].categoryId+ '<br/>' +  \n" +
          "                             'Center: '  + venueMap.floors[floorName].primitives[i].center + '<br/>' + \n" +
          "                             'Bounds: '  + venueMap.floors[floorName].primitives[i].bounds + '<br/>' + \n" +
          "                             'LOD: '  + venueMap.floors[floorName].primitives[i].optimalZoom(0.8) + '<br/>' + \n" +
          "                             'Floor: '  + venueMap.floors[floorName].primitives[i].floor.name + '<br/>'; \n" +
          "             } \n" +
          "             displayAlert('Venue Map Info <br/>'+venue); \n" +
          "      } \n" +
          "} \n" +
          "else \n" +
	      "     displayAlert('Unable to perform action, no active venue map found');\n";

var venuemapcode7 = // get nearby venuemaps 
            "if (venueMap){ \n" +
            "   venueMapFactory.getNearbyVenues({ location:map.getCenter(), radius: 10000, callback: function(venues) { \n" +
            "   var venue = 'Number of Venues : ' + venues.length + '<br/><br/>'; \n" +
            "   var ctr = 0; \n" +
            "   for (var i in venues){ \n" +
            "       var ctr = ctr+1; \n" +
            "       venue = venue + 'Venue#' + ctr + '<br/>'  + \n" +
            "                   'Name : ' + venues[i].metadata.Name + '<br/>' + \n" +
            "                   'MapId : ' + venues[i].metadata.MapId + '<br/>' + \n" +
            "                   'MapType : ' + venues[i].metadata.MapType+ '<br/>' + \n" +
            "                   'DefaultFloor : ' + venues[i].metadata.DefaultFloor + '<br/>' + \n" +
            "                   'FloorHeader : ' + venues[i].metadata.FloorHeader + '<br/>' + \n" +
            "                   'Footprint Polygon Counts: ' + venues[i].metadata.Footprint.Polygons.length + '<br/>' + \n" +
            "                   'Footprint Lod Range: ' + venues[i].metadata.Footprint.LodRange + '<br/>' + \n" +
            "                   'Footprint Transform: ' + venues[i].metadata.Footprint.Transform + '<br/><br/>'; \n " +
            "   } \n" +
            "   displayAlert('Nearby Venues <br/>'+venue); \n" +
            "   }}); \n" +
            "} \n" +
            "else \n" +
            "   displayAlert('Unable to perform action, no active venue map found');";

var venuemapcode8 = // click event 
            "if (venueMap){ \n" +
            "   clickHandler = Microsoft.Maps.Events.addHandler(venueMap, 'click', function (p) { \n" +
            "                   displayAlert('Clicked Place <br/>' + \n" +
            "                   'Name : ' +  p.name  + '<br/>' +  \n" +
            "                   'Id: ' +  p.id+ '<br/>' +  \n" +
            "                   'YPId : ' +  p.businessId  + '<br/>' +  \n" +
            "                   'Category Name : ' +  p.categoryName + '<br/>' + \n" +
            "                   'Category Id : ' +  p.categoryId + '<br/>' + \n" +
            "                   'Optimal Zoom: ' + p.optimalZoom(0.8) + '<br/>' + \n" +
            "                   'Floor: ' + p.floor.name + '<br/>' + \n" +
            "                   'Center : ' +  p.center  + '<br/>' + \n" +
            "                   'Coordinates : ' +  p.locations + '<br/>' + \n" +
            "                   'Bounding Box: ' + p.bounds); \n" +
            "                   p.highlight(); \n" +
            "               }); \n" +
            "   displayAlert('Click to get Info'); \n" +
            "} \n" +
            "else \n" +
            "   displayAlert('Unable to perform action, no active venue map found');";

var venuemapcode9 = // mouse over event
            "if (venueMap){ \n" +
            "   mouseOverHandler = Microsoft.Maps.Events.addHandler(venueMap, 'mouseover', function (p) { \n" +
            "                       displayAlert('Mouse Over Place <br/>' + \n" +
            "                       'Name : ' +  p.name  + '<br/>' +  \n" +
            "                       'Id: ' +  p.id+ '<br/>' +  \n" +
            "                       'YPId : ' +  p.businessId  + '<br/>' +  \n" +
            "                       'Category Name : ' +  p.categoryName + '<br/>' + \n" +
            "                       'Category Id : ' +  p.categoryId + '<br/>' + \n" +
            "                       'Optimal Zoom: ' + p.optimalZoom(0.8) + '<br/>' + \n" +
            "                       'Floor: ' + p.floor.name + '<br/>' + \n" +
            "                       'Center : ' +  p.center  + '<br/>' + \n" +
            "                       'Coordinates : ' +  p.locations + '<br/>' + \n" +
            "                       'Bounding Box: ' + p.bounds); \n" +
            "                       p.highlight(); \n" +
            "                   }); \n" +
            "   displayAlert('Mouse over to get Info'); \n" +
            "} \n" +
            "else \n" +
            "   displayAlert('Unable to perform action, no active venue map found');";

var venuemapcode10 = // mouse out event
            "if (venueMap){ \n" +
            "   mouseOutHandler = Microsoft.Maps.Events.addHandler(venueMap, 'mouseout', function (p) { \n" +
            "                       displayAlert('Mouse out of Place <br/>' + \n" +
            "                       'Name : ' +  p.name  + '<br/>' +  \n" +
            "                       'Id: ' +  p.id+ '<br/>' +  \n" +
            "                       'YPId : ' +  p.businessId  + '<br/>' +  \n" +
            "                       'Category Name : ' +  p.categoryName + '<br/>' + \n" +
            "                       'Category Id : ' +  p.categoryId + '<br/>' + \n" +
            "                       'Optimal Zoom: ' + p.optimalZoom(0.8) + '<br/>' + \n" +
            "                       'Floor: ' + p.floor.name + '<br/>' + \n" +
            "                       'Center : ' +  p.center  + '<br/>' + \n" +
            "                       'Coordinates : ' +  p.locations + '<br/>' + \n" +
            "                       'Bounding Box: ' + p.bounds); \n" +
            "                       p.unhighlight(); \n" +
            "                   }); \n" +
            "   displayAlert('Mouse out to get Info'); \n" +
            "} \n" +
            "else \n" +
            "   displayAlert('Unable to perform action, no active venue map found');";

var venuemapcode11 = // footprint click event 
            "if (venueMap){ \n" +
            "      footprint = Microsoft.Maps.Events.addHandler(venueMap, 'footprintclick', function (e) { \n" +
            "                       displayAlert('Footprint clicked'); \n" +
            "                  }); \n" +
            "} \n" +
            "else \n" +
            "   displayAlert('Unable to perform action, no active venue map found');";

var venuemapcode12 = // remove all events  
        "if (typeof (clickHandler) != 'undefined') \n"+
        "   Microsoft.Maps.Events.removeHandler(clickHandler); \n"+
        "if (typeof (mouseOverHandler) != 'undefined') \n"+
        "   Microsoft.Maps.Events.removeHandler(mouseOverHandler); \n"+
        "if (typeof (mouseOutHandler) != 'undefined') \n"+
        "   Microsoft.Maps.Events.removeHandler(mouseOutHandler); \n"+
        "if (typeof (closeHandler) != 'undefined') \n"+
        "   Microsoft.Maps.Events.removeHandler(closeHandler); \n"+
        "if (typeof (footprint) != 'undefined') \n"+
        "   Microsoft.Maps.Events.removeHandler(footprint);  \n"+
        "displayAlert('Active events handlers removed');";

function AddDirectory()
{
	if (venueMap)
	{
		if (!venueMapDirectoryDiv)
		{
			createVenueMapDirectoryDiv();
			venueMap.directory.createUIElements();
		}
		if (!document.body.contains(venueMapDirectoryDiv))
		{
			document.body.appendChild(venueMapDirectoryDiv);
		}
		venueMap.directory.addToDOM(venueMapDirectoryDiv, Microsoft.Maps.VenueMaps.DirectorySortOrder.alphabetical, Microsoft.Maps.VenueMaps.DirectoryGrouping.none);
		venueMap.directory.setHeight(680);
	}

	function createVenueMapDirectoryDiv()
	{
		var div = document.createElement('div');
		div.id = 'venue_map_directory';
		div.style.position = 'absolute';
		div.style.left = '1180px';
		div.style.top = '120px';
		div.style.width = '300px';
		div.style.border = '2px solid black';
		venueMapDirectoryDiv = div;
	}
}

function RemoveDirectory()
{
	if (venueMap)
	{
		venueMap.directory.removeFromDOM();
		if (document.body.contains(venueMapDirectoryDiv))
		{
			document.body.removeChild(venueMapDirectoryDiv);
		}
		displayAlert('');
		if (venueMapDirectoryMouseClickHandler)
		{
			Microsoft.Maps.Events.removeHandler(venueMapDirectoryMouseClickHandler);
			venueMapDirectoryMouseClickHandler = null;
		}
		if (venueMapDirectoryMouseOverHandler)
		{
			Microsoft.Maps.Events.removeHandler(venueMapDirectoryMouseOverHandler);
			venueMapDirectoryMouseOverHandler = null;
		}
		if (venueMapDirectoryMouseOutHandler)
		{
			Microsoft.Maps.Events.removeHandler(venueMapDirectoryMouseOutHandler);
			venueMapDirectoryMouseOutHandler = null
		}
	}
}

function DirectoryMouseOver()
{
	if (venueMap && !venueMapDirectoryMouseOverHandler)
	{
		venueMapDirectoryMouseOverHandler = Microsoft.Maps.Events.addHandler(venueMap.directory, 'mouseover', function (e)
		{
			var p = e.primitive;
			venueMap.directory.handleMouseOver(e); // call base method
			displayAlert('Mouse Over <br/>' +
                'Name : ' + p.name + '<br/>' +
                'Id: ' + p.id + '<br/>' +
                'YPId : ' + p.businessId + '<br/>' +
                'Category Name : ' + p.categoryName + '<br/>' +
                'Category Id : ' + p.categoryId + '<br/>' +
                'Optimal Zoom: ' + p.optimalZoom(0.8) + '<br/>' +
                'Floor: ' + p.floor.name + '<br/>' +
                'Center : ' + p.center + '<br/>' +
                'Coordinates : ' + p.locations + '<br/>' +
                'Bounding Box: ' + p.bounds);
		});
	}
}

function DirectoryMouseOut()
{
	if (venueMap && !venueMapDirectoryMouseOutHandler)
	{
		venueMapDirectoryMouseOutHandler = Microsoft.Maps.Events.addHandler(venueMap.directory, 'mouseout', function (e)
		{
			var p = e.primitive;
			venueMap.directory.handleMouseOut(e); // call base method
			displayAlert('Mouse Out <br/>' +
                'Name : ' + p.name + '<br/>' +
                'Id: ' + p.id + '<br/>' +
                'YPId : ' + p.businessId + '<br/>' +
                'Category Name : ' + p.categoryName + '<br/>' +
                'Category Id : ' + p.categoryId + '<br/>' +
                'Optimal Zoom: ' + p.optimalZoom(0.8) + '<br/>' +
                'Floor: ' + p.floor.name + '<br/>' +
                'Center : ' + p.center + '<br/>' +
                'Coordinates : ' + p.locations + '<br/>' +
                'Bounding Box: ' + p.bounds);
		});
	}
}

function DirectoryMouseClick()
{
	if (venueMap && !venueMapDirectoryMouseClickHandler)
	{
		venueMapDirectoryMouseClickHandler = Microsoft.Maps.Events.addHandler(venueMap.directory, 'click', function (e)
		{
			var p = e.primitive;
			venueMap.directory.handleMouseClick(e); // call base method
			displayAlert('Clicked Store <br/>' +
                'Name : ' + p.name + '<br/>' +
                'Id: ' + p.id + '<br/>' +
                'YPId : ' + p.businessId + '<br/>' +
                'Category Name : ' + p.categoryName + '<br/>' +
                'Category Id : ' + p.categoryId + '<br/>' +
                'Optimal Zoom: ' + p.optimalZoom(0.8) + '<br/>' +
                'Floor: ' + p.floor.name + '<br/>' +
                'Center : ' + p.center + '<br/>' +
                'Coordinates : ' + p.locations + '<br/>' +
                'Bounding Box: ' + p.bounds);
		});
	}
}

var navbarcode0 = // load new nav bar 
        "Microsoft.Maps.loadModule('Microsoft.Maps.Overlays.Style', \n" +
        "                           { callback: function() { \n" +
        "                                           map = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', customizeOverlays: true}); \n" +
        "                                       } \n"+
        "                           });";

var navbarcode1 = // load new nav bar 
        "Microsoft.Maps.loadModule('Microsoft.Maps.Overlays.Style', \n" +
        "                           { callback: function() { \n" +
        "                                           map = new Microsoft.Maps.Map(document.getElementById('SDKmap'), {credentials: 'Your Bing Maps Key', customizeOverlays: true, showBreadcrumb: true}); \n" +
        "                                       } \n" +
        "                           });";

var bingThemeCode0 = "Microsoft.Maps.loadModule('Microsoft.Maps.Themes.BingTheme', { callback: function() \n\
{\n\
    map = new Microsoft.Maps.Map(document.getElementById('SDKmap'), \n\
    { \n\
         credentials: 'Your Bing Maps Key', \n\
         theme: new Microsoft.Maps.Themes.BingTheme() \n\
    }); \n\
}});";

var bingThemeCode1 = "Microsoft.Maps.loadModule('Microsoft.Maps.Themes.BingTheme', { callback: function() \n\
{\n\
    map = new Microsoft.Maps.Map(document.getElementById('SDKmap'), \n\
    { \n\
         credentials: 'Your Bing Maps Key', \n\
         theme: new Microsoft.Maps.Themes.BingTheme() \n\
    }); \n\
    map.entities.push(new Microsoft.Maps.Pushpin(map.getCenter(), null)); \n\
}});";

var bingThemeCode2 = "Microsoft.Maps.loadModule('Microsoft.Maps.Themes.BingTheme', { callback: function() \n\
{\n\
    map = new Microsoft.Maps.Map(document.getElementById('SDKmap'), \n\
    { \n\
         credentials: 'Your Bing Maps Key', \n\
         theme: new Microsoft.Maps.Themes.BingTheme() \n\
    }); \n\
    map.entities.push(new Microsoft.Maps.Pushpin(map.getCenter(), {typeName: 'micro'})); \n\
}});";

var bingThemeCode3 = "function handlerEvent() \n\
{ \n\
     displayAlert('Handler clicked'); \n\
} \n\
Microsoft.Maps.loadModule('Microsoft.Maps.Themes.BingTheme', { callback: function() \n\
{\n\
    map = new Microsoft.Maps.Map(document.getElementById('SDKmap'), \n\
    { \n\
         credentials: 'Your Bing Maps Key', \n\
         theme: new Microsoft.Maps.Themes.BingTheme() \n\
    }); \n\
    var infoboxOptions = {title:'Infobox Title', description:'Infobox description', actions:[{label: 'Click Handler', eventHandler: handlerEvent}]}; \n\
    map.entities.push(new Microsoft.Maps.Infobox(map.getCenter(), infoboxOptions)); \n\
}});";

var bingThemeCode4 = "Microsoft.Maps.loadModule('Microsoft.Maps.Themes.BingTheme', { callback: function() \n\
{\n\
    map = new Microsoft.Maps.Map(document.getElementById('SDKmap'), \n\
    { \n\
         credentials: 'Your Bing Maps Key', \n\
         theme: new Microsoft.Maps.Themes.BingTheme() \n\
    }); \n\
    var pin1 = new Microsoft.Maps.Pushpin(new Microsoft.Maps.Location(34.05, -118.24), null); \n\
    map.entities.push(pin1); \n\
    map.entities.push(new Microsoft.Maps.Infobox(new Microsoft.Maps.Location(34.05, -118.24), {title: 'Los Angeles', description: 'description here', pushpin: pin1})); \n\
    var pin2 = new Microsoft.Maps.Pushpin(new Microsoft.Maps.Location(51.50, -0.127), null); \n\
    map.entities.push(pin2); \n\
    map.entities.push(new Microsoft.Maps.Infobox(new Microsoft.Maps.Location(51.50, -0.127), {title: 'London', description: 'description here', pushpin: pin2})); \n\
}});";

var bingThemeCode5 = "Microsoft.Maps.loadModule('Microsoft.Maps.Themes.BingTheme', { callback: function() \n\
{\n\
    map = new Microsoft.Maps.Map(document.getElementById('SDKmap'), \n\
    { \n\
         credentials: 'Your Bing Maps Key', \n\
         theme: new Microsoft.Maps.Themes.BingTheme() \n\
    }); \n\
    var latlon = map.getCenter(); \n\
    var polygon = new Microsoft.Maps.Polygon([new Microsoft.Maps.Location(latlon.latitude, latlon.longitude-0.15), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude-0.05), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude+0.05), new Microsoft.Maps.Location(latlon.latitude, latlon.longitude+0.15), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude+0.05), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude-0.05), new Microsoft.Maps.Location(latlon.latitude, latlon.longitude-0.15)], null); \n\
    var infobox = new Microsoft.Maps.Infobox(new Microsoft.Maps.Location(latlon.latitude, latlon.longitude-0.15), {title: 'Polygon#1', description: 'Polygon with Bing theme',  polygon: polygon } );  \n\
    map.entities.push(infobox); \n\
    map.setView( {zoom:7}); \n\
    map.entities.push(polygon); \n\
    latlon = new Microsoft.Maps.Location(-1,1); \n\
    polygon = new Microsoft.Maps.Polygon([new Microsoft.Maps.Location(latlon.latitude, latlon.longitude-0.15), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude-0.05), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude+0.05), new Microsoft.Maps.Location(latlon.latitude, latlon.longitude+0.15), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude+0.05), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude-0.05), new Microsoft.Maps.Location(latlon.latitude, latlon.longitude-0.15)], null); \n\
    infobox = new Microsoft.Maps.Infobox(new Microsoft.Maps.Location(latlon.latitude, latlon.longitude-0.15), {title: 'Polygon#2', description: 'Polygon with Bing theme',  polygon: polygon } ); \n\
    map.entities.push(infobox); \n\
    map.entities.push(polygon); \n\
}});";

var searchManager = null;
var currInfobox = null;
function createSearchManager()
{
    if (!searchManager)
    {
        map.addComponent('searchManager', new Microsoft.Maps.Search.SearchManager(map));
        searchManager = map.getComponent('searchManager');
    }
}

var searchCode0 = "function createSearchManager() \n\
{\n\
    if (!searchManager) \n\
    {\n\
        map.addComponent('searchManager', new Microsoft.Maps.Search.SearchManager(map)); \n\
        searchManager = map.getComponent('searchManager'); \n\
        displayAlert('Search module loaded'); \n\
    }\n\
}\n\
Microsoft.Maps.loadModule('Microsoft.Maps.Search', { callback: createSearchManager })"; 


var searchCode1 = "function geocodeRequest() \n\
{ \n\
    createSearchManager(); \n\
    var where = 'Denver, CO'; \n\
    var userData = { name: 'Maps Test User', id: 'XYZ' }; \n\
    var request = \n\
    { \n\
        where: where, \n\
        count: 5, \n\
        bounds: map.getBounds(), \n\
        callback: onGeocodeSuccess, \n\
        errorCallback: onGeocodeFailed, \n\
        userData: userData \n\
    }; \n\
    searchManager.geocode(request); \n\
} \n\
function onGeocodeSuccess(result, userData) \n\
{ \n\
    if (result) { \n\
        map.entities.clear(); \n\
        var topResult = result.results && result.results[0]; \n\
        if (topResult) { \n\
            var pushpin = new Microsoft.Maps.Pushpin(topResult.location, null); \n\
            map.setView({ center: topResult.location, zoom: 10 }); \n\
            map.entities.push(pushpin); \n\
        } \n\
    } \n\
} \n\
function onGeocodeFailed(result, userData) { \n\
    displayAlert('Geocode failed'); \n\
} \n\
\n\
if (searchManager) \n\
{ \n\
    geocodeRequest(); \n\
} \n\
else \n\
{ \n\
    Microsoft.Maps.loadModule('Microsoft.Maps.Search', { callback: geocodeRequest }); \n\
}";

var searchCode2 = "function reverseGeocodeRequest() \n\
{ \n\
    createSearchManager(); \n\
    var userData = { name: 'Maps Test User', id: 'XYZ' }; \n\
    map.setView({zoom: 10}); \n\
    var request = \n\
    { \n\
	    location: new Microsoft.Maps.Location(40.71, -74.00), \n\
	    callback: onReverseGeocodeSuccess, \n\
	    errorCallback: onReverseGeocodeFailed, \n\
	    userData: userData \n\
    }; \n\
    searchManager.reverseGeocode(request); \n\
} \n\
function onReverseGeocodeSuccess(result, userData) \n\
{ \n\
    if (result) \n\
    { \n\
        map.entities.clear(); \n\
        var pushpin = new Microsoft.Maps.Pushpin(result.location, null); \n\
        map.setView({ center: result.location, zoom: 10 }); \n\
        map.entities.push(pushpin); \n\
        displayAlert('Location found : ' + result.name); \n\
    } \n\
    else \n\
    { \n\
        displayAlert('no Location found, try panning map'); \n\
    } \n\
} \n\
function onReverseGeocodeFailed(result, userData) \n\
{ \n\
    displayAlert('Rev geocode failed'); \n\
} \n\
\n\
if (searchManager) \n\
{ \n\
    reverseGeocodeRequest(); \n\
} \n\
else \n\
{ \n\
    Microsoft.Maps.loadModule('Microsoft.Maps.Search', { callback: reverseGeocodeRequest }); \n\
}";

var searchCode3 = "function searchRequest() \n\
{ \n\
    displayAlert('Searching...'); \n\
    createSearchManager(); \n\
    var what = 'pizza'; \n\
    var userData = { name: 'Maps Test User', id: 'XYZ' }; \n\
    var where = 'boston, ma'; \n\
    var request = \n\
        { \n\
            what: what, \n\
            where: where, \n\
            count: 10, \n\
            startIndex: 0, \n\
            bounds: map.getBounds(), \n\
            callback: search_onSearchSuccess, \n\
            errorCallback: search_onSearchFailure, \n\
            userData: userData \n\
        }; \n\
    searchManager.search(request); \n\
 } \n\
function search_onSearchSuccess(result, userData) \n\
{ \n\
    map.entities.clear(); \n\
    var searchResults = result && result.searchResults; \n\
    if (searchResults) { \n\
        for (var i = 0; i < searchResults.length; i++) { \n\
            search_createMapPin(searchResults[i]); \n\
        } \n\
        if (result.searchRegion && result.searchRegion.mapBounds) { \n\
            map.setView({ bounds: result.searchRegion.mapBounds.locationRect }); \n\
            displayAlert('Search results displayed'); \n\
        } \n\
        else \n\
        { \n\
            displayAlert('No results returned, Please try after sometime.'); \n\
        } \n\
    } \n\
} \n\
function search_createMapPin(result) \n\
{ \n\
    if (result) { \n\
        var pin = new Microsoft.Maps.Pushpin(result.location, null); \n\
        Microsoft.Maps.Events.addHandler(pin, 'click', function () { search_showInfoBox(result) }); \n\
        map.entities.push(pin); \n\
    } \n\
} \n\
function search_showInfoBox(result) \n\
{ \n\
    if (currInfobox) { \n\
        currInfobox.setOptions({ visible: true }); \n\
        map.entities.remove(currInfobox); \n\
    } \n\
    currInfobox = new Microsoft.Maps.Infobox( \n\
        result.location, \n\
        { \n\
            title: result.name, \n\
            description: [result.address, result.city, result.state, result.country, result.phone].join(' '), \n\
            showPointer: true, \n\
            titleAction: null, \n\
            titleClickHandler: null \n\
        }); \n\
    currInfobox.setOptions({ visible: true }); \n\
    map.entities.push(currInfobox); \n\
} \n\
function search_onSearchFailure(result, userData) \n\
{ \n\
    displayAlert('Search failed'); \n\
} \n\
if (searchManager) \n\
{ \n\
    searchRequest(); \n\
} \n\
else \n\
{ \n\
    Microsoft.Maps.loadModule('Microsoft.Maps.Search', { callback: searchRequest }); \n\
}";

var searchCode4 = "function searchRequest() \n\
{ \n\
    displayAlert('Searching...'); \n\
    createSearchManager(); \n\
    var userData = { name: 'Maps Test User', id: 'XYZ' }; \n\
    var query = 'flowers in Los Angeslas, CA'; \n\
    var request = \n\
        { \n\
            query: query, \n\
            count: 10, \n\
            startIndex: 0, \n\
            bounds: map.getBounds(), \n\
            callback: search_onSearchSuccess, \n\
            errorCallback: search_onSearchFailure, \n\
            userData: userData \n\
        }; \n\
    searchManager.search(request); \n\
 } \n\
function search_onSearchSuccess(result, userData) \n\
{ \n\
    map.entities.clear(); \n\
    var searchResults = result && result.searchResults; \n\
    if (searchResults) { \n\
        for (var i = 0; i < searchResults.length; i++) { \n\
            search_createMapPin(searchResults[i]); \n\
        } \n\
        if (result.searchRegion && result.searchRegion.mapBounds) { \n\
            map.setView({ bounds: result.searchRegion.mapBounds.locationRect }); \n\
             displayAlert('Search results displayed'); \n\
        } \n\
        else \n\
        { \n\
            displayAlert('No results returned, Please try after sometime.'); \n\
        } \n\
    } \n\
} \n\
function search_createMapPin(result) \n\
{ \n\
    if (result) { \n\
        var pin = new Microsoft.Maps.Pushpin(result.location, null); \n\
        Microsoft.Maps.Events.addHandler(pin, 'click', function () { search_showInfoBox(result) }); \n\
        map.entities.push(pin); \n\
    } \n\
} \n\
function search_showInfoBox(result) \n\
{ \n\
    if (currInfobox) { \n\
        currInfobox.setOptions({ visible: true }); \n\
        map.entities.remove(currInfobox); \n\
    } \n\
    currInfobox = new Microsoft.Maps.Infobox( \n\
        result.location, \n\
        { \n\
            title: result.name, \n\
            description: [result.address, result.city, result.state, result.country, result.phone].join(' '), \n\
            showPointer: true, \n\
            titleAction: null, \n\
            titleClickHandler: null \n\
        }); \n\
    currInfobox.setOptions({ visible: true }); \n\
    map.entities.push(currInfobox); \n\
} \n\
function search_onSearchFailure(result, userData) \n\
{ \n\
    displayAlert('Search failed'); \n\
} \n\
if (searchManager) \n\
{ \n\
    searchRequest(); \n\
} \n\
else \n\
{ \n\
    Microsoft.Maps.loadModule('Microsoft.Maps.Search', { callback: searchRequest }); \n\
}";

var advancedShape0 = "function createPolygon() \n\
{\n\
    map.entities.clear(); \n\
    latlon = map.getCenter(); \n\
    var polygon = new Microsoft.Maps.Polygon([ \n\
                        [new Microsoft.Maps.Location(latlon.latitude, latlon.longitude-0.15), new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude-0.05), \n\
                            new Microsoft.Maps.Location(latlon.latitude+0.1, latlon.longitude+0.05), new Microsoft.Maps.Location(latlon.latitude, latlon.longitude+0.15), \n\
                            new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude+0.05), new Microsoft.Maps.Location(latlon.latitude-0.1, latlon.longitude-0.05), \n\
                            new Microsoft.Maps.Location(latlon.latitude, latlon.longitude-0.15)], \n\
                        [new Microsoft.Maps.Location(latlon.latitude, latlon.longitude-0.1), new Microsoft.Maps.Location(latlon.latitude+0.05, latlon.longitude-0.05), \n\
                            new Microsoft.Maps.Location(latlon.latitude+0.05, latlon.longitude+0.05), new Microsoft.Maps.Location(latlon.latitude, latlon.longitude+0.1), \n\
                            new Microsoft.Maps.Location(latlon.latitude-0.05, latlon.longitude+0.05), new Microsoft.Maps.Location(latlon.latitude-0.05, latlon.longitude-0.05), \n\
                            new Microsoft.Maps.Location(latlon.latitude, latlon.longitude-0.1)],  \n\
                        [new Microsoft.Maps.Location(latlon.latitude, latlon.longitude-0.075), new Microsoft.Maps.Location(latlon.latitude+0.025, latlon.longitude-0.05), \n\
                            new Microsoft.Maps.Location(latlon.latitude+0.025, latlon.longitude+0.05), new Microsoft.Maps.Location(latlon.latitude, latlon.longitude+0.075), \n\
                            new Microsoft.Maps.Location(latlon.latitude-0.025, latlon.longitude+0.05), new Microsoft.Maps.Location(latlon.latitude-0.025, latlon.longitude-0.05), \n\
                            new Microsoft.Maps.Location(latlon.latitude, latlon.longitude-0.075)]  \n\
                                           ]);  \n\
    map.setView( {zoom:10});  \n\
    map.entities.push(polygon); \n\
}\n\
Microsoft.Maps.loadModule('Microsoft.Maps.AdvancedShapes', { callback: createPolygon })";


var QuerybyAreaWithNearby = "function findLocations() \n\
{ \n\
    var latitude = 40.83274904439099; \n\
    var longitude = -74.3163299560546935; \n\
    var location = latitude + '|' + longitude; \n\
    var spatialFilter = 'spatialFilter=nearby(' + latitude + ',' + longitude + ', 5)'; \n\
    var select = '$select=EntityID,Latitude,Longitude,__Distance'; \n\
    var top = '$top=3'; \n\
    var format = '$format=json'; \n\
    var sdsRequest = 'http://sdsEnvironmentName/REST/v1/data/20181f26d9e94c81acdf9496133d4f23/FourthCoffeeSample/FourthCoffeeShops?' + \n\
        spatialFilter + '&' + \n\
        select + '&' + \n\
        top + '&' + \n\
        format + '&jsonp=SDSNearbyServiceCallback&jsonso=' + location + '&key=' + sdsQueryKey; \n\
    var mapscript = document.createElement('script'); \n\
    mapscript.type = 'text/javascript'; \n\
    mapscript.src = sdsRequest; \n\
    document.getElementById('SDKmap').appendChild(mapscript); \n\
}; \n\
findLocations();";

var QuerybyAreaWithBbox = "function findLocations() \n\
{ \n\
    var southLatitude = 40.7801465817126; \n\
    var westLongitude = -74.46958923339845; \n\
    var northLatitude = 40.88535150706938; \n\
    var eastLongitude = -74.163070678710937; \n\
    var sFilter = southLatitude + '|' + westLongitude + '|' + northLatitude + '|' + eastLongitude; \n\
    var spatialFilter = 'spatialFilter=bbox(' + southLatitude + ',' + westLongitude + ',' + northLatitude + ',' + eastLongitude + ')'; \n\
    var select = '$select=EntityID,Latitude,Longitude,DisplayName'; \n\
    var skip = '$skip=2'; \n\
    var top = '$top=3'; \n\
    var format = '$format=json'; \n\
    var sdsRequest = 'http://sdsEnvironmentName/REST/v1/data/20181f26d9e94c81acdf9496133d4f23/FourthCoffeeSample/FourthCoffeeShops?' + \n\
        spatialFilter + '&' + \n\
        select + '&' + \n\
        top + '&' + \n\
        skip + '&' + \n\
        format + '&jsonp=SDSBboxServiceCallback&jsonso=' + sFilter + '&key=' + sdsQueryKey; \n\
    var mapscript = document.createElement('script'); \n\
    mapscript.type = 'text/javascript'; \n\
    mapscript.src = sdsRequest; \n\
    document.getElementById('SDKmap').appendChild(mapscript); \n\
}; \n\
findLocations();";

var QueryNearARouteWithAddressValues = "function findLocations() \n\
{ \n\
    var routeStart = 'Webster,TX'; \n\
    var routeEnd = 'Kemah,TX'; \n\
    var route = routeStart + '|' + routeEnd; \n\
    var spatialFilter = \"spatialFilter=nearRoute('\" + routeStart + \"\',\'\" + routeEnd + \"\')\"; \n\
    var select = '$select=EntityID,Latitude,Longitude,DisplayName,Phone,__Distance'; \n\
    var top = '$top=3'; \n\
    var format = '$format=json'; \n\
    var sdsRequest = 'http://sdsEnvironmentName/REST/v1/data/20181f26d9e94c81acdf9496133d4f23/FourthCoffeeSample/FourthCoffeeShops?' + \n\
        spatialFilter + '&' + \n\
        select + '&' + \n\
        top + '&' + \n\
        format + '&jsonp=SDSNearARouteServiceCallback&jsonso=' + route + '&key=' + sdsQueryKey; \n\
    var mapscript = document.createElement('script'); \n\
    mapscript.type = 'text/javascript'; \n\
    mapscript.src = sdsRequest; \n\
    document.getElementById('SDKmap').appendChild(mapscript); \n\
}; \n\
Microsoft.Maps.loadModule('Microsoft.Maps.Search') \n\
findLocations();";

var QueryNearARouteWithLocationValues = "function findLocations() \n\
{ \n\
    var routeStart = '29.5386,-95.1194'; \n\
    var routeEnd = '29.5431,-95.01831'; \n\
    var data = routeStart + ',' + routeEnd; \n\
    var spatialFilter = \"spatialFilter=nearRoute('\" + routeStart + \"\',\'\" + routeEnd + \"\')\"; \n\
    var select = '$select=EntityID,Latitude,Longitude,DisplayName,Phone,__Distance'; \n\
    var top = '$top=3'; \n\
    var format = '$format=json'; \n\
    var sdsRequest = 'http://sdsEnvironmentName/REST/v1/data/20181f26d9e94c81acdf9496133d4f23/FourthCoffeeSample/FourthCoffeeShops?' + \n\
        spatialFilter + '&' + \n\
        select + '&' + \n\
        top + '&' + \n\
        format + '&jsonp=SDSNearARouteWithLocationServiceCallback&jsonso=' + data + '&key=' + sdsQueryKey; \n\
    var mapscript = document.createElement('script'); \n\
    mapscript.type = 'text/javascript'; \n\
    mapscript.src = sdsRequest; \n\
    document.getElementById('SDKmap').appendChild(mapscript); \n\
}; \n\
findLocations();";


var QuerybyProperty = "function findLocations() \n\
{ \n\
    var latitude = 27.894007; \n\
    var longitude = -82.670776; \n\
    var location = latitude + '|' + longitude; \n\
    var spatialFilter = 'spatialFilter=nearby(' + latitude + ',' + longitude + ', 2)'; \n\
    var select = '$select=Latitude,Longitude,IsWiFiHotSpot,DisplayName'; \n\
    var top = '$top=3'; \n\
    var format = '$format=json'; \n\
    var filter = \"$filter=StoreType Eq 'Coffee Shop'\"; \n\
    var orderby = '$orderby=IsWiFiHotSpot'; \n\
    var sdsRequest = 'http://sdsEnvironmentName/REST/v1/data/20181f26d9e94c81acdf9496133d4f23/FourthCoffeeSample/FourthCoffeeShops?' + \n\
        spatialFilter + '&' + \n\
        select + '&' + \n\
        top + '&' + \n\
        filter + '&' + \n\
        orderby + '&' + \n\
        format + '&jsonp=SDSQuerybyPropertyServiceCallback&jsonso=' + location + '&key=' + sdsQueryKey; \n\
    var mapscript = document.createElement('script'); \n\
    mapscript.type = 'text/javascript'; \n\
    mapscript.src = sdsRequest; \n\
    document.getElementById('SDKmap').appendChild(mapscript); \n\
}; \n\
findLocations();";

var QuerybyPropertyWithWildcardSearch = "function findLocations() \n\
{ \n\
    var latitude = 27.894007; \n\
    var longitude = -82.670776; \n\
    var location = latitude + '|' + longitude; \n\
    var spatialFilter = 'spatialFilter=nearby(' + latitude + ',' + longitude + ', 2)'; \n\
    var select = '$select=Latitude,Longitude,IsWiFiHotSpot,DisplayName'; \n\
    var top = '$top=3'; \n\
    var format = '$format=json'; \n\
    var filter = \"$filter=StartsWith(PrimaryCity,'Clear') eq true\"; \n\
    var orderby = '$orderby=IsWheelchairAccessible'; \n\
    var sdsRequest = 'http://sdsEnvironmentName/REST/v1/data/20181f26d9e94c81acdf9496133d4f23/FourthCoffeeSample/FourthCoffeeShops?' + \n\
        spatialFilter + '&' + \n\
        select + '&' + \n\
        top + '&' + \n\
        filter + '&' + \n\
        orderby + '&' + \n\
        format + '&jsonp=SDSQuerybyPropertyServiceCallback&jsonso=' + location + '&key=' + sdsQueryKey; \n\
    var mapscript = document.createElement('script'); \n\
    mapscript.type = 'text/javascript'; \n\
    mapscript.src = sdsRequest; \n\
    document.getElementById('SDKmap').appendChild(mapscript); \n\
}; \n\
findLocations();";

var QuerybyIDForASingleEntity = "function findLocations() \n\
{ \n\
    var select = '$select=EntityID,Latitude,Longitude'; \n\
    var sdsRequest = \"http://sdsEnvironmentName/REST/v1/data/20181f26d9e94c81acdf9496133d4f23/FourthCoffeeSample/FourthCoffeeShops('-22067')?$format=json&jsonp=SDSQuerybyIDServiceCallback&key=\" + \n\
                    sdsQueryKey + '&' + \n\
                    select; \n\
    var mapscript = document.createElement('script'); \n\
    mapscript.type = 'text/javascript'; \n\
    mapscript.src = sdsRequest; \n\
    document.getElementById('SDKmap').appendChild(mapscript); \n\
}; \n\
findLocations();";

var QuerybyIDForMultipleEntities = "function findLocations() \n\
{ \n\
    var select = '$select=EntityID,Latitude,Longitude'; \n\
    var filter = \"$filter=entityId in('-22067','-22060')\"; \n\
    var sdsRequest = 'http://sdsEnvironmentName/REST/v1/data/20181f26d9e94c81acdf9496133d4f23/FourthCoffeeSample/FourthCoffeeShops?$format=json&jsonp=SDSQuerybyIDsServiceCallback&key=' + \n\
                    sdsQueryKey + '&' + \n\
                    filter + '&' + \n\
                    select; \n\
    var mapscript = document.createElement('script'); \n\
    mapscript.type = 'text/javascript'; \n\
    mapscript.src = sdsRequest; \n\
    document.getElementById('SDKmap').appendChild(mapscript); \n\
}; \n\
findLocations();";


function SDSNearbyServiceCallback(result, data) {
    var location = data.split('|');
    map.setView({ zoom: 10, center: new Microsoft.Maps.Location(location[0], location[1]) });
    query_onQuerySuccess(result['d']);
};

function SDSBboxServiceCallback(result, data) {
    var sFilter = data.split('|');
    var viewRect = Microsoft.Maps.LocationRect.fromEdges(new Number(sFilter[2]), new Number(sFilter[1]), new Number(sFilter[0]), new Number(sFilter[3]));
    map.setView({bounds: viewRect });
    query_onQuerySuccess(result['d']);
};

function SDSNearARouteServiceCallback(result, data) {
    var route = data.split('|');
    getAddressLocations(route);
    query_onQuerySuccess(result['d']);
};

var addressLocation;

function getAddressLocations(route) {
    addressLocation = [];
    geocodeRequest(route[0]);
    geocodeRequest(route[1]);
}

function geocodeRequest(address) {
    createSearchManager();
    var where = address;
    var request =
    {
        where: where,
        count: 5,
        bounds: map.getBounds(),
        callback: onGeocodeSuccess,
        errorCallback: onGeocodeFailed
    };
    searchManager.geocode(request);
}

function onGeocodeSuccess(result) {
    if (result) {
        var topResult = result.results && result.results[0];
        if (topResult) {
            addressLocation.push(topResult.location);
            if (addressLocation.length == 2) {
                var viewRect = Microsoft.Maps.LocationRect.fromLocations(addressLocation[0], addressLocation[1]);
                map.setView({bounds: viewRect });
            }
        }
    }
}

function onGeocodeFailed(result, userData) {
    displayAlert('Geocode failed. ' + result.errorMessage);
}

function SDSNearARouteWithLocationServiceCallback(result, data) {
    var location = data.split(',');
    var viewRect = Microsoft.Maps.LocationRect.fromLocations(new Microsoft.Maps.Location(location[0], location[1]), new Microsoft.Maps.Location(location[2], location[3]));
    map.setView({bounds: viewRect });
    query_onQuerySuccess(result['d']);
}

function SDSQuerybyPropertyServiceCallback(result, data) {
    var location = data.split('|');
    map.setView({ zoom: 10, center: new Microsoft.Maps.Location(location[0], location[1]) });
    query_onQuerySuccess(result['d']);
}

function SDSQuerybyIDServiceCallback(result) {
    var searchResult = result['d'];
    if (searchResult) {
        map.setView({ zoom: 10, center: new Microsoft.Maps.Location(searchResult.Latitude, searchResult.Longitude) });
        map.entities.clear();
        createMapPin(searchResult);
    }
    else {
        displayAlert("No result for the query");
    }
}

function SDSQuerybyIDsServiceCallback(result) {
    var searchResults = result['d'] && result['d']["results"];
    map.setView({ zoom: 5, center: new Microsoft.Maps.Location(searchResults[0].Latitude, searchResults[0].Longitude) });
    query_onQuerySuccess(result['d']);
}

function query_onQuerySuccess(result) {
    map.entities.clear();
    var searchResults = result && result["results"];
    if (searchResults) {
        if (searchResults.length == 0) {
            displayAlert("No results for the query");
        }
        else {
            for (var i = 0; i < searchResults.length; i++) {
                createMapPin(searchResults[i]);
            }
        }
    }
}

function createMapPin(result) {
    if (result && result.Latitude && result.Longitude) {
        var location = new Microsoft.Maps.Location(result.Latitude, result.Longitude);
        var pin = new Microsoft.Maps.Pushpin(location);
        Microsoft.Maps.Events.addHandler(pin, 'click', function () { showInfoBox(result) });
        map.entities.push(pin);
    }
}

function showInfoBox(result) {
    if (currInfobox) {
        map.entities.remove(currInfobox);
    }

    var location = new Microsoft.Maps.Location(result.Latitude, result.Longitude);
    var decription = [];

    for (var item in result) {
        if (item === '__copyright' || item === '__metadata') {
            continue;
        }

        decription.push(item + ":" + result[item] + "<br/>");
    }

    currInfobox = new Microsoft.Maps.Infobox(location,
         { title: "Title", description: decription.join(' '), showPointer: true});

    currInfobox.setOptions({ visible: true });
    map.entities.push(currInfobox);
}
