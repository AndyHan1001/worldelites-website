package com.zq.worldelites.service.manage;

import java.util.HashMap;

import org.springframework.stereotype.Service;




@Service("collectionService")
public class CollectionService extends CommonService {
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("Collection", " where isdel = 0 order by id desc", pageNo, pageSize);
		
		return hm;
	}
}
