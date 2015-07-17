package com.zq.worldelites.service.web;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import util.Constants;
import util.StringUtil;
import util.SystemUtil;

import com.zq.worldelites.model.Apartment;
import com.zq.worldelites.model.Collection;
import com.zq.worldelites.model.Coupon;
import com.zq.worldelites.model.Geography;
import com.zq.worldelites.model.Menu;
import com.zq.worldelites.model.Room;
import com.zq.worldelites.model.School;
import com.zq.worldelites.model.Thread;
import com.zq.worldelites.service.manage.CommonService;
import com.zq.worldelites.vo.GAndSchoolVo;
import com.zq.worldelites.vo.UserVo;

@Service("apartmentWService")
public class ApartmentWService extends CommonService{

	public Apartment getApartmentByName(String name){
		String hql=" from Apartment a where a.isenable=1 and a.isdel=0 and a.name= '"+name+"' order by a.sort desc";
		List<Apartment> list = find(hql);
		if(list.size()>0&&list!=null){
			return list.get(0);
		}
		return null;
	}
	
	public School getUniversityByName(String name){
		String hql=" from School s where s.isenable=1 and s.isdel=0 and s.memo= '"+name+"' order by s.sort desc";
		List<School> list = find(hql);
		if(list.size()>0&&list!=null){
			return list.get(0);
		}
		return null;
	}
	
	public List<Apartment> getVoteApartmentPage(int size){
		String hql = " from Apartment a where a.ifvote = 1 and a.isenable=1 and a.isdel=0 order by a.sort desc";
		List<Apartment> list = find(hql, 0, size);
			List<Apartment> apartmentList=new ArrayList<Apartment>();
			School school=null;
			for(Apartment oneApartment:list){
				school=getOneSchool(oneApartment.getParentid());
				oneApartment.setMemo(school.getMemo());
				oneApartment.setParentname(school.getName());
				apartmentList.add(oneApartment);
			}
		return apartmentList;
	}
	
	public List<Apartment> getNewApartmentPage(int size){
		String hql = " from Apartment a where a.isenable=1 and a.isdel=0 and a.ifvote=1 order by a.id desc ";
		List<Apartment> list = find(hql, 0, size);
		List<Apartment> apartmentList=new ArrayList<Apartment>();
		School school=null;
		for(Apartment oneApartment:list){
			school=getOneSchool(oneApartment.getParentid());
			oneApartment.setMemo(school.getMemo());
			oneApartment.setParentname(school.getName());
			apartmentList.add(oneApartment);
		}
		return apartmentList;
	}
	
	public List<GAndSchoolVo> getGSVo(){
		List<Geography> geographyList=find("from Geography g where g.isdel=0 and g.isenable=1");
		if(geographyList!=null&&geographyList.size()>0){
			List<GAndSchoolVo> GSVo=new ArrayList<GAndSchoolVo>();
			GAndSchoolVo gAndSchoolVo=null;
			for(Geography onegGeography:geographyList){
				gAndSchoolVo=new GAndSchoolVo();
				List<School> schoolList=find("from School s where s.isdel=0 and s.isenable=1 and s.parentid=?",onegGeography.getId());
				gAndSchoolVo.setGeography(onegGeography);
				gAndSchoolVo.setSchoolList(schoolList);
				GSVo.add(gAndSchoolVo);
			}
			return GSVo;
		}else{
			return null;
		}
	}
	
	public String getGeographyNameById(String id){
		try {
			if(!StringUtil.isNullOrEmpty(id)){
				Geography obj = (Geography) findById(Geography.class, Integer.parseInt(id));
				if(obj != null)
					return obj.getName();
					
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return "U.S.";
	}
	
	public List<School> getOneSchoolList(String id){
		List<School> list=find("from School s where s.isdel=0 and s.id=?",Integer.parseInt(id));
		return list;
	}
	
	public List<Apartment> getAllApartmentListForSchool(String schoolId){
		List<Apartment> list=find("from Apartment a where a.isdel=0 and a.parentid=?",Integer.parseInt(schoolId));
		return list;
	}
	
	public School getSchoolByApartmentId(Integer parentId){
		if(parentId==null) 
			return null;
		List<School> list=find("from School s where s.isdel=0 and s.id=?",parentId);
		if(list.size()>0&&list!=null)
			return list.get(0);
		else
			return null;
	}
	
	public List<Apartment> getAllApartmentListBySchoolId(String schoolId){
		List<Apartment> list=find("from Apartment a where a.isdel=0 and a.isenable=1 and a.parentid=?",Integer.parseInt(schoolId));
		List<Apartment> apartmentList=new ArrayList<Apartment>();
		for(Apartment oneApartment:list){
			String marketprice=oneApartment.getMarketprice();
				/*String discount=oneApartment.getDiscount();
				if(StringUtil.isNullOrEmpty(marketprice))
					marketprice="0";
				if(StringUtil.isNullOrEmpty(discount))
					discount="0";
				oneApartment.setDiscount(String.valueOf(Integer.parseInt(marketprice)-Integer.parseInt(discount)));//原价-优惠价=赋值给优惠价
*/			oneApartment.setParentname(getOneSchool(oneApartment.getParentid()).getName());
			apartmentList.add(oneApartment);
		}
		return apartmentList;
	}
	
	public List<Thread> getAllThreadListForSchool(String id,Integer size){
		List<Thread> list=find("from Thread t where t.isdel=0 and t.typecode="+Integer.parseInt(id),0,size);
		
		return list;
	}
	
	//刷新攻略
	public List<Thread> refreshThread(Integer start,Integer end,Integer schoolId){
		List<Thread> list=find("from Thread t where t.isdel=0 and t.channel='"+Constants.BBS_TYPE_THREAD+"' and t.isenable=1 and t.typecode="+schoolId,start,end);
		return list;
	}
	
	public Apartment getOneApartment(Integer id){
		Apartment apartment=(Apartment) findById(Apartment.class,id);
		if(apartment!=null){
		return apartment;
		}else{
			return null;
		}
	}
	
	/**
	 * 如果没有apartment 。Id那么取出一个公寓ID
	 * @return
	 */
	public Integer getApartmentIfIdIsNull(){
		List<Apartment> list=find("from Apartment a where a.isdel=0 and a.isenable=1 order by a.sort desc");
		return list.get(0).getId();
	}
	
	/**
	 * 如果没有school 。Id那么取出一个schoolID
	 * @return
	 */
	public Integer getSchoolIfIdIsNull(){
		List<School> list=find("from School s where s.isdel=0 and s.isenable=1 order by s.sort desc");
		return list.get(0).getId();
	}
	
	public School getOneSchool(Integer id){
		School school=(School) findById(School.class,id);
		if(school!=null){
		return school;
		}else{
			return null;
		}
	}
	
	//得到一个学校下。一个公寓的其他公寓List
	public List<Apartment> getOthersApartment(Integer id,HttpServletRequest request){
		
		UserVo userVo=SystemUtil.getFrontLogin(request);
		if(userVo!=null){
			List<Collection> list=find("from Collection c where c.isdel=8 and c.userid="+userVo.getId()+" order by c.id desc",0,5);
			List<Apartment> apartmentList=new ArrayList<Apartment>();
			for(Collection oneCollection:list){
				Apartment apartment=(Apartment) findById(Apartment.class, oneCollection.getProductid());
				if(apartment!=null){
					apartment.setMemo(this.getOneSchool(apartment.getParentid()).getMemo());
					apartmentList.add(apartment);
				}
			}
			return apartmentList;
		}else{
			return null;
		}
		
	}
	
	public List<Room> getAllRoomForApartment(Integer id){
		List<Room> list=find("from Room r where r.isdel=0 and r.parentid=? order by r.sort desc",id);
		
		return list;
	}
	
	public Room getOneRoom(Integer id){
		Room room=(Room) findById(Room.class, id);
		
		return room;
	}
	
	public School getOneSchoolByApartmentId(Integer id){
		Apartment apartment=(Apartment) findById(Apartment.class, id);
		if(apartment!=null){
			School school=(School)findById(School.class, apartment.getParentid());
			return school;
		}
		
		return null;
	}
	
	public boolean IsCollection(Integer userid,Integer apartmentid){
		List<Collection> list=null;
		list=find("from Collection c where c.isdel=0 and c.userid="+userid+" and c.productid="+apartmentid);
		if(list.size()!=0){
			return false;
		}else{
			return true;
		
		}
	}
	
	/*
	 * 判断是否领取过优惠券
	 */
	public boolean isGetCoupon(Integer userId,Integer apartmentId){
		List<Coupon> list=find("from Coupon c where c.isdel=0 and c.apartmentid=? and c.userid=? order by c.ctime desc",new Object[]{apartmentId,userId});
		if(list.size()>0){
			if(list.get(0).getCtime().getTime()<(new Date().getTime()-1000*60*5)){
				return true;
			}else{
				return false;
			}
		}else{
			return true;
		}
	}
	
	/**
	 * 通过ID找名字（学校）
	 * @param id
	 * @return
	 */
	public String getSchoolNameBySchoolId(Integer id){
		School school=(School)findById(School.class, id);
		if(school!=null){
			return school.getName();
		}else{
			return null;
		}
		
	}
	
	/**
	 * 得到配置名称通过ID  EN
	 * @param id
	 * @return
	 */
	public String getConfigNameById(String id){
		if(!StringUtil.isNullOrEmpty(id)){
			Menu menu=(Menu) findById(Menu.class,Integer.parseInt(id));
			if(menu!=null){
				return menu.getName();
			}else{
				return null;
			}
		}else{
			return null;
		}
		
	}
	
	/**
	 * 得到配置名称通过ID  Cn
	 * @param id
	 * @return
	 */
	public String getCNConfigNameById(String id){
		if(!StringUtil.isNullOrEmpty(id)){
			Menu menu=(Menu) findById(Menu.class,Integer.parseInt(id));
			if(menu!=null){
				return menu.getMemo();
			}else{
				return null;
			}
		}else{
			return null;
		}
	}
	
}
