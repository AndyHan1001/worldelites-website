package com.zq.worldelites.service.manage;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Article;



@Service("columnService")
public class ColumnService extends CommonService {
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("Article", " where isdel = 8 ", pageNo, pageSize);
		return hm;
	}
	
	/**
	 * 
	 */
	public Object getById(int id){
		List list = find("from Article where id = ? and isdel = 8", id);
		if(list != null && list.size() > 0)
			return list.get(0);
		else
			return null;
	}
	
	
}
