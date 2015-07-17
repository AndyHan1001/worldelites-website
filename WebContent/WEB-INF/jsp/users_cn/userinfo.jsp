<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path2 = request.getContextPath();
%>
<%@include file="../others/head.jsp" %>
<style>
	tr{height:40px}
	input{width:150px}
	button{float:right;color:red;border:none;margin-bottom:-10px;cursor:pointer}
	input{border:1px solid #ffffff; float:left;}
	select{border:1px solid #ffffff; display:none; float:left;}
</style>
<div class="FrameAbout">
	<div class="BigTT"><img src="<%= path2 %>/resources/web/images/kouhao.jpg" /></div>

</div>

<div class="clearDiv2"></div>


<div class="FrameMain">
	<div class="divMain">
        <div class="MainLeft">
        	<div class="MainLeftMenu">
                <div class="dplHead">
                    <p>My Account</p>
                </div>
                <div class="dplMain">
                    <ul>
                        <li  id="hoverNew"><a href="userinfo.html" >我的信息</a></li>
                        <!--<li class="nowHover"><a href="userthreads.html" >My Blog</a></li>-->
                        <li class="nowHover"><a href="userapartments.html" >我收藏的公寓</a></li>
                        <li class="nowHover"><a href="usercoupon.html" >我的WE Coupon</a></li>                        
                        <li class="nowHover"><a href="userorder.html" >我的订单</a></li>
                    </ul>
                </div>
            </div>
            
           
        </div>
        <div class="MainRight">
			<h4><p>我的信息<input type="button" id="editbutton" class="editbutton" onClick="showInput()" value="修改" /></p></h4>
		  <form action="updateuserinfo.html" name="userinfoform" method="post">
		    <table width="800" border="0" cellpadding="5" align="center">
		      <!-- 个人信息 -->
		      <tr>
		        <td colspan="4" align="left"  bgcolor="#FAFAFA" style="border-bottom:1px solid #ABC138; height:30px;color:#F7AB00"><p  style="color:#F90">个人信息</p></td>
	          </tr>
			  
		      <tr>
		        <td><p >*First Name:</p></td>
		        <td width="180"><span class="edit">
		          <input  name="name" value="${userinfo.name}"  placeholder="same as on passport"  type="text" />
		        </span></td>
		        <td><p >*Last Name:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input  name="lastname" value="${userinfo.lastname}"  placeholder="same as on passport"  type="text" /></td>
	          </tr>
		      <tr>
		        <td><p>*Gender:</p></td>
		        <td>
		        	<span class="edit"></span>
                    
                    <c:if test="${userinfo.sex==1}">
                    <input name="sexff" id="sexff" value="Male">
                    </c:if>
                     <c:if test="${userinfo.sex==2}">
                    <input name="sexff" id="sexff" value="Famale">
                    </c:if>
                   
		        	<select name="sex" value="${userinfo.sex}">
		          		<option value="1">Male</option>
		          		<option value="2">Famale</option>
		          	</select>
		        </td>
		        <td><p >*Date of Birth:</p></td>
		        <td>
		          <span class="edit"></span>
                  <div>
                  <input type="text" name="birthday_es" id="birthday_add" value="${fn:substring(userinfo.birthday,0,10)}"   />
                  <select name="_y" id="_y" onChange="setBirth()">
                  <option>${fn:substring(userinfo.birthday,0,4)}</option>
                  <option>1970</option>
                  <option>1971</option>
                  <option>1972</option>
                  <option>1973</option>
                  <option>1974</option>
                  <option>1975</option>
                  <option>1976</option>
                  <option>1977</option>
                  <option>1978</option>
                  <option>1979</option>
                  <option>1980</option>
                  <option>1981</option>
                  <option>1982</option>
                  <option>1983</option>
                  <option>1984</option>
                  <option>1985</option>
                  <option>1986</option>
                  <option>1987</option>
                  <option>1988</option>
                  <option>1989</option>
                  <option>1990</option>   
                  <option>1991</option>
                  <option>1992</option>
                  <option>1993</option>
                  <option>1994</option>
                  <option>1995</option>
                  <option>1996</option>
                  <option>1997</option>
                  <option>1998</option>
                  <option>1999</option>
                  <option>2000</option>       
                  <option>2001</option>
                  <option>2002</option>
                  <option>2003</option>
                  <option>2004</option>
                  <option>2005</option>
                  <option>2006</option>
                  <option>2007</option>
                  <option>2008</option>
                  <option>2009</option>    
                  <option>2010</option>       
                  <option>2011</option>
                  <option>2012</option>
                  <option>2013</option>
                  <option>2014</option>
                  <option>2015</option>
                  <option>2016</option>
                  <option>2017</option>
                  <option>2018</option>
                  <option>2019</option>    
                  <option>2020</option>    
                  </select>
                  <select name="_m" id="_m" onChange="setBirth()">
                  <option>${fn:substring(userinfo.birthday,5,7)}</option>
                  <option>01</option>
                  <option>02</option>
                  <option>03</option>
                  <option>04</option>
                  <option>05</option>
                  <option>06</option>
                  <option>07</option>
                  <option>08</option>
                  <option>09</option>
                  <option>10</option>
                  <option>11</option>
                  <option>12</option>
				  </select>
                  <select name="_d" id="_d" onChange="setBirth()">
                  <option>${fn:substring(userinfo.birthday,8,10)}</option>
                  <option>01</option>
                  <option>02</option>
                  <option>03</option>
                  <option>04</option>
                  <option>05</option>
                  <option>06</option>
                  <option>07</option>
                  <option>08</option>
                  <option>09</option>
                  <option>10</option>
                  <option>11</option>
                  <option>12</option>
                  <option>13</option>
                  <option>14</option>
                  <option>15</option>
                  <option>16</option>
                  <option>17</option>
                  <option>18</option>
                  <option>19</option>
                  <option>20</option>
                  <option>21</option>
                  <option>22</option>
                  <option>23</option>
                  <option>24</option>
                  <option>25</option>
                  <option>26</option>
                  <option>27</option>
                  <option>28</option>
                  <option>29</option>
                  <option>30</option>
                  <option>31</option>
				  </select>
                  </div>
		        </td>
	          </tr>
	          <tr>
	          		<td><p >*Passport No:</p></td>
		        <td>
		        	<span class="edit">
		        	<input  name="passportNo" value="${userinfo.passportNo}">
		        	</span></td>
	          		<td><p >&nbsp;</p></td>
		        <td width="180">
		        	<span class="edit"></span></td>
	          </tr>
		      <!-- 学校信息 -->
		      <tr>
		        <td colspan="4" align="left"  bgcolor="#FAFAFA" style="border-bottom:1px solid #ABC138; height:30px;color:#F7AB00"><p  style="color:#F90">学校信息</p></td>
	          </tr>
		      <tr>
		        <td><p >*University:</p></td>
		        <td>
		        	<span class="edit"></span>
                   <select name="newschool" id="schoollist" onChange="setSchool()">
                    <option value="${userinfo.newschool}">${userinfo.newschool}</option>
                     <c:forEach items="${schoollist}" var="item">
                     	<option value="${item.name}">${item.name}</option>
                     </c:forEach>
                     <option>Others..</option>
                    </select>
		        	<input  id="newschool" value="${userinfo.newschool}">
                    </td>
		        <td><p >*Academic Status:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input  id="grade" name="grade" value="${userinfo.grade}">
		        	<select  id="gradeList" onchange="setGrade()">
	                    <option value="${userinfo.grade}" >${userinfo.grade}</option>
	                    <option value="Undergraduate" >Undergraduate</option>
	                    <option value="Graduate" >Graduate</option>
	                    <option value="PhD/Post Doc" >PhD/Post Doc</option>
	                    <option value="Faculty" >Faculty</option>
	                    <option value="Alumni" >Alumni</option>
                  </select>
					</td>
	          </tr>
		      <!-- 联系方式  -->
		      <tr>
		        <td colspan="4" align="left"  bgcolor="#FAFAFA" style="border-bottom:1px solid #ABC138; height:30px;color:#F7AB00"><p  style="color:#F90">联系方式</p></td>
	          </tr>
		      <tr>
		        <td><p >*Permanent Address:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input   name="addr" value="${userinfo.addr}"></td>
		         <td><p >*Phone:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input name="phone" value="${userinfo.phone}"></td>
	          </tr>
		      <tr>
		        <td><p >*City/County:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input name="county" id="user_country" value="${userinfo.county}"></td>
		        <td><p >*State/Province:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input name="city" value="${userinfo.city}"/></td>
	          </tr>
		      <tr>
		        <td><p >*Zip Code:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input  name="zip" value="${userinfo.zip}"/></td>
		        <td><p >*Country:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input   name="countries" id="countyies_user" value="${userinfo.countries}"/>
                </td>
	          </tr>
		      <!-- 紧急情况联系人 -->
		      <tr>
		        <td colspan="4" align="left"  bgcolor="#FAFAFA" style="border-bottom:1px solid #ABC138; height:30px;color:#F7AB00"><p  style="color:#F90">相关联系人信息</p></td>
	          </tr>
		      <tr>
		        <td><p >*Full Name:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input name="relativesname" value="${userinfo.relativesname}"></td>
		        <td><p >*Relationship with you:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input name="relatives" value="${userinfo.relatives}"></td>
	          </tr>
		      <tr>
		        <td><p >*Emergency Contact Address:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input name="relativesaddr" value="${userinfo.relativesaddr}"></td>
		        <td><p >*City/County:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input name="relativescity" value="${userinfo.relativescity}"></td>
	          </tr>
		      <tr>
		        <td><p >*State/Province:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input name="relativesprvc" value="${userinfo.relativesprvc}"></td>
		        <td><p >*Zip Code:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input name="relativeszip" value="${userinfo.relativeszip}"></td>
	          </tr>
		      <tr>
		        <td><p >*Country:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input name="relativescountries"  value="${userinfo.relativescountries}"></td>
		        <td><p >*Emergency Contact Phone:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input name="relativesphone" value="${userinfo.relativesphone}"></td>
	          </tr>
		      <tr>
		        <td colspan="4" align="left"  bgcolor="#FAFAFA" style="border-bottom:1px solid #ABC138; height:30px;color:#F7AB00"><p  style="color:#F90">如果已有合适室友</p></td>
	          </tr>
		      <tr>
		        <td><p >Roommate1 Full Name:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input name="roommate1" value="${userinfo.roommate1}"></td>
		        <td><p >Roommate1 Email:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input name="roommatemail1" value="${userinfo.roommatemail1}"></td>
	          </tr>
		      <tr>
		        <td><p >Roommate2 Full Name:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input name="roommate2" value="${userinfo.roommate2}"></td>
		        <td><p >Roommate2 Email:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input name="roommatemail2" value="${userinfo.roommatemail2}"></td>
	          </tr>
		      <tr>
		        <td><p >Roommate3 Full Name:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input name="roommate3" value="${userinfo.roommate3}" ></td>
		        <td><p >Roommate3 Email:</p></td>
		        <td>
		        	<span class="edit"></span>
		        	<input name="roommatemail3" value="${userinfo.roommatemail3}"></td>
	          </tr>
	          <tr>
	          	<td colspan="4"><input type="hidden" value="${userinfo.id}" name="id"> </td>
	          </tr>
	           <tr>
	          	<td colspan="4"><input type="hidden" value="1" name="state"> </td>
	          </tr>
	        </table>
		    
</form> 
            <div class="order_submit">
                    <div class="s_submit">
                        <p id="nowSubmitBtn"><a href="javascript:sub()"  class="sbt">Save</a></p>
                    </div>
            </div>
		<script language="javascript">
        function setBirth()
        {
        document.getElementById("birthday_add").value=document.getElementById("_y").value+"-"+document.getElementById("_m").value+"-"+document.getElementById("_d").value;
        }
		function setSchool()
		{
        document.getElementById("newschool").value=document.getElementById("schoollist").value;
		if(document.getElementById("schoollist").value=="Others..")
								{
									   document.getElementById("newschool").style.display="block";
								}
								else
								{
									document.getElementById("newschool").style.display="none";
								}
		}
		function setGrade(){
			$("#grade").val($("#gradeList").val());
			
		}
		
        setBirth();
        </script>
        
        <script type="text/javascript">
        	function sub(){
        		$("[name='userinfoform']").submit();
        	}
        </script>  
        
        
<script language="javascript">
	function showInput()
	{
		var u=document.getElementById("editbutton").value;
		if(u=="修改"){
			$("input").css("border","1px solid #dddddd");
			$("select").css("border","1px solid #dddddd");
			$("select").css("display","block");
			$("input").attr("disabled",null);
			$(".order_submit").show();
			document.getElementById("editbutton").value="取消";
			document.getElementById("birthday_add").style.display="none"
			document.getElementById("sexff").style.display="none"
			document.getElementById("newschool").style.display="none";
			document.getElementById("grade").style.display="none";
			//document.getElementById("nowSubmitBtn").style.display="block";
			}
		else{
			$("input").css("border","1px solid #ffffff");
			$("select").css("border","1px solid #ffffff");
			$("select").css("display","none");
			$("input").attr("disabled","disabled");
			$("#editbutton").attr("disabled",null);
			$(".order_submit").hide();
			document.getElementById("editbutton").value="修改";
			document.getElementById("birthday_add").style.display="block"
			document.getElementById("sexff").style.display="block"
			document.getElementById("newschool").style.display="block";
			document.getElementById("grade").style.display="block"
			//document.getElementById("nowSubmitBtn").style.display="none";
		}
	}
	$("input").attr("disabled","disabled");
	$("#editbutton").attr("disabled",null);
	$(".order_submit").hide();
	//document.getElementById("nowSubmitBtn").style.display="none";
</script>
			
      </div>
    </div>
</div>



<%@include file="../others/footer.jsp" %>