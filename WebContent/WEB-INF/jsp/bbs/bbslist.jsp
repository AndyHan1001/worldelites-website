<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<%@include file="../head.jsp" %>
<link rel='stylesheet' href='<%=path2 %>/resources/web/publiu/style.css' media='screen' />
<style>
	p{word-wrap:break-word; word-break:normal}
</style>
<div class="FrameAbout">
	<div class="BigTT"><img src="<%= path2 %>/resources/web/images/kouhao.jpg" /></div>

    <div class="SmlTT">We provide marketing service to off-campus housing management companies</div>
</div>
<div class="clearDiv2"></div>

<div class="FrameMain">
	<div class="divMain">
        
        <div class="MainRight" style="width:1120px; display:none">
			<h4 style="width:1120px">
            <input type="button" value="我要发帖" class="submit"  onclick="showPopWin('<%= path %>/bbs/bbsadd.html?universityid=${universityid}', 520, 290, null)" />
            &nbsp;&nbsp;&nbsp;&nbsp;${universityname}
            </h4>
           
           
        </div>
        
        
    </div>
</div>

<div class="clearDiv"></div>









  <div id="wrapper">
                
                    <div id="container">
                    </div>
                    <div class="clearDiv"></div>
                    <div id="nothread" style="display:none;margin:0 auto;border:1px dotted #CCC;color:#666666;width:;height:30px;text-align:center;line-height:30px">没有了</div>
                
                <input type="hidden" id="schoolid" value="${universityid}">
                <script type="text/javascript">
                var size=10;
                var flag=1;
                //onload---------
                $(function(){
                    if(flag==1){
                    $.post("refreshThread.html",{start:0,schoolId:$("#schoolid").val()},function(data){
                        
                        if(data.length==0){
                            $("#nothread").show();	
                            return false;
                            
                        }else{
                            var text="";
                            for(var i=0;i<data.length;i++){
                                var lengths=data[i].content.length;
                                if(lengths>3000){
                                    subString=data[i].content.substr(0,400+lengths%10*10);
                                }else if(lengths>2000){
                                    subString=data[i].content.substr(0,400+lengths%10*10);
                                }else if(lengths>1000){
                                    subString=data[i].content.substr(0,400+lengths%10*10);
                                }else if(lengths>500){
                                    subString=data[i].content.substr(0,400+lengths%10*10);
                                }else{ 
                                    subString=data[i].content.substr(0,lengths);
                                }
                                
                                 text+="<div class='grid'>"+
                                    "<div class='imgholder'>"+
                                    "<img class='lazy' src='<%=path %>/resources/web/publiu/images/pixel.gif' data-original='<%= path2 %>/fileupload/images/"+data[i].logo+"' width='175' /></div>"+
                                    "<strong>"+data[i].title+"</strong>"+
                                    "<p>"+
                                    subString+
                                    "</p>"+
                                    "<div class='meta'><a href='<%=path %>/bbs/bbsshow.html?id="+data[i].id+"' target='_blank'>点击查看>>></a></div>"+
                                "</div>";
                            }
                            
                            $('#container').append(text);
                            $('#container').BlocksIt({
                                numOfCol:5,
                                offsetX: 8,
                                offsetY: 8
                            });
                            $("img.lazy").lazyload();
                        }
                        
                    },"json");
                    flag++;
                    }
                });
                
                
                
                    $(window).scroll(function(){
                            // 当滚动到最底部以上50像素时， 加载新内容
                        if ($(document).height() - $(this).scrollTop() - $(this).height()<250){
                            
                            $.post("refreshThread.html",{start:size,schoolId:$("#schoolid").val()},function(data){
                                
                                if(data.length==0){
                                    $("#nothread").show();	
                                    return false;
                                    
                                }else{
                                    var text="";
                                    
                                    for(var i=0;i<data.length;i++){
                                        var lengths=data[i].content.length;
                                        if(lengths>3000){
                                            subString=data[i].content.substr(0,400+lengths%10*10);
                                        }else if(lengths>2000){
                                            subString=data[i].content.substr(0,400+lengths%10*10);
                                        }else if(lengths>1000){
                                            subString=data[i].content.substr(0,400+lengths%10*10);
                                        }else if(lengths>500){
                                            subString=data[i].content.substr(0,400+lengths%10*10);
                                        }else{ 
                                            subString=data[i].content.substr(0,lengths);
                                        }
                                        
                                         text+="<div class='grid'>"+
                                            "<div class='imgholder'>"+
                                            "<img class='lazy' src='<%=path %>/resources/web/publiu/images/pixel.gif' data-original='<%= path2 %>/fileupload/images/"+data[i].logo+"' width='175' /></div>"+
                                            "<strong>"+data[i].title+"</strong>"+
                                            "<p>"+
                                            subString+
                                            "</p>"+
                                            "<div class='meta'><a href='<%=path %>/bbs/bbsshow.html?id="+data[i].id+"' target='_blank'>点击查看>>></a></div>"+
                                        "</div>";
                                    }
                                    
                                    $('#container').append(text);
                                    $('#container').BlocksIt({
                                        numOfCol:5,
                                        offsetX: 8,
                                        offsetY: 8
                                    });
                                    $("img.lazy").lazyload();
                                }
                                size+=10;
                            },"json");
                            
                        }
                    });
                    
                    //window resize
                    var currentWidth = 1100;
                    $(window).resize(function() {
                        var winWidth = $(window).width();
                        var conWidth;
                        if(winWidth < 660) {
                            conWidth = 440;
                            col = 2
                        } else if(winWidth < 880) {
                            conWidth = 660;
                            col = 3
                        } else if(winWidth < 1100) {
                            conWidth = 880;
                            col = 4;
                        } else {
                            conWidth = 1100;
                            col = 5;
                        }
                        
                        if(conWidth != currentWidth) {
                            currentWidth = conWidth;
                            $('#container').width(conWidth);
                            $('#container').BlocksIt({
                                numOfCol: col,
                                offsetX: 8,
                                offsetY: 8
                            });
                        }
                    });
                
                </script>










<%@include file="../footer.jsp" %>