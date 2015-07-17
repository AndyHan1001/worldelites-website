package com.zq.worldelites.service.manage;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Replay;




@Service("replayService")
public class ReplayService extends CommonService {
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("Replay", " where isdel = 0 ", pageNo, pageSize);
		
		return hm;
	}
}
