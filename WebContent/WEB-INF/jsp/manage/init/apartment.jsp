<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../head.jsp" %>
	<link  type="text/css" rel="stylesheet"  href="<%=path %>/resources/web/subDiv/submodal.css" />
	<script type="text/javascript" src="<%=path %>/resources/web/subDiv/submodalsource.js"></script>
<body>
	<h2>公寓管理</h2>       
          <!--搜索窗口-->
    	<div id="search" style="margin-bottom:5px;display:none">
  			<div class="easyui-panel" title="检索小工具" style="width:800px;height:50px;padding:10px;overflow:hidden" data-options="iconCls:'icon-search',noheader:'ture'">
            	<form action="" name="" method="">
            	<table>
                	<tr>
                        <td>搜索类型
                        	<select name="searchType" id="searchType">
                        		<option value="mark" >公寓编号</option>
								<option value="name" >公寓名称</option>
								<option value="nameabb" >公寓名称缩写</option>
								<option value="corporation" >公寓所在房产公司</option>
								<option value="marketprice" >公寓最低月租</option>
								<option value="addr" >公寓地址</option>
								<option value="petpolicy" >宠物政策</option>
								<option value="petpolicy_cn" >宠物政策(cn)</option>
								<option value="deposit" >公寓押金</option>
								<option value="applicationfee" >申请费</option>
								<option value="activityfee" >活动经费</option>
								<option value="managementfee" >社区管理费</option>
								<option value="parking" >停车场</option>
								<option value="otherfee" >其他费用</option>
								<option value="otherfee_cn" >其他费用(cn)</option>
								<option value="enterearly" >提前入住</option>
								<option value="enterearly_cn" >提前入住(cn)</option>
								<option value="matching" >室友匹配服务</option>
								<option value="matching_cn" >室友匹配服务(cn)</option>
								<option value="parentname" >学校名称</option>
								<option value="memo" >公寓附录</option>
								<option value="atlas" >学校图集路径</option>
								<option value="location" >学校地理位置</option>
								<option value="ifvote">是否推荐</option>
								<option value="isenable">是否启用</option>				
								<option value="isbook">是否可预订</option>				
								<option value="iscoupon">是否可得到优惠券</option>				
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
						$.post("searchsystem.html",{table:"Apartment",searchType:searchType,searchKeyWord:searchKeyword},function(data){
							$("#dg").datagrid("loadData",data);
						},"json");//Ajax--Post
					}
					$(function(){
						
					});
                </script>
            </div>
        </div>
    <!--搜索窗口--结束-->
  
	<table width="100%"  style="height:450px;" id="dg" title="公寓列表" 
	 data-options="autoRowHeight:false,rownumbers:true,singleSelect:true,pagination:true,url:'getApartmentList.html',method:'get'">
		<thead>
			<th data-options="field:'ck',checkbox:true"></th>
			<th field="id" >数据库ID</th>
			<!-- <th field="ssid" >公寓编号</th> -->
			<th field="mark" >公寓编号</th>
			<th field="name" >公寓名称</th>
			<th field="nameabb" >公寓名称缩写</th>
			<th field="corporation" >公寓所在房产公司</th>
			<th field="csname" >客服经理姓名</th>
			<th field="csmail" >客服经理邮箱</th>
			<th field="mail" >公寓经理邮箱</th>
			<th field="tel" >公寓联系电话</th>
			<th field="fax" >公寓联系传真</th>
			<th field="worktime" >公寓办公时间</th>
			<th field="worktime_cn" >公寓办公时间(cn)</th>
			
			
			<th field="discount" >公寓优惠金额</th>
			<!-- <th field="discounttype_cn" >公寓折扣类型(cn)</th> -->
			<!-- <th field="discount_cn" >公寓提供折扣(cn)</th> -->
			<!-- <th field="lowestprice" >公寓最低价格</th> -->
			<th field="marketprice" >公寓最低月租</th>
			
			<th field="discounttype" >WE折扣类型</th>
			<th field="discounttype_back" >WE折扣类型数值</th>
			
			<th field="uniquediscount" >WE折扣信息</th>
			<th field="uniquediscount_cn" >WE独家折扣(cn)</th>
			<th field="addr" >公寓地址</th>
			<th field="website" >公寓网址</th>
			<th field="news" >公寓特惠&新闻</th>
			<th field="news_cn" >公寓特惠&新闻(cn)</th>
			<th field="tag" >公寓标签</th>
			<th field="tag_cn" >公寓标签(cn)</th>
			<!-- <th field="hignlight" >公寓亮点</th>
			<th field="hignlight_cn" >公寓亮点(cn)</th> -->
			<th field="introduction">公寓周边</th>
			<th field="introduction_cn">公寓周边(cn)</th>
			
			<th field="feature" >公寓配置</th>
			<th field="feature_cn" >公寓配置(cn)</th>
			<th field="amenities" >社区设施</th>
			<th field="amenities_cn" >社区设施(cn)</th>
			
			<th field="peripheral" >公寓周边</th>
			<th field="peripheral_cn" >公寓周边(cn)</th>
			<th field="utility" >公寓水电网等费</th>
			<th field="utility_cn" >公寓水电网等费(cn)</th>
			<th field="leasingtype" >租赁方式</th>
			<th field="leasingtype_cn" >租赁方式(cn)</th>
			<th field="petpolicy" >宠物政策</th>
			<th field="petpolicy_cn" >宠物政策(cn)</th>
			<th field="deposit" >公寓押金</th>
			<th field="applicationfee" >申请费</th>
			<th field="applicationfee_cn" >申请费</th>
			<th field="activityfee" >活动经费</th>
			<th field="managementfee" >公寓管理费</th>
			<th field="parking" >停车场</th>
			<th field="parking_cn" >停车场(cn)</th>
			<th field="otherfee" >其他费用</th>
			<th field="otherfee_cn" >其他费用(cn)</th>
			
			<!-- <th field="forpay" >代缴费</th>
			<th field="forpay_cn" >代缴费(cn)</th> -->
			<th field="enterearly" >提前入住</th>
			<th field="enterearly_cn" >提前入住(cn)</th>
			<th field="matching" >室友匹配服务</th>
			<th field="matching_cn" >室友匹配服务(cn)</th>
					
			
			<th field="parentname" >学校名称</th>
			<th field="parentid" >学校编号</th>
			<th field="logo" >公寓缩略图</th>
			<th field="coupon" >公寓优惠劵</th>
			<th field="memo" >Coupon提示文本</th>
			<th field="atlas" >学校图集路径</th>
			<th field="location" >学校地理位置</th>
			<th field="sort" >公寓排序</th>
			<th field="ifvote">是否推荐</th>
			<th field="isenable"  formatter="formatterisdel">是否启用</th>
			<th field="isbook"  formatter="formatterisdel">是否可预订</th>		
			<th field="iscoupon"  formatter="formatterisdel">是否可得到优惠券</th>		
			<!-- <th field="isdel" formatter="formatterisdel">是否删除：0否，1是</th> -->
		
		</thead>

	</table>

    <!--添加窗口--> 
    <div id="apartmentadd" class="easyui-window" title="添加新公寓" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:880px;height:440px;padding:10px;">
	    <form action="saveApartment.html" method="post" name="apartmentAS">
	    	<table cellpadding="5" border="0">
	    		<tr   style="display:none">
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" ></input></td>
                    <td style="width:100px">公寓编号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" ></input></td>
	    		</tr>
	    		 <tr>
	    			<td>公寓编号:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="mark" ></input></td>
	    			<td></td>
	    			<td></td>
	    		</tr>
                <tr>
	    			<td style="width:250px">公寓名称:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="name" data-options="required:true" ></input></td>
	    			<td>公寓名称缩写:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="nameabb"></input></td>
	    		</tr> 
	    		 <tr>
	    			<td>学校名称:</td>
	    			<td>
						<select class="easyui-combobox"  name="parentname" required="required" data-options=" valueField: 'id',
	    			textField: 'name',width:135,panelHeight:'135',url:'getSchoolListByWordKey.html',
	    			onChange:function(){$('#parentid_as').val($(this).combobox('getValue'))}" >
	    			</select>
	    			</td>
	    			<td>学校编号:</td>
	    			<td><input onfocus="this.blur()" class="easyui-validatebox"  readonly="readonly" name="parentid" id="parentid_as" data-options="required:true"></input></td>
	    		</tr> 
	    		 <tr>
	    			<td>房产公司:</td>
	    			<td>
	    			
						<select class="easyui-combobox"  name="corporation" data-options=" valueField: 'name',
	    			textField: 'name',width:135,panelHeight:'135',url:'getAllCompanyList.html'" >
	    			</select>
	    			</td>
	    			<td>公寓经理邮箱:</td>
	    			<td>
	    				<input class="easyui-validatebox" validType="email" validType="length[0,255]" invalidMessage="请填写正确的邮件格式"  name="mail" ></input>
	    			</td> 
	    		</tr> 
	    		<tr>
	    			<td>公寓联系电话:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="tel"></input></td>
	    			<td>公寓联系传真:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="fax"></input></td>
	    		</tr>
	    		<tr>
	    			<td>公寓工作时间:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="worktime"></input></td>
	    			<td>公寓工作时间(cn):</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="worktime_cn"></input></td>
	    		</tr>
	    		
	    		<tr>
	    			<td>客服经理姓名:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="csname"></input></td>
	    			<td>客服经理邮箱:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="csmail"></input></td>
	    		</tr> 
	    		<tr>
	    			<td>WE折扣类型:</td>
	    			<td><select name="discounttype">
						<option value="1">Rate/WE</option>
		    			<option value="2">Bonus/WE</option>
		    			<option value="3">Specials/WE</option>
					</select></td>
					<td>WE折扣类型-具体数值:</td>
	    			<td><input name="discounttype_back" class="easyui-numberbox" validType="length[0,11]"   />
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>WE折扣信息:</td>
	    			<td><textarea name="uniquediscount" rows="1" cols="18"></textarea></input></td>
	    			<td>WE折扣信息(cn):</td>
	    			<td><textarea name="uniquediscount_cn" rows="1" cols="18"></textarea></input></td>
	    		</tr>
	    		<tr>
	    			<td>公寓最低月租:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,255]"  name="marketprice"></input></td>
	    			<td>公寓优惠金额:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,255]"  name="discount"></td>

	    		</tr>
	    		<tr>
	    			<td>押金:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="deposit"></input></td>
	    			<td>押金(cn):</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="deposit_cn"></input></td>
	    		</tr>
	    		<tr>
	    			<td>申请费:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,255]"  name="applicationfee"></input></td>
	    			<td>申请费(cn):</td>
	    			<td><input class="easyui-numberbox" validType="length[0,255]"  name="applicationfee_cn"></input></td>
	    		</tr>
	    		<tr>	
	    			<td>公寓特惠&新闻:</td>
	    			<td><textarea name="news" rows="1" cols="18"></textarea> </td>
					<td>公寓特惠&新闻(cn):</td>
	    			<td><textarea name="news_cn" rows="1" cols="18"></textarea> </td>
	    		</tr>
	    		<tr>
	    			<td>公寓网站:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="website"></input></td>
	    			<td>公寓地址:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="addr"></input></td>
	    		</tr>
	    		<tr>
	    			<td>公寓标签:</td>
	    			<td>
	    				<select class="easyui-combobox"  name="tag"  data-options=" valueField: 'name',
	    			textField: 'name',width:135,panelHeight:'135',url:'getAllTagList.html'" > </select>   				
	    			</td>
	    			<td>公寓标签(cn):</td>
	    			<td>
	    				<select class="easyui-combobox"  name="tag_cn"  data-options=" valueField: 'memo',
	    			textField: 'memo',width:135,panelHeight:'135',url:'getAllTagList.html'" > </select>   				
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>公寓视频:</td>
	    			<td colspan="3">
	    				<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="video"]', {
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
                        <textarea name="video" style="width:450px;height:250px;visibility:hidden;"></textarea>
                        <!--编辑器代码END-->
	    			</td>
	    		</tr>
	    		
	    		<tr>
	    			<td>公寓周边:</td>
	    			<td colspan="3">
	    				<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="introduction"]', {
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
                        <textarea name="introduction" style="width:450px;height:250px;visibility:hidden;"></textarea>
                        <!--编辑器代码END-->
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>公寓周边(cn):</td>
	    			<td colspan="3">
	    				<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="introduction_cn"]', {
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
                        <textarea name="introduction_cn" style="width:450px;height:250px;visibility:hidden;"></textarea>
                        <!--编辑器代码END-->
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>公寓亮点:</td>
	    			<td colspan="3">
	    				<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="hignlight"]', {
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
                        <textarea name="hignlight" style="width:450px;height:250px;visibility:hidden;"></textarea>
                        <!--编辑器代码END-->
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>公寓亮点(cn):</td>
	    			<td colspan="3">
	    				<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="hignlight_cn"]', {
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
                        <textarea name="hignlight_cn" style="width:450px;height:250px;visibility:hidden;"></textarea>
                        <!--编辑器代码END-->
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>公寓配置:</td>
	    			<td>
	    				<textarea name="feature" rows="1" cols="18"></textarea> 
	    			</td>
	    			<td>公寓配置(cn):</td>
	    			<td>
	    				<textarea name="feature_cn" rows="1" cols="18"></textarea>    				
	    			</td>
	    		</tr>
	    		<tr>
					<td>社区设施:</td>
	    			<td>
	    				<textarea name="amenities" rows="1" cols="18"></textarea> 
	    			</td>
	    			<td>社区设施(cn):</td>
	    			<td>
	    				<textarea name="amenities_cn" rows="1" cols="18"></textarea> 
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>杂费项目:</td>
	    			<td>
	    				<textarea name="apartment_discountproject" rows="1" cols="18"></textarea> 
	    			</td>
					<td>杂费项目(cn):</td>
	    			<td>
	    				<textarea name="apartment_discountproject_cn" rows="1" cols="18"></textarea>    				
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>公寓周边:</td>
	    			<td><textarea name="peripheral" rows="1" cols="18"></textarea> </td>
	    			<td>公寓周边(cn):</td>
	    			<td><textarea name="peripheral_cn" rows="1" cols="18"></textarea> </td>
	    		</tr>
	    		<tr>
					<td>水电网等费:</td>
	    			<td><textarea name="utility" rows="1" cols="18"></textarea> </td>
	    			<td>水电网等费(cn):</td>
	    			<td><textarea name="utility_cn" rows="1" cols="18"></textarea> </td>
	    		</tr>
	    		<tr>
					<td>宠物政策:</td>
	    			<td><textarea name="petpolicy" rows="1" cols="18"></textarea> </td>
	    			<td>宠物政策(cn):</td>
	    			<td><textarea name="petpolicy_cn" rows="1" cols="18"></textarea> </td>
	    		</tr>
	    		<tr>
	    			<td>租赁方式:</td>
	    			<td><textarea name="leasingtype" rows="1" cols="18"></textarea> </td>
	    			<td>租赁方式(cn):</td>
	    			<td><textarea name="leasingtype_cn" rows="1" cols="18"></textarea> </td>
	    		</tr>
	    		<tr>	
	    			<td>停车场:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="parking"></input></td>
	    			<td>停车场(cn):</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="parking_cn"></input></td>
	    		</tr>
	    		<tr>
	    			<td>社区活动经费:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,8]"  name="activityfee"></input></td>
	    			<td>公寓管理费:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="managementfee"></input></td>
	    		</tr>
	    		<tr>
	    			<td>其他费用:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="otherfee"></input></td>
	    			<td>其他费用(cn):</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="otherfee_cn"></input></td>
	    		</tr>
	    		
	    		<tr>
	    			<td>代缴费:</td>
	    			<td><select name="forpay"><option value="Yes">Yes</option><option value="No">No</option></select></td>
	    			<td>代缴费(cn):</td>
	    			<td><select name="forpay_cn"><option value="是">是</option><option value="否">否</option></select></td>
	    		</tr>
	    		<tr>
	    			<td>是否可以提前入住:</td>
	    			<td><select name="enterearly"><option value="Yes">Yes</option><option value="No">No</option></select></td>
	    			<td>是否可以提前入住(cn):</td>
	    			<td><select name="enterearly_cn"><option value="是">是</option><option value="否">否</option></select></td>
	    		</tr>
	    		<tr>
	    			<td>室友匹配服务:</td>
	    			<td><select name="matching"><option value="Yes">Yes</option><option value="No">No</option></select></td>
	    			<td>室友匹配服务(cn):</td>
	    			<td><select name="matching_cn"><option value="是">是</option><option value="否">否</option></select></td>
	    		</tr>
	    		
                 <tr>
	    			<td>公寓缩略图:</td>
	    			<td>
	    				<input type="hidden" name="logo" id="logo" />
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; "></iframe>	    			
	    			</td>
					<td>第三种Coupon动态文字:</td>
	    			<td><textarea name="memo" rows="1" cols="18"></textarea></td>
                </tr>
                <tr>
	    			<td vlign="top">公寓图集:</td>
	    			<td colspan="3">
	    				<input type="hidden" name="defpic" id="defpic" />
	    				<input type="hidden" name="atlas" id="defpicList" />
  						<iframe id="ifmupdo" name="ifmupdo"  src="<%=request.getContextPath()+"/upload/uploadpics.html"%>" frameborder="0" scrolling="no" width="610" height="255" style="background-color:#ffffff; margin:0; padding:0; margin-top:7px; margin-left:5px;"></iframe>	    			
	    			</td>
                </tr>
				<tr>
	    			<td vlign="top">公寓位置:</td>
	    			<td colspan="3">
	    				<input style="width:600px;" type="text" name="location" id="location" />
  						<iframe id="ifmlocationdo" name="ifmlocationdo"  src="<%=request.getContextPath()+"/resources/MapSet.html"%>" frameborder="0" scrolling="no" width="610" height="355" style="background-color:#ffffff; margin:0; padding:0; margin-top:7px; margin-left:5px;"></iframe>	    			
	    			</td>
                </tr>
                 <tr>
                	<td>地理排序:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,8]" name="sort"></input></td>
	    			<td>是否启用:</td>
	    			<td><select name="isenable">
                    		<option value="1">是</option>
                            <option value="0">否</option>
                         </select>
                    </td>
	    		</tr>   
	    		 <tr>
                	<td>是否推荐:</td>
	    			<td>
						<select name="ifvote">
                    		<option value="1">是</option>
                            <option value="0" >否</option>
                         </select>
					</td>
					<td>是否可预订:</td>
	    			<td>
						<select name="isbook">
                    		<option value="1">是</option>
                            <option value="0" >否</option>
                         </select>
					</td>
	    		 </tr>                            
                <tr>
	    			<td>是否可下载优惠券:</td>
	    			<td>
						<select name="iscoupom">
                    		<option value="1">是</option>
                            <option value="0" >否</option>
                         </select>
					</td>
                    <td>&nbsp;</td>                    
                    <td align="right">
                    	<input type="button" onClick="apartmentA()" value="提交">&nbsp;&nbsp;
                        <script>
							function apartmentA(){
								if($('[name="apartmentAS"]').form('validate'))
									$('[name="apartmentAS"]').submit();
							}
						</script>
	    			</td>
                    
	    		</tr>
	    	</table>
	    </form>
	</div>	    
    <!--添加--结束-->
    
    
   <!--修改窗口--> 
    <div id="apartmentedit" class="easyui-window" title="修改公寓" data-options="modal:true,collapsible:false,maximizable:false,minimizable:false,closed:true,iconCls:'icon-save'" style="width:800px;height:600px;padding:10px;">
	    <form action="updateApartment.html" method="post" name="apartmentES">
	    	<table cellpadding="5" border="0">
	    		<tr   style="display:none">
	    			<td style="width:200px">流水号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="id" ></input></td>
                    <td style="width:100px">公寓编号:</td>
	    			<td style="width:200px"><input onfocus="this.blur()"  readonly="readonly" name="ssid" ></input></td>
	    		</tr>
	    		 <tr>
	    			<td>公寓编号:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="mark" ></input></td>
	    			<td></td>
	    			<td></td>
	    		</tr>
                <tr>
	    			<td style="width:250px">公寓名称:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="name" data-options="required:true" ></input></td>
	    			<td>公寓名称缩写:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="nameabb"></input></td>
	    		</tr> 
	    		<tr>
	    			<td>学校名称:</td>
	    			<td>
						<select class="easyui-combobox"  name="parentname" required="required" data-options=" valueField: 'id',
	    			textField: 'name',width:135,panelHeight:'135',url:'getSchoolListByWordKey.html',
	    			onChange:function(){$('#parentid_es').val($(this).combobox('getValue'))}" >
	    			</select>
	    			</td>
	    			<td>学校编号:</td>
	    			<td><input onfocus="this.blur()" class="easyui-validatebox"  readonly="readonly" name="parentid" id="parentid_es" data-options="required:true"></input></td>
	    		</tr> 
	    		 <tr>
	    			<td>房产公司:</td>
	    			<td>
						<select class="easyui-combobox"  name="corporation" id="corporation_es" data-options=" valueField: 'name',
	    			textField: 'name',width:135,panelHeight:'135',url:'getAllCompanyList.html'" >
	    			</select>
	    			</td>
	    			<td>公寓经理邮箱:</td>
	    			<td>
	    				<input class="easyui-validatebox" validType="email" validType="length[0,255]" invalidMessage="请填写正确的邮件格式"  name="mail" ></input>
	    			</td> 
	    		</tr> 
	    		<tr>
	    			<td>公寓联系电话:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="tel"></input></td>
	    			<td>公寓联系传真:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="fax"></input></td>
	    		</tr>
	    		<tr>
	    			<td>公寓工作时间:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="worktime"></input></td>
	    			<td>公寓工作时间(cn):</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="worktime_cn"></input></td>
	    		</tr>
	    		<tr>
	    			<td>客服经理姓名:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="csname"></input></td>
	    			<td>客服经理邮箱:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="csmail"></input></td>
	    		</tr> 
	    		<tr>
	    			<td>WE折扣类型:</td>
	    			<td><select name="discounttype">
						<option value="1">Rate/WE</option>
		    			<option value="2">Bonus/WE</option>
		    			<option value="3">Specials/WE</option>
					</select></td>
	    			<td>WE折扣类型-具体数值:</td>
	    			<td><input name="discounttype_back" class="easyui-numberbox" validType="length[0,11]"   />
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>WE折扣信息:</td>
	    			<td><textarea name="uniquediscount" rows="1" cols="18"></textarea></input></td>
	    			<td>WE折扣信息(cn):</td>
	    			<td><textarea name="uniquediscount_cn" rows="1" cols="18"></textarea></input></td>
	    		</tr>

	    		<tr>
	    			<td>公寓最低月租:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,255]"  name="marketprice"></input></td>
	    			<td>公寓优惠金额:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,255]"  name="discount"></td>
	    		</tr>
	    		<tr>
	    			<td>押金:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="deposit"></input></td>
	    			<td>押金(cn):</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="deposit_cn"></input></td>
	    		</tr>
	    		<tr>
	    			<td>申请费:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,255]"  name="applicationfee"></input></td>
	    			<td>申请费(cn):</td>
	    			<td><input class="easyui-numberbox" validType="length[0,255]"  name="applicationfee_cn"></input></td>
	    		</tr>
	    		<tr>	
	    			<td>公寓特惠&新闻:</td>
	    			<td><textarea name="news" rows="1" cols="18"></textarea> </td>
					<td>公寓特惠&新闻(cn):</td>
	    			<td><textarea name="news_cn" rows="1" cols="18"></textarea> </td>
	    		</tr>
	    		<tr>
	    			<td>公寓网站:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="website"></input></td>
	    			<td>公寓地址:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="addr"></input></td>
	    		</tr>
	    		<tr>
	    			<td>公寓标签:</td>
	    			<td>
	    				<select class="easyui-combobox"  name="tag"  data-options=" valueField: 'name',
	    			textField: 'name',width:135,panelHeight:'135',url:'getAllTagList.html'" > </select>   				
	    			</td>
	    			<td>公寓标签(cn):</td>
	    			<td>
	    				<select class="easyui-combobox"  name="tag_cn"  data-options=" valueField: 'memo',
	    			textField: 'memo',width:135,panelHeight:'135',url:'getAllTagList.html'" > </select>   				
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>公寓视频:</td>
	    			<td colspan="3">
	    				<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="video"]', {
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
                        <textarea name="video" id="video" style="width:450px;height:250px;visibility:hidden;"></textarea>
                        <!--编辑器代码END-->
	    			</td>
	    		</tr>
	    		
	    		<tr>
	    			<td>公寓周边:</td>
	    			<td colspan="3">
	    				<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="introduction"]', {
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
                        <textarea name="introduction" id="introduction" style="width:450px;height:250px;visibility:hidden;"></textarea>
                        <!--编辑器代码END-->
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>公寓周边(cn):</td>
	    			<td colspan="3">
	    				<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="introduction_cn"]', {
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
                        <textarea name="introduction_cn" id="introduction_cn" style="width:450px;height:250px;visibility:hidden;"></textarea>
                        <!--编辑器代码END-->
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>公寓亮点:</td>
	    			<td colspan="3">
	    				<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="hignlight"]', {
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
                        <textarea name="hignlight" id="hignlight" style="width:450px;height:250px;visibility:hidden;"></textarea>
                        <!--编辑器代码END-->
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>公寓亮点(cn):</td>
	    			<td colspan="3">
	    				<!--编辑器代码-->
						<script>
                            var editor;
                            KindEditor.ready(function(K) {
                                editor = K.create('textarea[name="hignlight_cn"]', {
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
                        <textarea name="hignlight_cn" id="hignlight_cn" style="width:450px;height:250px;visibility:hidden;"></textarea>
                        <!--编辑器代码END-->
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>公寓配置:</td>
	    			<td>
	    				<textarea name="feature" rows="1" cols="18"></textarea> 
	    			</td>
	    			<td>公寓配置(cn):</td>
	    			<td>
	    				<textarea name="feature_cn" rows="1" cols="18"></textarea>    				
	    			</td>
	    		</tr>
	    		<tr>
					<td>社区设施:</td>
	    			<td>
	    				<textarea name="amenities" rows="1" cols="18"></textarea> 
	    			</td>
	    			<td>社区设施(cn):</td>
	    			<td>
	    				<textarea name="amenities_cn" rows="1" cols="18"></textarea> 
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>杂费项目:</td>
	    			<td>
	    				<textarea name="apartment_discountproject" rows="1" cols="18"></textarea> 
	    			</td>
					<td>杂费项目(cn):</td>
	    			<td>
	    				<textarea name="apartment_discountproject_cn" rows="1" cols="18"></textarea>    				
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>公寓周边:</td>
	    			<td><textarea name="peripheral" rows="1" cols="18"></textarea> </td>
	    			<td>公寓周边(cn):</td>
	    			<td><textarea name="peripheral_cn" rows="1" cols="18"></textarea> </td>
	    		</tr>
	    		<tr>
					<td>水电网等费:</td>
	    			<td><textarea name="utility" rows="1" cols="18"></textarea> </td>
	    			<td>水电网等费(cn):</td>
	    			<td><textarea name="utility_cn" rows="1" cols="18"></textarea> </td>
	    		</tr>
	    		<tr>
					<td>宠物政策:</td>
	    			<td><textarea name="petpolicy" rows="1" cols="18"></textarea> </td>
	    			<td>宠物政策(cn):</td>
	    			<td><textarea name="petpolicy_cn" rows="1" cols="18"></textarea> </td>
	    		</tr>
	    		<tr>
	    			<td>租赁方式:</td>
	    			<td><textarea name="leasingtype" rows="1" cols="18"></textarea> </td>
	    			<td>租赁方式(cn):</td>
	    			<td><textarea name="leasingtype_cn" rows="1" cols="18"></textarea> </td>
	    		</tr>
	    		<tr>	
	    			<td>停车场:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="parking"></input></td>
	    			<td>停车场(cn):</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="parking_cn"></input></td>
	    		</tr>
	    		<tr>
	    			<td>社区活动经费:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,8]"  name="activityfee"></input></td>
	    			<td>公寓管理费:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="managementfee"></input></td>
	    		</tr>
	    		<tr>
	    			<td>其他费用:</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="otherfee"></input></td>
	    			<td>其他费用(cn):</td>
	    			<td><input class="easyui-validatebox" validType="length[0,255]"  name="otherfee_cn"></input></td>
	    		</tr>
	    		

	    		<tr>
	    			<td>是否可以提前入住:</td>
	    			<td><select name="enterearly"><option value="Yes">Yes</option><option value="No">No</option></select></td>
	    			<td>是否可以提前入住(cn):</td>
	    			<td><select name="enterearly_cn"><option value="是">是</option><option value="否">否</option></select></td>
	    		</tr>
	    		<tr>
	    			<td>室友匹配服务:</td>
	    			<td><select name="matching"><option value="Yes">Yes</option><option value="No">No</option></select></td>
	    			<td>室友匹配服务(cn):</td>
	    			<td><select name="matching_cn"><option value="是">是</option><option value="否">否</option></select></td>
	    		</tr>
	    		
                 <tr>
	    			<td>公寓缩略图:</td>
	    			<td>
	    				<input  name="logo" type="hidden" id="logo_es" />
	    				<div id="logoView">
	    					原图片:<img src='/fileupload/images/' width='80' height='40' id="imgg"/>
	    				</div>
	    				<script>
	    					function loadLogo(){
	    						$("#logoView img").attr("src","<%=path %>/fileupload/images/"+$("#logo_es").val());
	    					}
	    				</script>
 						<iframe id="ifmupdo" name="ifmupdo"  src="<%=path %>/upload/uploadlogo.html?act=es" frameborder="0" scrolling="no" width="200" 
 						height="150" style="background-color:#ffffff; margin:0; padding:0; "></iframe>
	    			</td>
					<td>Coupoon动态文字:</td>
	    			<td><textarea name="memo" rows="1" cols="18"></textarea></td>
                </tr>

                <tr>
	    			<td vlign="top">公寓图集:</td>
	    			<td colspan="3">
	    				<input type="hidden" name="defpic" id="defpic" />
	    				<input type="hidden" name="atlas" id="defpicList_es" />
  						<iframe id="ifmupdo_es" name="ifmupdo"  src="<%=request.getContextPath()+"/upload/uploadpics.html"%>" frameborder="0" scrolling="no" width="610" height="255" style="background-color:#ffffff; margin:0; padding:0; margin-top:7px; margin-left:5px;"></iframe>	    			
	    			</td>
               	
                </tr>
				<tr>
	    			<td vlign="top">公寓位置:</td>
	    			<td colspan="3">
	    				<input style="width:600px;" type="text" name="location" id="location_es" />
  						<iframe id="ifmlocationdo" name="ifmlocationdo"  src="<%=request.getContextPath()+"/resources/MapSet.html"%>" frameborder="0" scrolling="no" width="610" height="355" style="background-color:#ffffff; margin:0; padding:0; margin-top:7px; margin-left:5px;"></iframe>	    			
	    			</td>               	
                </tr> 
                 <tr>
                	<td>地理排序:</td>
	    			<td><input class="easyui-numberbox" validType="length[0,8]" name="sort"></input></td>
	    			<td>是否启用:</td>
	    			<td><select name="isenable">
                    		<option value="1">是</option>
                            <option value="0">否</option>
                         </select>
                    </td>
	    		</tr>   
	    		 <tr>
                	<td>是否推荐:</td>
	    			<td>
						<select name="ifvote">
                    		<option value="1">是</option>
                            <option value="0" selected>否</option>
                         </select>
					</td>
					<td>是否可预订:</td>
	    			<td>
						<select name="isbook">
                    		<option value="1">是</option>
                            <option value="0" >否</option>
                         </select>
					</td>
	    		 </tr>                            
                <tr>
	    			<td>是否可下载优惠券:</td>
	    			<td>
						<select name="iscoupon">
                    		<option value="1">是</option>
                            <option value="0" >否</option>
                         </select>
					</td>
                    <td>&nbsp;</td>                    
                    <td align="right">
                    	<input type="button" onClick="apartmentE()" value="提交">&nbsp;&nbsp;
                        <script>
							function apartmentE(){
								if($('[name="apartmentES"]').form('validate'))
									$('[name="apartmentES"]').submit();
							}
						</script>
	    			</td>
                    
	    		</tr>
	    	</table>
	    </form>
	</div>	   
    <!--修改评论窗口--结束-->    
 
<script type="text/javascript">
var nowParentid=0;
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
				$.get("setAtlasSessionClear.html",{},function(data){},"text");
				$('#apartmentadd').window('open');
				setTimeout(function(){
					$('#ifmupdo').reload();
				},1000);
			}
		},{
			iconCls:'icon-edit',
			handler:function(){
				var selectedRows=$('#dg').datagrid('getSelections');
				if(selectedRows.length!=1){ $.messager.alert("提示","请选择一条记录！"); return;}
				var row = $('#dg').datagrid('getSelected');
				$.get("setAtlasSession.html",{atlas:row.atlas},function(data){},"text");
				$('#apartmentedit').form('load', 'getApartmentById.html?id='+row.id);
				function sps(v){
					var s=v.split(",");
					var ccc=[];
					for(var i=0;i<s.length;i++){
						ccc[i]=s[i];
					}
					//salert(ccc)
					return ccc;
				}
				
				
				$.post("getApartmentById.html?id="+row.id,{},function(data){
					
					$('#amenities').combobox('setValues', sps(data.amenities));
					
					$("#feature").combobox("setValues",sps(data.feature));
					$("#amenities_cn").combobox("setValues",sps(data.amenities_cn));
					$("#feature_cn").combobox("setValues",sps(data.feature_cn));
					$("#apartment_discountproject").combobox("setValues",sps(data.apartment_discountproject));
					$("#apartment_discountproject_cn").combobox("setValues",sps(data.apartment_discountproject_cn));
					
					KindEditor.html('#introduction',data.introduction);
					KindEditor.html('#video',data.video);
					KindEditor.html('#introduction_cn',data.introduction_cn);
					
					KindEditor.html('#hignlight',data.hignlight);
					KindEditor.html('#hignlight_cn',data.hignlight_cn);
				},"json");
				//document.getElementById("ifmupdo_es").src=document.getElementById("ifmupdo_es").src+"?rnd="+Math.random()*1000;		
				$('#apartmentedit').window('open');
				$('#ifmupdo_es').attr('src',$('#ifmupdo_es').attr('src'));
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
						    url: 'delApartmentById.html?id='+row.id,
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
				location.href="outExcelForApartment.html";
			}
		}]
	});			
})
</script>
</body>
</html>