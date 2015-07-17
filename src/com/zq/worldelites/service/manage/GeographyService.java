package com.zq.worldelites.service.manage;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Geography;
import com.zq.worldelites.model.Menu;
import com.zq.worldelites.model.Type;


@Service("geographyService")
public class GeographyService extends CommonService {
	public HashMap getPageList(int pageNo, int pageSize,String pageParentId) {              
		HashMap hm = getPageList("Geography", " where isdel = 0 and parentid = "+pageParentId, pageNo, pageSize);
		
		return hm;
	}
	public List<Geography> getAreaList() {              
		List<Geography> list=find("from Geography g where g.isdel=0");
		return list;
	}
}
