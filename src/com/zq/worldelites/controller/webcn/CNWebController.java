package com.zq.worldelites.controller.webcn;


import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import util.Constants;
import util.JsonUtil;
import util.RandomValidateCode;
import util.Security;
import util.StringUtil;

import com.zq.worldelites.model.Apartment;
import com.zq.worldelites.model.Article;
import com.zq.worldelites.model.EmailLog;
import com.zq.worldelites.model.Others;
import com.zq.worldelites.model.Picture;
import com.zq.worldelites.model.Thread;
import com.zq.worldelites.model.User;
import com.zq.worldelites.service.web.ApartmentWService;
import com.zq.worldelites.service.web.EmailService;
import com.zq.worldelites.service.web.IndexService;
import com.zq.worldelites.service.web.OthersService;
import com.zq.worldelites.service.web.WebService;
import com.zq.worldelites.service.web.WebUserService;
import com.zq.worldelites.vo.ApartmentSearchVo;
import com.zq.worldelites.vo.SearchVo;
import com.zq.worldelites.vo.UserVo;

@Controller() 
@RequestMapping("/others")
public class CNWebController{
	@Resource
	private WebService webService;
	@Resource
	private OthersService otherssService;
	@Resource
	private IndexService indexService;
	@Resource
	private ApartmentWService apartmentWService;
	@Resource
	private EmailService emailService;
	@Resource
	private WebUserService webUserService;
	
	@RequestMapping("setwebstate")
	public String setwebstate(String state,HttpServletRequest request,HttpSession session){
		if("cn".equals(state)){
			session.setAttribute("webstate","cn");
			return "redirect:/webcn/index.html";
		}else if("fa".equals(state)){
			session.setAttribute("webstate","fa");
			return "redirect:/webcn/index.html";
		}else{
			session.setAttribute("webstate","en");
			return "redirect:/web/index.html";
		}
	}

	@RequestMapping("head")
	public void head(){
		
	}
	
	@RequestMapping("index")
	public void index(Model model,HttpSession session,String act,HttpServletRequest request){
		model.addAttribute("WEB_SITE_STATE",request.getParameter("WEB_SITE_STATE"));
		
		model.addAttribute("act", act);
		List<Apartment> voteApartmentList = apartmentWService.getVoteApartmentPage(20);
		List<Apartment> newApartmentList = apartmentWService.getNewApartmentPage(20);
		model.addAttribute("votelist", voteApartmentList);
		model.addAttribute("newlist", newApartmentList);
		
		List<Picture> pictureList = this.webService.getPicture();
		model.addAttribute("piclist", pictureList);
		
		List<Article> historyList = this.indexService.getArticleForIndex(Constants.ARTICLE_TYPE_HISTORY, 7);
		if(historyList.size()>0){
			List<Article> historyListBig=(List<Article>) historyList.subList(0, 1);
			model.addAttribute("historylistbig", historyListBig);

				List<Article> historyListSmall=historyList.subList(1,historyList.size());
				model.addAttribute("historylistsmall", historyListSmall);
			
		}
		
		
		List<Article> usercase1List = this.indexService.getArticleForIndex(Constants.ARTICLE_TYPE_USERCASE1, 1);
		List<Article> usercase2List = this.indexService.getArticleForIndex(Constants.ARTICLE_TYPE_USERCASE2, 1);
		
		
		
		model.addAttribute("usercase1list", usercase1List);
		model.addAttribute("usercase2list", usercase2List);
		
		List<Thread> channel1List = this.indexService.getThreadForIndex_left(Constants.BBS_TYPE_THREAD ,3);
		List<Thread> channel2List = this.indexService.getThreadForIndex_right(Constants.BBS_TYPE_THREAD, 3);
		
		model.addAttribute("channel1list", channel1List);
		model.addAttribute("channel2list", channel2List);
		//新的展示方法。
		List<Thread> allThreadList15 = this.indexService.getThreadForIndex15();
		model.addAttribute("allthread15", allThreadList15);
				
		List<Others> list = otherssService.getOthersList();
		if(list != null){
			for(Others other:list){
				model.addAttribute(other.getType(), other);
			}
		}
		
	}
	
	/*首页查询:搜索学校
	 */
	@ResponseBody
	@RequestMapping("indexsearch")
	public String indexSearch(String keyword){
		String keyword1;
		try {
			keyword1 = new String(keyword.getBytes("ISO-8859-1"),"UTF-8");
			List<SearchVo> list=webService.seachSchool(keyword1);
			return JsonUtil.getJsonFormatDateFromArray(list);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	/*首页查询:单独搜索公寓
	 */
	@ResponseBody
	@RequestMapping("indexsearchapartment")
	public String indexSearchApartment(String keyword){
		String keyword1;
		try {
			keyword1 = new String(keyword.getBytes("ISO-8859-1"),"UTF-8");
			List<ApartmentSearchVo> list=webService.seachApartment(keyword1);
			return JsonUtil.getJsonFormatDateFromArray(list);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	/*
	 * 登录验证
	 */
	@ResponseBody
	@RequestMapping("validateLogin")
	public String ValidateLogin(String mail,String password,HttpServletRequest request,HttpSession session){
		String result=webService.ValidateLogin(mail, password);
		if("loginSuccess".equals(result)){
			UserVo user=webService.checkLogin(mail, password);
			User user2=webService.getUserByMail(mail);
			user2.setLogtime(new Date());
			user2.setLoginip(request.getRemoteAddr());
			webService.update(user2);
			session.setAttribute(Constants.FRONT_LOGIN, user);
		}
		return result;
	}

	/*
	 * 登录成功时进行跳转
	 */
	@RequestMapping("loginSuccess")
	public String LoginSuccess(HttpServletRequest request,HttpSession session,String mail,String password){
		UserVo user=webService.checkLogin(mail, password);
		User user2=webService.getUserByMail(mail);
		user2.setLogtime(new Date());
		user2.setLoginip(request.getRemoteAddr());
		webService.update(user2);
		session.setAttribute(Constants.FRONT_LOGIN, user);
		return "redirect:index.html";
	}
	
	
	@ResponseBody
	@RequestMapping("validateRegMail")
	public String validateRegMail(String mail){
		if(webService.validateRegMail(mail)==null){
			return null;
		}
		return "1";
	}
	
	@ResponseBody
	@RequestMapping("exit")
	public String Exit(HttpSession session){
		session.removeAttribute(Constants.FRONT_LOGIN);
		return "1";
	}
	
	@RequestMapping("login")
	public void login(){
		
	}
	
	@RequestMapping("reg")
	public void reg(){
		
	}
	
	@RequestMapping("reg2")
	public void reg2(String message,Model model){
		model.addAttribute("message", message);
	}
	
	@RequestMapping("reg3")
	public void reg3(){
		
	}
	
	@ResponseBody
	@RequestMapping("getAllSchool")
	public String getAllSchool(){
		
		return webService.getAllSchool();
	}
	
	@ResponseBody
	@RequestMapping("getAllCountyies")
	public String getAllCountyies(){
		
		return webService.getAllCountyies();
	}
	
	@ResponseBody
	@RequestMapping("getAllSchoolByPrvcName")
	public String getAllSchoolByPrvcName(String name){
		
		return webService.getAllSchoolByPrvcName(name);
	}
	
	//邮箱注册，给用户发邮件
	@RequestMapping("userReg")
	public String userReg(User user,HttpSession session){
		User mUser=webService.getUserByMailAndStateO(user.getMail());
		if(mUser!=null){
			user.setId(mUser.getId());
			mUser=null;
			User nUser=new User();
			nUser.setId(user.getId());
			webService.update(nUser);
		}
		
		//推广
		if(session.getAttribute("tuiguang")!=null){
			user.setTypecode((String)session.getAttribute("tuiguang"));
		}
		
		//分离 school id school name
		if(user.getNewschool().indexOf('@')!=-1){
			String[] s=user.getNewschool().split("@");
			user.setNewschoolid(Integer.valueOf(s[0]));
			user.setNewschool(s[1]);
		}
				
		user.setBtime(new Date());
		user.setCtime(new Date());
		user.setUtime(new Date());
		user.setEtime(new Date());
		user.setBirthday(new Date());
		user.setLogtime(new Date());
		user.setState(0);
		webService.saveOrUpdate(user);
		user=webService.getUserByMail(user.getMail());
		Map<String, String> arg = new HashMap<String,String>();
		arg.put("[@USERNAME]",user.getName()+" "+user.getLastname());
		String md5=Security.encode("MD5",user.getMail()+UUID.randomUUID().toString());
		String url=Constants.WEBSITE+"/regactive.html?code="+user.getMail()+"&token="+md5;
		arg.put("[@URL]",url);
		emailService.sendEmail(Constants.EMAIL_ACTIVE,Constants.EMAIL_ACTIVE_CN, arg,user.getMail(),user,md5,url,0,"");
		return "redirect:reg2.html";
	}
	
	//对邮箱进行验证
	@RequestMapping("regactive")
	public String regactive(String code,String token){
		User user=webService.getUserByMail(code);
		if(user!=null){
			EmailLog emailLog=webService.getEmailLogByUserId(user.getId(),token);
			if(emailLog==null){
				return "redirect:reg2.html";
			}else{
				if(emailLog.getValiddate().after(new Date())&&(emailLog.getClicked()==0)){
					user.setState(1);
					webService.update(user);
					emailLog.setClicked(1);
					webService.update(emailLog);
					//welcome邮件
					Map<String, String> arg = new HashMap<String,String>();
					arg.put("[@USERNAME]",user.getName()+" "+user.getLastname());
					emailService.sendEmail(Constants.EMAIL_WELCOME,Constants.EMAIL_WELCOME_CN, arg,user.getMail(),user,"","",0,"");
					return "redirect:reg3.html";
				}else{
					return "redirect:reg2.html?message=overdue";//验证码过期
				}
			}
		}else{
			return "redirect:reg2.html";
		}
	}
	
	/*
	 * 
	 */
	@RequestMapping("resetpassword")
	public void resetpassword(){
		
	}
	
	/*
	 * 用户忘记密码后通过邮箱点击进入进行邮箱验证
	 */
	@ResponseBody
	@RequestMapping("resetpassworddo")
	public String resetpassworddo(String mail,String code,HttpSession session){
		if(!code.equalsIgnoreCase((String) session.getAttribute(RandomValidateCode.RANDOMCODEKEY))){
			return "0";
		}else if(webService.getUserByMail(mail)==null){
			return "-1";
		}else{
			Map<String, String> arg = new HashMap<String,String>();
			arg.put("[@USERNAME]",webService.getUserByMail(mail).getName());
			String md5=Security.encode("MD5",mail+UUID.randomUUID().toString());
			String url=Constants.WEBSITE+"/newpassword.html?code="+mail+"|"+md5;
			arg.put("[@URL]",url);
			User user=webService.getUserByMail(mail);
			if(user!=null){
				webService.update(user);
				emailService.sendEmail(Constants.EMAIL_RESETPASSWORD,Constants.EMAIL_RESETPASSWORD_CN, arg,mail,user,md5,url,0,"");
			}
			return "1";
		}
	}
	
	@RequestMapping("newpassword")
	public void newpassword(HttpServletRequest request,Model model){

	}
	
	//验证码！！！！
		@RequestMapping("getValidateImage")
		public void getValidateImage(HttpServletResponse response,HttpServletRequest request,HttpSession session){
			 	response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
		        response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
		        response.setHeader("Cache-Control", "no-cache");
		        response.setDateHeader("Expire", 0);
		        RandomValidateCode randomValidateCode = new RandomValidateCode();
		        try {
		            randomValidateCode.getRandcode(request, response);//输出图片方法
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		}
		
		@ResponseBody
		@RequestMapping("validatecode")
		public String validatecode(String code,HttpSession session){
			String str=(String) session.getAttribute("RANDOMVALIDATECODEKEY");
			if(str.equalsIgnoreCase(code))
				return "1";
			else
				return "0";
		}
	
	
	@RequestMapping("newpassworddo")
	public String newpassworddo(String mail,String password,String token){
		if(StringUtil.isNullOrEmpty(password)){
			String u="err";
		}else{
			User user=webService.getUserByMail(mail);
			EmailLog emailLog=webService.getEmailLogByUserId(user.getId(),token);
			if(user!=null&&emailLog.getToken().equals(token)&&(emailLog.getClicked()==0)&&(emailLog.getValiddate().after(new Date()))){
				user.setPassword(password);
				webService.update(user);
				emailLog.setClicked(1);
				webService.update(emailLog);
			}
		}
		return "redirect:index.html?act=login";
	}
	
	@RequestMapping("footer")
	public void footer(HttpSession session){
		
	}
}
