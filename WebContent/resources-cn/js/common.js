// JavaScript Document

window.onload=function(){
	<!--栏目一 JS-->
	Qfast.add('widgets', { path: "js/terminator2.2.min.js", type: "js", requires: ['fx'] });  
	Qfast(false, 'widgets', function () {
		K.tabs({
			id: 'fsD1',   //焦点图包裹id  
			conId: "D1pic1",  //** 大图域包裹id  
			tabId:"D1fBt",  
			tabTn:"a",
			conCn: '.fcon', //** 大图域配置class       
			auto: 1,   //自动播放 1或0
			effect: 'fade',   //效果配置
			eType: 'click', //** 鼠标事件
			pageBt:true,//是否有按钮切换页码
			bns: ['.prev', '.next'],//** 前后按钮配置class                          
			interval: 3000  //** 停顿时间  
		}) 
	}) 
	<!--栏目一 END-->
<!--Nav子菜单-->
	o_head_nav_div=document.getElementById("head_nav_div");
	o_head_nav=document.getElementById("head_nav");
	
	o_head_nav.onmouseover=function(){
			o_head_nav_div.style.display="block"
	}
	o_head_nav_div.onmouseover=function(){
			o_head_nav_div.style.display="block"
	}
	o_head_nav.onmouseout=function(){
			o_head_nav_div.style.display="none"
	}
	o_head_nav_div.onmouseout=function(){
			o_head_nav_div.style.display="none"
	}
<!--Nav子菜单--END-->

}
<!--滚动字幕-->
$(function(){
	var count=$("#srool li")
	if(count.length>5){//当li数量大于9个时进行滚动
		function scrollText(){
			
			$("#srool li:first").appendTo($("#srool"));	
			
		}
		var timer=setInterval(scrollText,1000)
		$("#srool").hover(function(){
				clearInterval(timer);
		},function(){
			timer=setInterval(scrollText,1000)
		})
	}
	})
<!--滚动字幕-END->
<!--main_column7左右滚动-->
var gg=0;
function main_column7_left(value){
	var main_column7_left_focus=document.getElementById("main_column7_left_focus")
	if(value=='left'){//向左移动
			if(main_column7_left_focus.offsetLeft>(-2492)){
			gg-=623;
			startMove(main_column7_left_focus,{left:gg})
			
				
			//main_column7_left_focus.style.disabled=ture;
			}
	   }else{//向右移动
			if(main_column7_left_focus.offsetLeft<0){
			gg+=623;
			startMove(main_column7_left_focus,{left:gg})
			}
	}
}
<!--END-->
