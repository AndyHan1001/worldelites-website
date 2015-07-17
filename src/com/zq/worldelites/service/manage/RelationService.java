package com.zq.worldelites.service.manage;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Relation;




@Service("relationService")
public class RelationService extends CommonService {
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("Relation", " where isdel = 0 ", pageNo, pageSize);
		return hm;
	}
}
