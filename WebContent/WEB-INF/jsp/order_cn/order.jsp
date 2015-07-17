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

<div class="FrameUniversity">
	<div class="DivOrder">
    
    <div class="order" style="width:100%">
    	<div id="">
            <div class="order_percent">
                <img src="<%= path2 %>/resources/web/images/jindu1.jpg" />
            </div>
            <div class="order_title">
                1：Select Floor Plan
            </div>
            <form action="order_money.html" method="post" name="form1">
            	<input type="hidden" value="${oneapartment.id}" name="apartmentid">
             <c:forEach var="item" items="${roomlist}">
            <div class="order_content">
                <table width="100%" border="1" cellspacing="0" cellpadding="0">
                            
                                  <tr>
                                    <td width="100"><img src="<%= path2 %>/fileupload/images/${item.logo}" width="200" height="100"/></td>
                                    <td align="left" width="310">
                                	${(item.name==null||item.name=='')?"":item.name}<br>
                                    Floor Plan Size (sq. ft.)：${(item.area==null||item.area=='')?"":item.area}
                                    </td>
                                    <td align="left" width="190">
                                        ${(item.info==null||item.info=='')?"":item.info}
                                    </td>
                                    <td align="left">
                                    	Monthly Rent:<c:if test="${oneapartment.discounttype=='1'}"> <del>&nbsp;${(item.price==null||item.price=='')?"":item.price}</del></c:if>&nbsp;&nbsp;&nbsp;
                                    	$${(item.discountprice==null||item.discountprice=='')?"":item.discountprice}<br><br>
	                                    Leasing Term:12 Months<br>
                                    </td>
                                    <td width="20" align="center" class="">
                                        <input type="radio" name="roomid" id="roomid" value="${item.id}" checked="checked" style="cursor:pointer">
                                    </td>
                                  </tr>
                            
               </table>
            </div>
            </c:forEach>
            </form>
            <div style="float:left;">
            <table width="900" align="center"><tr><td height="30" style="font-size:12px; color:#999" align="left">
            	If you need to choose a different leasing term or move-in, move-out date, please call us at +1 (510) 761-8000 or email:  contact@worldelites.com
            </td></tr></table>
            </div>
            <div class="order_submit">
                    <div class="s_submit">
                        <p><a href="javascript:sub()"  class="sbt">Next</a></p>
                    </div>
            </div>
        </div>
    
    </div>
	<script type="text/javascript">
		function sub(){
			if($("#roomid").val()!=""&&$("#roomid").val()!=null)
				$("[name='form1']").submit();
			else
				alert("请选择一个户型!");
		}
	</script>

    </div>

</div>
<script type="text/javascript">
	window.onload=function(){
		var text="";
		$.get("getAllPrvc.html",{},function(data){
			for(i=0;i<data.length;i++){
				text+="<option value="+data[i].name+">"+data[i].name+"</option>";
			}
			$("#prvc").html("<option>州</option>"+text);
		},"json");
		
	}
	
	function selectPrvc(v){
		var text="";
		$.get("getAllSchoolByPrvcName.html",{name:v},function(data){
			for(i=0;i<data.length;i++){
				text+="<option value="+data[i].name+">"+data[i].name+"</option>";
			}
			$("#newschool").html(" <option>学校</option>"+text);
		},"json");
		
	}	
</script>
<div style="clear:both;height:100px;"></div>
<%@include file="../others/footer.jsp" %>