package com.zq.worldelites.service.manage;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Menu;
import com.zq.worldelites.model.Type;


@Service("typeService")
public class TypeService extends CommonService {
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("Type", " where isdel = 0 ", pageNo, pageSize);
		return hm;
	}
}
