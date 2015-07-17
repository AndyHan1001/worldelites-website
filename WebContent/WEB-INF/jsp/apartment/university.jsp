<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<%@include file="../head.jsp" %>
<div class="FrameAbout">
	<div class="BigTT"><img src="<%= path2 %>/resources/web/images/kouhao.jpg" /></div>

    <div class="SmlTT">We provide marketing service to off-campus housing management companies</div>
</div>
<div class="clearDiv2"></div>

<div class="FrameMap" style="background:white">
	<div class="divMapShow" style="background:white">
        <div class="divMapLeft">
            	${map.content}
            </div>
        <div class="divMapRight">
              <iframe style="float:left; width:800px; height:500px;" frameborder="0" scrolling="no" src="<%=path2 %>/resources/MapDiv.html"></iframe>
      </div>

  </div>
</div>

<div class="clearDiv"></div>

<div class="FrameUniversity">
	<div class="divUniversity">
        	<div class="dplHead">
            	&nbsp;&nbsp;SELECTED：${title}
                <p><a href=""></a></p>
            </div>
            <input type="hidden" value="${areaid}" id="showSchool"> 
            <div class="dplMain">          
				<script language="javascript">
                   window.onload=function(){
                	   $(".UniversityList dt").each(function(){
                   		$(this).click(function(){
                   			$(this).next("dd").toggleClass("expanded");
                   		});
                   	})
                	   
                	   $("#G"+$("#showSchool").val()).next("dd").toggleClass("expanded");//显示指定id的dd
                	   $('html,body').animate({scrollTop:$("#G"+$("#showSchool").val()).offset().top},1000);//滚动到此处
                	   
                    	
                    };
                </script>
                          
                <c:forEach items="${ualist}" var="item">
                <dl class="UniversityList">
                    <dt id="G${item.geography.id}">&nbsp;&nbsp;${fn:replace(item.geography.name,"_"," ")}</dt>
                    <dd>
                    	<c:forEach items="${item.schoolList}" var="item2">
                        <p><a href="<%=path %>/university/${item2.memo}"><c:out value="${item2.name}"></c:out></a></p>
                        </c:forEach>
                    </dd>
                </dl>
                </c:forEach>
                    

            </div>
    </div>
</div>

<%@include file="../footer.jsp" %>