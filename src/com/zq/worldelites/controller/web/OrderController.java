package com.zq.worldelites.controller.web;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import util.Constants;
import util.DateUtil;
import util.GetHTMLCode;
import util.PDF_Order;
import util.StringUtil;
import util.SystemUtil;

import com.zq.worldelites.model.Apartment;
import com.zq.worldelites.model.Order;
import com.zq.worldelites.model.Room;
import com.zq.worldelites.model.School;
import com.zq.worldelites.model.User;
import com.zq.worldelites.service.web.ApartmentWService;
import com.zq.worldelites.service.web.EmailService;
import com.zq.worldelites.service.web.WebOrderService;
import com.zq.worldelites.service.web.WebService;
import com.zq.worldelites.service.web.WebUserService;
import com.zq.worldelites.vo.UserVo;

@Controller() 
@RequestMapping("/order")
public class OrderController{
	@Resource
	private EmailService emailService;
	@Resource
	private WebService webService;
	@Resource
	private ApartmentWService apartmentWService;
	@Resource
	private WebUserService webUserService;
	@Resource
	private WebOrderService webOrderService;
	
	
	//-------------------------------订单--------------------------------------------
		@RequestMapping("order")
		public void order(String apartmentid,String roomid,Model model,HttpServletRequest request){
			Apartment oneapartment=this.getApartment(apartmentid);
			model.addAttribute("oneapartment", oneapartment);//一个公寓
			
			if(StringUtil.isNullOrEmpty(roomid)){//没有选择户型
				List<Room> roomList=this.getRoomListByApartmentId(apartmentid);
				model.addAttribute("roomlist", roomList);
			}else{//选择了的
				List<Room> roomList=this.getRoomList(roomid);
				model.addAttribute("roomlist", roomList);
			}
			
		}
		
		//确认消费金额
		@RequestMapping("order_money")
		public void order_money(Model model,HttpServletRequest request){
			String apartmentid=request.getParameter("apartmentid");
			String roomid=request.getParameter("roomid");
			String enterlong=request.getParameter("enterlong");
			model.addAttribute("enterlong",enterlong);
			model.addAttribute("apartmentid",apartmentid);
			model.addAttribute("roomid",roomid);
			if(apartmentid!=null&&apartmentid!=""){
				
				Apartment oneapartment=this.getApartment(apartmentid);
				model.addAttribute("oneapartment", oneapartment);//一个公寓
				
				Room room=this.getRoom(roomid);
				model.addAttribute("oneroom", room);//一个房间
					
			}
		}
		
		//填写个人信息
		@RequestMapping("order_userinfo")
		public void order_userinfo(Model model,HttpServletRequest request,HttpSession session){
			String apartmentid=request.getParameter("apartmentid");
			String roomid=request.getParameter("roomid");
			String enterlong=request.getParameter("enterlong");
			model.addAttribute("enterlong",enterlong);
			model.addAttribute("apartmentid",apartmentid);
			model.addAttribute("roomid",roomid);
			if(SystemUtil.getFrontLogin(request)!=null){
				UserVo uservo=SystemUtil.getFrontLogin(request);
				User user=webUserService.getUserById(uservo.getId());
				User user2=webUserService.getUserByIdGet(uservo.getId());
				user.setPassword(user2.getPassword());//-------------
				
				model.addAttribute("birthday",DateUtil.getDateFormat(user.getBirthday(), "yyyy-MM-dd"));
				model.addAttribute("birthday_y",DateUtil.getDateFormat(user.getBirthday(), "yyyy"));
				model.addAttribute("birthday_m",DateUtil.getDateFormat(user.getBirthday(), "MM"));
				model.addAttribute("birthday_d",DateUtil.getDateFormat(user.getBirthday(), "dd"));
				model.addAttribute("userinfo", user);
			}
			
			Apartment oneapartment=this.getApartment(apartmentid);
			model.addAttribute("oneapartment", oneapartment);//一个公寓
			
		}
		
		//确认信息
		@RequestMapping("order_vuserinfo")
		public void order_vuserinfo(Model model,User user,String birthday_bg,HttpServletRequest request,HttpSession session){
			String apartmentid=request.getParameter("apartmentid");
			String roomid=request.getParameter("roomid");
			String abcd=request.getParameter("abcd");
			model.addAttribute("apartmentid",apartmentid);
			model.addAttribute("roomid",roomid);
		
			Apartment oneapartment=this.getApartment(apartmentid);
			model.addAttribute("oneapartment", oneapartment);//一个公寓
			
			Room room=this.getRoom(roomid);
			model.addAttribute("oneroom", room);//一个房间信息
			
			user.setBirthday(DateUtil.getDateFromStr(birthday_bg, "yyyy-MM-dd"));
			user.setState(1);
			if(StringUtil.isNullOrEmpty(abcd)){
				UserVo userVo=SystemUtil.getFrontLogin(request);
				user=webUserService.getUserById(userVo.getId());
			}else{
				webService.update(user);
			}
			model.addAttribute("userinfo", user);
			model.addAttribute("birthday", birthday_bg);
			
		}
		
		@ResponseBody
		@RequestMapping("validateMail")
		public String validateMail(String mail){
			if(webUserService.validateRegMailIsHave(mail)==false){
				return "0";
			}
			return "1";
		}
		
		//等待审核----------------------------------------------------------------------------------------
		@RequestMapping("orderjump")
		public void orderjump(Model model,HttpServletRequest request,HttpSession session){
			String apartmentid=request.getParameter("apartmentid");
			String roomid=request.getParameter("roomid");
			String enterlong=request.getParameter("enterlong");
			String firstname=request.getParameter("firstname");
			String lastname=request.getParameter("lastname");
			model.addAttribute("enterlong",enterlong);
			model.addAttribute("apartmentid",apartmentid);
			model.addAttribute("roomid",roomid);

			User user=null;
			if(SystemUtil.getFrontLogin(request)!=null){
				UserVo uservo=SystemUtil.getFrontLogin(request);
				user=webUserService.getUserByIdGet(uservo.getId());
				user.setName(firstname.toUpperCase());
				user.setLastname(lastname.toUpperCase());
				webUserService.update(user);
			}
			Apartment apartment=this.getApartment(apartmentid);
			
			Order order=new Order();
			Date currTime = new Date();
			String orderInfo=apartmentid+roomid+user.getId();
			SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd-"+orderInfo+"-hhmmss",Locale.US);
			String sid=sf.format(currTime);   
			order.setOrderid(sid);//订单号			
			
			//大学。公寓
				if(apartment!=null){
					order.setApartmentid(apartment.getId());
					order.setApartmentname(apartment.getName());
					order.setLogo(apartment.getLogo());
					
					School school= this.getSchoolByApartmentId(apartment.getId().toString()) ;//设置学校
					if(school!=null){
						order.setSchoolid(school.getId());
						order.setSchoolname(school.getName());
					}
					
					//房间
					Room room=this.getRoom(roomid);
					if(room!=null){
						order.setRoomid(room.getId());
						order.setRoomname(room.getName());
						order.setEntertime(DateUtil.getDateFormat(room.getEntertime(), "yyyy-MM-dd HH:mm:ss"));
						order.setLeavetime(DateUtil.getDateFormat(room.getOuttime(), "yyyy-MM-dd HH:mm:ss"));
						order.setEndtime(DateUtil.getDateFormat(room.getEndtime(), "yyyy-MM-dd HH:mm:ss"));
					}
						
					StringBuffer priceNote = new StringBuffer();
					if(!StringUtil.isNullOrEmpty(apartment.getApplicationfee())){
						priceNote.append("\n申请费:");
						priceNote.append(apartment.getApplicationfee());
					}
					if(!StringUtil.isNullOrEmpty(apartment.getActivityfee())){
						priceNote.append("\n活动费:");
						priceNote.append(apartment.getActivityfee());
					}
					if(!StringUtil.isNullOrEmpty(apartment.getManagementfee())){
						priceNote.append("\n社区管理费");
						priceNote.append(apartment.getManagementfee());
					}
					if(!StringUtil.isNullOrEmpty(apartment.getParking())){
						priceNote.append("\n停车费:");
						priceNote.append(apartment.getParking());
					}
					if(!StringUtil.isNullOrEmpty(apartment.getOtherfee())){
						priceNote.append("\n其他费用:");
						priceNote.append(apartment.getOtherfee());
					}
					order.setPrice("In the calculation of the administrator,Please wait for email notification");//总价
					order.setPricenote(priceNote.toString());//总价描述
					order.setSubmittime(DateUtil.getDateFormat(new Date(), "yyyy-MM-dd HH:mm:ss"));
					order.setConfirmtime(DateUtil.getDateFormat(new Date(), "yyyy-MM-dd HH:mm:ss"));
					order.setState("Application Request Submitted");
					order.setStatenote("*Please note you have NOT YET completed the application. It takes us 1-2 business days to verify your information. You will be contacted by our Customer Service Manager or the Apartment Leasing Manager regarding the next step.");
						
				   	//--添加进订单
					order.setUserid(user.getId());
					order.setUserlastname(user.getLastname());
					order.setUsername(user.getName());
					order.setUserpassportno(user.getPassportNo());
					order.setUserphone(user.getPhone());
					order.setUsermail(user.getMail());
					webService.save(order);
					
					//--发邮件（订单状态：申请）
					Map<String, String> arg = new HashMap<String,String>();
					arg.put("[@DATE]",DateUtil.getDateFormat(new Date(), "MM/dd/yyyy"));
					arg.put("[@USERNAME]",user.getMail());
					arg.put(" [@ORDERID]",order.getOrderid());
					arg.put("[@NAME]",user.getName()+" "+user.getLastname());
					arg.put("[@PHONE]",user.getPhone());
					arg.put("[@APARTMENTID]",apartment.getId().toString());
					arg.put("[@APARTMENT]",apartment.getName());
					arg.put("[@ROOM]",room.getName());
					List<String> files=new ArrayList<String>();
					String pdfName="WE Housing_"+user.getName().toUpperCase()+" "+user.getLastname().toUpperCase()+"_Application Info.pdf";//pdf name
					GetHTMLCode getHTMLCode=new GetHTMLCode();//html
					String htmlUrl="http://www.worldelites.com/order/info_html.html?id="+user.getId()+"&apartmentid="+apartment.getId()+
							"&roomid="+room.getId();
					String htmlContent=null;
					try {
						htmlContent=getHTMLCode.getHTML(htmlUrl);
					} catch (Exception e) {
						e.printStackTrace();
					}
					PDF_Order pdf_Order=new PDF_Order();
					if(pdf_Order.publishPdf(Constants.FILE_URL+pdfName, htmlContent)){//pdf
						files.add(pdfName);
					}
					this.getFiles(user, files);//后边的五个文件 附件。
					emailService.sendEmail(Constants.EMAIL_ORDER_USER_NEW,Constants.EMAIL_ORDER_USER_NEW_CN, arg,user.getMail(),user,"","",2,"");//给用户发邮件
					emailService.sendEmailForVOrder(Constants.EMAIL_ORDER_ADMIN_NEW, arg, apartment.getCsmail(), 1, files,user,apartment.getName(),room.getName());

			}
		}
		
		public void getFiles(User user,List<String> list){
			if(!StringUtil.isNullOrEmpty(user.getFile5())){
				list.add(user.getFile5());
			}
			if(!StringUtil.isNullOrEmpty(user.getFile1())){
				list.add(user.getFile1());
			}
			if(!StringUtil.isNullOrEmpty(user.getFile2())){
				list.add(user.getFile2());
			}
			if(!StringUtil.isNullOrEmpty(user.getFile3())){
				list.add(user.getFile3());
			}
			if(!StringUtil.isNullOrEmpty(user.getFile4())){
				list.add(user.getFile4());
			}
		}
		
		@RequestMapping("coming")
		public void coming(){
			
		}
		
		@RequestMapping("order_wait")
		public void order_wait(){
			
		}
		
		@RequestMapping("info_html")
		public void info_html(Model model,Integer id,HttpServletRequest request,HttpSession session){
			String apartmentid=request.getParameter("apartmentid");
			String roomid=request.getParameter("roomid");
		
			Apartment oneapartment=this.getApartment(apartmentid);
			model.addAttribute("oneapartment", oneapartment);//一个公寓
			
			Room room=this.getRoom(roomid);
			model.addAttribute("oneroom", room);//一个房间信息
			
			User user=(User) webUserService.getById("User", id);
			model.addAttribute("userinfo", user);
			model.addAttribute("birthday", DateUtil.getDateFormat(user.getBirthday(), "yyyy-MM-dd"));
			
		}
		
		/**
		 * 得到一个公寓通过ID
		 * @param id
		 * @return
		 */
		public Apartment getApartment(String id){
			Integer idInt;
			try {
				idInt=Integer.valueOf(id);
				return apartmentWService.getOneApartment(idInt);
			} catch (Exception e) {
				return null;
			}
			
		}
		
		/**
		 *得到其他的公寓  --- 通过ID
		 */
		public List<Apartment> getOthersApartment(String id,HttpServletRequest request){
			Integer idInt;
			try {
				idInt=Integer.valueOf(id);
				return apartmentWService.getOthersApartment(idInt,request);
			} catch (Exception e) {
				return null;
			}
			
		}
		
		public Room getRoom(String id){
			Integer idInt;
			try {
				idInt=Integer.valueOf(id);
				List<Room> list=webService.getOneRoom(idInt);
				if(list.size()>0&&list!=null)
					return list.get(0);
				else
					return null;
			} catch (Exception e) {
				return null;
			}
		}
		
		public List<Room> getRoomList(String id){
			Integer idInt;
			try {
				idInt=Integer.valueOf(id);
				List<Room> list=webService.getOneRoom(idInt);
					return list;
			} catch (Exception e) {
				return null;
			}
		}
		
		public List<Room> getRoomListByApartmentId(String id){
			Integer idInt;
			try {
				idInt=Integer.valueOf(id);
				List<Room> roomList=webService.getRoomListByApartmentIdStateIsYes(idInt);
					return roomList;
			} catch (Exception e) {
				return null;
			}
		}
		
		public School getSchoolByApartmentId(String id){
			Integer idInt;
			try {
				idInt=Integer.valueOf(id);
				return apartmentWService.getOneSchoolByApartmentId(idInt);
			} catch (Exception e) {
				return null;
			}
		}
		
}