package com.zq.worldelites.service.manage;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Group;



@Service("groupService")
public class GroupService extends CommonService {
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("Group", " where isdel = 0 ", pageNo, pageSize);
		return hm;
	}
}
