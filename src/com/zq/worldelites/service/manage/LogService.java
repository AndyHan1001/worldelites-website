package com.zq.worldelites.service.manage;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Log;



@Service("logService")
public class LogService extends CommonService {
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("Log", " where isdel = 0 ", pageNo, pageSize);
		return hm;
	}
}
