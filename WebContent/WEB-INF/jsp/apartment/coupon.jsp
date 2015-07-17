<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<%@include file="../head.jsp" %>

<script type="text/javascript" src="<%= path %>/resources/web/js/easydialog.min.js"></script>


<div class="clearDiv"></div>

<div class="FrameUniversity">
	<div class="DivOrder">
    
    <div class="order">
    

            <div class="order_title">
                Get COUPON
            </div>
            <div class="order_content">
            <div class="list_coupon_smeil">
            <ul>
 	             <li style="height:auto !important;">
                <div class="pic"><a href="<%=path  %>/university/${oneapartment.memo}/${fn:replace(oneapartment.name,' ','_')}"><img src="<%= path2 %>/fileupload/images/${oneapartment.logo}" /></a></div>
                <div class="text">
                  <h2>
                  <a href="<%=path  %>/university/${oneapartment.memo}/${fn:replace(oneapartment.name,' ','_')}">${oneapartment.name}</a>
                    <c:if test="${oneapartment.discounttype=='1'}">
                    	<div class="vovo1">
                    	${oneapartment.uniquediscount}
                    </div>	
                    </c:if>
                    <c:if test="${oneapartment.discounttype=='2'}">
                    	<div class="vovo2">
                    	${oneapartment.uniquediscount}
                    </div>	
                    </c:if>
                     <c:if test="${oneapartment.discounttype!='1'&&oneapartment.discounttype!='2'}">
                    	<div class="vovo3">
                    	${oneapartment.uniquediscount}
                    </div>	
                    </c:if>  
                  </h2>
                  <div style="float:left; width:100%; font-size:12px; line-height:1.5; margin-top:8px;">
                  ${oneapartment.hignlight}
                  </div>
                </div>
                <div class="text2">
<!--                <c:if test="${oneapartment.discounttype!='2'}">
                  <p><del>$${oneapartment.marketprice}</del> $${oneapartment.discount}</p>
                </c:if>
                <c:if test="${oneapartment.discounttype=='2'}">
                  <p>From $${oneapartment.discount}</p>
                </c:if>
-->               <p>&nbsp;</p>
                 <div class="s_submit">
                     <p><a href="javascript:download(${oneapartment.id})"  class="sbt">Get Coupon</a></p>
                 </div>
                </div>
              </li>

            </ul>
          </div>            
            </div>
            
        
    </div>


            	 <div class="aptHeadRight2">
                        <c:if test="${oneapartment.discounttype=='1'}">
                            <div class="vovo1">
                            ${oneapartment.uniquediscount}
                        </div>	
                        </c:if>
                        <c:if test="${oneapartment.discounttype=='2'}">
                            <div class="vovo2">
                            ${oneapartment.uniquediscount}
                        </div>	
                        </c:if>
                         <c:if test="${oneapartment.discounttype!='1'&&oneapartment.discounttype!='2'}">
                            <div class="vovo3">
                            ${oneapartment.uniquediscount}
                        </div>	
                        </c:if>     
                    </div>          

            <div class="su_rt fixed" id="sidebar">
                    <div class="su_rt_1">
                            <div class="su_main">
                               ${oneapartment.news}
                            </div>
                    </div>
    
                   
                      <div class="s_btn">
                        <p><a href="javascript:addfvrt(${oneapartment.id})"  class="sc">Add to Favorite</a></p>
                        <c:if test="${oneapartment.isbook==1}">
							  <p><a href="../order/order.html?apartmentid=${oneapartment.id}" class="yd">Book a Room</a></p>      	
                        </c:if>
                        <c:if test="${oneapartment.isbook!=1}">
							  <p><a href="###" class="yd" style="background:#CCC;">Book a Room</a></p> 	
                        </c:if>
                        
                    </div>
                   <c:if test="${othersapartmentlist!=null&&othersapartmentlist!=''}">
                    <div class="su_rt_1">
                            <div class="tit">
                                <strong>Recently Viewed</strong>
                            </div>
                            <div class="su_main">
                                <c:forEach var="item" items="${othersapartmentlist}">
                                <li>
                                    <dl>
                                        <dd class="pic"><a href="apartment.html?id=${item.id}"><img src="<%= path2 %>/fileupload/images/${item.logo}" /></a></dd>
                                        <dd class="info">
                                            <h1><a href="apartment.html?id=${item.id}"><c:out value="${item.name}"></c:out></a></h1>
                                            <p><a href="apartment.html?id=${item.id}"><c:out value="${item.memo}"></c:out></a></p>
                                        </dd>
                                        <dd class="price">From $<c:out value="${item.marketprice}"></c:out></dd>
                                    </dl>
                                </li>
                                </c:forEach>
                            </div>
                    </div> 
                    </c:if>
                    </div>
    
    </div>

</div>

<script language="javascript">
function removeHTMLTag(str) {
    str = str.replace(/<\/?[^>]*>/g,''); //去除HTML tag
    str = str.replace(/[ | ]*\n/g,'\n'); //去除行尾空白
    //str = str.replace(/\n[\s| | ]*\r/g,'\n'); //去除多余空行
    str=str.replace(/&nbsp;/ig,'');//去掉&nbsp;
    return str;
}
function msg(s)
{
	easyDialog.open({
		container : {
			//header : '关闭拖拽',
			content : "<span style='text-align:center; color:#666666; padding:30px; padding-top:60px; padding-bottom:60px; background-color:#ffffff'>"+s+"<span>"
		},
		drag : false,
		autoClose : 3500
	});
}

</script>
<script language="javascript">
function download(id)
{
	$.ajax({
	    url:"addcoupon.html",    //请求的url地址
	    dataType:"text",   //返回格式为json
	    async:true,//请求是否异步，默认为异步，这也是ajax重要特性
	    data:{"id":id},    //参数值
	    type:"POST",   //请求方式
	    beforeSend:function(){
	        msg("Coupon Sending....");
	    },
	    success:function(data){
	    if(data=="1"){
			msg("Success! Please find your WE Coupon in your email ^^");
			}
		else{
			msg("Sorry, you have applied this coupon. If you didn’t receive the coupon email, please try again after 5 minutes.");
			}
		},
	    complete:function(data){
	    },
	    error:function(){
	        //请求出错处理
	    }
	});

}


function addfvrt(id)
{
	$.post("<%= path %>/apartment/addcollection.html",{id:id},function(data){
		if(data==null||data==""){
			//
		}else{
			//
		}
		alert(data);
	},"text");
}
</script>

<%@include file="../footer.jsp" %>