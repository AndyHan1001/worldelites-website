package com.zq.worldelites.controller.manage;


import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zq.worldelites.model.Geography;
import com.zq.worldelites.model.User;
import com.zq.worldelites.service.manage.UserService;
import com.zq.worldelites.service.web.EmailService;
import com.zq.worldelites.service.web.WebService;

import util.Constants;
import util.Security;
import util.StringUtil;

@Controller() 
@RequestMapping("/manage")
public class LoginController {

	@Resource
	private UserService userService;
	
	@Resource
	private WebService webService;
	
	@Resource
	private EmailService emailService;
	
	@RequestMapping("login")
	public void login(){
		
	}
	
	@ResponseBody
	@RequestMapping("check")
	public String check(HttpServletRequest request,HttpSession session){
		String mail = request.getParameter("mail");
		String password = request.getParameter("password");
		if(!StringUtil.isNullOrEmpty(mail) && !StringUtil.isNullOrEmpty(password)){
			User user = userService.getUser(mail, password);
			if(user != null){
				session.setAttribute(Constants.BACK_LOGIN, user);
				return null;
			}
		}
		return "err";
	}
	
	@RequestMapping("index")
	public void index(){
		
	}

	@RequestMapping("mailTest")
	public void mailTest(){
		
	}
	
////////////////////////////////
	@RequestMapping("sendMail")
	public void sendMail(){
		
	}
	
	@ResponseBody
	@RequestMapping("sendMailDo")
	public void sendMailDo(){
		List<User> list=userService.getAllUserOne();
		StringBuffer ss=new StringBuffer();
		for(User user:list){
		
		user.setBtime(new Date());
		user.setCtime(new Date());
		user.setUtime(new Date());
		user.setEtime(new Date());
		user.setBirthday(new Date());
		user.setLogtime(new Date());
		user.setState(1);
		webService.saveOrUpdate(user);
		user=webService.getUserByMail(user.getMail());
		Map<String, String> arg = new HashMap<String,String>();
		arg.put("[@USERNAME]",user.getName()+" "+user.getLastname());
		arg.put("[@MAIL]",user.getMail());
		String md5=Security.encode("MD5",user.getMail()+UUID.randomUUID().toString());
		String url=Constants.WEBSITE+"/web/newpassword.html?code="+user.getMail()+"|"+md5;
		arg.put("[@URL]",url);
		boolean flag=emailService.sendEmail("re_UserActive",Constants.EMAIL_ACTIVE_CN, arg,user.getMail(),user,md5,url,0,"");
		ss.append(user.getMail()+"-------"+flag+"------"+"\n");
		
		try {
			Thread.sleep(200);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		}
		
		try {
			   File f = new File("/logo_yxx.text");
			   FileWriter fw = new FileWriter(f);
			   PrintWriter pw = new PrintWriter(fw);
			   pw.append(ss);
			   pw.flush();
			   pw.close();
			  } catch (Exception e) {
			   e.printStackTrace();
			  }
	
	}
}
	
