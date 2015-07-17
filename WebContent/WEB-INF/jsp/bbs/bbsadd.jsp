<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<link rel="stylesheet" href="<%=path2 %>/resources/kindeditor41/themes/default/default.css" />
    <link rel="stylesheet" href="<%=path2 %>/resources/kindeditor41/plugins/code/prettify.css" />
    <script type="text/javascript" charset="utf-8" src="<%=path2 %>/resources/kindeditor41/kindeditor.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path2 %>/resources/kindeditor41/lang/zh_CN.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path2 %>/resources/kindeditor41/plugins/code/prettify.js"></script>

<link rel="stylesheet" href="<%= path2 %>/resources/web/css/about.css" type="text/css" />

<form action="<%=path2 %>/bbs/bbssave.html" method="post" target="_parent">

  <table width="500" border="0" cellpadding="2" style="font-size:12px;" bgcolor="#FFFFFF">
  <tr>
    <td width="70" height="30" align="center">发新贴:</td>
    <td width="430"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td  align="left" valign="top"><input name="title" class="textbox" size="30" /> </td>
          <td width="20"  align="center" valign="top"><a onclick="parent.hidePopWin(false);"><span style="color:#F60; cursor:pointer">[x]</span></a></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center">帖子内容:</td>
    <td>
		<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="content"]', {
                                    resizeType : 1,
                                    allowPreviewEmoticons : true,
                                    allowImageUpload : true,
                                    afterBlur:function(){this.sync();},
                                    items : [
                                        'source', '|','fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                                        'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                                        'insertunorderedlist', '|', 'emoticons', 'image', 'link']
                                });
                            });
                        </script>
                        <textarea name="content" style="width:90%;height:180px;visibility:hidden;">快点输入你的详细信息吧...</textarea>

			</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="50"><input type="submit" class="submit" value=" 发 布 " />
    <input type="hidden" name="universityid" id="universityid" value="${universityid}"></td>
  </tr>
</table>               
</form>