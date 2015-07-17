package com.zq.worldelites.service.manage;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Message;





@Service("messageService")
public class MessageService extends CommonService {
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("Message", " where isdel = 0 ", pageNo, pageSize);
		
		return hm;
	}
}
