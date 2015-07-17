package com.zq.worldelites.controller.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import util.Constants;
import util.DateUtil;
import util.StringUtil;
import util.SystemUtil;

import com.mchange.lang.IntegerUtils;
import com.zq.worldelites.model.Apartment;
import com.zq.worldelites.model.Coupon;
import com.zq.worldelites.model.Order;
import com.zq.worldelites.model.Others;
import com.zq.worldelites.model.School;
import com.zq.worldelites.model.Thread;
import com.zq.worldelites.model.User;
import com.zq.worldelites.service.manage.SchoolService;
import com.zq.worldelites.service.web.OthersService;
import com.zq.worldelites.service.web.WebUserService;
import com.zq.worldelites.vo.CouponVo;
import com.zq.worldelites.vo.UserVo;

@Controller() 
@RequestMapping("/users")
public class UsersController {
	
	@Resource
	private WebUserService webUserService;
	@Resource
	private OthersService otherssService;
	@Resource
	private SchoolService schoolService;
	
	
	@ResponseBody
	@RequestMapping("checkLogin")
	public String checkLogin(HttpServletRequest request,HttpSession session){
		
		String passport = request.getParameter("passport");
		String password = request.getParameter("password");
		UserVo user = webUserService.checkLogin(passport, password);
		if(user != null){
			session.setAttribute(Constants.FRONT_LOGIN, user);
			return "success";
		}else{
			return Constants.LOGIN_FRONT_ERROR_MESSAGE;
		}
		
	}
	
	//----------------------------------------用户管理-----------------------------------------------------------------
	//首页
	@RequestMapping("usercenter")
	public String usercenter(HttpServletRequest request,HttpSession session,Model model){
		Others others=webUserService.getOneOthersByType(Constants.USERCENTERWELCOME);
		model.addAttribute("others", others);
		if(session.getAttribute(Constants.FRONT_LOGIN)==null)
			return "redirect:../index.html?act=login";
		return null;
	}
	//订单
	@RequestMapping("userorder")
	public String userorder(HttpServletRequest request,HttpSession session,Model model){
		if(session.getAttribute(Constants.FRONT_LOGIN)==null){
			return "redirect:../index.html?act=login";
		}else{
			UserVo user = SystemUtil.getFrontLogin(request);
			List<Order> list = webUserService.getOrdersByUserId(user.getId());
			model.addAttribute("orderlist", list);
			return null;
		}
	}
	//收藏
	@RequestMapping("userapartments")
	public void userapartments(HttpServletRequest request,Model model){
		UserVo user = SystemUtil.getFrontLogin(request);
		List<Apartment> list = this.webUserService.getFvrtApartmentByUserId(user.getId());
		model.addAttribute("apartmentlist", list);
	}
	
	//用户删除收藏
	@ResponseBody
	@RequestMapping("removeCollection")
	public String removeCollection(Integer id,HttpServletRequest request){
		UserVo user = SystemUtil.getFrontLogin(request);
		if(user==null)
			return "0";
		return webUserService.deleteCollectionByApartmentId(id,user.getId());
	}
	
	//用户优惠券
	@RequestMapping("usercoupon")
	public void usercoupon(HttpServletRequest request,Model model){
		UserVo user = SystemUtil.getFrontLogin(request);
		if(user!=null){
			List<Coupon> mycouponlist=webUserService.getUserCouponlist(user.getId());
			List<CouponVo> couponVos=new ArrayList<CouponVo>();
			Date nowDate=new Date();//当前时间；
			for(Coupon oneCoupon:mycouponlist){
				CouponVo couponVo=new CouponVo();
				couponVo.setCoupon(oneCoupon);
				Date date=DateUtil.getDateSubDay(oneCoupon.getCtime(), 30);
				if(date.after(nowDate))
					couponVo.setFlag(true);
				else
					couponVo.setFlag(false);
				couponVos.add(couponVo);
			}
			model.addAttribute("mycouponlist", couponVos);
		}
	}
	
	@ResponseBody
	@RequestMapping("deleteoneorder")
	public String deleteoneorder(String id){
		Order order=(Order) webUserService.findById(Order.class, Integer.valueOf(id));
		if(order!=null){
			webUserService.delete(order);
			return "1";
		}
		return "0";
	}
	
	//----------------------------------------用户信息管理-----------------------------------------------------------------
	//用户个人信息
	@RequestMapping("userinfo")
	public void userinfo(HttpServletRequest request,Model model){
		UserVo user = SystemUtil.getFrontLogin(request);
		int userid = user.getId();
		User u = this.webUserService.getUserById(userid);
		model.addAttribute("userinfo", u);
		
		//model大学列表
		List<School> scList=schoolService.getAllSchoolList();
		model.addAttribute("schoollist", scList);
		
	}
	//对用户信息进行修改
	@RequestMapping("updateuserinfo")
	public String updateuserinfo(User user,String birthday_es,HttpServletRequest request){
		
		User olduser=(User) webUserService.getById("User", user.getId());
		
		user.setBirthday(DateUtil.getDateFromStr(birthday_es,"yy-MM-dd"));
		user.setPassword(olduser.getPassword());
		user.setMail(olduser.getMail());
		user.setPassport(olduser.getPassport());
		user.setContent(olduser.getContent());
		user.setFile1(olduser.getFile1());
		user.setFile2(olduser.getFile2());
		user.setFile3(olduser.getFile3());
		user.setFile4(olduser.getFile4());
		user.setFile5(olduser.getFile5());
		user.setFulltime(olduser.getFulltime());
		user.setIsdel(olduser.getIsdel());
		user.setKnowweby(olduser.getKnowweby());
		user.setLogo(olduser.getLogo());
		user.setNationality(user.getNationality());
		user.setNowstate(olduser.getNowstate());
		user.setPassport(user.getPassport());
		user.setPrvc(user.getPrvc());
		
		user.setCtime(olduser.getCtime());
		user.setBtime(olduser.getBtime());
		user.setEtime(olduser.getEtime());
		user.setLoginip(request.getRemoteAddr());
		user.setUtime(new Date());
		user.setLogtime(new Date());
		webUserService.update(user);
				
		return "redirect:userinfo.html";
	}
	
	//----------------------------------------用户帖子管理-----------------------------------------------------------------
	@RequestMapping("userthreads")
	public void userthreads(HttpServletRequest request,Model model){
		UserVo user = SystemUtil.getFrontLogin(request);
		String pageIndexStr = request.getParameter("pageindex");
		String act = request.getParameter("act");
		int pageSize = 20;
		if(StringUtil.isNullOrEmpty(act))
			act="now";
		if(StringUtil.isNullOrEmpty(pageIndexStr))
			pageIndexStr="1";
		if(!StringUtil.isNullOrEmpty(act) && !StringUtil.isNullOrEmpty(pageIndexStr)){
			int pageIndex = this.webUserService.getThreadPageIndex(pageIndexStr, act, pageSize, user.getId());
			List<Thread> list = this.webUserService.getPageThreadByUserId(pageIndex, pageSize, user.getId());
			model.addAttribute("threadlist", list);
			
			int count = this.webUserService.getMyThreadCount(user.getId());
			
			int countPageNo = count%pageSize==0?count/pageSize:count/pageSize+1;
			if(countPageNo == 0)
				countPageNo = 1;
			
			model.addAttribute("pageindex", pageIndex);
			model.addAttribute("countpageno", countPageNo);
		}else{
			model.addAttribute("pageindex", 1);
			model.addAttribute("countpageno", 1);
		}
	}
	
	@RequestMapping("userpay")
	public void userpay(HttpServletRequest request,Model model){
		UserVo user = SystemUtil.getFrontLogin(request);
	}
	
	//------------------------------------------User Bill---------------------------------------------------------
	@RequestMapping("userbill")
	public void userbill(Integer id,Model model){
		if(id!=null){
			Order order = webUserService.getOneOrderBy(id);
			model.addAttribute("oneorder", order);
		}
		
		Others others = otherssService.getOthersByType(Constants.ORDER_MODEL);
		model.addAttribute("ordercommon", others);
	}

}
