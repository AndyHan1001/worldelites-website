package com.zq.worldelites.service.manage;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.BadWord;




@Service("badWordService")
public class BadWordService extends CommonService {
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("BadWord", " where isdel = 0 ", pageNo, pageSize);
		
		return hm;
	}
}
