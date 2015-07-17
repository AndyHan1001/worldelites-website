//----------------------------------------------------------
// Copyright (C) Microsoft Corporation. All rights reserved.
// owner: hegoya, v-sapand
// Discription : js for isdk page 
//----------------------------------------------------------
// MicrosoftAjaxV7isdk.js

var map = null;
var xmlNode=-1;
var pinid=1;
var xmldoc=null;
var shortcode=null
var longcode=null;
var codetab=1;
var id=-1;
var layerid=1;
var polyid=1;
var xmltree=null;
var xmlabout=null;
var numberOfNodes;
var refTopic;
var xmlRefDoc=null;
var is3dLoading = false;
var nodeClicked = false;
var alerttext;
var browser;
var elementId = -1;
var oldLocation = location.href;
var isPageLoad = false;
var oldsubElement = -1;
var index = -1;
var i = -1;
var resetClicked = false;
var arrSection = new Array();
arrSection[0] = "#CreateMap";
arrSection[1] = "#CreateMapWithMapOptions";
arrSection[2] = "#CreateMapWithViewOptions";
arrSection[3] = "#GetMapOptions";
arrSection[4] = "#SetMapOptions";
arrSection[5] = "#Pushpins";
arrSection[6] = "#Shapes";
arrSection[7] = "#Infobox";
arrSection[8] = "#TileLayers";
arrSection[9] = "#RESTServices";
arrSection[10] = "#AttachMapEvents";
arrSection[11] = "#DetachMapEvents";
arrSection[12] = "#DisposeMap";
arrSection[13] = "#GetUserLocation";
arrSection[14] = "#LoadingDynamicModule";
arrSection[15] = "#TrafficModule";
arrSection[16] = "#DirectionsModule";
arrSection[17] = "#VenueMapsModule";
arrSection[18] = "#NavigationBarModule";
arrSection[19] = "#BingThemeModule";
arrSection[20] = "#SearchModule";
arrSection[21] = "#AdvancedShapeModule";
arrSection[22] = "#SpatialDataServices";

//Ignoring all errors
//Remove this when debugging
window.onerror = function(error, source, line)
{
    return true;
}

function RemoveMyControl() {
    var mycontrol = document.getElementById("myControl");
    if (mycontrol != null) map.DeleteControl(mycontrol);
    var myShim = document.getElementById("myShim");
    if (myShim != null) myShim.parentNode.removeChild(myShim);
    myShim = null;
}

function Reset() {

    refTopic = "gg427609.aspx";
    ShowJSCode(constrcode2);
    RunCode();
    HideCode();
    resetClicked = true;
}

function DoTreeClick()
/*
for each node in the XML file, we read the id to see what it is, 
we then set the reference topic, and then call
the applicable code. All events are tracked by adCenter through the hierarchy object.
*/
{
    var hierarchy = ''; //Set up hierarchy for analytics view
    if (id == "101") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(constrcode1); RunCode(); hierarchy += 'Show/DefaultMap'; displayAlert('Map created with no credentials'); }
    else if (id == "100") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(constrcode2); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "102") { refTopic = "gg427600.aspx"; javascript: ShowJSCode(loadMap1); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "103") { refTopic = "gg427600.aspx"; javascript: ShowJSCode(loadMap2); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "104") { refTopic = "gg427600.aspx"; javascript: ShowJSCode(loadMap3); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "105") { refTopic = "gg427600.aspx"; javascript: ShowJSCode(loadMap4); RunCode(); hierarchy += 'Show/DefaultMap'; }

    if (id == "200") { refTopic = "gg427603.aspx"; javascript: ShowJSCode(constrcode3); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "201") { refTopic = "gg427603.aspx"; javascript: ShowJSCode(constrcode4); RunCode(); hierarchy += 'Show/DefaultMap';  }
    else if (id == "202") { refTopic = "gg427603.aspx"; javascript: ShowJSCode(constrcode5); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "203") { refTopic = "gg427603.aspx"; javascript: ShowJSCode(constrcode6); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "204") { refTopic = "gg427603.aspx"; javascript: ShowJSCode(constrcode7); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "205") { refTopic = "gg427603.aspx"; javascript: ShowJSCode(constrcode8); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "206") { refTopic = "gg427603.aspx"; javascript: ShowJSCode(constrcode17); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "207") { refTopic = "gg427603.aspx"; javascript: ShowJSCode(constrcode18); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "208") { refTopic = "gg427603.aspx"; javascript: ShowJSCode(constrcode19); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "209") { refTopic = "gg427603.aspx"; javascript: ShowJSCode(constrcode20); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "210") { refTopic = "gg427603.aspx"; javascript: ShowJSCode(constrcode21); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "211") { refTopic = "gg427603.aspx"; javascript: ShowJSCode(constrcode22); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "212") { refTopic = "gg427603.aspx"; javascript: ShowJSCode(constrcode23); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "213") { refTopic = "gg427603.aspx"; javascript: ShowJSCode(constrcode24); RunCode(); hierarchy += 'Show/DefaultMap'; }

    if (id == "300") { refTopic = "gg427628.aspx"; javascript: ShowJSCode(constrcode10); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "301") { refTopic = "gg427628.aspx"; javascript: ShowJSCode(constrcode11); RunCode(); hierarchy += 'Show/DefaultMap';  }
    else if (id == "302") { refTopic = "gg427628.aspx"; javascript: ShowJSCode(constrcode12); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "303") { refTopic = "gg427628.aspx"; javascript: ShowJSCode(constrcode13); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "304") { refTopic = "gg427628.aspx"; javascript: ShowJSCode(constrcode14); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "305") { refTopic = "gg427628.aspx"; javascript: ShowJSCode(constrcode15); RunCode(); hierarchy += 'Show/DefaultMap'; }
    else if (id == "306") { refTopic = "gg427628.aspx"; javascript: ShowJSCode(constrcode16); RunCode(); hierarchy += 'Show/DefaultMap'; }

    if (id == "400") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(getimageryid); RunCode(); hierarchy += 'Get/MapOptions'; }
    else if (id == "401") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(getheading); RunCode(); hierarchy += 'Get/MapOptions'; }
    else if (id == "402") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(getzoomlevelcode); RunCode(); hierarchy += 'Get/MapOptions'; }
    else if (id == "403") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(getcenter); RunCode(); hierarchy += 'Get/MapOptions'; }
    else if (id == "404") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(getdiamension); RunCode(); hierarchy += 'Get/MapOptions'; }
    else if (id == "405") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(getviewport); RunCode(); hierarchy += 'Get/MapOptions'; }
    else if (id == "406") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(getmeterperpixel); RunCode(); hierarchy += 'Get/MapOptions'; }
    else if (id == "407") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(getmapbound); RunCode(); hierarchy += 'Get/MapOptions'; }
    else if (id == "408") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(locationtopixel); RunCode(); hierarchy += 'Get/MapOptions'; }
    else if (id == "409") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(ismercator); RunCode(); hierarchy += 'Get/MapOptions'; }
    else if (id == "410") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(isrotationenabled); RunCode(); hierarchy += 'Get/MapOptions'; }
    else if (id == "411") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(getzoomrange); RunCode(); hierarchy += 'Get/MapOptions'; }


    if (id == "500") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(setzoomcenter); RunCode(); hierarchy += 'Set/MapOptions'; }
    else if (id == "501") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(setbounds); RunCode(); hierarchy += 'Set/MapOptions'; }
    else if (id == "502") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(setanimation); RunCode(); hierarchy += 'Set/MapOptions'; }
    else if (id == "503") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(setmapstyle); RunCode(); hierarchy += 'Set/MapOptions'; }
    else if (id == "504") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(setnomapstyle); RunCode(); hierarchy += 'Set/MapOptions'; }


    if (id == "600") { refTopic = "gg427615.aspx"; javascript: ShowJSCode(addpushpincode1); RunCode(); hierarchy += 'Show/Pushpins'; }
    else if (id == "601") { refTopic = "gg427629.aspx"; javascript: ShowJSCode(addpushpincode2); RunCode(); hierarchy += 'Show/Pushpins'; }
    else if (id == "602") { refTopic = "gg427629.aspx"; javascript: ShowJSCode(addpushpincode3); RunCode(); hierarchy += 'Show/Pushpins'; }
    else if (id == "603") { refTopic = "gg427615.aspx"; javascript: ShowJSCode(addpushpincode4); RunCode(); hierarchy += 'Show/Pushpins'; }
    else if (id == "604") { refTopic = "gg427615.aspx"; javascript: ShowJSCode(addpushpincode5); RunCode(); hierarchy += 'Show/Pushpins'; }
    else if (id == "605") { refTopic = "gg427615.aspx"; javascript: ShowJSCode(addpushpincode6); RunCode(); hierarchy += 'Show/Pushpins'; }
    else if (id == "606") { refTopic = "gg427615.aspx"; javascript: ShowJSCode(addpushpincode7); RunCode(); hierarchy += 'Show/Pushpins'; }
    else if (id == "607") { refTopic = "gg427615.aspx"; javascript: ShowJSCode(addpushpincode8); RunCode(); hierarchy += 'Show/Pushpins'; }
    else if (id == "608") { refTopic = "gg427615.aspx"; javascript: ShowJSCode(addpushpincode9); RunCode(); hierarchy += 'Show/Pushpins'; }
    else if (id == "609") { refTopic = "gg427615.aspx"; javascript: ShowJSCode(addpushpincode10); RunCode(); hierarchy += 'Show/Pushpins'; }
    else if (id == "610") { refTopic = "gg427615.aspx"; javascript: ShowJSCode(addpushpincode11); RunCode(); hierarchy += 'Show/Pushpins'; }
    else if (id == "611") { refTopic = "gg427615.aspx"; javascript: ShowJSCode(addpushpincode12); RunCode(); hierarchy += 'Show/Pushpins'; }
    else if (id == "612") { refTopic = "gg427615.aspx"; javascript: ShowJSCode(addpushpincode13); RunCode(); hierarchy += 'Show/Pushpins'; }
    else if (id == "613") { refTopic = "gg427615.aspx"; javascript: ShowJSCode(addpushpincode14); RunCode(); hierarchy += 'Show/Pushpins'; }
    else if (id == "614") { refTopic = "gg427615.aspx"; javascript: ShowJSCode(addpushpincode15); RunCode(); hierarchy += 'Show/Pushpins'; }


    if (id == "700") { refTopic = "gg427597.aspx"; javascript: ShowJSCode(polylinecode1); RunCode(); hierarchy += 'Show/Polyline'; }
    else if (id == "701") { refTopic = "gg427597.aspx"; javascript: ShowJSCode(polylinecode2); RunCode(); hierarchy += 'Show/Polyline'; }
    else if (id == "702") { refTopic = "gg427597.aspx"; javascript: ShowJSCode(polylinecode3); RunCode(); hierarchy += 'Show/Polyline'; }
    else if (id == "703") { refTopic = "gg427597.aspx"; javascript: ShowJSCode(polylinecode4); RunCode(); hierarchy += 'Show/Polyline'; }
    else if (id == "704") { refTopic = "gg427597.aspx"; javascript: ShowJSCode(polylinecode5); RunCode(); hierarchy += 'Show/Polyline'; }
    else if (id == "705") { refTopic = "gg427597.aspx"; javascript: ShowJSCode(polylinecode6); RunCode(); hierarchy += 'Show/Polyline'; }
    else if (id == "706") { refTopic = "gg427594.aspx"; javascript: ShowJSCode(polygoncode1); RunCode(); hierarchy += 'Show/Polygon'; }
    else if (id == "707") { refTopic = "gg427594.aspx"; javascript: ShowJSCode(polygoncode2); RunCode(); hierarchy += 'Show/Polygon'; }
    else if (id == "708") { refTopic = "gg427594.aspx"; javascript: ShowJSCode(polygoncode3); RunCode(); hierarchy += 'Show/Polygon'; }
    else if (id == "709") { refTopic = "gg427594.aspx"; javascript: ShowJSCode(polygoncode4); RunCode(); hierarchy += 'Show/Polygon'; }
    else if (id == "710") { refTopic = "gg427594.aspx"; javascript: ShowJSCode(polygoncode5); RunCode(); hierarchy += 'Show/Polygon'; }
    else if (id == "711") { refTopic = "gg427594.aspx"; javascript: ShowJSCode(polygoncode6); RunCode(); hierarchy += 'Show/Polygon'; }

    if (id == "800") { refTopic = "gg675208.aspx"; javascript: ShowJSCode(DefaultInfobox); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "801") { refTopic = "gg675210.aspx"; javascript: ShowJSCode(InfoBoxHeightWidth); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "802") { refTopic = "gg675210.aspx"; javascript: ShowJSCode(InfoBoxTitle); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "803") { refTopic = "gg675210.aspx"; javascript: ShowJSCode(InfoboxPointer); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "804") { refTopic = "gg675210.aspx"; javascript: ShowJSCode(InfoboxCloseButton); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "805") { refTopic = "gg675210.aspx"; javascript: ShowJSCode(InfoboxOffset); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "806") { refTopic = "gg675210.aspx"; javascript: ShowJSCode(InfoboxZindex); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "807") { refTopic = "gg675210.aspx"; javascript: ShowJSCode(InfoboxTitleClickHandler); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "808") { refTopic = "gg675210.aspx"; javascript: ShowJSCode(InfoboxActions); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "809") { refTopic = "gg675210.aspx"; javascript: ShowJSCode(InfoBoxOptions); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "810") { refTopic = "gg675208.aspx"; javascript: ShowJSCode(InfoboxGetOptions); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "811") { refTopic = "gg675208.aspx"; javascript: ShowJSCode(InfoboxHideShow); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "812") { refTopic = "gg675208.aspx"; javascript: ShowJSCode(InfoboxGetActions); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "813") { refTopic = "gg675208.aspx"; javascript: ShowJSCode(InfoboxGetHtmlContent); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "814") { refTopic = "gg675208.aspx"; javascript: ShowJSCode(InfoboxGetOffset); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "815") { refTopic = "gg675208.aspx"; javascript: ShowJSCode(InfoboxGetShowCloseButton); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "816") { refTopic = "gg675208.aspx"; javascript: ShowJSCode(InfoboxGetShowPointer); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "817") { refTopic = "gg675208.aspx"; javascript: ShowJSCode(InfoboxGetZIndex); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "818") { refTopic = "gg675208.aspx"; javascript: ShowJSCode(InfoboxSetLocation); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "819") { refTopic = "gg675208.aspx"; javascript: ShowJSCode(InfoboxSetHtmlContent); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "820") { refTopic = "gg675208.aspx"; javascript: ShowJSCode(InfoboxSetOptions); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "821") { refTopic = "gg675208.aspx"; javascript: ShowJSCode(InfoboxentityChangedEvent); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "822") { refTopic = "gg675208.aspx"; javascript: ShowJSCode(InfoboxMouseOverEvent); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "823") { refTopic = "gg675208.aspx"; javascript: ShowJSCode(InfoboxMouseOutEvent); RunCode(); hierarchy += 'Show/Infobox'; }
    else if (id == "824") { refTopic = "gg675208.aspx"; javascript: ShowJSCode(InfoboxMouseClickEvent); RunCode(); hierarchy += 'Show/Infobox'; }

    if (id == "900") { refTopic = "gg427598.aspx"; javascript: ShowJSCode(addTileLayer1); RunCode(); hierarchy += 'Show/TileLayer'; }
    else if (id == "901") { refTopic = "gg427613.aspx"; javascript: ShowJSCode(addTileLayer2); RunCode(); hierarchy += 'Show/TileLayer'; }
    else if (id == "902") { refTopic = "gg427598.aspx"; javascript: ShowJSCode(addTileLayer3); RunCode(); hierarchy += 'Show/TileLayer'; }
    else if (id == "903") { refTopic = "gg427598.aspx"; javascript: ShowJSCode(addTileLayer4); RunCode(); hierarchy += 'Show/TileLayer'; }

    if (id == "1000") { refTopic = "ff701715.aspx"; javascript: ShowJSCode(find); RunCode(); hierarchy += 'REST API - find location'; }
    else if (id == "1001") { refTopic = "ff701705.aspx"; javascript: ShowJSCode(route); RunCode(); hierarchy += 'REST API - directions'; }

   
    if (id == "1100") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(click); RunCode(); hierarchy += 'Show/Attach MapEvents'; }
    else if (id == "1101") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(dblclick); RunCode(); hierarchy += 'Show/Attach MapEvents'; }
    else if (id == "1102") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(rightclick); RunCode(); hierarchy += 'Show/Attach MapEvents'; }
    else if (id == "1103") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(mousedown); RunCode(); hierarchy += 'Show/Attach MapEvents'; }
    else if (id == "1104") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(mouseup); RunCode(); hierarchy += 'Show/Attach MapEvents'; }
    else if (id == "1105") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(mousemove); RunCode(); hierarchy += 'Show/Attach MapEvents'; }
    else if (id == "1106") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(mouseover); RunCode(); hierarchy += 'Show/Attach MapEvents'; }
    else if (id == "1107") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(mouseout); RunCode(); hierarchy += 'Show/Attach MapEvents'; }
    else if (id == "1108") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(mousewheel); RunCode(); hierarchy += 'Show/Attach MapEvents'; }
    else if (id == "1109") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(mapviewchangeStart); RunCode(); hierarchy += 'Show/Attach MapEvents'; }
    else if (id == "1110") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(mapviewchange); RunCode(); hierarchy += 'Show/Attach MapEvents'; }
    else if (id == "1111") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(mapviewchangeend); RunCode(); hierarchy += 'Show/Attach MapEvents'; }
    else if (id == "1112") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(imagerychanged); RunCode(); hierarchy += 'Show/Attach MapEvents'; }
    else if (id == "1113") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(copyrightchanged); RunCode(); hierarchy += 'Show/Attach MapEvents'; }


    if (id == "1200") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(Dclick); RunCode(); hierarchy += 'Show/Detach MapEvents'; }
    else if (id == "1201") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(Ddblclick); RunCode(); hierarchy += 'Show/Detach MapEvents'; }
    else if (id == "1202") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(Drightclick); RunCode(); hierarchy += 'Show/Detach MapEvents'; }
    else if (id == "1203") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(Dmousedown); RunCode(); hierarchy += 'Show/Detach MapEvents'; }
    else if (id == "1204") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(Dmouseup); RunCode(); hierarchy += 'Show/Detach MapEvents'; }
    else if (id == "1205") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(Dmousemove); RunCode(); hierarchy += 'Show/Detach MapEvents'; }
    else if (id == "1206") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(Dmouseover); RunCode(); hierarchy += 'Show/Detach MapEvents'; }
    else if (id == "1207") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(Dmouseout); RunCode(); hierarchy += 'Show/Detach MapEvents'; }
    else if (id == "1208") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(Dmousewheel); RunCode(); hierarchy += 'Show/Detach MapEvents'; }
    else if (id == "1209") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(DmapviewchangeStart); RunCode(); hierarchy += 'Show/Detach MapEvents'; }
    else if (id == "1210") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(Dmapviewchange); RunCode(); hierarchy += 'Show/Detach MapEvents'; }
    else if (id == "1211") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(Dmapviewchangeend); RunCode(); hierarchy += 'Show/Detach MapEvents'; }
    else if (id == "1212") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(Dimagerychanged); RunCode(); hierarchy += 'Show/Detach MapEvents'; }
    else if (id == "1213") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(Dcopyrightchanged); RunCode(); hierarchy += 'Show/Detach MapEvents'; }

    if (id == "1300") { refTopic = "gg427609.aspx"; javascript: ShowJSCode(disposecode1); RunCode(); hierarchy += 'Dispose Map'; }

    if (id == "1400") { refTopic = "hh125833.aspx"; javascript: ShowJSCode(geolocation1); RunCode(); hierarchy += 'Geolocation'; }
    else if (id == "1401") { refTopic = "hh125833.aspx"; javascript: ShowJSCode(geolocation2); RunCode(); hierarchy += 'Geolocation'; }
    else if (id == "1402") { refTopic = "hh125833.aspx"; javascript: ShowJSCode(geolocation3); RunCode(); hierarchy += 'Geolocation'; }
    else if (id == "1403") { refTopic = "hh125833.aspx"; javascript: ShowJSCode(geolocation4); RunCode(); hierarchy += 'Geolocation'; }
    else if (id == "1404") { refTopic = "hh125833.aspx"; javascript: ShowJSCode(geolocation5); RunCode(); hierarchy += 'Geolocation'; }


    if (id == "1500") { refTopic = "hh125837.aspx"; javascript: ShowJSCode(registerClustermodule); RunCode(); hierarchy += 'Dynamic Module'; }
    else if (id == "1501") { refTopic = "hh125837.aspx"; javascript: ShowJSCode(loadClustermodule); RunCode(); hierarchy += 'Dynamic Module'; }
    else if (id == "1502") { refTopic = "hh125837.aspx"; javascript: ShowJSCode(enableClustering); RunCode(); hierarchy += 'Dynamic Module'; }
    else if (id == "1503") { refTopic = "hh125837.aspx"; javascript: ShowJSCode(disbleClustering); RunCode(); hierarchy += 'Dynamic Module'; }


    if (id == "1600") { refTopic = "hh312804.aspx"; javascript: ShowJSCode(trafficLayer1); RunCode(); hierarchy += 'Traffic layer'; }
    else if (id == "1601") { refTopic = "hh312804.aspx"; javascript: ShowJSCode(trafficLayer2); RunCode(); hierarchy += 'Traffic layer'; }
    else if (id == "1602") { refTopic = "hh312804.aspx"; javascript: ShowJSCode(trafficLayer3); RunCode(); hierarchy += 'Traffic layer'; }
    else if (id == "1603") { refTopic = "hh312804.aspx"; javascript: ShowJSCode(trafficLayer4); RunCode(); hierarchy += 'Traffic layer'; }

    if (id == "1700") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode01); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1701") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode02); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1702") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode03); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1703") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode04); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1704") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode05); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1705") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode06); RunCode(); hierarchy += 'Directions Module'; }

    else if (id == "1706") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode08); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1707") { refTopic = "hh312839.aspx"; javascript: ShowJSCode(directionscode09); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1708") { refTopic = "hh312839.aspx"; javascript: ShowJSCode(directionscode10); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1709") { refTopic = "hh312832.aspx"; javascript: ShowJSCode(directionscode11); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1710") { refTopic = "hh312832.aspx"; javascript: ShowJSCode(directionscode12); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1711") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode13); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1712") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode14); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1713") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode15); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1714") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode16); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1715") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode17); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1716") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode18); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1717") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode19); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1718") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode20); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1719") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode21); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1720") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode22); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1721") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode23); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1722") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode24); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1723") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode25); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1724") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode26); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1725") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode27); RunCode(); hierarchy += 'Directions Module'; }
    else if (id == "1726") { refTopic = "hh312802.aspx"; javascript: ShowJSCode(directionscode28); RunCode(); hierarchy += 'Directions Module'; }

    if (id == "1800") { refTopic = "hh312797.aspx"; javascript: ShowJSCode(venuemapcode0); RunCode(); hierarchy += 'Show/VenueMaps'; }
    else if (id == "1801") { refTopic = "hh312797.aspx"; javascript: ShowJSCode(venuemapcode1); RunCode(); hierarchy += 'Show/VenueMaps'; }
    else if (id == "1802") { refTopic = "hh312797.aspx"; javascript: ShowJSCode(venuemapcode2); RunCode(); hierarchy += 'Show/VenueMaps'; }
    else if (id == "1803") { refTopic = "hh312797.aspx"; javascript: ShowJSCode(venuemapcode3); RunCode(); hierarchy += 'Show/VenueMaps'; }
    else if (id == "1804") { refTopic = "hh312797.aspx"; javascript: ShowJSCode(venuemapcode4); RunCode(); hierarchy += 'Show/VenueMaps'; }
    else if (id == "1805") { refTopic = "hh312797.aspx"; javascript: ShowJSCode(venuemapcode5); RunCode(); hierarchy += 'Show/VenueMaps'; }
    else if (id == "1806") { refTopic = "hh312797.aspx"; javascript: ShowJSCode(venuemapcode6); RunCode(); hierarchy += 'Show/VenueMaps'; }
    else if (id == "1807") { refTopic = "hh312797.aspx"; javascript: ShowJSCode(venuemapcode7); RunCode(); hierarchy += 'Show/VenueMaps'; }
    else if (id == "1808") { refTopic = "hh312797.aspx"; javascript: ShowJSCode(venuemapcode8); RunCode(); hierarchy += 'Show/VenueMaps'; }
    else if (id == "1809") { refTopic = "hh312797.aspx"; javascript: ShowJSCode(venuemapcode9); RunCode(); hierarchy += 'Show/VenueMaps'; }
    else if (id == "1810") { refTopic = "hh312797.aspx"; javascript: ShowJSCode(venuemapcode10); RunCode(); hierarchy += 'Show/VenueMaps'; }
    else if (id == "1811") { refTopic = "hh312797.aspx"; javascript: ShowJSCode(venuemapcode11); RunCode(); hierarchy += 'Show/VenueMaps'; }
    else if (id == "1812") { refTopic = "hh312797.aspx"; javascript: ShowJSCode(venuemapcode12); RunCode(); hierarchy += 'Show/VenueMaps'; }

    else if (id == "1813") { refTopic = "hh312797.aspx"; javascript: ShowJSCode(GetCode(AddDirectory)); AddDirectory(); hierarchy += 'Show/VenueMaps'; }
    else if (id == "1814") { refTopic = "hh312797.aspx"; javascript: ShowJSCode(GetCode(RemoveDirectory)); RemoveDirectory(); hierarchy += 'Show/VenueMaps'; }
    else if (id == "1815") { refTopic = "hh312797.aspx"; javascript: ShowJSCode(GetCode(DirectoryMouseOver)); DirectoryMouseOver(); hierarchy += 'Show/VenueMaps'; }
    else if (id == "1816") { refTopic = "hh312797.aspx"; javascript: ShowJSCode(GetCode(DirectoryMouseOut)); DirectoryMouseOut(); hierarchy += 'Show/VenueMaps'; }
    else if (id == "1817") { refTopic = "hh312797.aspx"; javascript: ShowJSCode(GetCode(DirectoryMouseClick)); DirectoryMouseClick(); hierarchy += 'Show/VenueMaps'; }

    if (id == "1900") { refTopic = "hh397913.aspx"; javascript: ShowJSCode(navbarcode0); RunCode(); hierarchy += 'Navigation bar module'; }
    else if (id == "1901") { refTopic = "hh397913.aspx"; javascript: ShowJSCode(navbarcode1); RunCode(); hierarchy += 'Navigation bar module'; }

    if (id == "2000") { refTopic = "hh921953.aspx"; javascript: ShowJSCode(bingThemeCode0); RunCode(); hierarchy += 'Bing theme module'; }
    else if (id == "2001") { refTopic = "hh921953.aspx"; javascript: ShowJSCode(bingThemeCode1); RunCode(); hierarchy += 'Bing theme module'; }
    else if (id == "2002") { refTopic = "hh921953.aspx"; javascript: ShowJSCode(bingThemeCode2); RunCode(); hierarchy += 'Bing theme module'; }
    else if (id == "2003") { refTopic = "hh921953.aspx"; javascript: ShowJSCode(bingThemeCode3); RunCode(); hierarchy += 'Bing theme module'; }
    else if (id == "2004") { refTopic = "hh921953.aspx"; javascript: ShowJSCode(bingThemeCode4); RunCode(); hierarchy += 'Bing theme module'; }
    else if (id == "2005") { refTopic = "hh921953.aspx"; javascript: ShowJSCode(bingThemeCode5); RunCode(); hierarchy += 'Bing theme module'; }

    if (id == "2100") { refTopic = "hh868062.aspx"; javascript: ShowJSCode(searchCode0); RunCode(); hierarchy += 'Search module'; }
    else if (id == "2101") { refTopic = "hh868062.aspx"; javascript: ShowJSCode(searchCode1); RunCode(); hierarchy += 'Search module'; }
    else if (id == "2102") { refTopic = "hh868062.aspx"; javascript: ShowJSCode(searchCode2); RunCode(); hierarchy += 'Search module'; }
    else if (id == "2103") { refTopic = "hh868062.aspx"; javascript: ShowJSCode(searchCode4); RunCode(); hierarchy += 'Search module'; }
    else if (id == "2104") { refTopic = "hh868062.aspx"; javascript: ShowJSCode(searchCode3); RunCode(); hierarchy += 'Search module'; }

    if (id == "2200") { refTopic = "hh921950.aspx"; javascript: ShowJSCode(advancedShape0); RunCode(); hierarchy += 'Advanced shape module'; }

    if (id == "2300") { refTopic = "gg585133.aspx"; javascript: ShowJSCode(ReplaceGlobals(QuerybyAreaWithNearby)); RunCode(); hierarchy += 'Spatial Data Services Module'; }
    else if (id == "2301") { refTopic = "gg585133.aspx"; javascript: ShowJSCode(ReplaceGlobals(QuerybyAreaWithBbox)); RunCode(); hierarchy += 'Spatial Data Services Module'; }
    else if (id == "2302") { refTopic = "hh771572.aspx"; javascript: ShowJSCode(ReplaceGlobals(QueryNearARouteWithAddressValues)); RunCode(); hierarchy += 'Spatial Data Services Module'; }
    else if (id == "2303") { refTopic = "hh771572.aspx"; javascript: ShowJSCode(ReplaceGlobals(QueryNearARouteWithLocationValues)); RunCode(); hierarchy += 'Spatial Data Services Module'; }
    else if (id == "2304") { refTopic = "gg585125.aspx"; javascript: ShowJSCode(ReplaceGlobals(QuerybyProperty)); RunCode(); hierarchy += 'Spatial Data Services Module'; }
    else if (id == "2305") { refTopic = "gg585125.aspx"; javascript: ShowJSCode(ReplaceGlobals(QuerybyPropertyWithWildcardSearch)); RunCode(); hierarchy += 'Spatial Data Services Module'; }
    else if (id == "2306") { refTopic = "gg585137.aspx"; javascript: ShowJSCode(ReplaceGlobals(QuerybyIDForASingleEntity)); RunCode(); hierarchy += 'Spatial Data Services Module'; }
    else if (id == "2307") { refTopic = "gg585137.aspx"; javascript: ShowJSCode(ReplaceGlobals(QuerybyIDForMultipleEntities)); RunCode(); hierarchy += 'Spatial Data Services Module'; }

    var a = document.getElementById('msdnlink');
    a.innerHTML = "<a href='http://msdn.microsoft.com/en-us/library/" + refTopic + "' target='_blank'>Browse to the Bing Maps AJAX Control SDK topic on MSDN</a><br>";

    if (oldsubElement > 0 && oldsubElement <= arrSection.length) {
        location.hash = arrSection[oldsubElement-1] + (parseInt(id % 100) + 1);
    }
    oldLocation = location.href;
    isPageLoad = false;
    document.title = "Bing Maps V7 Interactive SDK" ;
    TrackPage("vesdk/TOC/" + hierarchy, "iSDK TOC: " + hierarchy);
}

function CheckBrowser() //for 3d calls: are we dealing with IE or moz? 3d only works in IE
{
    return true;
}


function ChangeMap(e) //handles a click on a subnode in the Task Tree
{
    //unselect the current tree choice
    if (id != -1) { document.getElementById(id).className = "SDKtreesubnode"; }
    if (id != 100) document.getElementById(100).className = "SDKtreesubnode"; //clear first node selection from onload

    //get the new id of the selected tree node
    if (e.target) id = e.target.id; //moz
    else if (e.srcElement) id = e.srcElement.id; //ie

    // bug fix when user clicks the bullet or New icon in the API code (sub node of tree)
    if (!id || id == "") {
        if (e.target && e.target.parentNode) id = e.target.parentNode.id; //moz
        else if (e.srcElement && e.srcElement.parentNode) id = e.srcElement.parentNode.id; //ie
    }  

    //set the style of the selected node (highlights)
    document.getElementById(id).className = "SDKtreeselected";

    //if there is currently an alert on the screen, clear it
    HideAlert();

    SwitchBackToHomeTabs();
    setTimeout('DoTreeClick()', 100); //this delay is required to ensure the tree is updated correctly.
}

function SwitchBackToHomeTabs() {
    doClick(1); //sets us back on the map tab
}

function onPageLoad() //fires when the page first loads
{
    if (window.ActiveXObject) { browser = 'ie'; }
    else if (navigator.userAgent.indexOf("Firefox") != -1) { browser = 'ff'; var contentTabs = document.getElementById('contentTabs'); if (contentTabs) contentTabs.style.top = '4px'; }
    else if (document.implementation && document.implementation.createDocument) { browser = 'moz'; }

    // this is required to be enabled in dev environment.
    if (location.href && location.href.toLowerCase().indexOf("/devportal") != -1) 
         virtualPath = '/Devportal';
    
    try { LoadTree(); }
    catch (err) { }
    try { LoadSnippets(); }
    catch (err) { }
    try { PopAbout(); }
    catch (err) { }
    if (map == null) {
        id = "100";
        ShowTab('content1');
        setTimeout('DoTreeClick()', 100);
    }
    isPageLoad = true;
    // update tree based on query parameter, if the URL have it
    UpdateTree();
}

function UpdateTree() {
    var querystr = location.hash;
    index = -1;
    elementId = -1;
    var strArray = querystr.match(/\D+/g);
    if (strArray) {
        for (i = 0; i < arrSection.length; i++) {
            if (strArray[0].toLowerCase() == arrSection[i].toLowerCase()) {
                index = i;
                break; 
            }
        }
    }
    // regex to get the number from the query string specified with '#'
    // It will give number array & we pick the first number from the string, so #section400, #400, #sdf400,  will all open API with div id 400
    var numArray = querystr.match(/\d+/g);
    if (numArray) {
        elementId = numArray[0];
    }

    if (index != -1 && elementId != -1) {
        setTimeout("ClickNode(index+1, elementId-1)", 150);
    }

}

// function to click tree node & sub node having the API 
function ClickNode(subElement, element) {
    element = parseInt(element, 10) + parseInt(subElement * 100, 10);
    var div = document.getElementById(element);
    if (div) {
        var subDiv = document.getElementById('node' + subElement);
        if (subDiv) {
            if (oldsubElement != subElement)
                DoExpandoClick(subElement);
            document.getElementById(id).className = "SDKtreesubnode";
            id = element;
            document.getElementById(id).className = "SDKtreeselected";
            SwitchBackToHomeTabs();
            setTimeout('DoTreeClick()', 100);
        }
    }
}

// this checks for brower address bar update of URL, if user does not load the page & change the query string
setInterval('CheckForAddressBarUpdate()', 1000);

function CheckForAddressBarUpdate() {
    if (location.href != oldLocation && !isPageLoad) {
        UpdateTree();
        oldLocation = location.href;
    }

    if (location.href == oldLocation && resetClicked) {
        UpdateTree();
        resetClicked = false;
    }

}

function LoadSnippets() //puts all code snippets in an XMLDocument for easy retreival
{
    var xmlhttp = GetXmlHttp();
    xmlhttp.open("GET", virtualPath + "/ISDK/Snippets.xml", true);
    xmlhttp.onreadystatechange=function()
    {
        if (xmlhttp.readyState == 4)
        {
            xmldoc = xmlhttp.responseXML;
            xmlhttp	= null;
        }
    }
    xmlhttp.send(null);
}

function LoadTree() //loads the  XML file for the task tree
{
    var xmlhttp = GetXmlHttp();
    xmlhttp.open("GET", virtualPath + "/ISDK/Tree.xml", true);
    xmlhttp.onreadystatechange=function()
    {
        if (xmlhttp.readyState == 4)
        {
            xmltree = xmlhttp.responseXML;
            PopTree();
            xmlhttp	= null;
        }
    }
    xmlhttp.send(null);
}

function PopTree() //creates the Task Tree based on the nodes in the xmltree
{
    var whatsnew = "<br><div onclick='doWhatsNew()'><img src='./img/new.gif' /><br><b>What's new in the latest release?</b></div>";
	numberOfNodes = xmltree.getElementsByTagName("node").length+1;
	var strTree = "";
	strTree += "<div class='SDKtreeHeader'></div>";
	for (x=0;x<numberOfNodes-1;x++) {
	    var nodeNumber = xmltree.getElementsByTagName("node")[x].getAttribute("id");
	    var nodetitle = xmltree.getElementsByTagName("node")[x].getAttribute("text");
		strTree += "<div id='node" + nodeNumber + "' class='SDKtreenode' onclick='DoExpandoClick(" + nodeNumber + ")'><div class='state' id='hidden" + nodeNumber + "'></div>";

        // check the node title for *, which would be used to indicate new API
		if (nodetitle.indexOf("*") != -1) {
		    nodetitle = nodetitle.replace("*", "");
		    strTree += "<img id='img" + nodeNumber + "' src='" + virtualPath + "/Content/expand.gif' alt='*'/>&nbsp;" + nodetitle + "&nbsp;<img src='" + virtualPath + "/Content/New_Icon.gif' alt='New'/></div>";
		}
		else
		    strTree += "<img id='img" + nodeNumber + "' src='" + virtualPath + "/Content/expand.gif' alt='*'/>&nbsp;" + nodetitle + "</div>";

        strTree += "<div class='SDKsubtreeHeader'></div>";
        strTree+="<div id='sub"+nodeNumber+"' class='SDKtreehidden'>";
		
		for (sn=0;sn<xmltree.getElementsByTagName("node")[x].childNodes.length;sn++)
		{
			if (xmltree.getElementsByTagName("node")[x].childNodes[sn].nodeName=="subnode" 
					&& xmltree.getElementsByTagName("node")[x].childNodes[sn].hasChildNodes() 
					&& xmltree.getElementsByTagName("node")[x].childNodes[sn].childNodes[0].nodeName=="#text")
				{
					var snid = xmltree.getElementsByTagName("node")[x].childNodes[sn].attributes[0].nodeValue;
					var sntitle = xmltree.getElementsByTagName("node")[x].childNodes[sn].childNodes[0].nodeValue;

					// check the subnode title for *, which would be used to indicate new API
					if (sntitle.indexOf("*") != -1) {
					    sntitle = sntitle.replace("*", "");
					    strTree += "<div id=" + snid + " class='SDKtreesubnode' onclick='ChangeMap(event)'><img src='" + virtualPath + "/Content/bullet2.gif' alt='*'/>&nbsp;&nbsp;" + sntitle + "&nbsp;<img src='" + virtualPath + "/Content/New_Icon.gif' alt='New'/></div>";
					}
			        else
			            strTree += "<div id=" + snid + " class='SDKtreesubnode' onclick='ChangeMap(event)'><img src='" + virtualPath + "/Content/bullet2.gif' alt='*'/>&nbsp;&nbsp;" + sntitle + "</div>";	
				}
        }
        strTree += "<div class='SDKsubtreeHeader'></div>";
        strTree+="</div>";
	}
	var tree = document.getElementById('tree');
	tree.innerHTML=strTree;
	SelectFirstTreeItem();
}

function SelectFirstTreeItem() //selectes the first item in the Task Tree
{
	DoExpandoClick(1);
	xmlNode=1;
	document.getElementById('100').className="SDKtreeselected";
	if (xmldoc!=null)
	{
		doClick(1);
	}
}

function PopAbout() //creates the "Learn More" tab content from the About.xml file
{
    var xmlhttp = GetXmlHttp();
    xmlhttp.open("GET", virtualPath + "/ISDK/About.xml", true);
    xmlhttp.onreadystatechange=function()
    {
        if (xmlhttp.readyState == 4)
        {
            xmlabout = xmlhttp.responseXML;
            ShowAbout();
            xmlhttp	= null;
        }
    }
    xmlhttp.send(null);    
}

function ShowAbout() //shows the content when the "Learn More" tab is clicked
{
	var about = document.getElementById('learnmore');
    var gethtmlnode = xmlabout.getElementsByTagName("HtmlText")[0];
	about.innerHTML = gethtmlnode.textContent || gethtmlnode.text;
}

function doClick(t) //handles clicks of the tabs--from map to reference to snippet, etc.
{
    //set the look of the tab itself
    document.getElementById("contentTab1").className = "backContentTab";
    document.getElementById("contentTab2").className = "backContentTab";
   // document.getElementById("contentTab3").className = "backContentTab";
    
    document.getElementById("contentTab" + t).className = "activeContentTab";

    //..and if the custom user control is currently shown, remove it
    RemoveMyControl();
    //...and hide the alert box if it is open
    HideAlert();

    //Set up the hierarchy for adCenter tracking

    var hierarchy = '';

	if (t==2) //learn more page
	{
	    HideTab('ref');
	    HideTab('SDKcode');
	    HideTab('SDKmap');
	    HideTab('SDKalert');
	   
        ShowTab('learnmore');
        hierarchy += 'LearnMore';
	}
	else //show the map
	{
	    ShowTab('SDKmap');
	    ShowTab('SDKcode');
	    ShowTab('SDKalert');
        HideTab('ref');
        HideTab('learnmore');
	    hierarchy += 'ShowMe';
	}

	TrackPage("vesdk/TAB/" + hierarchy, "iSDK Tab: " + hierarchy);
}

function HideTab(id) //generic handler for hiding an element
{
    document.getElementById(id).style.visibility="hidden";
    document.getElementById(id).style.display="none";
}

function ShowTab(id)//generic handler for showing an element
{
    document.getElementById(id).style.visibility="visible";
    document.getElementById(id).style.display="block";
}

function GenerateCode() //shows the Code tab content
{
    try {

        document.getElementById('codebutton').style.visibility = "visible";
        document.getElementById('codebutton').style.display = "block";
        var codetitle = document.getElementById("codetitle");
        if (codetitle)
            codetitle.innerText = document.getElementById(id).innerText;
        document.getElementById("codediv").style.visibility = "visible";
        // to generate html code for detach event same as add handler one
        var temp = id;
        if (temp >= 1200 && temp < 1300) temp = temp - 100;
        var snip = xmldoc.selectNodes("/demos/demo[id='" + temp + "']")[0];
        longcode = snip.getElementsByTagName("long")[0].childNodes[0].nodeValue;
        var codebox = document.getElementById("code");
	    codebox.innerText = longcode;
	}
    catch(e)
	{
	    //Safari 2 does not support xpath. Have to use a loop to search for the correct node.
	    codetitle.textContent = document.getElementById(id).textContent;
	    var codebox = document.getElementById('code');
	    codebox.textContent = SearchForNode(id);
	}
}

function SearchForNode(id)
{
    var s = "";
    try
    {
        var nodes = xmldoc.getElementsByTagName("demo");
        for(var i=0;i<nodes.length;i++)
        {
            var n = nodes[i].getElementsByTagName("id")[0];
            if(n && n.childNodes && n.childNodes[0] && n.childNodes[0].nodeValue == id) {

                var gethtmlnode = nodes[i].getElementsByTagName("long")[0];
                s = gethtmlnode.textContent;
                break;
            }
        }
    }
    catch(e){}
    return s;
}

function GetRef() //shows the reference tab content
{
    if (refTopic != '') {
        document.getElementById("refframe").src = "http://msdn.microsoft.com/en-us/library(d=ide)/" + refTopic;
    }
    displayedrefTopic = refTopic;
}

function ShowRef()
{
	var s = "<a href='http://msdn.microsoft.com/en-us/library/"+refTopic+"' target='_blank'>Click here to open the Bing Map Control SDK in a new window.</a><br>";
    DoAlert(s);
}

function GetLinks() //deprecated - should be safe to delete
{
	var text = xmldoc.getElementsByTagName("links")[xmlNode].childNodes[0].childNodes[0].firstChild.nodeValue;
	var link = xmldoc.getElementsByTagName("links")[xmlNode].childNodes[0].childNodes[1].firstChild.nodeValue;
}

function DoExpandoClick(id) //handles changes when the user expands/collapese a node in the Task Tree.
{
    var expimg = virtualPath + "/Content/collapse.gif";
    var colimg = virtualPath + "/Content/expand.gif";

	//collapse all nodes first
	for (var s=1; s<numberOfNodes; s++)
	{
		if (s!=id)
		{	
			var d = document.getElementById("node"+s);
			var nodes = d.childNodes[0];
			nodes.id = "hidden" + s;
			document.getElementById("node" + s).className = "SDKtreenode";
			document.getElementById("sub"+s).className="SDKtreehidden";
			document.getElementById("img"+s).src=colimg;
		}
	}
	//now expand the one we want
    var div = document.getElementById("node" + id);

	var img = document.getElementById("img"+id);
	var subnode = document.getElementById("sub" + id);
	if (!div) return;
	var hiddennode = div.childNodes[0];

	if (hiddennode.id == "hidden" + id)//we are collapsed
	{
	    document.getElementById("node" + id).className = "SDKtreenode";
	    subnode.className = "SDKtreeshown";
	    hiddennode.id = "shown" + id;
	    img.src = expimg;
	}
	else //we are expanded
	{
	    subnode.className = "SDKtreehidden";
	    hiddennode.id = "hidden" + id;
	    img.src = colimg;
	}
	oldsubElement = id;
}

function DoAlert(text) //this is used for all UI notifications, including the new alerts that contain UI elements.
{
	var d=document.getElementById("alertdiv");
	d.style.visibility="visible";
    document.getElementById("alerttext").innerHTML = text;
  //  addShim(d,'alertshim');
}

function ShowCode(code)
{
//    var d = document.getElementById("codediv");
//    d.style.visibility = "visible";
//    document.getElementById("codetext").innerHTML = text;
}

function displayAlert(text) //this is used for all UI notifications, including the new alerts that contain UI elements.
{
        document.getElementById("SDKalertmessage").innerHTML = text;   
}

function addShim(el,id) //creates the required 3D shim for an element. Used espcially with the DoAlert() function
{
    var shim = document.getElementById('alertshim');
    if (!shim) 
        shim = document.createElement("iframe"); 
    shim.id = id;         
    shim.frameBorder = "0"; 
    shim.style.position = "absolute";
    shim.style.zIndex = "1";
    shim.style.top  = el.offsetTop + "px";
    shim.style.left = el.offsetLeft + "px";
    shim.style.width  = el.offsetWidth + "px";
    var h = parseInt(document.getElementById("alerttitle").offsetHeight) +
	        parseInt(document.getElementById("alerttext").offsetHeight);
    if (h > 0)
	    shim.style.height = h + "px";
	else
	    shim.style.height = parseInt(document.getElementById("alerttitle").style.height) +
	                        parseInt(document.getElementById("alerttext").style.height) + "px";
    el.shimElement = shim; 
    el.parentNode.insertBefore(shim, el);
}

function HideAlert() //hides the custom Alert box
{
    document.getElementById('alertdiv').style.visibility='hidden';
    var myShim = document.getElementById("alertshim");            
    if (myShim!=null) myShim.parentNode.removeChild(myShim);            
    myShim = null;
}

function HideCode() //hides the custom Alert box
{
    document.getElementById('codediv').style.visibility = 'hidden';
    document.getElementById('codebutton').style.visibility = "hidden";
    document.getElementById('codebutton').style.display = "none";

//    var myShim = document.getElementById("alertshim");
//    if (myShim != null) myShim.parentNode.removeChild(myShim);
//    myShim = null;
}


function doCopy() //copies the code snippet to the clipboard.
{
	if (window.clipboardData) 
	{	
    	window.clipboardData.setData("Text", longcode);
	}
	else
	{
	    alert("Your browser does not allow direct copies to the clipboard. Please select & press Control-C to copy it to your clipboard.");
	}
}

function doWhatsNew() //brings up the What's New topic
{
    //GetRef('bb412561.aspx');
	doClick(3);
	HideAlert();
	
}

function startLoading() 
{
    is3dLoading=true;
}

function doneLoading()
{
    is3dLoading=false;
}

function GetXmlHttp()
{
    var req = null;

    // Check for the W3C Standard way of invoking an XMLHTTP Object first
    if (window.XMLHttpRequest)
    {
        req = new XMLHttpRequest();
    }
    else if (window.ActiveXObject)
    {
        try
        {
            req = new ActiveXObject('Msxml2.XmlHttp.6.0');
        }
        catch(everything)
        {
            try
            {
                req = new ActiveXObject('Msxml2.XmlHttp.3.0');
            }
            catch(everything)
            {
                try
                {
                    req = new ActiveXObject('Msxml2.XMLHTTP');
                }
                catch(everything)
                {
                    try
                    {
                        req = new ActiveXObject('Microsoft.XMLHTTP');
                    }
                    catch(everything) { }
                }
            }
        }
    }
    else
    {
        throw('XMLHTTP Required: Browser not supported');
    }

    return req;
}

function TrackPage(DCS, WT)
{
    if (window.dcsMultiTrack)
    {
        dcsMultiTrack('DCS.dcsuri', DCS, 'WT.ti', WT);
    } 
}
