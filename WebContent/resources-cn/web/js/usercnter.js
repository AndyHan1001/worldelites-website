$(function(){
	$(".edit").next().hide();//隐藏掉后边的控件
	$(".edit").css({"cursor":"pointer","color":"blue"});//鼠标手势
	/*$(".edit").each(function(i){
		
		$(this).click(function(){
			//$(".edit").show().next().hide();//隐藏全部。效果只显示一条修改
			$(this).hide();
			$(this).next().show();
		});
	});*/
	$("#editbutton").click(function(){
		$(".edit").next().show();//show后边的控件
	});
	
});