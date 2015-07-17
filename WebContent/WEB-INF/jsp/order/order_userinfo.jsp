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

<div class="FrameUniversity">
	<div class="DivOrder">
    
    <div class="order" style="width:100%">
    	<div id="">
            <div class="order_percent">
                <img src="<%= path2 %>/resources/web/images/jindu3.jpg" />
            </div>
            <div class="order_title" style="background:none;border-bottom:2px solid #F5AA00;color:#69F">
                3：Personal Information
            </div>
            <div class="order_content2">
            <form action="order_vuserinfo.html?roomid=${roomid}&apartmentid=${apartmentid}&abcd=abcd" method="post" name="form1" id="fomr1">
              <table width="100%" border="0" cellpadding="5" align="center">
                <!-- 个人信息 -->
                <tr>
                  <td colspan="4" align="center" bgcolor=""> 
                  		<input type="hidden" name="id" value="${userinfo.id}" />
                 		 <input type="hidden" name="password" value="${userinfo.password}" />
                 		 <p style="border-bottom:1px solid #ABC138; background:none;color:#F7AB00">Personal&nbsp;Information</p></td>
                </tr>
                <tr>
               	 <td><p >*First Name:</p></td>
                  <td><input  name="name" value="${userinfo.name}" id="pfirstname"></td>
                  <td><p >*Last Name:</p></td>
                  <td><input  name="lastname" value="${userinfo.lastname}" id="plastname"></td>
                </tr>
                <tr>
                  <td><p >*Gender:</p></td>
                  <td><select name="sex" bg-data="${userinfo.sex}">
                    <option value="1">Male</option>
                    <option value="2">Famale</option>
                  </select></td>
                  <td><p >*Date of Birth: </p></td>
                  <td class="td_YYYYMMDD">
                  <input type="hidden" name="birthday_bg" id="birthday_add" value="${birthday}"  />
                  <select name="_y" id="_y"   class="setDate"    bg-data="${birthday_y}">
						<option value="1970">1970</option>
						<option value="1971">1971</option>
						<option value="1972">1972</option>
						<option value="1973">1973</option>
						<option value="1974">1974</option>
						<option value="1975">1975</option>
						<option value="1976">1976</option>
						<option value="1977">1977</option>
						<option value="1978">1978</option>
						<option value="1979">1979</option>
						<option value="1980">1980</option>
						<option value="1981">1981</option>
						<option value="1982">1982</option>
						<option value="1983">1983</option>
						<option value="1984">1984</option>
						<option value="1985">1985</option>
						<option value="1986">1986</option>
						<option value="1987">1987</option>
						<option value="1988">1988</option>
						<option value="1989">1989</option>
						<option value="1990">1990</option>
						<option value="1991">1991</option>
						<option value="1992">1992</option>
						<option value="1993">1993</option>
						<option value="1994">1994</option>
						<option value="1995">1995</option>
						<option value="1996">1996</option>
						<option value="1997">1997</option>
						<option value="1998">1998</option>
						<option value="1999">1999</option>
						<option value="2000">2000</option>
						<option value="2001">2001</option>
						<option value="2002">2002</option>
						<option value="2003">2003</option>
						<option value="2004">2004</option>
						<option value="2005">2005</option>
						<option value="2006">2006</option>
						<option value="2007">2007</option>
						<option value="2008">2008</option>
						<option value="2009">2009</option>
						<option value="2010">2010</option>
						<option value="2011">2011</option>
						<option value="2012">2012</option>
						<option value="2013">2013</option>
						<option value="2014">2014</option>
						<option value="2015">2015</option>   
                  </select>
                  <select name="_m" id="_m"  class="setDate"  bg-data="${birthday_m}">
		                  <option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
				  </select>
                  <select name="_d" id="_d"   class="setDate"   bg-data="${birthday_d}">
		                  <option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						<option value="31">31</option>
				  </select>
                  </td>
                </tr>
                <tr>
                  <td><p >*Passport No:</p></td>
                  <td><input  name="passportNo" value="${userinfo.passportNo}"></td>
                  <td><p >&nbsp;</p></td>
                  <td>&nbsp;</td>
                </tr>
                <!-- 学校信息 -->
                <tr>
                  <td colspan="4" align="center" bgcolor="">
                  <p  style="border-bottom:1px solid #ABC138; background:none;color:#F7AB00">University Infomation</p></td>
                </tr>
                <tr>
                  <td><p >* University:</p></td>
                  <td>
                    <select name="newschool" id="newschool" bg-data="${userinfo.newschool}">
                      <option value="">School</option>
                    </select></td>
                  <td><p >* Degree:</p></td>
                  <td><input  name="grade" value="${userinfo.grade}"></td>
                </tr>
                <!-- 联系方式  -->
                <tr>
                  <td colspan="4" align="center" bgcolor=""><p  style="border-bottom:1px solid #ABC138; background:none;color:#F7AB00">Contact&nbsp;Information</p></td>
                </tr>
                <tr>
                  <td><p >*Permanent Address:</p></td>
                  <td><input   name="addr" value="${userinfo.addr}"></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td><p >*City/County:</p></td>
                  <td><input name="county" id="user_country" value="${userinfo.county}"></td>
                  <td><p >*State/Province:</p></td>
                  <td><input name="city" value="${userinfo.city}"/></td>
                </tr>
                <tr>
                  <td><p >*Zip Code:</p></td>
                  <td><input  name="zip" value="${userinfo.zip}"/></td>
                  <td><p >*Country:</p></td>
                  <td><select name="countries" id="countyies_user" bg-data="${userinfo.countries}">
                   
                  </select></td>
                </tr>
                <tr>
                  <td><p >*Phone:</p></td>
                  <td><input name="phone" value="${userinfo.phone}"></td>
                  <td></td>
                  <td><input name="mail" value="${userinfo.mail}" id="user_mail" type="hidden" ></td>
                </tr>
                <!-- 紧急情况联系人 -->
                <tr>
                  <td colspan="4" align="center" bgcolor=""><p  style="border-bottom:1px solid #ABC138; background:none;color:#F7AB00">Emergency&nbsp;Contact&nbsp;Information</p></td>
                </tr>
                <tr>
                  <td><p >*Full Name:</p></td>
                  <td><input name="relativesname" value="${userinfo.relativesname}"></td>
                  <td><p >*Relationship with you:</p></td>
                  <td><input name="relatives" value="${userinfo.relatives}"></td>
                </tr>
                <tr>
                  <td><p >*Emergency Contact Address:</p></td>
                  <td><input name="relativesaddr" value="${userinfo.relativesaddr}"></td>
                  <td><p >*City/County:</p></td>
                  <td><input name="relativescity" value="${userinfo.relativescity}"></td>
                </tr>
                <tr>
                  <td><p >*State/Province:</p></td>
                  <td><input name="relativesprvc" value="${userinfo.relativesprvc}"></td>
                  <td><p >*Zip Code:</p></td>
                  <td><input name="relativeszip" value="${userinfo.relativeszip}"></td>
                </tr>
                <tr>
                  <td><p >*Country:</p></td>
                  <td><select id="relativescountries" name="relativescountries" bg-data="${userinfo.relativescountries}"></select></td>
                  <td><p >*Emergency Contact Phone:</p></td>
                  <td><input name="relativesphone" value="${userinfo.relativesphone}"></td>
                </tr>
                <tr>
                  <td colspan="4" align="center" bgcolor=""><p  style="border-bottom:1px solid #ABC138; background:none;color:#F7AB00">Roommate Information, If Any</p></td>
                </tr>
                <tr>
                  <td><p >Roommate 1 Full Name:</p></td>
                  <td><input name="roommate1" value="${userinfo.roommate1}"></td>
                  <td><p >Roommate 1 Email:</p></td>
                  <td><input name="roommatemail1" value="${userinfo.roommatemail1}"></td>
                </tr>
                <tr>
                  <td><p >Roommate 2 Full Name:</p></td>
                  <td><input name="roommate2" value="${userinfo.roommate2}"></td>
                  <td><p >Roommate 2 Email:</p></td>
                  <td><input name="roommatemail2" value="${userinfo.roommatemail2}"></td>
                </tr>
                <tr>
                  <td><p >Roommate 3 Full Name:</p></td>
                  <td><input name="roommate3" value="${userinfo.roommate3}"></td>
                  <td><p >Roommate 3 Email:</p></td>
                  <td><input name="roommatemail3" value="${userinfo.roommatemail3}"></td>
                </tr>
                <tr>
                  <td colspan="4" align="center" bgcolor="#BED057"><p >Document Upload</p></td>
                </tr>
                <tr>
                  <td><p >*WE Coupon Upload:</p></td>
                  <td colspan="3">
                  <input type="hidden" name="file5" id="f5" />
                  <iframe id="ff5" name="fff"  src="<%=request.getContextPath()+"/upload/uploadfile5.html"%>" frameborder="0" scrolling="no" width="250" height="30" style="background-color:#ffffff; margin:0; padding:0; float:left"></iframe>
                   <span style="float:left;margin-top:-5px;color:#CCC;"> *Please get WE Coupon on apartment page.
                   		<br/>*The file should be smaller than 5 MB, File format:bmp jpg jpeg png gif pdf
                   </span>
                  </td>
                </tr>
                 <tr>
                  <td><p >*Passport Upload:</p></td>
                  <td colspan="3">
                  <input type="hidden" name="file1" id="f1" />
                  <iframe id="ff1" name="fff"  src="<%=request.getContextPath()+"/upload/uploadfile1.html"%>" frameborder="0" scrolling="no" width="250" height="30" style="background-color:#ffffff; margin:0; padding:0; float:left"></iframe>
                  <span style="float:left;margin-top:-5px;color:#CCC;"> *Please upload the photo page of your passport.
                  			<br/>*The file should be smaller than 5 MB, File format:bmp jpg jpeg png gif pdf
                  </span>
                  </td>
                </tr>
                <tr>
                  <td><p >I20/DS2109 Upload:</p></td>
                  <td colspan="3">
                  <input type="hidden" name="file2" id="f2" />
                  <iframe id="ff2" name="fff"  src="<%=request.getContextPath()+"/upload/uploadfile2.html"%>" frameborder="0" scrolling="no" width="250" height="30" style="background-color:#ffffff; margin:0; padding:0; float:left "></iframe>
                 <span style="float:left;margin-top:-5px;color:#CCC;"> *Please note the apartment may reject your application if no I-20 submitted.
                 		<br/>*The file should be smaller than 5 MB, File format:bmp jpg jpeg png gif pdf
                 </span>
                  </td>
                </tr>
                <tr>
                  <td><p >VISA Upload:</p></td>
                 <td colspan="3">
                  <input type="hidden" name="file3" id="f3" />
                  <iframe id="ff3" name="fff"  src="<%=request.getContextPath()+"/upload/uploadfile3.html"%>" frameborder="0" scrolling="no" width="250" height="30" style="background-color:#ffffff; margin:0; padding:0; "></iframe>
                  </td>
                </tr>
                <tr>
                  <td><p >Others:</p></td>
                 <td colspan="3">
                  <input type="hidden" name="file4" id="f4" />
                  <iframe id="ff4" name="fff"  src="<%=request.getContextPath()+"/upload/uploadfile4.html"%>" frameborder="0" scrolling="no" width="250" height="30" style="background-color:#ffffff; margin:0; padding:0; "></iframe>
                  </td>
                </tr>
              </table>
            </form>
          </div>
            
            <div class="order_submit">
                    <div class="s_submit">
                        <p><a href="order_money.html?roomid=${roomid}&apartmentid=${apartmentid}&enterlong=${enterlong}"  class="sbt">Prev</a></p>
                        <p><a href="javascript:sub()"  class="sbt">Next</a></p>
                    </div>
            </div>
    		<div style="display:none" id="userId">
    			${fuser}
    		</div>
        </div>
    </div>
	<script type="text/javascript">
		function sub(){
			var ii=0;
			$(".FrameUniversity input").each(function(i){
				if($(".FrameUniversity input:eq("+i+")").val()==""  && $(this).parent().prev().text().indexOf("*")>=0){
					if(ii==0){

						alert($(this).parent().prev().text()+" needed!");
						ii++;
					}
				}
			}); 
			if(ii==0){
				if($("#userId").html()!=""&&$("#userId").html()!=null){
					$("[name='form1']").submit();
				}else{
				$.post("validateMail.html",{mail:$("#user_mail").val()},function(data){
					
					if(data=="1"){
						alert("您填写的用户邮箱已经被占用了！");
					}else{
						if($("#user_mail").val()==""){
							alert("请填写邮箱");
						}else{
							$("[name='form1']").submit();
						}
					}
				},"text");
				}
			}
			
		};
	</script>

                   
    
    </div>

</div>

<script type="text/javascript">
	window.onload=function(){
	
		$.post("../getAllSchool.html",{},function(data){
			var text="";
			for(i=0;i<data.length;i++){
				text+="<option value='"+data[i].name+"'>"+data[i].name+"</option>";
			}
			$("#newschool").html(text);
			
			 $("#newschool").val($("#newschool").attr("bg-data"));
	         $("#countyies_user").val($("#countyies_user").attr("bg-data"));
	         $("#relativescountries").val($("#relativescountries").attr("bg-data"));
		},"json");
	
		$.post("../getAllCountyies.html",{},function(data){
			text="";
			for(i=0;i<data.length;i++){
				text+="<option value='"+data[i].name+"'>"+data[i].name+"</option>";
			}
			$("#countyies_user").html(text);
			$("#relativescountries").html(text);
			
			 $("[name='newschool']").val($("[name='newschool']").attr("bg-data"));
	         $("#countyies_user").val($("#countyies_user").attr("bg-data"));
	         $("#relativescountries").val($("#relativescountries").attr("bg-data"));
		},"json");
		
		
			$(".setDate").change(function(){
				$("#birthday_add").val($("#_y").val()+"-"+$("#_m").val()+"-"+$("#_d").val());
			});
		
	}
</script>

 <script type="text/javascript">
 setTimeout(function(){
	 $("[name='nick']").val($("[name='nick']").attr("bg-data"));
     $("[name='sex']").val($("[name='sex']").attr("bg-data"));
     $("[name='_y']").val($("[name='_y']").attr("bg-data"));
     $("[name='_m']").val($("[name='_m']").attr("bg-data"));
     $("[name='_d']").val($("[name='_d']").attr("bg-data"));
 },300);
        
 </script>



<%@include file="../footer.jsp" %>