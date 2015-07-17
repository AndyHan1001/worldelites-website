package com.zq.worldelites.service.manage;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Message;


@Service("eMailLogsService")
public class EmailLogsService extends CommonService {
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("EmailLog", " where isdel = 0 ", pageNo, pageSize);
		
		return hm;
	}
}
