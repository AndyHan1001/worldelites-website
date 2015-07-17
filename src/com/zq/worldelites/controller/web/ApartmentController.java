package com.zq.worldelites.controller.web;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import util.Constants;
import util.DateUtil;
import util.JsonUtil;
import util.SendPDF;
import util.SendPDF3;
import util.StringUtil;

import com.zq.worldelites.model.Apartment;
import com.zq.worldelites.model.Collection;
import com.zq.worldelites.model.Coupon;
import com.zq.worldelites.model.Room;
import com.zq.worldelites.model.School;
import com.zq.worldelites.model.Thread;
import com.zq.worldelites.model.User;
import com.zq.worldelites.service.web.ApartmentWService;
import com.zq.worldelites.service.web.EmailService;
import com.zq.worldelites.service.web.WebUserService;
import com.zq.worldelites.vo.GAndSchoolVo;
import com.zq.worldelites.vo.RoomVo;
import com.zq.worldelites.vo.UserVo;

@Controller() 
@RequestMapping("/apartment")
public class ApartmentController{
	
	@Resource
	private ApartmentWService apartmentWService;
	@Resource
	private EmailService emailService;
	@Resource
	private WebUserService webUserService;
	
	/*@RequestMapping(value="/{id}")
	public void apartment(@PathVariable("id") String name){
		System.out.println(name);
	}*/
	
	
	@RequestMapping("apartment")
	public void Apartment(Model model,Integer id,String name,HttpServletRequest request){
		if(!StringUtil.isNullOrEmpty(name)){
			Apartment a=apartmentWService.getApartmentByName(name);
			if(a!=null){
				id=a.getId();
			}
		}
		
		if(id==null)
			id=apartmentWService.getApartmentIfIdIsNull();
		
		//浏览的公寓
		if(request.getSession().getAttribute(Constants.FRONT_LOGIN)!=null){
			Collection collection=new Collection();
			UserVo userVo=(UserVo) request.getSession().getAttribute(Constants.FRONT_LOGIN);
			boolean result=apartmentWService.IsCollection(userVo.getId(), id);
			if(result){
				collection.setUserid(userVo.getId());
				collection.setUsername(userVo.getMail());
				Apartment apartment=apartmentWService.getOneApartment(id);
				collection.setProductid(apartment.getId());
				collection.setProductname(apartment.getName());
				collection.setIsdel(8);
				apartmentWService.save(collection);
			}
		}
		//end
		
		Apartment oneapartment=apartmentWService.getOneApartment(id);
		if(oneapartment!=null){
			//String schoolName=apartmentWService.getSchoolNameBySchoolId(oneapartment.getParentid());
			School school=apartmentWService.getOneSchool(oneapartment.getParentid());
			oneapartment.setParentname(school.getName());
			oneapartment.setMemo(school.getMemo());
			model.addAttribute("oneapartment", oneapartment);//一个公寓
		}
		String[] atlas=oneapartment.getAtlas().split(",");
		List<String> listString=new ArrayList<String>();
		for(String one:atlas){
			listString.add(one);
		}
		if(listString.size()>0&&listString!=null){
			model.addAttribute("firstapartmentatlas", listString.get(0));
			model.addAttribute("oneapartmentatlas", listString);//一个公寓的图集
		}
		
		if(oneapartment.getFeature()!=null){
			String[] feature=oneapartment.getFeature().split(",");
			List<String> featureList=new ArrayList<String>();
			for(String one:feature){
				if(!StringUtil.isNullOrEmpty(one))
				featureList.add(one);
			}
			if(listString.size()>0&&listString!=null){
				model.addAttribute("oneapartmentfeature", featureList);//一个公寓的配置
			}
		}
		
		if(oneapartment.getAmenities()!=null){
			String[] amenities=oneapartment.getAmenities().split(",");
			List<String> amenitiesList=new ArrayList<String>();
			for(String one:amenities){
				//String aString=apartmentWService.getConfigNameById(one);
				if(!StringUtil.isNullOrEmpty(one))
					amenitiesList.add(one);
			}
			if(amenitiesList.size()>0&&amenitiesList!=null){
				model.addAttribute("oneapartmentamenities", amenitiesList);//一个社区的配置
			}
		}
		
		if(oneapartment.getApartment_discountproject()!=null){
			String[] utilities=oneapartment.getApartment_discountproject().split(",");
			List<String> utilitiesList=new ArrayList<String>();
			for(String one:utilities){
				//String aString=apartmentWService.getConfigNameById(one);
				if(!StringUtil.isNullOrEmpty(one))
					utilitiesList.add(one);
			}
			if(utilitiesList.size()>0&&utilitiesList!=null){
				model.addAttribute("oneapartmentutilities", utilitiesList);//一个公寓的杂费项目
			}
		}
		
		List<Apartment> othersApartmentList=apartmentWService.getOthersApartment(id,request);
		model.addAttribute("othersapartmentlist", othersApartmentList);//其他公寓
		
		//各房间
		List<Room> allRoomList=apartmentWService.getAllRoomForApartment(id);
		if(allRoomList!=null&&allRoomList.size()>0){
			List<RoomVo> roomVoList=new ArrayList<RoomVo>();
			for(Room oneRoom:allRoomList){
				if(oneRoom!=null&&oneRoom.getState()==1){
					RoomVo roomVo=new RoomVo();
					if(!StringUtil.isNullOrEmpty(oneRoom.getDiscountmethod())){
						String[] discount=oneRoom.getDiscountmethod().split(",");
						List<String> sList=new ArrayList<String>();
						for(String oneDiscount:discount){
							if(!StringUtil.isNullOrEmpty(oneDiscount)){
								sList.add(oneDiscount);
							}
						}
						if(oneRoom.getEntertime()!=null){
							roomVo.setEnterDate(DateUtil.getDateFormat(oneRoom.getEntertime(), "MM/dd/yyyy"));
						}
						if(oneRoom.getOuttime()!=null){
							roomVo.setOutDate(DateUtil.getDateFormat(oneRoom.getOuttime(), "MM/dd/yyyy"));
						}
						//设置book。coupon按钮
						
						if(oneapartment.getIscoupon()==1&&oneRoom.getIscoupon()==1){
							roomVo.setIscoupon(1);
						}
						if(oneapartment.getIsbook()==1&&oneRoom.getIsbook()==1){
							roomVo.setIsbook(1);
						}
						
						roomVo.setRoomDiscount(sList);
						roomVo.setRoom(oneRoom);
					}
					roomVoList.add(roomVo);
				}
			}
			model.addAttribute("allroomlist", roomVoList);//公寓下的全部房间的list
		}
		
		if(oneapartment.getFeature()!=null){
			String[] ss=oneapartment.getFeature().split(",");
			List<String> facilitiesString=new ArrayList<String>();
			for(String two:ss){
				facilitiesString.add(two);
			}
			
			model.addAttribute("allfacilities", facilitiesString);//一个公寓的设施
		}
	}
	
	@RequestMapping("roomshow")
	public void roomshow(Integer id,Model model){
		Room room=apartmentWService.getOneRoom(id);
		if(room!=null){
			String[] atlas=room.getExpand2().split(",");
			List<String> list=new ArrayList<String>();
			for(String one:atlas){
				list.add(one);
			}
			model.addAttribute("roomatlas", list);
		}
		
	}
	
	@RequestMapping("university")
	public void university(HttpServletRequest request,Model model){
		String SearchWords = request.getParameter("SearchWords");
		String area = request.getParameter("areaid");
		String title = apartmentWService.getGeographyNameById(area);
		model.addAttribute("areaid", area);
		model.addAttribute("title", title);
		List<GAndSchoolVo> voList = apartmentWService.getGSVo();
		model.addAttribute("ualist", voList);
	}
	
	@ResponseBody
	@RequestMapping("getSchoolById")
	public School getSchoolById(Integer id){
		School school=apartmentWService.getOneSchool(id);
		return school;
	}
	
	@ResponseBody
	@RequestMapping("getApartmentById")
	public Apartment getApartmentById(Integer id){
		Apartment apartment=apartmentWService.getOneApartment(id);
		return apartment;
	}
	
	@RequestMapping("universityshow")
	public void universityshow(String id,String name,Model model){
		if(!StringUtil.isNullOrEmpty(name)){
			School s=apartmentWService.getUniversityByName(name);
			if(s!=null){
				id=s.getId().toString();
			}
		}
		if(StringUtil.isNullOrEmpty(id)){
			id=apartmentWService.getSchoolIfIdIsNull().toString();
		}
		
		model.addAttribute("schoolid", id);
		
		List<School> list=apartmentWService.getOneSchoolList(id);
		model.addAttribute("oneschoollist", list);
		if(list.size()>0){
			model.addAttribute("oneschool", list.get(0));
		}
		
		String[] atlas=list.get(0).getAtlas().split(",");
		List<String> listString=new ArrayList<String>();
		for(String one:atlas){
			listString.add(one);
		}
		model.addAttribute("schoolatlaslist", listString);
		
		
		List<Apartment> allApartmentList=apartmentWService.getAllApartmentListBySchoolId(id);
		model.addAttribute("allapartmentlist", allApartmentList);
		
				
	}
	
	@ResponseBody
	@RequestMapping("refreshThread")
	public List<Thread> refreshThread(Integer start,Integer schoolId){
		
		List<Thread> list=apartmentWService.refreshThread(start, 10, schoolId);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping("addcollection")
	public String addcollection(Integer id,HttpSession session){
		if(session.getAttribute(Constants.FRONT_LOGIN)!=null){
			Collection collection=new Collection();
			UserVo userVo=(UserVo) session.getAttribute(Constants.FRONT_LOGIN);
			boolean result=apartmentWService.IsCollection(userVo.getId(), id);
			if(result){
				collection.setUserid(userVo.getId());
				collection.setUsername(userVo.getMail());
				Apartment apartment=apartmentWService.getOneApartment(id);
				collection.setProductid(apartment.getId());
				collection.setProductname(apartment.getName());
				collection.setIsdel(0);
				apartmentWService.save(collection);
				return "Collection Success";
			}else{
				return "Have A Collection";
			}
		}else{
			return "Please Login";
		}
	}
	
	@ResponseBody
	@RequestMapping("ifCoupon")
	public String ifCoupon(Integer id,Model model,HttpSession session){
	
		if(session.getAttribute(Constants.FRONT_LOGIN)!=null){
			return "yes";
		}else{
			return "Please Login";
		}
	}
	
	@RequestMapping("coupon")
	public void coupon(Integer id,Model model,HttpSession session){
		UserVo user=(UserVo) session.getAttribute(Constants.FRONT_LOGIN);
		if(user!=null){
			Apartment apartment=apartmentWService.getOneApartment(id);
			if(apartment!=null){
				model.addAttribute("oneapartment", apartment);
			}
		}
	}
	
	@ResponseBody
	@RequestMapping("addcoupon")
	public String addcoupon(Integer id,HttpSession session,HttpServletRequest request){
		
		if(session.getAttribute(Constants.FRONT_LOGIN)!=null){
			UserVo userVo=(UserVo) session.getAttribute(Constants.FRONT_LOGIN);
			User user=webUserService.getUserById(userVo.getId());
			//得到公寓的信息
			Apartment apartment=apartmentWService.getOneApartment(id);
			if(apartment==null){
				return null;
			}else{
			//判断是否已经领取优惠券
				boolean listaaa=apartmentWService.isGetCoupon(user.getId(), apartment.getId());
			if(!listaaa){
				return "0";
			}else{
				//写到优惠券表
				Coupon coupon=new Coupon();
				School school=apartmentWService.getSchoolByApartmentId(apartment.getParentid());
				if(school==null){
					return "0";
				}else{
					coupon.setSchoolid(school.getId());
					coupon.setSchoolname(school.getName());
				}
				coupon.setCtime(new Date());
				coupon.setUserid(user.getId());
				coupon.setUsername(user.getName());
				coupon.setUserlastname(user.getLastname());
				coupon.setUsermail(user.getMail());
				coupon.setPrice(apartment.getLowestprice());
				coupon.setDiscountprice(apartment.getDiscount());
				coupon.setApartmentid(apartment.getId());
				coupon.setApartmentname(apartment.getName());
				coupon.setKnowweby(user.getKnowweby());
				coupon.setPm(user.getTypecode());
				coupon.setLogo(apartment.getLogo());
					String CouponId="U"+user.getId().toString()+"S"+school.getId()+"A"+apartment.getId();
				coupon.setMemo(CouponId);
				coupon.setContent(apartment.getIntroduction());
				coupon.setFile1(apartment.getCoupon());
				apartmentWService.save(coupon);
				//给公寓相关人员发邮件
				Map<String, String> manage = new HashMap<String,String>();
				manage.put("[@USERNAME]",user.getName()+user.getLastname());
				manage.put("[@USERPHONE]", user.getPhone());
				manage.put("[@APARTMENT]",apartment.getName());
				
				//---给用户发邮件，
				Map<String, String> arg = new HashMap<String,String>();
				arg.put("[@USERNAME]",user.getName()+" "+user.getLastname());//名
				arg.put("[@USERMAIL]",user.getMail());//邮箱
				arg.put("[@SCHOOLNAME]",school.getName());//学校
				arg.put("[@APARTMENTNAME]",apartment.getName());//公寓
				arg.put("[@APARTMENTDISCOUNT]",apartment.getUniquediscount());//公寓优惠
				arg.put("[@COUPONID]",CouponId);//coupon Number
				arg.put("[@CSNAME]",apartment.getCsname());//客户经理
				arg.put("[@CSMAIL]",apartment.getCsmail());//客户经理邮箱
				arg.put("[@DATE]",DateUtil.getDateFormat(new Date(), "MM/dd/yyyy"));//publish Date
				arg.put("[@PHONE]",user.getPhone());
				arg.put("[@APARTMENTMAIL]",apartment.getMail());
				//对于Coupon发送pdf

				 	String path="/usr/local/myapp/worldelites/fileupload/pdf";
				 	String BGpath="/usr/local/myapp/worldelites/fileupload/pdf/coupon.jpg";

				/*String path="c:/";
				String BGpath="c:/couponThree.jpg";*/
				String couponName="WE Coupon_"+apartment.getName()+"_"+user.getName()+" "+user.getLastname()+".pdf";
				session.setAttribute("couponName", couponName);
				if(!"3".equals(apartment.getDiscounttype())){//前两种---------!"3".equals(apartment.getDiscounttype())
					SendPDF s=new SendPDF();
					s.init(path+"/"+couponName, BGpath,user.getName()+" "+user.getLastname(),CouponId,
							DateUtil.getDateFormat(new Date(),"MM/dd/yyyy"),
							apartment.getName(),school.getName(),apartment.getUniquediscount());
					if(s.publishPDF()==1){
						emailService.sendEmail(Constants.EMAIL_COUPON_ADMIN,Constants.EMAIL_COUPON_ADMIN_CN, arg,"support@worldelites.com",user,"","",1,couponName);
						emailService.sendEmail(Constants.EMAIL_COUPON_USER,Constants.EMAIL_COUPON_USER_CN, arg,user.getMail(),user,"","",1,couponName);
						
						return "1";
					}
				}else{//第三种
					BGpath="/usr/local/myapp/worldelites/fileupload/pdf/couponThree.jpg";
					SendPDF3 s=new SendPDF3();
					s.init(path+"/"+couponName, BGpath,user.getName()+" "+user.getLastname(),CouponId,
							DateUtil.getDateFormat(new Date(),"MM/dd/yyyy"),
							apartment.getName(),school.getName(),apartment.getUniquediscount(),apartment.getMemo());
					if(s.publishPDF()==1){
						emailService.sendEmail(Constants.EMAIL_COUPON_ADMIN,Constants.EMAIL_COUPON_ADMIN_CN, manage,"support@worldelites.com",user,"","",1,couponName);
						emailService.sendEmail(Constants.EMAIL_COUPON_USER,Constants.EMAIL_COUPON_USER_CN, arg,user.getMail(),user,"","",1,couponName);
						return "1";
					}
				}
				
			}
			
		}
		}
		return "0";
	}
	
	@ResponseBody
	@RequestMapping("ajax_apartment")
	public String ajax_apartment(Integer id){
		Apartment apartment=apartmentWService.getOneApartment(id);
		if(apartment!=null){
			
			return JsonUtil.getJsonFormatDateFromObject(apartment);
		}else{
			return null;
		}
		
	}
	
	@ResponseBody
	@RequestMapping("ajax_university")
	public String ajax_university(Integer apartmentid){
		School school=apartmentWService.getOneSchoolByApartmentId(apartmentid);
		if(school!=null){
			
			return JsonUtil.getJsonFormatDateFromObject(school);
		}else{
			return null;
		}
		
	}
	
	
	@RequestMapping("map_apartment")
	public void map_apartment(Integer id,Model model,HttpSession session){
		if(id!=null){
			Apartment apartment = apartmentWService.getOneApartment(id);
			if(apartment!=null){
				if(apartment.getLocation().indexOf(',')>0){
					String[] locationLT=apartment.getLocation().split(",");
					model.addAttribute("lat", locationLT[0]);
					model.addAttribute("lng", locationLT[1]);
					model.addAttribute("sid", apartment.getId());
				}
			}
			School school =	apartmentWService.getOneSchoolByApartmentId(id);
			if(school!=null){
				if(school.getLocation().indexOf(',')>0){
					String[] locationLT=school.getLocation().split(",");
					model.addAttribute("u_lat", locationLT[0]);
					model.addAttribute("u_lng", locationLT[1]);
					model.addAttribute("u_sid", apartment.getId());
				}
			}
		}
	}
	@RequestMapping("map_university")
	public void map_university(String id,Model model,HttpSession session){
		
		List<School> list=apartmentWService.getOneSchoolList(id);
		if(list!=null&&list.size()>0){
			if(list.get(0).getLocation().indexOf(',')>0){
				String[] locationLT=list.get(0).getLocation().split(",");
				model.addAttribute("u_lat", locationLT[0]);
				model.addAttribute("u_lng", locationLT[1]);
				model.addAttribute("u_sid", list.get(0).getId());
			}
			List<Apartment> aList=apartmentWService.getAllApartmentListForSchool(id);
			if(aList!=null&&aList.size()>0){
				List<Map<String, String>> AllSchoolLocationList=new ArrayList<Map<String, String>>();
				if(aList.get(0).getLocation().indexOf(',')>0){
					String[] locationString = aList.get(0).getLocation().split(",");
	
					model.addAttribute("lat", locationString[0]);
					model.addAttribute("lng", locationString[1]);
					model.addAttribute("sid", list.get(0).getId());
				}
				for(Apartment oneApartment:aList){
					Map<String, String> oneMap=new HashMap<>();
					if(oneApartment.getLocation().indexOf(',')>0){
					String[] locationString = oneApartment.getLocation().split(",");
					oneMap.put("sid", oneApartment.getId().toString());
					oneMap.put("lat", locationString[0]);
					oneMap.put("lng", locationString[1]);
					AllSchoolLocationList.add(oneMap);
					}
				}
				model.addAttribute("allschoollocationlist", AllSchoolLocationList);
			}
		}
		
	
	}
		
}
