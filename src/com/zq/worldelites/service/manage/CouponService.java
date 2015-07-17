package com.zq.worldelites.service.manage;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;





import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Apartment;
import com.zq.worldelites.model.Coupon;
import com.zq.worldelites.model.School;
import com.zq.worldelites.model.User;




@Service("couponService")
public class CouponService extends CommonService {
	@Resource
	private UserService userService;
	
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("Coupon", " where isdel = 0 order by ctime desc", pageNo, pageSize);
		
		List<Coupon> list = (List<Coupon>) hm.get("rows");
		List<Coupon> list2 =new ArrayList<Coupon>();
		HashMap hm2 = new HashMap();
		User user = null;
		for(Coupon one : list){//调取学校名-重填
			user = (User) userService.getById("User", one.getUserid()==null?0:one.getUserid());
			if(user!=null){
				one.setUsercountry(user.getCountries());
			}else{
				one.setUsercountry("N/A");
			}
			list2.add(one);
		}
		
		hm2.put("rows", list2);
		hm2.put("total", hm.get("total"));
		
		return hm2;
	}
	
	public List<Coupon> getAllCoupon(){
		List<Coupon> list=find("from Coupon c where c.isdel=0");
		return list;
	}
	
}
