package com.zq.worldelites.controller.manage;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import util.Constants;
import util.DateUtil;
import util.JsonUtil;
import util.StringUtil;

import com.zq.worldelites.model.Coupon;
import com.zq.worldelites.model.EmailLog;
import com.zq.worldelites.model.Order;
import com.zq.worldelites.model.Pay;
import com.zq.worldelites.model.Product;
import com.zq.worldelites.model.Type;
import com.zq.worldelites.model.User;
import com.zq.worldelites.service.manage.CouponService;
import com.zq.worldelites.service.manage.ExcelService;
import com.zq.worldelites.service.manage.OrderService;
import com.zq.worldelites.service.manage.PayService;
import com.zq.worldelites.service.manage.ProductService;
import com.zq.worldelites.service.web.EmailService;

/**
 * 商城管理
 * @author Jason
 *
 */
@Controller() 
@RequestMapping("/manage/shop")
public class ShopController {
	@Resource
	private ProductService productService;
	@Resource
	private OrderService orderService;
	@Resource
	private PayService payService;
	@Resource
	private CouponService couponService;
	@Resource
	private EmailService emailService;
	@Resource
	private ExcelService excelService;
	
	
	/**
	 * //搜索系统
	 * @param table--实体类名
	 * @param searchType--搜索类型（实体类中）
	 * @param searchKeyWord--关键字
	 * @return
	 */
	@ResponseBody
	@RequestMapping("searchsystem")
	public String searchsystem(String table,String searchType,String searchKeyWord){
		List list=orderService.searchSystem(table, searchType, searchKeyWord);
		
		return JsonUtil.getJsonFromArray(list);
	}
//-----------------------------------------Product------------------------------------------------------------//
	@RequestMapping("product")
	public void product(){
		
	}
	
	@ResponseBody
	@RequestMapping("getProductList")
	public String getProductList(int page,int rows){
		HashMap hm=productService.getPageList(page, rows);
		
		return JsonUtil.getJson(hm);
	}
	
	@RequestMapping("saveProduct")
	public String saveProduct(String ctime_as,String utime_as,String btime_as,String etime_as,Product product,HttpServletRequest request){
		product.setCtime(DateUtil.getDateFromStr(ctime_as, "yyyy-MM-dd hh:mm:ss"));
		product.setUtime(DateUtil.getDateFromStr(utime_as, "yyyy-MM-dd hh:mm:ss"));
		product.setBtime(DateUtil.getDateFromStr(btime_as, "yyyy-MM-dd hh:mm:ss"));
		product.setEtime(DateUtil.getDateFromStr(etime_as, "yyyy-MM-dd hh:mm:ss"));
		if(product.getSsid()==null||product.getSsid()==0)
			product.setSsid(productService.getMaxSsid("Product")+1);
		productService.save(product);
		
		return "redirect:product.html";
	}
	
	@ResponseBody
	@RequestMapping("getProductById")
	public String getProductById(int id){
		Product product=(Product)productService.getById("Product",id);
			
		return JsonUtil.getJsonFormatDateFromObject(product);
	}
	
	@RequestMapping("updateProduct")
	public String updateProduct(String ctime_es,String utime_es,String btime_es,String etime_es,Product product,HttpServletRequest request){
		product.setCtime(DateUtil.getDateFromStr(ctime_es, "yyyy-MM-dd hh:mm:ss"));
		product.setUtime(DateUtil.getDateFromStr(utime_es, "yyyy-MM-dd hh:mm:ss"));
		product.setBtime(DateUtil.getDateFromStr(btime_es, "yyyy-MM-dd hh:mm:ss"));
		product.setEtime(DateUtil.getDateFromStr(etime_es, "yyyy-MM-dd hh:mm:ss"));
		productService.update(product);
		return "redirect:product.html";
	}
	
	@ResponseBody
	@RequestMapping("delProductById")
	public int delProductById(int id){
		
		return productService.delete("Product",id);
	}
	
	@ResponseBody
	@RequestMapping("getAllTypeJsonForProduct")
	public String getAllTypeJsonForProduct(){
		List<Type> list= productService.find("from Type", 0, 10);
		
		return JsonUtil.getJsonFromArray(list);
	}
	
//-----------------------------------------Order------------------------------------------------------------//
	@RequestMapping("order")
	public void order(){
		
	}
	
	@ResponseBody
	@RequestMapping("getOrderList")
	public String getOrderList(int page,int rows){
		HashMap hm=orderService.getPageList(page, rows);
		
		return JsonUtil.getJson(hm);
	}
	
	@RequestMapping("saveOrder")
	public String saveOrder(Order order,HttpServletRequest request){
		orderService.save(order);
		
		return "redirect:order.html";
	}
	
	@ResponseBody
	@RequestMapping("getOrderById")
	public String getOrderById(int id){
		Order order=(Order)orderService.getById("Order",id);
		
		return JsonUtil.getJsonFormatDateFromObject(order);
	}
	
	@RequestMapping("updateOrder")
	public String updateOrder(Order order,HttpServletRequest request){
		if("Applicaton Processing".equals(order.getState())){
			order.setConfirmtime(new Date().toString());
		}else if("Online Payment".equals(order.getState())){
			order.setPaytime(new Date().toString());
		}else if("Sign Lease".equals(order.getState())){
			order.setSigntime(new Date().toString());
		}else if("Complete".equals(order.getState())){
			order.setFinishtime(new Date().toString());
		}
	
		orderService.update(order);
		return "redirect:order.html";
	}
	
	@ResponseBody
	@RequestMapping("delOrderById")
	public int delOrderById(int id){
		
		return orderService.delete("Order",id);
	}	
	
	//订单表中，修改订单下的人工控制发送邮件系统
	@ResponseBody
	@RequestMapping("sendordermail")
	public String sendOrderMail(Integer userid,String type,String title,String content){
		if(content==null)
			return "0";
		User user=orderService.getUserById(userid);
		if(user!=null){
			if(emailService.sendEmailForOrder(content, type, title, user.getMail(), user))
				return "1";
		}
		return "0";
	}
	
	/*
	 * 1,2,3,4,5
	 * 订单表中，调取邮件模板
	 */
	@ResponseBody
	@RequestMapping("getMailTemplate")
	public String getMailTemplate(String type){
		if(!StringUtil.isNullOrEmpty(type)){
			return orderService.getMailTemplate(type);
		}
		return "";
	}


	@RequestMapping("outExcelForOrder")
	public void outExcelForOrder(HttpServletRequest request,HttpServletResponse response){
		String idObj = request.getParameter("id");
		String c[] = {"数据库ID","订单编号","户型ID","户型名称",
								"户型缩略图","大学ID","大学名称","公寓ID",
								"公寓名称","用户的id","用户姓","用户名",
								"用户护照","用户电话","用户邮箱","价格结算",
								"结算描述","入住时间","搬出时间","签约截止时间",
								"提交申请时间","确认申请时间","签租时间","支付时间",
								"完成代订时间","订单状态","订单描述","邮件标题",
								"邮件内容","用户全部信息→","数据库ID","账号","密码",
								"称呼","姓","名","性别",
								"生日","国籍","护照号","将要就读的学校",
								"学校ID","年级","全日制","专业",
								"以前的学校","知道我们通过","联系地址","省/州",
								"市/县","邮编","现状","国家",
								"信用卡类型","手机","用户邮箱","亲属全名",
								"亲属与用户关系","联系地址","省/州","市/县",
								"邮编","国家","亲属座机","手机",
								"用户邮箱","附件1","附件2","附件3",
								"附件4","用户头像","个人爱好","渠道编码",
								"个人备注","个人详细介绍","用户账号状态","注册时间",
								"登陆时间","登陆IP"};
		
		List<Order> list=orderService.getAllOrder();
		try {
			excelService.outExcel(response,c,list,5,idObj);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//-----------------------------------------Pay------------------------------------------------------------//
	@RequestMapping("pay")
	public void pay(){
	}
	
	@ResponseBody
	@RequestMapping("getPayList")
	public String getPayList(int page,int rows){
		HashMap hm=payService.getPageList(page, rows);
		
		return JsonUtil.getJson(hm);
	}
	
	@RequestMapping("savePay")
	public String savePay(String ctime_as,String utime_as,String btime_as,String etime_as,Pay pay,HttpServletRequest request){
		pay.setCtime(DateUtil.getDateFromStr(ctime_as, "yyyy-MM-dd hh:mm:ss"));
		pay.setUtime(DateUtil.getDateFromStr(utime_as, "yyyy-MM-dd hh:mm:ss"));
		pay.setBtime(DateUtil.getDateFromStr(btime_as, "yyyy-MM-dd hh:mm:ss"));
		pay.setEtime(DateUtil.getDateFromStr(etime_as, "yyyy-MM-dd hh:mm:ss"));
		if(pay.getSsid()==null||pay.getSsid()==0)
			pay.setSsid(payService.getMaxSsid("Pay")+1);
		payService.save(pay);
		
		return "redirect:pay.html";
	}
	
	@ResponseBody
	@RequestMapping("getPayById")
	public String getPayById(int id){
		Pay pay=(Pay)payService.getById("Pay",id);
			
		return JsonUtil.getJsonFormatDateFromObject(pay);
	}
	
	@RequestMapping("updatePay")
	public String updatePay(String ctime_es,String utime_es,String btime_es,String etime_es,Pay pay,HttpServletRequest request){
		pay.setCtime(DateUtil.getDateFromStr(ctime_es, "yyyy-MM-dd hh:mm:ss"));
		pay.setUtime(DateUtil.getDateFromStr(utime_es, "yyyy-MM-dd hh:mm:ss"));
		pay.setBtime(DateUtil.getDateFromStr(btime_es, "yyyy-MM-dd hh:mm:ss"));
		pay.setEtime(DateUtil.getDateFromStr(etime_es, "yyyy-MM-dd hh:mm:ss"));
		payService.update(pay);
		return "redirect:pay.html";
	}
	
	@ResponseBody
	@RequestMapping("delPayById")
	public int delPayById(int id){
		
		return payService.delete("Pay",id);
	}

	
	@RequestMapping("outExcelForPay")
	public void outExcelForPay(HttpServletResponse response){
		String c[] = {"数据库ID","支付id","支付-用户-标记","买家用户的id",
				"买家用户名称","支付用户的订单的MDID","支付对应的订单摘要",
				"支付发表时间","支付接口",
				"应付金额","实付金额","实付结果状态","附记"};
		
		List<Pay> list=payService.getAllPay();
		try {
			excelService.outExcel(response,c,list,4,null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//-------------------------------------------Coupon-------------------------------
	
	@RequestMapping("coupon")
	public void coupon(){
		
	}
	
	@ResponseBody
	@RequestMapping("getCouponList")
	public String getCouponList(int page,int rows){
		HashMap hm=couponService.getPageList(page, rows);
		
		return JsonUtil.getJson(hm);
	}
	
	@RequestMapping("saveCoupon")
	public String saveCoupon(String ctime_as,Coupon coupon,HttpServletRequest request){
		coupon.setCtime(DateUtil.getDateFromStr(ctime_as, "yyyy-MM-dd hh:mm:ss"));

		productService.save(coupon);
		
		return "redirect:coupon.html";
	}
	
	@ResponseBody
	@RequestMapping("getCouponById")
	public String getCouponById(int id){
		Coupon coupon=(Coupon)couponService.getById("Coupon",id);
			
		return JsonUtil.getJsonFormatDateFromObject(coupon);
	}
	
	@RequestMapping("updateCoupon")
	public String updateCoupon(String ctime_es,Coupon coupon,HttpServletRequest request){
		coupon.setCtime(DateUtil.getDateFromStr(ctime_es, "yyyy-MM-dd hh:mm:ss"));
		couponService.update(coupon);
		return "redirect:coupon.html";
	}
	
	@ResponseBody
	@RequestMapping("delCouponById")
	public int delCouponById(int id){
		
		return couponService.delete("Coupon",id);
	}
	
	@RequestMapping("outExcelForCoupon")
	public void outExcelForCoupon(HttpServletResponse response){
		String c[] = {"数据库ID","用户ID","用户名","用户姓","国籍",
				"邮箱","渠道编码","知道我们通过","优惠价时间",
				"学校ID","学校名称","公寓ID","公寓名称","价格",
				"优惠价","摘要","内容","缩略图","附件1","附件2"};
		
		List<Coupon> list=couponService.getAllCoupon();
		try {
			excelService.outExcel(response,c,list,2,null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
