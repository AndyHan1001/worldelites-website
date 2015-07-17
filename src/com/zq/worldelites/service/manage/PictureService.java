package com.zq.worldelites.service.manage;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Picture;



@Service("pictureService")
public class PictureService extends CommonService {
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("Picture", " where isdel = 0 ", pageNo, pageSize);
		
		return hm;
	}
}
