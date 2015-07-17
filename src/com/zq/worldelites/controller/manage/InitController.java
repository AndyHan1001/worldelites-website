package com.zq.worldelites.controller.manage;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import util.Constants;
import util.DateUtil;
import util.JsonUtil;
import util.StringUtil;

import com.zq.worldelites.model.Apartment;
import com.zq.worldelites.model.BadWord;
import com.zq.worldelites.model.Coupon;
import com.zq.worldelites.model.Geography;
import com.zq.worldelites.model.Group;
import com.zq.worldelites.model.Industry;
import com.zq.worldelites.model.Menu;
import com.zq.worldelites.model.Message;
import com.zq.worldelites.model.Others;
import com.zq.worldelites.model.Relation;
import com.zq.worldelites.model.Room;
import com.zq.worldelites.model.School;
import com.zq.worldelites.model.Type;
import com.zq.worldelites.model.User;
import com.zq.worldelites.service.manage.ApartmentService;
import com.zq.worldelites.service.manage.BadWordService;
import com.zq.worldelites.service.manage.ExcelService;
import com.zq.worldelites.service.manage.GeographyService;
import com.zq.worldelites.service.manage.GroupService;
import com.zq.worldelites.service.manage.IndustryService;
import com.zq.worldelites.service.manage.LogService;
import com.zq.worldelites.service.manage.MenuService;
import com.zq.worldelites.service.manage.OthersService;
import com.zq.worldelites.service.manage.RelationService;
import com.zq.worldelites.service.manage.RoomService;
import com.zq.worldelites.service.manage.SchoolService;
import com.zq.worldelites.service.manage.TypeService;

/**
 * 基础配置管理
 * @author Jason
 *
 */
@Controller() 
@RequestMapping("/manage/init")
public class InitController {
	
	@Resource
	private MenuService menuService;
	@Resource
	private OthersService othersService;
	@Resource
	private TypeService typeService;
	@Resource
	private GroupService groupService;
	@Resource
	private LogService logService;
	@Resource
	private RelationService relationService;
	@Resource
	private IndustryService industryService;
	@Resource 
	private GeographyService geographyService;
	@Resource
	private SchoolService schoolService;
	@Resource 
	private ApartmentService apartmentService;
	@Resource 
	private RoomService roomService;
	@Resource 
	private ExcelService excelService;
	
	
	@Resource
	private BadWordService badWordService;
	
	
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
		List list=schoolService.searchSystem(table, searchType, searchKeyWord);
		
		return JsonUtil.getJsonFromArray(list);
	}

//=================================SystemInfo Start=======================================================================
	/**
	 * 系统信息页面
	 */
	@RequestMapping("systeminfo")
	public void systeminfo(){
		
	}
	
	@ResponseBody
	@RequestMapping("getOthersList")
	public String getOthersList(int page,int rows){
		HashMap hm = othersService.getPageList(page, rows);
		return JsonUtil.getJson(hm);
	}
	
	
	@RequestMapping("saveOthers")
	public String saveOthers(Others others){
		othersService.save(others);
		return "redirect:systeminfo.html";
	}
	
	@RequestMapping("updateOthers")
	public String updateOthers(Others others){
		/*if(others.getType().equals(Constants.EMAIL_ACTIVE)){
			others.setContent("<html><head><meta content='Microsoft Visual Studio .NET 7.1' name='GENERATOR' charset='GB2312'>    <meta content='C#' name='CODE_LANGUAGE'>    <meta content='JavaScript' name='vs_defaultClientScript'>    <meta content='http://schemas.microsoft.com/intellisense/ie5' name='AIFCS'><script></script></head>"+others.getContent()+"</html>");
		}*/
		othersService.update(others);
		return "redirect:systeminfo.html";
	}
	
	@ResponseBody
	@RequestMapping("delOthersById")
	public int delOthersById(int id){
		return othersService.delete("Others",id);
	}
	
	@ResponseBody
	@RequestMapping("getOthersById")
	public String getOthersById(int id){
		Others others = (Others)othersService.getById(id);
		return JsonUtil.getJson(others);
		
	}
	
	
	//=================================Menu Start=======================================================================
	/**
	 * 菜单
	 */
	@RequestMapping("menu")
	public void menu(){
		
	}
	
	@ResponseBody
	@RequestMapping("getMenuList")
	public String getMenuList(int page,int rows){
		HashMap hm = menuService.getPageList(page, rows);
		return JsonUtil.getJson(hm);
	}
	
	
	@RequestMapping("saveMenu")
	public String saveMenu(Menu menu){
		if(menu.getSsid() == null || menu.getSsid() == 0)
			menu.setSsid(menuService.getMaxSsid("Menu")+1);
		menuService.save(menu);
		System.out.println("======add====["+menu.getId()+"]============");
		return "redirect:menu.html";
	}
	
	@RequestMapping("updateMenu")
	public String updateMenu(Menu menu){
		menuService.update(menu);
		System.out.println("=======update==["+menu.getId()+"]==================");
		return "redirect:menu.html";
	}
	
	@ResponseBody
	@RequestMapping("delMenuById")
	public int delMenuById(int id){
		return menuService.delete("Menu",id);
	}
	
	@ResponseBody
	@RequestMapping("getMenuById")
	public String getMenuById(int id){
		Menu menu = (Menu)menuService.getById("Menu",id);
		return JsonUtil.getJson(menu);
		
	}
	
//=================================Type Start=======================================================================
	@RequestMapping("typelist")
	public void typelist(){
		
	}
	
	@ResponseBody
	@RequestMapping("getTypeList")
	public String getTypeList(int page,int rows){
		HashMap hm = typeService.getPageList(page, rows);
		return JsonUtil.getJson(hm);
	}
	
	@RequestMapping("saveType")
	public String saveType(Type type){
		if(type.getSsid() == null || type.getSsid() == 0)
			type.setSsid(typeService.getMaxSsid("Type")+1);
		typeService.save(type);
		System.out.println("======add====["+type.getId()+"]============");
		return "redirect:typelist.html";
	}
	
	@RequestMapping("updateType")
	public String updateType(Type type){
		typeService.update(type);
		System.out.println("=======update==["+type.getId()+"]==================");
		return "redirect:typelist.html";
	}
	
	@ResponseBody
	@RequestMapping("delTypeById")
	public int delTypeById(int id){
		return typeService.delete("Type",id);
	}
	
	@ResponseBody
	@RequestMapping("getTypeById")
	public String getTypeById(int id){
		Type type = (Type)typeService.getById("Type",id);
		return JsonUtil.getJson(type);
	}

//=================================Group=======================================================================	
	
	@RequestMapping("group")
	public void group(){
	}
	
	@ResponseBody
	@RequestMapping("getGroupList")
	public String getGroupList(int page,int rows){
		HashMap hm=groupService.getPageList(page, rows);
		
		return JsonUtil.getJson(hm);
	}
	
	@RequestMapping("saveGroup")
	public String saveGroup(String ctime_as,String utime_as,String btime_as,String etime_as,Group group,HttpServletRequest request){
		group.setCtime(DateUtil.getDateFromStr(ctime_as, "yyyy-MM-dd hh:mm:ss"));
		group.setUtime(DateUtil.getDateFromStr(utime_as, "yyyy-MM-dd hh:mm:ss"));
		group.setBtime(DateUtil.getDateFromStr(btime_as, "yyyy-MM-dd hh:mm:ss"));
		group.setEtime(DateUtil.getDateFromStr(etime_as, "yyyy-MM-dd hh:mm:ss"));
		if(group.getSsid() == null || group.getSsid() == 0)
			group.setSsid(groupService.getMaxSsid("Group")+1);
		System.out.println("======add====["+group.getId()+"]============");
		groupService.save(group);
		return "redirect:group.html";
	}
	
	@RequestMapping("updateGroup")
	public String updateGroup(String ctime_es,String utime_es,String btime_es,String etime_es,Group group,HttpServletRequest request){
		group.setCtime(DateUtil.getDateFromStr(ctime_es, "yyyy-MM-dd hh:mm:ss"));
		group.setUtime(DateUtil.getDateFromStr(utime_es, "yyyy-MM-dd hh:mm:ss"));
		group.setBtime(DateUtil.getDateFromStr(btime_es, "yyyy-MM-dd hh:mm:ss"));
		group.setEtime(DateUtil.getDateFromStr(etime_es, "yyyy-MM-dd hh:mm:ss"));
		groupService.update(group);
		System.out.println("=======update==["+group.getId()+"]==================");
		return "redirect:group.html";
	}
	
	@ResponseBody
	@RequestMapping("delGroupById")
	public int delGroupById(int id){
		return groupService.delete("Group",id);
	}
	
	@ResponseBody
	@RequestMapping("getGroupById")
	public String getGroupById(int id){
		Group group = (Group)groupService.getById("Group",id);
		
		return JsonUtil.getJsonFormatDateFromObject(group);
	}
	
	@ResponseBody
	@RequestMapping("getAllTypeJson")
	public String getAllTypeJson(){
		List<Type> list = typeService.find("from Type t");
		String json = JsonUtil.getJsonFromArray(list);
		return json;
	}
	
//================================= BadWord  =======================================================================	
	@RequestMapping("badword")
	public void badword(){
		
	}
	
	@ResponseBody
	@RequestMapping("getBadWordList.html")
	public String getBadWordList(int page,int rows){
		HashMap hm=badWordService.getPageList(page, rows);
		
		return JsonUtil.getJson(hm);
	}
	
	@RequestMapping("saveBadWord")
	public String saveBadWord(BadWord badWord){
		if(badWord.getId() == null || badWord.getId() == 0)
			badWord.setId(badWordService.getMaxId("BadWord")+1);
		badWordService.save(badWord);
		System.out.println("======add====["+badWord.getId()+"]============");
		return "redirect:badword.html";
	}
	
	@ResponseBody
	@RequestMapping("getBadWordById")
	public String getBadWordById(int id){
		BadWord badWord = (BadWord)badWordService.getById("BadWord",id);
		return JsonUtil.getJson(badWord);
	}
	
	@RequestMapping("updateBadWord")
	public String updateBadWord(BadWord badWord){
		badWordService.update(badWord);
		System.out.println("=======update==["+badWord.getId()+"]==================");
		return "redirect:badword.html";
	}
	
	@ResponseBody
	@RequestMapping("delBadWordById")
	public int delBadWordById(int id){
		
		return badWordService.delete("BadWord",id);
	}
//================================= Log  =======================================================================
	@RequestMapping("loglist")
	public void loglist(){
		
	}
	
	@ResponseBody
	@RequestMapping("getLogList")
	public String getLogList(int page,int rows){
		HashMap hm=logService.getPageList(page, rows);
		
		return JsonUtil.getJsonFormatDateFromObject(hm);
	}
	
	@ResponseBody
	@RequestMapping("delLogById")
	public int delLogById(int id){
		
		return logService.delete("Log",id);
	}
	
	
//================================= Relation  =======================================================================	
	@RequestMapping("relation")
	public void relation(){
		
	}
	
	@ResponseBody
	@RequestMapping("getRelationList")
	public String getRelationList(int page,int rows){
		HashMap hm=relationService.getPageList(page, rows);
		
		return JsonUtil.getJson(hm);
	}
	
	@RequestMapping("saveRelation")
	public String saveRelation(String ctime_as,String utime_as,String btime_as,String etime_as,Relation relation,HttpServletRequest request){
		relation.setCtime(DateUtil.getDateFromStr(ctime_as, "yyyy-MM-dd hh:mm:ss"));
		relation.setUtime(DateUtil.getDateFromStr(utime_as, "yyyy-MM-dd hh:mm:ss"));
		relation.setBtime(DateUtil.getDateFromStr(btime_as, "yyyy-MM-dd hh:mm:ss"));
		relation.setEtime(DateUtil.getDateFromStr(etime_as, "yyyy-MM-dd hh:mm:ss"));
		if(relation.getSsid() == null || relation.getSsid() == 0)
			relation.setSsid(relationService.getMaxSsid("Relation")+1);
		relationService.save(relation);
		System.out.println("======add====["+relation.getSsid()+"]============");
		return "redirect:relation.html";
	}
	
	@RequestMapping("updateRelation")
	public String updateRelation(String ctime_es,String utime_es,String btime_es,String etime_es,Relation relation,HttpServletRequest request){
		relation.setCtime(DateUtil.getDateFromStr(ctime_es, "yyyy-MM-dd hh:mm:ss"));
		relation.setUtime(DateUtil.getDateFromStr(utime_es, "yyyy-MM-dd hh:mm:ss"));
		relation.setBtime(DateUtil.getDateFromStr(btime_es, "yyyy-MM-dd hh:mm:ss"));
		relation.setEtime(DateUtil.getDateFromStr(etime_es, "yyyy-MM-dd hh:mm:ss"));
		relationService.update(relation);
		System.out.println("=======update==["+relation.getId()+"]==================");
		return "redirect:relation.html";
	}
	
	@ResponseBody
	@RequestMapping("delRelationById")
	public int delRelationById(int id){
		
		return relationService.delete("Relation",id);
	}
	
	@ResponseBody
	@RequestMapping("getRelationById")
	public String getRelationById(int id){
		Relation relation= (Relation)relationService.getById("Relation",id);
		
		return JsonUtil.getJsonFormatDateFromObject(relation);
	}
	
	
	
	
//================================= Industry  =======================================================================	
	@RequestMapping("industry")
	public void industry(){
		
	}
	
	@ResponseBody
	@RequestMapping("getIndustryList")
	public String getindustryList(int page,int rows,String parentid){
		if(parentid==null)
			parentid="0";
		HashMap hm=industryService.getPageList(page, rows,parentid);
		
		return JsonUtil.getJson(hm);
	}
	
	@RequestMapping("saveIndustry")
	public String saveIndustry(Industry industry){
		if(industry.getSsid() == null || industry.getSsid() == 0)
			industry.setSsid(industryService.getMaxSsid("Industry")+1);
		industryService.save(industry);
		System.out.println("======add====["+industry.getSsid()+"]============");
		return "redirect:industry.html";
	}
	
	@RequestMapping("updateIndustry")
	public String updateIndustry(Industry industry){
		industryService.update(industry);
		System.out.println("=======update==["+industry.getId()+"]==================");
		return "redirect:industry.html";
	}
	
	@ResponseBody
	@RequestMapping("delIndustryById")
	public int delIndustryById(int id){
		
		return industryService.delete("Industry",id);
	}
	
	@ResponseBody
	@RequestMapping("getIndustryById")
	public String getIndustryById(int id){
		Industry industry= (Industry)industryService.getById("Industry",id);
		return JsonUtil.getJson(industry);
	}	
	
	
	
//================================= Geography  =======================================================================
	@RequestMapping("geography")
	public void geography(){
		
	}
	
	@ResponseBody
	@RequestMapping("getGeographyList")
	public String getGeographyList(int page,int rows,String parentid){
		if(parentid == null )
			parentid="0";
		HashMap hm=geographyService.getPageList(page, rows,parentid);
		
		return JsonUtil.getJson(hm);
	}
	
	@RequestMapping("saveGeography")
	public String saveGeography(Geography geography){
		if(geography.getSsid()==null||geography.getSsid()==0)
			geography.setSsid(geographyService.getMaxSsid("Geography")+1);
		geographyService.save(geography);
		
		return "redirect:geography.html";
	}
	
	@RequestMapping("updateGeography")
	public String updateGeography(Geography geography){
		geographyService.update(geography);
		
		return "redirect:geography.html";
	}
	
	@ResponseBody
	@RequestMapping("delGeography")
	public int delGeography(int id){
			
		return geographyService.delete("Geography",id);
	}
	
	@ResponseBody
	@RequestMapping("getGeographyById")
	public String getGeographyById(int id){
		Geography geography=(Geography)geographyService.getById("Geography",id);
		
		return JsonUtil.getJson(geography);
	}

//=================================================== School =================================================
	@RequestMapping("school")
	public void school(HttpServletRequest request,Model model){
		HttpSession session=request.getSession();
		session.setAttribute("utn",null);
	}
	
	@ResponseBody
	@RequestMapping("getSchoolList")
	public String getSchoolList(int page,int rows){
		HashMap hm=schoolService.getPageList(page, rows);
		
		return JsonUtil.getJson(hm);
	}
	
	@RequestMapping("saveSchool")
	public String saveSchool(School school){
		if(school.getSsid()==null||school.getSsid()==0)
			school.setSsid(schoolService.getMaxSsid("School")+1);
		schoolService.save(school);
		
		return "redirect:school.html";
	}
	
	@RequestMapping("updateSchool")
	public String updateSchool(School school){
		schoolService.update(school);
		
		return "redirect:school.html";
	}
	
	@ResponseBody
	@RequestMapping("delSchoolById")
	public int delSchoolById(int id){
			
		return schoolService.delete("School",id);
	}
	
	@ResponseBody
	@RequestMapping("getSchoolById")
	public String getSchoolById(int id){
		School school=(School)schoolService.getById("School",id);
		
		return JsonUtil.getJson(school);
	}
	
	/**
	 * 查询州列表，获取某学校的上级州信息
	 * @param key
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getPrvcListByWordKey")
	public String getPrvcListByWordKey(){
		
		List<Geography> list=schoolService.getSomePrvcByWordKey();
		
		return JsonUtil.getJsonFromArray(list);
	}
	
	@ResponseBody
	@RequestMapping("setAtlasSessionClear")
	public void setAtlasSessionClear(HttpServletRequest request){
		HttpSession session=request.getSession();
		session.setAttribute("ufn",null);
	}
	@ResponseBody
	@RequestMapping("setAtlasSession")
	public void setAtlasSession(HttpServletRequest request){
		HttpSession session=request.getSession();
		List<String> uploadList = new ArrayList<String>();
		String atlas=request.getParameter("atlas");
		String[] a=new String[]{};
		a=atlas.split(",");
		for(int i=0;i<a.length;i++){
			uploadList.add(a[i]);
		}
		session.setAttribute("ufn",uploadList);
	}
	
	@RequestMapping("outExcelForSchool")
	public void outExcelForSchool(HttpServletResponse response){
		String c[] = {"数据库ID","内部编号","学校名称","学校缩写",
				"学校介绍","学校介绍(cn)","所在州编号","所在州名称",
				"学校图片路径","学校图集路径","学校地理位置",
				"学校排序","是否启用"}; 
		
		List<School> list=schoolService.getAllSchool();
		try {
			excelService.outExcel(response,c,list,3,null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//=================================================== Apartment =================================================
	@RequestMapping("apartment")
	public void apartment(){
		
	}
	
	@ResponseBody
	@RequestMapping("getApartmentList")
	public String getApartmentList(int page,int rows){
		HashMap hm=apartmentService.getPageList(page, rows);
		
		return JsonUtil.getJson(hm);
	}
	
	@RequestMapping("saveApartment")
	public String saveApartment(Apartment apartment,HttpSession session){
		if(apartment.getSsid()==null||apartment.getSsid()==0)
			apartment.setSsid(apartmentService.getMaxSsid("Apartment")+1);
		
		apartmentService.save(apartment);
		session.setAttribute("ufn",null);
		return "redirect:apartment.html";
	}
	
	@RequestMapping("updateApartment")
	public String updateApartment(Apartment apartment,HttpSession session){
		apartmentService.update(apartment);
		session.setAttribute("ufn",null);
		return "redirect:apartment.html";
	}
	
	@ResponseBody
	@RequestMapping("delApartmentById")
	public int delApartmentById(int id){
			
		return apartmentService.delete("Apartment",id);
	}
	
	@ResponseBody
	@RequestMapping("getApartmentById")
	public String getApartmentById(int id){
		Apartment apartment=(Apartment)apartmentService.getById("Apartment",id);
		return JsonUtil.getJson(apartment);
	}
	
	@ResponseBody
	@RequestMapping("getSchoolListByWordKey")
	public String getSchoolListByWordKey(){
		
		List<School> list=apartmentService.getSomeSchoolByWordKey();
		
		return JsonUtil.getJsonFromArray(list);
	}
	//房产公司
	@ResponseBody
	@RequestMapping("getAllCompanyList")
	public String getAllCompanyList(){
		List<Menu> list=apartmentService.getAllMenuSet(Constants.MENU_TYPE_COMPANY);
		return JsonUtil.getJsonFromArray(list);
	}
	//设施
	@ResponseBody
	@RequestMapping("getAllAmenitiesList")
	public String getAllAmenitiesList(){
		List<Menu> list=apartmentService.getAllMenuSet(Constants.MENU_TYPE_AMENITIES);
		return JsonUtil.getJsonFromArray(list);
	}
	//配置
	@ResponseBody
	@RequestMapping("getAllFeatrueList")
	public String getAllFeatrueList(){
		List<Menu> list=apartmentService.getAllMenuSet(Constants.MENU_TYPE_FEATRUE);
		return JsonUtil.getJsonFromArray(list);
	}
	//公寓标签
	@ResponseBody
	@RequestMapping("getAllTagList")
	public String getAllTagList(){
		List<Menu> list=apartmentService.getAllMenuSet(Constants.MENU_TYPE_APARTMENTTAG);
		return JsonUtil.getJsonFromArray(list);
	}
	//优惠标签--房间
	@ResponseBody
	@RequestMapping("getAllOthersList")
	public String getAllOthersList(){
		List<Menu> list=apartmentService.getAllMenuSet(Constants.MENU_TYPE_OTHERS);
		return JsonUtil.getJsonFromArray(list);
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("getAllDisCountProjectList")
	public String getAllDisCountProjectList(){
		
		List<Menu> list=apartmentService.getAllMenuSet(Constants.MENU_TYPE_OTHERS);
		
		return JsonUtil.getJsonFromArray(list);
	}
	
	@RequestMapping("outExcelForApartment")
	public void outExcelForApartment(HttpServletResponse response){
		String c[] = {"数据库ID","公寓编号","公寓名称","公寓名称缩写",
				"公寓所在房产公司","客服经理姓名","客服经理邮箱",
				"公寓经理邮箱","公寓联系电话","公寓联系传真",
				"公寓办公时间","公寓办公时间(cn)","公寓优惠金额",
				"公寓最低月租","WE折扣类型","WE折扣信息",
				"WE独家折扣(cn)","公寓地址","公寓网址",
				"公寓特惠&新闻","公寓特惠&新闻(cn)",
				"公寓标签","公寓标签(cn)","公寓周边",
				"公寓周边(cn)","公寓配置","公寓配置(cn)",
				"社区设施","社区设施(cn)","公寓周边",
				"公寓周边(cn)","公寓水电网等费","公寓水电网等费(cn)",
				"租赁方式","租赁方式(cn)","宠物政策","宠物政策(cn)",
				"公寓押金","申请费","申请费","活动经费","公寓管理费",
				"停车场","停车场(cn)","其他费用","其他费用(cn)",
				"提前入住","提前入住(cn)","室友匹配服务",
				"室友匹配服务(cn)","学校编号","学校名称","公寓缩略图",
				"公寓优惠劵","公寓附录","学校图集路径","学校地理位置",
				"公寓排序","是否推荐","是否启用","是否可领取Coupon","是否可预订"};

		
		List<Apartment> list=apartmentService.getAllApartment();
		try {
			excelService.outExcel(response,c,list,6,null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


//=================================================== Room =================================================
	@RequestMapping("room")
	public void room(){
		
	}
	
	@ResponseBody
	@RequestMapping("getRoomList")
	public String getRoomList(int page,int rows){
		HashMap hm=roomService.getPageList(page, rows);
		
		return JsonUtil.getJson(hm);
	}
	
	@RequestMapping("saveRoom")
	public String saveRoom(Room room,HttpServletRequest request){
		room.setEntertime(DateUtil.getDateFromStr(request.getParameter("entertime_as"), "yyyy-MM-dd"));
		room.setEndtime(DateUtil.getDateFromStr(request.getParameter("endtime_as"), "yyyy-MM-dd"));
		room.setOuttime(DateUtil.getDateFromStr(request.getParameter("outtime_as"), "yyyy-MM-dd"));
		if(room.getSsid()==null||room.getSsid()==0)
			room.setSsid(roomService.getMaxSsid("Room")+1);
		roomService.save(room);
		
		return "redirect:room.html";
	}
	
	@RequestMapping("updateRoom")
	public String updateRoom(Room room,HttpServletRequest request){
		room.setEntertime(DateUtil.getDateFromStr(request.getParameter("entertime_es"), "yyyy-MM-dd"));
		room.setEndtime(DateUtil.getDateFromStr(request.getParameter("endtime_es"), "yyyy-MM-dd"));
		room.setOuttime(DateUtil.getDateFromStr(request.getParameter("outtime_es"), "yyyy-MM-dd"));
		roomService.update(room);
		
		return "redirect:room.html";
	}
	
	@ResponseBody
	@RequestMapping("delRoomById")
	public int delRoomById(int id){
			
		return roomService.delete("Room",id);
	}
	
	@ResponseBody
	@RequestMapping("getRoomById")
	public String getRoomById(int id){
		Room room=(Room)roomService.getById("Room",id);
		
		return JsonUtil.getJsonFormatDateFromObject(room);
	}
	
	@ResponseBody
	@RequestMapping("getApartmentListByWordKey")
	public String getApartmentListByWordKey(){
		
		List<Apartment> list=roomService.getSomeApartmentByWordKey();
		
		return JsonUtil.getJsonFromArray(list);
	}
	
	@ResponseBody
	@RequestMapping("getAllRoomList")
	public String getAllRoomList(){
		
		List<Menu> list=apartmentService.getAllMenuSet(Constants.MENU_TYPE_DISCOUNTPROJECT);
		
		return JsonUtil.getJsonFromArray(list);
	}
	
	@RequestMapping("outExcelForRoom")
	public void outExcelForRoom(HttpServletResponse response){
		String c[] = {"数据库ID","内部编号","户型名称","户型面积",
				"户型描述","户型描述(cn)","入住时间",
				"搬出时间","搬出时间","租期","租期(cn)",
				"市场租金","折扣价格","优惠项目及政策",
				"优惠项目及政策(cn)","WE折扣描述",
				"WE折扣描述(cn)","押金","所在公寓编号","所在公寓名称",
				"户型缩略图路径","户型图集",
				"户型排序","是否可被预订"}; 
		
		List<Room> list=roomService.getAllRoom();
		try {
			excelService.outExcel(response,c,list,7,null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//////////////////////////////////////////////地图初始化////////////////////////////////////////////////////////////////	
	@RequestMapping("mapinit")
	public void mapinit(HttpServletRequest request,Model model){
		 try {
			 String path = request.getSession().getServletContext().getRealPath("/"); 
			   File f = new File(path+"/resources/MapCode/map-data.js");
			   File f2 = new File(path+"/resources-cn/MapCode/map-data.js");
			   model.addAttribute("mapf", f);
			   model.addAttribute("mapf2", f2);
			   FileWriter fw = new FileWriter(f);
			   PrintWriter pw = new PrintWriter(fw);
			   
			   FileWriter fw2 = new FileWriter(f2);
			   PrintWriter pw2 = new PrintWriter(fw2);
		
			   List<Geography> list=geographyService.getAreaList();
			   for(Geography geography:list){
			   		pw.append("var vi_"+geography.getName().replace(" ","_")+"="+geography.getId()+";"+"\n");
			   		pw2.append("var vi_"+geography.getName().replace(" ","_")+"="+geography.getId()+";"+"\n");
			   }
			   
			   List<Geography> list2=geographyService.getAreaList();
			   for(Geography geography:list2){
				   if(geography.getIsenable()==1)
				   {
		   			pw.append("var if_"+geography.getName().replace(" ","_")+"=true;"+"\n");
		   			pw.append("var co_up_"+geography.getName().replace(" ","_")+"='#eaa907';"+"\n");
			   		pw.append("var co_over_"+geography.getName().replace(" ","_")+"='#99CC00';"+"\n");
			   		pw.append("var co_down_"+geography.getName().replace(" ","_")+"='#323896';"+"\n");
			   		
			   		pw2.append("var if_"+geography.getName().replace(" ","_")+"=true;"+"\n");
		   			pw2.append("var co_up_"+geography.getName().replace(" ","_")+"='#eaa907';"+"\n");
			   		pw2.append("var co_over_"+geography.getName().replace(" ","_")+"='#99CC00';"+"\n");
			   		pw2.append("var co_down_"+geography.getName().replace(" ","_")+"='#323896';"+"\n");
			   		
				   }else{
					   pw.append("var if_"+geography.getName().replace(" ","_")+"=false;"+"\n");
					   pw.append("var co_up_"+geography.getName().replace(" ","_")+"='#EBECED';"+"\n");
				   		pw.append("var co_over_"+geography.getName().replace(" ","_")+"='#99CC00';"+"\n");
				   		pw.append("var co_down_"+geography.getName().replace(" ","_")+"='#323896';"+"\n");
				   		
				   		pw2.append("var if_"+geography.getName().replace(" ","_")+"=false;"+"\n");
						   pw2.append("var co_up_"+geography.getName().replace(" ","_")+"='#EBECED';"+"\n");
					   		pw2.append("var co_over_"+geography.getName().replace(" ","_")+"='#99CC00';"+"\n");
					   		pw2.append("var co_down_"+geography.getName().replace(" ","_")+"='#323896';"+"\n");
				   }
			   }
			   
			  
			   
			   pw.flush();
			   pw2.flush();
			   pw.close();
			   pw2.close();
			  } catch (Exception e) {
			   e.printStackTrace();
			  }
	
	}
	
	
}
