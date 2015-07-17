$(function(){
			addEvent('map_1');
			addEvent('map_2');
			addEvent('map_3');
			addEvent('map_4');
			addEvent('map_5');
			addEvent('map_6');
			addEvent('map_7');
			addEvent('map_8');
			addEvent('map_9');
			addEvent('map_10');
			addEvent('map_11');
			addEvent('map_12');
			addEvent('map_13');
			addEvent('map_14');
			addEvent('map_15');
			addEvent('map_16');
			addEvent('map_17');
			addEvent('map_18');
			addEvent('map_19');
			addEvent('map_20');
			addEvent('map_21');
			addEvent('map_22');
			addEvent('map_23');
			addEvent('map_24');
			addEvent('map_25');
			addEvent('map_26');
			addEvent('map_27');
			addEvent('map_28');
			addEvent('map_29');
			addEvent('map_30');
			addEvent('map_31');
			addEvent('map_32');
			addEvent('map_33');
			addEvent('map_34');
			addEvent('map_35');
			addEvent('map_36');
			addEvent('map_37');
			addEvent('map_38');
			addEvent('map_39');
			addEvent('map_40');
			addEvent('map_41');
			addEvent('map_42');
			addEvent('map_43');
			addEvent('map_44');
			addEvent('map_45');
			addEvent('map_46');
			addEvent('map_47');
			addEvent('map_48');
			addEvent('map_49');
			addEvent('map_50');
			addEvent('map_51');
})

$(function(){
	//lakes's color and border color
	if($('#lakes').find('path').eq(0).attr('fill') != 'undefined'){
		$('#lakes').find('path').attr({'fill':map_config['default']['lakescolor']}).css({'stroke':map_config['default']['bordercolor']});
	}

	//configuration for title text's shadow
	$('.tip').css({
		'box-shadow':'1px 2px 4px '+map_config['default']['namesShadowColor'],
		'-moz-box-shadow':'2px 3px 6px '+map_config['default']['namesShadowColor'],
		'-webkit-box-shadow':'2px 3px 6px '+map_config['default']['namesShadowColor'],
	});

	//configuration for map shadow
	if($('#shadow').find('path').eq(0).attr('fill') != 'undefined'){
		var shadowOpacity = map_config['default']['shadowOpacity'];
		var shadowOpacity = parseInt(shadowOpacity);
		if (shadowOpacity >=100){shadowOpacity = 1;}else if(shadowOpacity <=0){shadowOpacity =0;}else{shadowOpacity = shadowOpacity/100;}
		
		$('#shadow').find('path').attr({'fill':map_config['default']['shadowcolor']}).css({'fill-opacity':shadowOpacity})
	}
});

function addEvent(id,relationId){
	var _obj = $('#'+id);
	var _Textobj = $('#'+id+','+'#'+map_config[id]['namesId']);
	var _h = $('#map').height();

	$('#'+map_config[id]['namesId']).find('tspan').attr({'fill':map_config['default']['namescolor']});

		_obj.attr({'fill':map_config[id]['upcolor'],'stroke':map_config['default']['bordercolor']});
		_Textobj.attr({'cursor':'default'});
		if(map_config[id]['enable'] == true){
			_Textobj.attr({'cursor':'pointer'});
			_Textobj.hover(function(){
				//moving in/out effect
				$('#tip').show().html(map_config[id]['name']);
				_obj.css({'fill':map_config[id]['overcolor']})

			},function(){
				$('#tip').hide();
				$('#'+id).css({'fill':map_config[id]['upcolor']});
			})
			//clicking effect
			_Textobj.mousedown(function(){
				$('#'+id).css({'fill':map_config[id]['downcolor']});
			})
			_Textobj.mouseup(function(){
				$('#'+id).css({'fill':map_config[id]['overcolor']});
				if(map_config[id]['target'] == '_blank'){
					window.open(map_config[id]['url']);	
				}else if(map_config[id]['target'] == '_parent'){
					parent.window.location.href=map_config[id]['url'];
				}
				
				else{
					window.location.href=map_config[id]['url'];
				}
			})
			_Textobj.mousemove(function(e){
				var x=e.pageX-20, y=e.pageY+(-38);
				var tipw=$('#tip').outerWidth(), tiph=$('#tip').outerHeight(), 
				x=(x+tipw>$(document).scrollLeft()+$(window).width())? x-tipw-(20*2) : x
				y=(y+tiph>$(document).scrollTop()+$(window).height())? $(document).scrollTop()+$(window).height()-tiph-10 : y
				$('#tip').css({left:x, top:y})
			})
		}	
}

