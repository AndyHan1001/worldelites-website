<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<body>
	<h2>优惠券管理</h2>       
     <!--搜索窗口-->
    	<div id="search" style="margin-bottom:5px;display:none">
  			<div class="easyui-panel" title="检索小工具" style="width:800px;height:50px;padding:10px;overflow:hidden" data-options="iconCls:'icon-search',noheader:'ture'">
            	<form action="" name="" method="">
            	<table>
                	<tr>
                        <td>搜索类型
                        	<select name="searchType" id="searchType">
                        		<option value="id" >流水号</option>
								<option value="userid" >用户ID</option>
								<option value="username" >用户名</option>
								<option value="userlastname" >用户姓</option>
								<option value="usermail" >用户邮箱</option>
								<option value="usercountry" >用户国家</option>
								<option value="schoolid" >学校ID</option>
								<option value="schoolname" >学校名称</option>
								<option value="apartmentid" >公寓ID</option>
								<option value="apartmentname" >公寓名称</option>
                       	    </select>
                            	关键字<input class="textbox" name="" id="searchKeyword">
                        </td>
                        <td><input type="button" onClick="searchClick()" value="检索"></td>
                    </tr>
                </table>
                </form>
                <script type="text/javascript">
					function searchClick(){
						var searchType=$("#searchType").val();//搜索分类
						var searchKeyword=$("#searchKeyword").val();//关键字
						$.post("searchsystem.html",{table:"Coupon",searchType:searchType,searchKeyWord:searchKeyword},function(data){
							$("#dg").datagrid("loadData",data);
						},"json");//Ajax--Post
					}
					$(function(){
						
					});
                </script>
            </div>
        </div>
    <!--搜索窗口--结束-->
  
	<table width="100%" style="height:450px;" id="dg" title="优惠劵列表"  
	data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getCouponList.html',method:'get'">
		<thead>
			<th data-options="field:'ck',checkbox:true"></th>
			<th field="id" >数据库编号</th>
			<th field="userid" >用户ID</th>
			<th field="usermail" >用户邮箱</th>
			<th field="memo" >摘要</th>
			<th field="username" >用户名</th>
			<th field="userlastname" >用户姓</th>
			<th field="usercountry" >用户国家</th>
			<th field="schoolid" >学校ID</th>
			<th field="schoolname" >学校名称</th>
			<th field="apartmentid" >公寓ID</th>
			<th field="apartmentname" >公寓名称</th>
			<th field="ctime" formatter="formatterdate">优惠价时间</th>
			<th field="pm" >渠道</th>
			<th field="knowweby" >知道我们通过</th>
			
			<th field="price" >价格</th>
			<th field="discountprice" >优惠价</th>
			
			<th field="content" >内容</th>
			<th field="logo" >缩略图</th>
			<!-- <th field="file1" >附件1</th>
			<th field="file2" >附件2</th> -->
			
			<!-- <th field="isdel" formatter="formatterisdel">是否显示</th> -->
		</thead>

	</table>

    <!--添加窗口--> 
    <div id="productadd" class="easyui-window" title="添加优惠券" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="saveCoupon.html" method="post" name="productAS">
	    	<table cellpadding="5" bproduct="0">
	    		<tr style="display:none">
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" ></input></td>
	    		</tr>
                
               <tr>
	    			<td>用户ID:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,8]" name="userid"></input></td>
                    <td>用户国籍:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="usercountry"></input></td>
	    		</tr>
	    		
	    		<tr>
	    			<td>用户名:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="username"></input></td>
                    <td>用户姓:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="userlastname"></input></td>
	    		</tr>
	    		<tr>
	    			<td>学校ID:</td>
	    			<td><input class="easyui-numberbox"  validType="length[0,8]" name="schoolid"></input></td>
                    <td>学校名称:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="schoolname"></input></td>
	    		</tr>
	    		<tr>
	    			<td>公寓ID:</td>
	    			<td><input class="easyui-numberbox"  validType="length[0,8]" name="apartmentid"></input></td>
                    <td>公寓名称:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="apartmentname"></input></td>
	    		</tr>
	    		<tr>
	    			<td>价格:</td>
	    			<td><input class="easyui-numberbox"  validType="length[0,8]" name="price"></input></td>
                    <td>优惠价:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,8]" name="discountprice"></input></td>
	    		</tr>
	    		<tr>
	    			<td>发出时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="ctime_as" id="ctime_as"></input></td>
					<td>附记:</td>
					<td><input class="easyui-validatebox"  validType="length[0,255]" name="memo"></input></td>
	    		</tr>
                 <tr>
	    			<td>商品内容:</td>
	    			<td colspan="3">
                    		<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="content"]', {
                                	cssPath : "<%=request.getContextPath()+"/resources/kindeditor41/plugins/code/prettify.css"%>",
                    				uploadJson : "<%=request.getContextPath()+"/resources/kindeditor41/jsp/upload_json.jsp"%>",
                    				fileManagerJson : "<%=request.getContextPath()+"/resources/kindeditor41/jsp/file_manager_json.jsp"%>",
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
                        <textarea name="content" style="width:450px;height:250px;visibility:hidden;"></textarea>
                        <!--编辑器代码END-->
                    </td>
	    		</tr>
                <tr>
                	<td>商品缩略图:</td>
	    			<td>
						<input type="hidden" name="logo" id="logo" />
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; "></iframe>
					</td>
                    <td>优惠劵:</td>
                    <td><input class="easyui-validatebox"  validType="length[0,255]" name="file1"></input></td>
                </tr>
                       
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="right">
                    	<input type="button" onClick="productA()" value="提交">&nbsp;&nbsp;
                        <script>
							function productA(){
								if($('[name="productAS"]').form('validate')){
										$('[name="productAS"]').submit();

								}
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--添加商品窗口--结束-->
    
    
   <!--修改窗口--> 
    <div id="productedit" class="easyui-window" title="修改优惠券" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="updateCoupon.html" method="post" name="productES">
	    	<table cellpadding="5" bproduct="0">
            	<tr style="display:none">
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" ></input></td>
	    		</tr>
               <tr>
	    			<td>用户ID:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,8]" name="userid"></input></td>
                    <td>用户国籍:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="usercountry"></input></td>
	    		</tr>
	    		<tr>
	    			<td>用户名:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="username"></input></td>
                    <td>用户姓:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="userlastname"></input></td>
	    		</tr>
	    		<tr>
	    			<td>学校ID:</td>
	    			<td><input class="easyui-numberbox"  validType="length[0,8]" name="schoolid"></input></td>
                    <td>学校名称:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="schoolname"></input></td>
	    		</tr>
	    		<tr>
	    			<td>公寓ID:</td>
	    			<td><input class="easyui-numberbox"  validType="length[0,8]" name="apartmentid"></input></td>
                    <td>公寓名称:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="apartmentname"></input></td>
	    		</tr>
	    		<tr>
	    			<td>价格:</td>
	    			<td><input class="easyui-numberbox"  validType="length[0,8]" name="price"></input></td>
                    <td>优惠价:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,8]" name="discountprice"></input></td>
	    		</tr>
	    		<tr>
	    			<td>发出时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="ctime_es" id="ctime_es"></input></td>
					<td>附记:</td>
					<td><input class="easyui-validatebox"  validType="length[0,255]" name="memo"></input></td>
	    		</tr>
                 <tr>
	    			<td>商品内容:</td>
	    			<td colspan="3">
                    		<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="content"]', {
                                	cssPath : "<%=request.getContextPath()+"/resources/kindeditor41/plugins/code/prettify.css"%>",
                    				uploadJson : "<%=request.getContextPath()+"/resources/kindeditor41/jsp/upload_json.jsp"%>",
                    				fileManagerJson : "<%=request.getContextPath()+"/resources/kindeditor41/jsp/file_manager_json.jsp"%>",
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
                        <textarea name="content" id="content" style="width:450px;height:250px;visibility:hidden;"></textarea>
                        <!--编辑器代码END-->
                    </td>
	    		</tr>
                <tr>
                	<td>商品缩略图:</td>
	    			<td>
	    				<input  name="logo" type="hidden" id="logo_es" />
	    				<div id="logoView">
	    					原图片:<img src='<%=path %>/fileupload/images/' width='80' height='40' id="imgg"/>
	    				</div>
	    				<script>
	    					function loadLogo(){
	    						$("#logoView img").attr("src","/fileupload/images/"+$("#logo_es").val());
	    					}
	    				</script>
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html?act=es" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; "></iframe>
	    			</td>
                    <td>优惠劵:</td>
                    <td><input class="easyui-validatebox"  validType="length[0,255]" name="file1"></input></td>
                </tr>                           
                <tr>
	    			<td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="right">
                    	<input type="button" onClick="productE()" value="提交">&nbsp;&nbsp;
                        <script>
							function productE(){
								if($('[name="productES"]').form('validate')){
										$('[name="productES"]').submit();

								}
							}
						</script>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>
    <!--修改商品窗口--结束-->    


<script type="text/javascript">
		$(function(){
			var pager = $('#dg').datagrid().datagrid('getPager');	// get the pager of datagrid
			pager.pagination({
				buttons:[{
					iconCls:'icon-search',
					handler:function(){
						if($('#search').css('display')=='block'){
							$('#search').slideUp();
						}else{
							$('#search').slideDown();	
						}
					}
				}, {
					iconCls:'icon-add',
					handler:function(){
						
						$('#productadd').window('open');
					}
				},{
					iconCls:'icon-edit',
					handler:function(){
						var selectedRows=$('#dg').datagrid('getSelections');
						if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
						var row = $('#dg').datagrid('getSelected');
						$('#productedit').form('load', 'getCouponById.html?id='+row.id);
						$.post("getCouponById.html?id="+row.id,{},function(data){
							KindEditor.html('#content',data.content);
							
							$('#productedit #ctime_es').datetimebox('setValue',data.ctime);
													
						},"json");
						$('#productedit').window('open');
						setTimeout(loadLogo,1000);
					}
				},{
					iconCls:'icon-remove',
					handler:function(){
						var selectedRows=$('#dg').datagrid('getSelections');
						if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
						var row = $('#dg').datagrid('getSelected');
						$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
						    if (r){ 
						    	var row = $('#dg').datagrid('getSelected');
						    	$.ajax({
								    url: 'delCouponById.html?id='+row.id,
								    type: "GET",
								    dataType: "text",
								    success: function (date) {
								    	if(date > 0)
								    		$.messager.alert("提示","删除成功!");
								    	else
								    		$.messager.alert("提示","删除失败!");
								    	
								    	$('#dg').datagrid('reload');
								    }
								});     
						    }
						    
						});
					}
				},{
					iconCls:'icon-sum',//导出
					handler:function(){
						location.href="outExcelForCoupon.html";
					}
				}]
			});			
		})
	</script>
</body>
</html>