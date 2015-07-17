<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2=request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<%= path2 %>/resources/web/albmList/albmListSmall.css" rel="stylesheet" type="text/css" />
<script src="<%= path2 %>/resources/web/albmList/jquery.min.js"  type="text/javascript"></script>
<script src="<%= path2 %>/resources/web/albmList/jquery.jqzoom.js"  type="text/javascript"></script>
<script src="<%= path2 %>/resources/web/albmList/albmList.js"  type="text/javascript"></script>


<DIV id="DB_gallery">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="20" align="right" valign="top"><a onclick="parent.hidePopWin(false);"><span style="color:#F60; cursor:pointer">[x]</span></a></td>
        </tr>
      </table>

<div class="bigAlbmList">
      <!-- 大图begin -->
      <div id="preview" class="spec-preview"> 
          <span class="jqzoom"><img jqimg="<%=path2 %>/fileupload/images/${roomatlas[0]}" src="<%=path2 %>/fileupload/images/${roomatlas[0]}" /></span> 
      </div>
      <!-- 大图end -->
      <!-- 缩略图begin -->
      <div class="spec-scroll"> <a class="prev">&lt;</a> <a class="next">&gt;</a>
        <div class="items">
          <ul>
           <c:forEach var="item" items="${roomatlas}">
            <li><img bimg="<%=path2 %>/fileupload/images/${item}" src="<%=path2 %>/fileupload/images/${item}" onclick="preview(this);"></li>
            </c:forEach>
          </ul>
        </div>
      </div>
      <!-- 缩略图end -->
</div>
      

</DIV>
                          
                            
                            
                            