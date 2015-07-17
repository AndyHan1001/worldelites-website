package com.zq.worldelites.service.manage;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Industry;
import com.zq.worldelites.model.Menu;
import com.zq.worldelites.model.Type;


@Service("industryService")
public class IndustryService extends CommonService {
	public HashMap getPageList(int pageNo, int pageSize,String parentid) {              
		HashMap hm = getPageList("Industry", " where isdel = 0 ", pageNo, pageSize);
		
		return hm;
	}
	public List<Industry> getAllIndustryList(String parentid){
		List<Industry> list=find("from Industry i where i.parentid="+parentid,0,10);
		return list;
	}
	
}
