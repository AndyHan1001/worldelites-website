package com.zq.worldelites.controller.manage;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import util.DateUtil;
import util.JsonUtil;

import com.zq.worldelites.model.Collection;
import com.zq.worldelites.model.Message;
import com.zq.worldelites.model.User;
import com.zq.worldelites.service.manage.BaseService;
import com.zq.worldelites.service.manage.CollectionService;
import com.zq.worldelites.service.manage.EmailLogsService;
import com.zq.worldelites.service.manage.ExcelService;
import com.zq.worldelites.service.manage.GeographyService;
import com.zq.worldelites.service.manage.IndustryService;
import com.zq.worldelites.service.manage.MessageService;
import com.zq.worldelites.service.manage.UserService;

/**
 * 会员管理
 * 
 * @author Jason
 * 
 */
@Controller
@RequestMapping("/manage/user")
public class UserController {

	@Resource
	private UserService userService;
	@Resource
	private CollectionService collectionService;
	@Resource
	private MessageService messageService;
	@Resource
	private BaseService baseService;
	@Resource
	private GeographyService geographyService;
	@Resource
	private IndustryService industryService;
	@Resource
	private EmailLogsService emailLogsService;
	@Resource
	private ExcelService excelService;

	// -----------------------------------------User------------------------------------------------------------//
	@RequestMapping("user")
	public void user() {

	}

	@ResponseBody
	@RequestMapping("getUserList")
	public String getUserList(int page, int rows) {
		HashMap hm = userService.getPageList(page, rows);
		return JsonUtil.getJson(hm);
	}

	@RequestMapping("saveUser")
	public String saveUser(String ctime_as, String utime_as, String btime_as,
			String etime_as, String logtime_as, String birthday_as, User user,
			HttpServletRequest request) {
		user.setCtime(DateUtil.getDateFromStr(ctime_as, "yyyy-MM-dd hh:mm:ss"));
		user.setUtime(DateUtil.getDateFromStr(utime_as, "yyyy-MM-dd hh:mm:ss"));
		user.setBtime(new Date());
		user.setEtime(new Date());
		user.setLogtime(DateUtil.getDateFromStr(logtime_as,
				"yyyy-MM-dd hh:mm:ss"));
		user.setBirthday(DateUtil.getDateFromStr(birthday_as, "yyyy-MM-dd"));
		if (user.getSsid() == null || user.getSsid() == 0)
			user.setSsid(userService.getMaxSsid("User") + 1);
		baseService.save(user);

		return "redirect:user.html";
	}

	@ResponseBody
	@RequestMapping("getUserById")
	public String getUserById(int id) {
		User user = (User) userService.getById("User", id);

		return JsonUtil.getJsonFormatDateFromObject(user);
	}

	@RequestMapping("updateUser")
	public String updateProduct(String ctime_es, String utime_es,
			String btime_es, String etime_es, String logtime_es,
			String birthday_es, User user, HttpServletRequest request) {
		user.setCtime(DateUtil.getDateFromStr(ctime_es, "yyyy-MM-dd hh:mm:ss"));
		user.setUtime(DateUtil.getDateFromStr(utime_es, "yyyy-MM-dd hh:mm:ss"));
		user.setBtime(new Date());
		user.setEtime(new Date());
		user.setLogtime(DateUtil.getDateFromStr(logtime_es,
				"yyyy-MM-dd hh:mm:ss"));
		user.setBirthday(DateUtil.getDateFromStr(birthday_es, "yyyy-MM-dd"));
		baseService.update(user);
		return "redirect:user.html";
	}

	@ResponseBody
	@RequestMapping("delUserById")
	public int delUserById(int id) {

		return userService.delete("User", id);
	}

	/**
	 * 查看用户的账户名有木有
	 * 
	 * @param passport
	 * @return
	 */
	@ResponseBody
	@RequestMapping("testPassport")
	public boolean testPassport(String passport) {
		boolean flag = userService.testUser(passport);

		return flag;
	}
	
	@RequestMapping("outExcelForUser")
	public void outExcelForUser(HttpServletResponse response){
		String c[] = {"数据库ID","账号","密码","称呼","姓","名","性别","生日",
				"国籍","护照号","将要就读的学校","学校ID","年级","全日制","专业","以前的学校",
				"知道我们通过","联系地址","省/州","市/县","邮编","现状","国家","信用卡类型",
				"手机","用户邮箱","亲属全名","亲属与用户关系","联系地址","省/州","市/县",
				"邮编","国家","亲属座机","手机","用户邮箱","附件1","附件2","附件3","附件4",
				"用户头像","个人爱好","渠道编码","个人备注","个人详细介绍",
				"用户账号状态","注册时间","登陆时间","登陆IP"};
		List<User> list=userService.getAllUser();
		try {
			excelService.outExcel(response,c,list,1,null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// -----------------------------------------Collection------------------------------------------------------------//
	@RequestMapping("collection")
	public void collection() {

	}

	@ResponseBody
	@RequestMapping("getcollectionList")
	public String getCollectionList(int page, int rows) {
		HashMap hm = collectionService.getPageList(page, rows);

		return JsonUtil.getJson(hm);
	}

	@RequestMapping("savecollection")
	public String saveCollection(Collection collection,
			HttpServletRequest request) {

		collectionService.save(collection);

		return "redirect:collection.html";
	}

	@ResponseBody
	@RequestMapping("getcollectionById")
	public String getCollectionById(int id) {
		Collection collection = (Collection) collectionService.getById(
				"Collection", id);
		JSONObject json = JSONObject.fromObject(collection);
		return JsonUtil.getJson(json);
	}

	@RequestMapping("updatecollection")
	public String updateCollection(Collection collection,
			HttpServletRequest request) {
		messageService.update(collection);
		return "redirect:collection.html";
	}

	@ResponseBody
	@RequestMapping("delcollectionById")
	public int delCollectionById(int id) {

		return collectionService.delete("Collection", id);
	}

	/**
	 * //搜索系统
	 * 
	 * @param table
	 *            --实体类名
	 * @param searchType
	 *            --搜索类型（实体类中）
	 * @param searchKeyWord
	 *            --关键字
	 * @return
	 */
	@ResponseBody
	@RequestMapping("searchsystem")
	public String searchsystem(String table, String searchType,
			String searchKeyWord) {
		List list = userService.searchSystem(table, searchType, searchKeyWord);

		return JsonUtil.getJsonFromArray(list);
	}

	// -----------------------------------------Message------------------------------------------------------------//
	@RequestMapping("message")
	public void message() {

	}

	@ResponseBody
	@RequestMapping("getMessageList")
	public String getMessageList(int page, int rows) {
		HashMap hm = messageService.getPageList(page, rows);

		return JsonUtil.getJson(hm);
	}

	@RequestMapping("saveMessage")
	public String saveMessage(String ctime_as, String utime_as,
			String btime_as, String etime_as, Message message,
			HttpServletRequest request) {
		message.setCtime(DateUtil.getDateFromStr(ctime_as,
				"yyyy-MM-dd hh:mm:ss"));
		message.setUtime(DateUtil.getDateFromStr(utime_as,
				"yyyy-MM-dd hh:mm:ss"));
		message.setBtime(DateUtil.getDateFromStr(btime_as,
				"yyyy-MM-dd hh:mm:ss"));
		message.setEtime(DateUtil.getDateFromStr(etime_as,
				"yyyy-MM-dd hh:mm:ss"));

		if (message.getSsid() == null || message.getSsid() == 0)
			message.setSsid(messageService.getMaxSsid("Message") + 1);

		messageService.save(message);

		return "redirect:message.html";
	}

	@ResponseBody
	@RequestMapping("getMessageById")
	public String getMessageById(int id) {
		Message message = (Message) messageService.getById("Message", id);
		JSONObject json = JSONObject.fromObject(message);
		json.put("ctime", message.getCtime().toString());
		json.put("utime", message.getUtime().toString());
		json.put("btime", message.getBtime().toString());
		json.put("etime", message.getEtime().toString());
		return JsonUtil.getJson(json);
	}

	@RequestMapping("updateMessage")
	public String updateProduct(String ctime_es, String utime_es,
			String btime_es, String etime_es, Message message,
			HttpServletRequest request) {
		message.setCtime(DateUtil.getDateFromStr(ctime_es,
				"yyyy-MM-dd hh:mm:ss"));
		message.setUtime(DateUtil.getDateFromStr(utime_es,
				"yyyy-MM-dd hh:mm:ss"));
		message.setBtime(DateUtil.getDateFromStr(btime_es,
				"yyyy-MM-dd hh:mm:ss"));
		message.setEtime(DateUtil.getDateFromStr(etime_es,
				"yyyy-MM-dd hh:mm:ss"));
		messageService.update(message);
		return "redirect:message.html";
	}

	@ResponseBody
	@RequestMapping("delMessageById")
	public int delMessageById(int id) {

		return messageService.delete("Message", id);
	}

	@ResponseBody
	@RequestMapping("getAllUserJson")
	public String getAllUserJson() {
		List<User> list = userService.getAllUser();

		return JsonUtil.getJsonFromArray(list);
	}

	// ----------------------------------------------EmailLog-------------------------------------------------//
	@RequestMapping("maillogs")
	public void maillogs() {

	}
	
	@ResponseBody
	@RequestMapping("getAllMailLogs")
	public String getAllMailLogs(int page, int rows) {
		HashMap hm = emailLogsService.getPageList(page, rows);
		return JsonUtil.getJson(hm);
	}
	
	@ResponseBody
	@RequestMapping("delEmailLogById")
	public int delEmailLogById(int id) {
		return emailLogsService.delete("EmailLog", id);
	}

}
