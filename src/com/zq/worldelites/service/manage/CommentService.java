package com.zq.worldelites.service.manage;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Comment;



@Service("commentService")
public class CommentService extends CommonService {
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("Comment", " where isdel = 0 ", pageNo, pageSize);
		return hm;
	}
}
