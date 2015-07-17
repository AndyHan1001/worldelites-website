package com.zq.worldelites.service.manage;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.User;





@Service("threadService")
public class ThreadService extends CommonService {
	
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("Thread", " where isdel = 0 ", pageNo, pageSize);
		
		return hm;
	}
	
	public List<User> getAllUserJson(){
		List<User> list=find("from User u where u.isdel=0 and u.state=1");
		return list;
	}
	
	
}
