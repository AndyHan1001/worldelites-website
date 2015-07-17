package com.zq.worldelites.service.web;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Order;
import com.zq.worldelites.model.Others;
import com.zq.worldelites.service.manage.CommonService;

@Service("otherssService")
public class OthersService extends CommonService{
	
	
	public List<Others> getOthersList(){
		List<Others> list = find(" from Others o order by o.id asc");
		return list;
	}
	
	/**
	 * 通过类型找模版
	 * @param type
	 * @return
	 */
	public Others getOthersByType(String type){
		if(type==null)
			return null;
		List<Others> list = find(" from Others o where o.type='"+type+"'");
		if(list.size()>0&&list!=null)
			return list.get(0);
		else
		return null;
	}
	
}
