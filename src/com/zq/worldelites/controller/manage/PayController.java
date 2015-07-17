package com.zq.worldelites.controller.manage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zq.worldelites.model.Order;
import com.zq.worldelites.model.Pay;
import com.zq.worldelites.service.manage.OrderService;
import com.zq.worldelites.service.web.WebOrderService;
import com.zq.worldelites.vo.UserVo;

import util.StringUtil;
import util.SystemUtil;


@Controller
@RequestMapping("/pay")
public class PayController {
	@Resource
	private OrderService orderService;
	@Resource
	private WebOrderService webOrderService;
	
	@RequestMapping("AutoReceive")
	public void Receive(){
		
	}
	@RequestMapping("Send")
	public void Send(){
		
	}
	
	@RequestMapping("payOrder")
	public void PayOrder(HttpServletRequest request,HttpServletResponse respons) throws ServletException, IOException {
		UserVo user=SystemUtil.getFrontLogin(request);
		String orderId = request.getParameter("orderId");
		String url = request.getParameter("url");
		
		if(!StringUtil.isNullOrEmpty(orderId)&&user!=null){
			String info=null;
			int intId=Integer.parseInt(orderId);
			Order order=(Order) orderService.getById("Order", intId);
			if(order!=null){
				String email=user.getMail();
				String v_amount=order.getPrice();
				String v_oid=order.getOrderid();
				if(!StringUtil.isNullOrEmpty(email)&&!StringUtil.isNullOrEmpty(v_amount)&&!StringUtil.isNullOrEmpty(v_oid)){
				request.setAttribute("email", email);
				request.setAttribute("v_amount", v_amount);
				request.setAttribute("v_oid", v_oid);
				request.setAttribute("url",url);
				request.getRequestDispatcher("Send.html").forward(request, respons);
				return;
				}
			}
		}
		request.getRequestDispatcher("../index.html").forward(request, respons);
		return;
	}
	
	@RequestMapping("paysuccess")
	public String PaySuccess(String v_oid,String v_pmode,String v_amount,String v_moneytype){
		try {
			Order order=webOrderService.getOrderByOrderId(v_oid);
			order.setState("Sign Lease");
			order.setStatenote("Please wait for the administrator to inform");
			order.setIsPay("yes");
			webOrderService.update(order);
			//写入支付表
			Pay pay=new Pay();
			pay.setMdid(order.getOrderid());
			pay.setUserid(order.getUserid());
			pay.setUsername(order.getUsername()+" "+order.getUserlastname());
			pay.setNote("Apartment:"+order.getApartmentname()+"; Floor Plan:"+order.getRoomname()+"; "+order.getPricenote());
			pay.setMoney(Integer.valueOf(v_amount));
			pay.setPayInterface(v_pmode);
			webOrderService.save(pay);
			return "redirect:order_wait.html?payState=ok";
		} catch (Exception e) {
			return "redirect:order_wait.html?payState=error";
		}
	}
	
	@RequestMapping("success")
	public void success(String payState,Model model){
		model.addAttribute("payState", payState);
	}
	
}
