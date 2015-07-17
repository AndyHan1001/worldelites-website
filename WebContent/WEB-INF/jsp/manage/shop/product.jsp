<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
<body>
	<h2>商品管理</h2>       
     <!--搜索窗口-->
    	<div id="search" style="margin-bottom:5px;display:none">
  			<div class="easyui-panel" title="检索小工具" style="width:800px;height:50px;padding:10px;overflow:hidden" data-options="iconCls:'icon-search',noheader:'ture'">
            	<form action="" name="" method="">
            	<table>
                	<tr>
                        <td>类型
                        	<select name="" id="searchType">
                        		<option value="kong">&nbsp;&nbsp;&nbsp;&nbsp;</option>
                        		<option value="类型">类型</option>
                       	    </select>
                            关键字(不填写为所选类型下所有数据)<input class="textbox" name="" id="searchKeyword">
                        </td>
                        <td><input type="button" onClick="searchClick()" value="检索"></td>
                    </tr>
                </table>
                </form>
                <script type="text/javascript">
					function searchClick(){
						var searchType=$("#searchType").val();//搜索分类
						var searchKeyword=$("#searchKeyword").val();//关键字
						$.post();//Ajax--Post
					}
                </script>
            </div>
        </div>
    <!--搜索窗口--结束-->
  
	<table width="100%" style="height:450px;" id="dg" title="商品列表"  
	data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getProductList.html',method:'get'">
		<thead>
			<th data-options="field:'ck',checkbox:true"></th>
			<th field="id" >流水号</th>
			<th field="ssid" >产品id</th>
			<th field="type" >产品类型</th>
			<th field="typecode" >类型代码</th>
			<th field="ctime" formatter="formatterdate">产品发表时间</th>
			<th field="utime" formatter="formatterdate">更新时间</th>
			<th field="btime"  formatter="formatterdate">开始时间</th>
			<th field="etime" formatter="formatterdate" >结束时间</th>
			<th field="title" >产品名称</th>
			<th field="pp" >品牌</th>
			<th field="gg" >规格</th>
			<th field="xh" >型号</th>
			<th field="ys" >颜色</th>
			<th field="num" >产品库存数量</th>
			<th field="p1" >成本价</th>
			<th field="p2" >市场价</th>
			<th field="p3" >销售价</th>
			<th field="p4" >会员价</th>
			<th field="p5" >成交价</th>
			<th field="v1" >附属1</th>
			<th field="v2" >附属2</th>
			<th field="v3" >附属3</th>
			<th field="v4" >附属4</th>
			<th field="v5" >附属5</th>
			<th field="v6" >附属6</th>
			<th field="keyword" >关键词</th>
			<th field="note" >附录</th>
			<th field="source" >产品来源</th>
			<th field="memo" >摘要</th>
			<th field="content" >产品内容</th>
			<th field="logo" >产品缩略图</th>
			<th field="atlas" >产品图集ID</th>
			<th field="isenable" formatter="formatterisdel">产品是否通过审核</th>
			<th field="stick" formatter="formatterisdel">产品是否置顶</th>
			<th field="visit">产品浏览次数</th>
			<!-- <th field="isdel" formatter="formatterisdel">是否显示</th> -->
		</thead>

	</table>

    <!--添加窗口--> 
    <div id="productadd" class="easyui-window" title="添加新商品" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="saveProduct.html" method="post" name="productAS">
	    	<table cellpadding="5" bproduct="0">
            	<caption style="font-size:20px;margin-bottom:10px;">添加商品
                  </caption>
	    		<tr>
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" ></input></td>
                    <td style="width:100px">商品ID:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" ></input></td>
	    		</tr>
                <tr>
	    			<td>商品类型:</td>
	    			<td><select class="easyui-combobox"  name="type" required="required" data-options=" valueField: 'code',
	    			textField: 'channel',width:135,panelHeight:'auto',url:'getAllTypeJsonForProduct.html',onChange:function(){$('#typecode_as').val($(this).combobox('getValue'))}"></select>
                    <td>类型代码:</td>
	    			<td><input name="typecode" id="typecode_as" required="required" class="easyui-validatebox" missingMessage="无法获取产品类型编号<br>请查看产品类型<br>是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td>
	    		</tr>
                <tr>
	    			<td>发表时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="ctime_as" id="ctime_as"></input></td>
                    <td>更新时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="utime_as" id="utime_as"></input></td>
	    		</tr>
                <tr>
	    			<td>开始时间:</td>
	    			<td><input name="btime_as" id="btime_as" class="easyui-datetimebox" required="required" editable="false"></input> </td>
                    <td>结束时间:</td>
	    			<td><input name="etime_as" id="etime_as" class="easyui-datetimebox" validType="TimeCheck['btime_as']" invalidMessage="结束时间必须大于开始时间" required="required" editable="false"></input> </td>
	    		</tr>
                <tr>
	    			<td>名称:</td>
	    			<td colspan="3"><input class="easyui-validatebox" required="true"  validType="length[0,30]" name="title"></input></td>
	    		</tr>
                <tr>
	    			<td>品牌:</td>
	    			<td><input class="easyui-validatebox"   validType="length[0,40]" name="pp"></input></td>
                    <td>规格:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,40]" name="gg"></input></td>
	    		</tr>
                 <tr>
	    			<td>型号:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,40]" name="xh"></input></td>
                    <td>颜色:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,40]" name="ys"></input></td>
	    		</tr>
                 <tr>
	    			<td>产品库存数量:</td>
	    			<td><input class="easyui-numberbox" required="true"  validType="length[0,8]" name="num"></input></td>
                    <td></td>
	    			<td></td>
	    		</tr>
                <tr>
	    			<td>成本价:</td>
	    			<td><input class="easyui-numberbox" required="true"  validType="length[0,20]" name="p1"></input></td>
                    <td>市场价:</td>
	    			<td><input class="easyui-numberbox" required="true"  validType="length[0,20]" name="p2"></input></td>
	    		</tr>
                <tr>
	    			<td>销售价:</td>
	    			<td><input class="easyui-numberbox" required="true"  validType="length[0,20]" name="p3"></input></td>
                    <td>VIP价:</td>
	    			<td><input class="easyui-numberbox" required="true"  validType="length[0,20]" name="p4"></input></td>
	    		</tr>
                <tr>
	    			<td>成交价:</td>
	    			<td colspan="3"><input class="easyui-numberbox"  validType="length[0,20]" name="p5"></input></td>

	    		</tr>
                <tr>
	    			<td>附属1:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="v1"></input></td>
                    <td>附属2:</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,255]" name="v2"></input></td>
	    		</tr>
                <tr>
	    			<td>附属3:</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,255]" name="v3"></input></td>
                    <td>附属4:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="v4"></input></td>
	    		</tr>
                <tr>
	    			<td>附属5:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="v5"></input></td>
                    <td>附属6:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="v6"></input></td>
	    		</tr>
                
                
                 <tr>
                 	<td>关键词:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,30]" name="keyword" style="background:#FFF"></input></td>
                    <td>备注:</td>
	    			<td><textarea name="note" rows="3" cols="18" style="background:#FFF"></textarea></td>
	    		</tr>
                 <tr>
                 	<td>产品来源:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="source" style="background:#FFF"></input></td>
                    <td>商品摘要:</td>
	    			<td><textarea name="memo" rows="3" cols="15" style="background:#FFF"></textarea></td>
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
                    <td>商品图集ID:</td>
                    <td><input class="easyui-numberbox"  validType="length[0,8]" name="atlas"></input></td>
                </tr>
                <tr>
	    			<td>商品是否通过审核:</td>
	    			<td><select name="isenable">
	    					<option value="1">是</option>
	    					<option value="0" selected>否</option>
	    				</select>
	    			</td>
                    
	    			<td>商品是否置顶:</td>
	    			<td>
                    	<select  name="stick">
                        	<option value="0" selected>否</option>
                        	<option value="1">是</option>
                        </select>
                    </td>
	    		</tr> 
                
                <tr>
	    			<td>商品浏览次数:</td>
	    			<td colspan="3"><input onfocus="this.blur()"  readonly="readonly" name="visit" value="0"></input></td>                  
	    			<!-- <td>商品是否显示:</td>
	    			<td>
                    	<select  name="isdel">
                        	<option value="0" selected>否</option>
                        	<option value="1">是</option>
                        </select>
                    </td> -->
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
    <div id="productedit" class="easyui-window" title="修改商品" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="updateProduct.html" method="post" name="productES">
	    	<table cellpadding="5" bproduct="0">
            	<caption style="font-size:20px;margin-bottom:10px;">修改商品
                  </caption>
	    		<tr>
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" ></input></td>
                    <td style="width:100px">商品ID:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" ></input></td>
	    		</tr>
                <tr>
	    			<td>图片类型:</td>
	    			<td><select class="easyui-combobox"  name="type" required="required" data-options=" valueField: 'ssid',
	    			textField: 'channel',width:135,panelHeight:'auto',url:'getAllTypeJsonForProduct.html',onChange:function(){$('#typecode_es').val($(this).combobox('getValue'))}"></select>
                    <td>类型代码:</td>
	    			<td><input name="typecode" id="typecode_es" required="required" class="easyui-validatebox" missingMessage="无法获取产品类型编号<br>请查看产品类型<br>是否存在"
	    			 style="background:#E7E7E7;width:130px;border:#A5ACB2 1px solid" onfocus="this.blur()"  readonly="readonly"></input></td>
	    		</tr>
                <tr>
	    			<td>发表时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="ctime_es" id="ctime_es"></input></td>
                    <td>更新时间:</td>
	    			<td><input class="easyui-datetimebox" required="required" editable="false" name="utime_es" id="utime_es"></input></td>
	    		</tr>
                <tr>
	    			<td>开始时间:</td>
	    			<td><input name="btime_es" id="btime_es" class="easyui-datetimebox" required="required" editable="false"></input> </td>
                    <td>结束时间:</td>
	    			<td><input name="etime_es" id="etime_es" class="easyui-datetimebox" validType="TimeCheck['btime_es']" 
	    			invalidMessage="结束时间必须大于开始时间" required="required" editable="false"></input> </td>
	    		</tr>
                <tr>
	    			<td>名称:</td>
	    			<td colspan="3"><input class="easyui-validatebox" required="true"  validType="length[0,30]" name="title"></input></td>
	    		</tr>
                <tr>
	    			<td>品牌:</td>
	    			<td><input class="easyui-validatebox"   validType="length[0,40]" name="pp"></input></td>
                    <td>规格:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,40]" name="gg"></input></td>
	    		</tr>
                 <tr>
	    			<td>型号:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,40]" name="xh"></input></td>
                    <td>颜色:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,40]" name="ys"></input></td>
	    		</tr>
                 <tr>
	    			<td>产品库存数量:</td>
	    			<td><input class="easyui-numberbox" required="true"  validType="length[0,8]" name="num"></input></td>
                    <td></td>
	    			<td></td>
	    		</tr>
                <tr>
	    			<td>成本价:</td>
	    			<td><input class="easyui-numberbox" required="true"  validType="length[0,20]" name="p1"></input></td>
                    <td>市场价:</td>
	    			<td><input class="easyui-numberbox" required="true"  validType="length[0,20]" name="p2"></input></td>
	    		</tr>
                <tr>
	    			<td>销售价:</td>
	    			<td><input class="easyui-numberbox" required="true"  validType="length[0,20]" name="p3"></input></td>
                    <td>VIP价:</td>
	    			<td><input class="easyui-numberbox" required="true"  validType="length[0,20]" name="p4"></input></td>
	    		</tr>
                <tr>
	    			<td>成交价:</td>
	    			<td colspan="3"><input class="easyui-numberbox"  validType="length[0,20]" name="p5"></input></td>

	    		</tr>
                <tr>
	    			<td>附属1:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="v1"></input></td>
                    <td>附属2:</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,255]" name="v2"></input></td>
	    		</tr>
                <tr>
	    			<td>附属3:</td>
	    			<td><input  class="easyui-validatebox"  validType="length[0,255]" name="v3"></input></td>
                    <td>附属4:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="v4"></input></td>
	    		</tr>
                <tr>
	    			<td>附属5:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="v5"></input></td>
                    <td>附属6:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,255]" name="v6"></input></td>
	    		</tr>
                
                
                 <tr>
                 	<td>关键词:</td>
	    			<td><input class="easyui-validatebox"  validType="length[0,30]" name="keyword" style="background:#FFF"></input></td>
                    <td>备注:</td>
	    			<td><textarea name="note" rows="3" cols="18" style="background:#FFF"></textarea></td>
	    		</tr>
                 <tr>
                 	<td>产品来源:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]" name="source" style="background:#FFF"></input></td>
                    <td>商品摘要:</td>
	    			<td><textarea name="memo" rows="3" cols="15" style="background:#FFF"></textarea></td>
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
	    				<input type="hidden" name="logo" id="logo_es" />
	    				<div id="logoView"></div>
	    				<script >
	    					document.getElementById("logoView").innerHTML=
	    						"<img src='/MOVIE/fileupload/images/"+document.getElementById('logo_es').value+"' />";
	    				</script>
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html?act=es" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; "></iframe>
	    			</td>
                    <td>商品图集ID:</td>
                    <td><input class="easyui-numberbox"  validType="length[0,8]" name="atlas"></input></td>
                </tr>
                <tr>
	    			<td>商品是否通过审核:</td>
	    			<td><select name="isenable">
	    					<option value="1">是</option>
	    					<option value="0" selected>否</option>
	    				</select>
	    			</td>
                    
	    			<td>商品是否置顶:</td>
	    			<td>
                    	<select  name="stick">
                        	<option value="0" selected>否</option>
                        	<option value="1">是</option>
                        </select>
                    </td>
	    		</tr> 
                
                <tr>
	    			<td>商品浏览次数:</td>
	    			<td colspan="3"><input onfocus="this.blur()"  readonly="readonly" name="visit" value="0"></input></td>                  
	    			<!-- <td>商品是否显示:</td>
	    			<td>
                    	<select  name="isdel">
                        	<option value="0" selected>否</option>
                        	<option value="1">是</option>
                        </select>
                    </td> -->
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
				},{
					iconCls:'icon-add',
					handler:function(){
						/* var row = $('#dg').datagrid('getSelected');
						var pid = 0;
						if(row != null)
							pid = row.id;
						
						//$('#menu_add_parentid').value = pid;
						document.getElementById("type_add_parentid").value=pid; */
						$('#productadd').window('open');
					}
				},{
					iconCls:'icon-edit',
					handler:function(){
						var selectedRows=$('#dg').datagrid('getSelections');
						if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return; }
						var row = $('#dg').datagrid('getSelected');
						$('#productedit').form('load', 'getProductById.html?id='+row.id);
						$.post("getProductById.html?id="+row.id,{},function(data){
							KindEditor.html('#content',data.content);
							
							$('#productedit #ctime_es').datetimebox('setValue',data.ctime);
							$('#productedit #utime_es').datetimebox('setValue',data.utime);
							$('#productedit #btime_es').datetimebox('setValue',data.btime);
							$('#productedit #etime_es').datetimebox('setValue',data.etime);							
						},"json")
						$('#productedit').window('open');
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
								    url: 'delProductById.html?id='+row.id,
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
				}]
			});			
		})
	</script>
</body>
</html>