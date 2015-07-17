package com.zq.worldelites.service.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import util.Constants;
import util.StringUtil;

import com.zq.worldelites.model.Apartment;
import com.zq.worldelites.model.Collection;
import com.zq.worldelites.model.Coupon;
import com.zq.worldelites.model.Order;
import com.zq.worldelites.model.Others;
import com.zq.worldelites.model.Room;
import com.zq.worldelites.model.School;
import com.zq.worldelites.model.Thread;
import com.zq.worldelites.model.Type;
import com.zq.worldelites.model.User;
import com.zq.worldelites.service.manage.CommonService;
import com.zq.worldelites.vo.UserVo;


@Service("webUserService")
public class WebUserService extends CommonService {
	
	
	public void SaveUser(User user){
		save(user);
	}
	
	public UserVo checkLogin(String passport,String password){
		String hql = " FROM User u WHERE u.passport = ? AND u.password = ? ";
		List<User> list = find(hql, new Object[]{passport,password});
		if(list != null && list.size() > 0){
			User user = list.get(0);
			UserVo userVo = new UserVo(user.getId(),user.getPassport(),user.getName(),user.getLastname(),user.getNewschool(),user.getLogo());
			return userVo;
		}else{
			return null;
		}
	}
	
	public List<Order> getOrdersByUserId(int id){
		String hql = " FROM Order o WHERE o.isdel=0 and o.userid = ? ";
		List<Order> list = find(hql, id);
		List<Order> orderList= new ArrayList<Order>();
		School school=null;
		for(Order one : list){
			if(one.getSchoolid()==null)
				continue;
			school=this.getOneSchool(one.getSchoolid());
			if(school==null)
				continue;
			one.setSchoolname(school.getMemo());
			orderList.add(one);
		}
		
		
		
		return list;
	}
	
	
	public List<Apartment> getFvrtApartmentByUserId(Integer id){
		String hql = " select c.productid from Collection c where c.isdel=0 and c.userid = ? ";
		List<Integer> collectApartmentIdArr = find(hql, id);
		if(collectApartmentIdArr != null && collectApartmentIdArr.size() > 0){
			List<Apartment> allCollectionList=new ArrayList<Apartment>();
			Apartment apartment=null;
			for(Integer oneApartmentId:collectApartmentIdArr){
				if(oneApartmentId!=null){
					List<Apartment> oneList=new ArrayList<Apartment>();
					 oneList=find("from Apartment a where a.isdel=0 and a.id="+oneApartmentId);
					if(oneList.size()!=0){
						apartment=oneList.get(0);
						apartment.setMemo(this.getOneSchool(apartment.getParentid()).getMemo().toString());
						allCollectionList.add(apartment);
					}
					
				}
			}
			return allCollectionList;
		}
		return null;
	}
	
	public School getOneSchool(Integer id){
		School school=(School) findById(School.class,id);
		if(school!=null){
		return school;
		}else{
			return null;
		}
	}
	
	public User getUserById(int id){
		User user = (User) findById(User.class, id);
		return user;
	}
	
	public User getUserByIdGet(int id){
		User user = (User) findById(User.class, id);
		return user;
	}
	
	public List<Thread> getPageThreadByUserId(int pageIndex,int pageSize,int id){
		String hql = " FROM Thread t WHERE t.authorid = " + id + " AND t.isdel = 0 ORDER BY t.id DESC ";
		List<Thread> list = find(hql, (pageIndex-1) * pageSize, pageSize);
		return list;
	}
	
	public int getThreadPageIndex(String pageIndex,String act,int pageSize,int userid){
		int index = 1;
		if(StringUtil.isNullOrEmpty(pageIndex) || StringUtil.isNullOrEmpty(act))
			return index;
		else
			index = Integer.parseInt(pageIndex);
		
		if(act.equals(Constants.PAGE_PREV)){
			if(index > 1)
				index--;
		}else if(act.equals(Constants.PAGE_NEXT)){
			int count = 0;
				count = getMyThreadCount(userid);
			int size = (index - 1) * pageSize;
			if(size < count)
				index++;
		}else{
			index = 1;
		}
		return index;
	}
	
	public int getMyThreadCount(int id){
		String hql = " SELECT COUNT(*) FROM Thread t WHERE t.authorid = " + id + " AND t.isdel = 0 ORDER BY t.id DESC ";
		return getCount(hql);
	}
	
	public List<Type> getAllPayType(){
		String hql = " FROM Type t WHERE t.code = ? ";
		List<Type> list = find(hql, Constants.PAYTYPE);
		return list;
	}
	
	public boolean validateRegMailIsHave(String mail){
		List<User> list=find("from User u where u.mail=?",mail);
		if(list==null||list.size()==0){
			return false;
		}else{
			return true;
		}
	}
	
	/**
	 * 得到用户优惠券信息
	 */
	public List<Coupon> getUserCouponlist(Integer id){
		List<Coupon> list=find("from Coupon c where c.isdel=0 and c.userid=?",id);
		List<Coupon> couponList=new ArrayList<Coupon>();
		School school=null;
		for(Coupon one:list){
			if(one.getSchoolid()==null)
				continue;
			school=this.getOneSchool(one.getSchoolid());
			if(school==null)
				continue;
			one.setSchoolname(school.getMemo());
			couponList.add(one);
		}
		
		return couponList;
	}
	
	/*
	 * 删除一个收藏
	 */
	public String deleteCollectionByApartmentId(Integer id,Integer userid){
		if(id==null)
			return "0";
		List<Collection> list=find("from Collection c where c.productid=? and c.userid=?",new Object[]{id,userid});
		if(list.size()>0&&list!=null){
			Collection collection=list.get(0);
			collection.setIsdel(1);
			update(collection);
			return "1";
		}
		return "0";
	}
	
	/**
	 * 查某一order
	 * @param orderId
	 * @return
	 */
	public Order getOneOrderBy(Integer orderId){
		Order order=(Order) findById(Order.class, orderId);
		return order;
	}
	
	/**
	 * 得到others表的中数据根据type
	 * @param orderId
	 * @return
	 */
	public Others getOneOthersByType(String type){
		if(StringUtil.isNullOrEmpty(type))
			return null;
		List<Others> list=find("from Others o where o.type=?",type);
		if(list.size()>0&&list!=null)
			return list.get(0);
		return null;
	}
}
