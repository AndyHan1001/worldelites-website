// JavaScript Document
$(function(){
	/*搜索*/
	$(".searchResult").hide();
	
	//$(".searchResult").mouseout(function(){$(".searchResult").hide();});
	$("#SearchWords").keyup(function(){
		if($("#SearchWords").val().length<=0)
			$(".searchResult").hide();
		if($("#SearchWords").val()!=""&&$("#SearchWords").val()!=null){
			$(".searchResult").show();
			var keyword=$("#SearchWords").val();
			var searchType=$("#SearchType").val()=='0'?true:false;
			if(searchType){
				$.post("indexsearch.html",{keyword:keyword},function(data){
					data=eval(data);
					var text="";
					if(data.length>0){
						for(var i=0;i<data.length;i++){
							text2="";
							for(var j=0;j<data[i].allApartment.length;j++){
								text2+="<li><span><img src='/resources/MapCode/ptype1.png'></span><a href='../university_cn/"+data[i].schoolAbb+"/"+data[i].allApartment[j].name.split(" ").join("_")+"'>"+data[i].allApartment[j].name+"</a></li>";
							}
							
							text+=
							"<dl>"+
							"<dt><a href='../university_cn/"+data[i].schoolAbb+"'><img src='/resources/MapCode/ptype101.png'></a></dt><dd><span>have "+data[i].allApartment.length+" apt</span><a class='socovo' href='../university_cn/"+data[i].schoolAbb+"'>"+data[i].schoolAbb+"|"+data[i].schoolName+"</a></dd>"+
								"<ul>"+
									text2+
								"</ul>"+
							"</dl>";
						}
					}else{
						text=
							"<dl>"+
								"<dt></dt><dd>The university does not exist,In other words try input, ^-^</dd>"+
								"<ul>"
								"</ul>"+
							"</dl>";
					}
					$(".searchResult").html(text);
					
					$(".searchResult dd").each(function(i) {
					    $(this).mouseover(function(){
					    	$(".searchResult ul").hide();
					    	if($(this).next("ul").is(":hidden"))
					    		$(this).next("ul").show();
					    	else
					    		$(this).next("ul").hide();
					    });
					});
					
				});
			}else{//单独搜索公寓
				$.post("indexsearchapartment.html",{keyword:keyword},function(data){
					data=eval(data);
					var text="";
					if(data.length>0){
						for(var i=0;i<data.length;i++){
							text+=
							"<dl>"+
							"<dt><a href='../university_cn/"+data[i].nameabb+"/"+data[i].name+"'><img src='/resources/MapCode/ptype1.png'></a></dt><dd><a class='socovo' href='../university_cn/"+data[i].namebb+"/"+data[i].name.split(" ").join("_")+"'>"+data[i].nameabb+"|"+data[i].name+"</a></dd>"+
							"</dl>";
						}
					}else{
						text=
							"<dl>"+
								"<dt></dt><dd>The Apartment does not exist,In other words try input, ^-^</dd>"+
								"<ul>"
								"</ul>"+
							"</dl>";
					}
					$(".searchResult").html(text);
				});
			}
		}
	});
	
$(".searchResult dd").each(function(i) {
	    $(this).mouseover(function(){
	    	$(".searchResult ul").hide();
	    	if($(this).next("ul").is(":hidden"))
	    		$(this).next("ul").show();
	    	else
	    		$(this).next("ul").hide();
	    });
	});

});



