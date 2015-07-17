package com.zq.worldelites.service.manage;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Others;

@Service("othersService")
public class OthersService extends CommonService{
	
	/**
	 * 
	 * @param entityName
	 * @param swhere	
	 * @param pageNo	1开始
	 * @param pageSize
	 * @return
	 */
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("Others", "", pageNo, pageSize);
		
		return hm;
	}
	
	public Object getById(int id){
		List<Others> list = find("from Others where id = ?", id);
		if(list != null && list.size() > 0)
			return list.get(0);
		else
			return null;
	}
}
