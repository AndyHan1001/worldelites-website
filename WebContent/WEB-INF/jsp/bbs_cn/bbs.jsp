<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<%@include file="../others/head.jsp" %>

<div class="FrameAbout">
	<div class="BigTT"><img src="<%= path2 %>/resources/web/images/kouhao.jpg" /></div>

    <div class="SmlTT">We provide marketing service to off-campus housing management companies</div>
</div>
<div class="clearDiv2"></div>

<div class="FrameMain">
	<div class="divMain">
        <div class="MainLeft">
        	<div class="MainLeftMenu">
                <div class="dplHead">
                    &nbsp;&nbsp;<p>University</p>
                </div>
                <div class="dplMainTag">


                         	<c:if test="${universityid=='' || universityid==null}">
                            <div class="bbstagNow"><a title="${item.name}" href="bbs.html?universityid=&amp;tagid=${tagid}">ALL</a></div>
                            </c:if>
                         	<c:if test="${universityid!='' && universityid!=null}">
                            <div class="bbstag"><a title="${item.name}" href="bbs.html?universityid=&amp;tagid=${tagid}">ALL</a></div>
                            </c:if>


            			 <c:forEach items="${schoollist}" var="item">
                         
                         	<c:if test="${item.id==universityid}">
                            <div class="bbstagNow"><a title="${item.name}" href="bbs.html?universityid=${item.id}&amp;tagid=${tagid}">${item.memo}</a></div>
                            </c:if>
                         	<c:if test="${item.id!=universityid}">
                            <div class="bbstag"><a title="${item.name}" href="bbs.html?universityid=${item.id}&amp;tagid=${tagid}">${item.memo}</a></div>
                            </c:if>
                            
                        </c:forEach>
                </div>
				<div class="clearDiv"></div>
                <div class="dplHead">
                    &nbsp;&nbsp;<p>Blog Tag</p>
                </div>
                <div class="dplMainTag">

                         	<c:if test="${tagid=='' || tagid==null}">
                            <div class="bbstagNow"><a title="${item.name}" href="bbs.html?universityid=${universityid}&amp;tagid=">ALL</a></div>
                            </c:if>
                         	<c:if test="${tagid!='' && tagid!=null}">
                            <div class="bbstag"><a title="${item.name}" href="bbs.html?universityid=${universityid}&amp;tagid=">ALL</a></div>
                            </c:if>

            			 <c:forEach items="${threadtag}" var="item">


                         	<c:if test="${item.id==tagid}">
                            <div class="bbstagNow"><a title="${item.name}" href="bbs.html?universityid=${universityid}&amp;tagid=${item.id}">${item.name}</a></div>
                            </c:if>
                         	<c:if test="${item.id!=tagid}">
                            <div class="bbstag"><a title="${item.name}" href="bbs.html?universityid=${universityid}&amp;tagid=${item.id}">${item.name}</a></div>
                            </c:if>
                            
                        </c:forEach>
                </div>

                
            </div>
            
            <div class="clearDiv"></div>
            
        	          
        </div>
        <div class="MainRight">
                  <div class="xggl">
                  <style type="text/css">
						/* clearfix */
						.clearfix{clear:both;}
						
						/* wrapper */
						#wrapper{margin-top:20px;width:100%;}
						#container{position:relative;width:800px;margin:0 auto 25px;padding-bottom:10px;}
						.grid{width:188px;min-height:100px;padding:15px;background:#fff;margin:8px;font-size:12px;float:left;box-shadow:0 1px 3px rgba(34,25,25,0.4);-moz-box-shadow:0 1px 3px rgba(34,25,25,0.4);-webkit-box-shadow:0 1px 3px rgba(34,25,25,0.4);-webkit-transition:top 1s ease, left 1s ease;-moz-transition:top 1s ease, left 1s ease;-o-transition:top 1s ease, left 1s ease;-ms-transition:top 1s ease, left 1s ease;}
						.grid strong{height:36px;ling-height:35px;overflow:hidden;}
						.grid p{ word-wrap:break-word; word-break:normal;height:108px;overflow:hidden}
						.grid strong{border-bottom:1px solid #ccc;margin:10px 0;display:block;padding:0 0 5px;font-size:17px;}
						.grid .meta{text-align:right;color:#777;font-style:italic;}
						.grid .imgholder img{max-width:100%;background:#ccc;display:block;background:url(/resources/web/publiu/images/loding.gif) no-repeat center;width:220px;height:150px;}
				  </style>
                            <h4>WE 博客&nbsp;&nbsp;${school.name}</h4>
                            <script type="text/javascript" src="<%=path %>/resources/web/publiu/js/jquery.lazyload.min.js"></script>
                            <script type="text/javascript" src="<%=path %>/resources/web/publiu/js/blocksit.min.js"></script>
                            <div id="wrapper">
                            
                                <div id="container">
                                </div>
                                <div id="nothread" style="clear:both;margin:0 auto;margin-top:10px;background:#AAA;border:1px dotted #EEE;color:#FFF;width:;height:30px;text-align:center;line-height:30px"><b>No More..</b></div>
                            
                                <input type="hidden" id="schoolid" value="${schoolid}">
                                <script type="text/javascript">
                                var size=0;
                                $("#nothread").hide();	
                                //onload---------
                                $(function(){
                                    $.post("refreshBbs.html",{start:size,schoolId:<%= request.getAttribute("universityid") %>,tagId:<%= request.getAttribute("tagid") %>},function(data){
                                        data=eval(data);
                                        if(data.length==0){
                                            $("#nothread").show();	
                                            return false;
                                            
                                        }else{
                                            var text="";
                                            for(var i=0;i<data.length;i++){
                                                
                                                 text+="<div class='grid'>"+
                                                    "<div class='imgholder'>"+
                                                   " <a href='<%=path %>/bbs_cn/bbsshow.html?id="+data[i].id+"' target='_blank'>"+
                                                    "<img class='lazy' src='<%=path %>/resources/web/publiu/images/pixel.gif'' data-original='<%= path2 %>/fileupload/images/"+data[i].logo+"' width='220' /></a></div>"+
                                                    "<strong>"+data[i].title+"</strong>"+
                                                    "<p>"+
                                                    data[i].memo.substr(0,40)+
                                                    "</p>"+
                                                    "<div class='meta'><a href='<%=path %>/bbs_cn/bbsshow.html?id="+data[i].id+"' target='_blank'>Detail>>></a></div>"+
                                                "</div>";
                                            }
                                            
                                            $('#container').append(text);
                                            $('#container').BlocksIt({
                                                numOfCol:3,
                                                offsetX: 8,
                                                offsetY: 8
                                            });
                                            $("img.lazy").lazyload();
                                        }
                                        
                                    },"json");
                                });
                                
                                
                                
                                    $(window).scroll(function(){
                                            // 当滚动到最底部以上50像素时， 加载新内容
                                        if ($(document).height() - $(this).scrollTop() - $(this).height()<250){
                                        	size+=10;
                                        $.post("refreshBbs.html",{start:size,schoolId:<%= request.getAttribute("universityid") %>,tagId:<%= request.getAttribute("tagid") %>},function(data){
                                        	data=eval(data);
                                                if(data.length==0){
                                                    $("#nothread").show();	
                                                    return false;
                                                    
                                                }else{
                                                    var text="";
                                                    
                                                    for(var i=0;i<data.length;i++){
                                                        
                                                         text+="<div class='grid'>"+
                                                            "<div class='imgholder'>"+
                                                            " <a href='<%=path %>/bbs_cn/bbsshow.html?id="+data[i].id+"' target='_blank'>"+
                                                            "<img class='lazy' src='<%=path %>/resources/web/publiu/images/pixel.gif' data-original='<%= path2 %>/fileupload/images/"+data[i].logo+"' width='220' /></a></div>"+
                                                            "<strong>"+data[i].title+"</strong>"+
                                                            "<p>"+
                                                            data[i].memo.substr(0,40)+
                                                            "</p>"+
                                                            "<div class='meta'><a href='<%=path %>/bbs_cn/bbsshow.html?id="+data[i].id+"' target='_blank'>Detail>>></a></div>"+
                                                        "</div>";
                                                    }
                                                    
                                                    $('#container').append(text);
                                                    $('#container').BlocksIt({
                                                        numOfCol:3,
                                                        offsetX: 8,
                                                        offsetY: 8
                                                    });
                                                    $("img.lazy").lazyload();
                                                }
                                                
                                            },"json");
                                            
                                        }
                                    });
                                    
                                    //window resize
                                    var currentWidth = 800;
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
                                            conWidth = 800;
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
                                            
                            </div>
                </div>

        </div>
        
        
    </div>
</div>

<%@include file="../others/footer.jsp" %>