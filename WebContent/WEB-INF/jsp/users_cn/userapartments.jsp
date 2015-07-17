<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<%@include file="../others/head.jsp" %>

<div class="FrameAbout">
	<div class="BigTT"><img src="<%= path2 %>/resources/web/images/kouhao.jpg" /></div>

</div>

<div class="clearDiv2"></div>

<div class="FrameMain">
	<div class="divMain">
        <div class="MainLeft">
        	<div class="MainLeftMenu">
                <div class="dplHead">
                    <p>我的账户</p>
                </div>
                <div class="dplMain">
                    <ul>
                        <li class="nowHover"><a href="userinfo.html" >我的信息</a></li>
                        <!--<li class="nowHover"><a href="userthreads.html" >My Blog</a></li>-->
                        <li  id="hoverNew"><a href="userapartments.html" >我收藏的公寓</a></li>
                        <li class="nowHover"><a href="usercoupon.html" >我的WE Coupon</a></li>                        
                        <li class="nowHover"><a href="userorder.html" >我的订单</a></li>
                    </ul>
                </div>
            </div>
            
           
        </div>
        <div class="MainRight">
			<h4><p>我收藏的公寓</p></h4>
            <div class="myThreads list_main_myThreads">
            <ul>
                <c:forEach items="${apartmentlist}" var="item">
 	             <li>
                <div class="pic"><a href="<%=path  %>/university_cn/${item.memo}/${fn:replace(item.name,' ','_')}"><img src="<%= path2 %>/fileupload/images/${item.logo}" /></a></div>
                <div class="text">
                  <h2>
                  <a href="<%=path  %>/university_cn/${item.memo}/${fn:replace(item.name,' ','_')}">${item.name}</a>
                    <c:if test="${item.discounttype=='1'}">
                    	<div class="vovo1">
                    	${item.uniquediscount}
                    </div>	
                    </c:if>
                    <c:if test="${item.discounttype=='2'}">
                    	<div class="vovo2">
                    	${item.uniquediscount}
                    </div>	
                    </c:if>
                     <c:if test="${item.discounttype!='1'&&item.discounttype!='2'}">
                    	<div class="vovo3">
                    	${item.uniquediscount}
                    </div>	
                    </c:if>  
                  </h2>
                  <div style="float:left; width:100%; font-size:12px; line-height:1.5; margin-top:8px;">
                  ${fn:substring(item.hignlight,0,180)}
                  </div>
                </div>
                <div class="text2">
                <c:if test="${item.discounttype=='1'||item.discounttype=='2'}">
                  <p><del>$${item.marketprice}</del> $${item.discount}</p>
                </c:if>
                <c:if test="${item.discounttype!='1'&&item.discounttype!='2'}">
                  <p>From $${item.discount}</p>
                </c:if>
                
                  <p class="url"><a href="javascript:deleteCollection('${item.id}')">Remove</a></p>
                </div>
              </li>
                </c:forEach>

            </ul>
            

            </div>            
			
        </div>
    </div>
</div>
<!-- 删除某个收藏公寓的ajax -->
<script type="text/javascript">
	function deleteCollection(id){
		$.get("removeCollection.html",{id:id},function(data){
			if(data=="1")
				alert("Remove Success!");
			else
				alert("Remove Fail!");
			window.location.href=location;
		},"text");
	}
</script>
<%@include file="../others/footer.jsp" %>