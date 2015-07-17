package com.zq.worldelites.service.web;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import util.Constants;
import util.DateUtil;
import util.UseAuthenticatorSender;

import com.zq.worldelites.model.EmailLog;
import com.zq.worldelites.model.Others;
import com.zq.worldelites.model.User;
import com.zq.worldelites.service.manage.CommonService;

@Service("emailService")
public class EmailService extends CommonService{
	/**
	  * @param templateCode  邮件模版的类型
	  * @param arg  替换信息的map
	  * @param toAddress  收件方
	  * @param user  收件方的信息
	  * @param url  验证的地址连接
	  * @param ----------------------------------	   
	  * @param toUserName	收件人姓名  [@USERNAME]
	  * @param url			邮件中包含的链接  [@URL]
	  * @param apartment	公寓名称 	[@APARTMENT]
	  * @param discount		金额		[@DISCOUNT]
	  * @param orderCode	订单号	[@ORDERCODE]
	  * @param orderTitle	订单名称 [@ORDERTITLE]
	  * @param orderState	订单状态 [@ORDERSTATE]
	  * Map<String, String> arg = new HashMap<String,String>();
	  * arg.put("[@USERNAME]","张三");
	  * arg.put("[@URL]","<a href='http://www.baidu.com'>http://www.baidu.com</a>");
	  * 
	  */
	public boolean sendEmail(String templateCode,String mailType,Map<String, String> arg,String toAddress,User user,String token,String url,Integer sendType,String couponName){
		Others Email= initEmailTemplate(templateCode, arg);
		if(Email!=null&&Email.getTitle()!=null&&Email.getContent()!=null){
			UseAuthenticatorSender uMail=new UseAuthenticatorSender();
			try {
				uMail.sendMail(toAddress,Email.getTitle() ,Email.getContent(),sendType,couponName);
				//White EmailLog
				EmailLog emailLog=new EmailLog();
				emailLog.setType(mailType);
				emailLog.setTouserid(user.getId());
				emailLog.setToaddres(user.getMail());
				emailLog.setFromaddres("admin");
				emailLog.setToken(token);
				emailLog.setTitle(Email.getTitle().replace("[@USERNAME]", user.getName()==null?user.getMail():user.getName()));//替换标题中的代码，如果用户名时空，则用邮箱代替
				emailLog.setContent(Email.getContent());
				emailLog.setUrl(url);
				emailLog.setSenddate(new Date());
				emailLog.setValiddate(DateUtil.getDateSubDay(new Date(), Constants.MAIL_EFFECTIVE));	
				save(emailLog);
				return true;
				//
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}
		return false;
	}
	

	public boolean sendEmailForVOrder(String templateCode,Map<String, String> arg,String toAddress,Integer sendType,List<String> files,User user,String apartment,String room){
		Others Email= initEmailTemplate(templateCode, arg);
		if(Email!=null&&Email.getTitle()!=null&&Email.getContent()!=null){
			UseAuthenticatorSender uMail=new UseAuthenticatorSender();
			try {
				uMail.sendMailForOrder(toAddress, Email.getTitle()+"_"+user.getName()+" "+user.getLastname()+"_"+apartment+"_"+room, Email.getContent(), sendType, files);
				return true;
				//
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}
		return false;
	}
	
	/**
	 * 给订单模块专用的发邮件
	 * @param content
	 * @param mailType
	 * @param title
	 * @param toAddress
	 * @param user
	 * @return
	 */
	public boolean sendEmailForOrder(String content,String mailType,String title,String toAddress,User user){
			if(toAddress==null)
				return false;
			UseAuthenticatorSender uMail=new UseAuthenticatorSender();
			try {
				uMail.sendMail(toAddress,title ,content,0,null);
				//White EmailLog
				EmailLog emailLog=new EmailLog();
				emailLog.setType(mailType);
				emailLog.setTouserid(user.getId());
				emailLog.setToaddres(user.getMail());
				emailLog.setFromaddres("admin");
				emailLog.setToken("");
				emailLog.setTitle(title.replace("[@USERNAME]", user.getName()==null?user.getMail():user.getName()));//替换标题中的代码，如果用户名时空，则用邮箱代替
				emailLog.setContent(content);
				emailLog.setUrl("");
				emailLog.setSenddate(new Date());
				emailLog.setValiddate(DateUtil.getDateSubDay(new Date(), Constants.MAIL_EFFECTIVE));	
				save(emailLog);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
	}
	
	
	//返回处理后的邮件标题，内容
	private Others initEmailTemplate(String templateCode,Map<String, String> arg){
		List<Others> list = find(" FROM Others o WHERE o.type = ? ", templateCode);
		Others others = null;
		if(list != null && list.size() > 0)
			others = list.get(0);
		if(others != null){
			String emailContent = others.getContent();
			String u="";
			String k="";
			for(Map.Entry<String, String> entry:arg.entrySet()){
				k=entry.getKey();
				u=entry.getValue();
				if(k!=null&&u!=null)
				emailContent=emailContent.replace(k,u);
			}  
			others.setContent(emailContent);
			return others;
			
		}else{
			return null;
		}
	}
}
