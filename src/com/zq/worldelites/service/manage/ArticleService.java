package com.zq.worldelites.service.manage;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Article;



@Service("articleService")
public class ArticleService extends CommonService {
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("Article", " where isdel != 1 ", pageNo, pageSize);
		return hm;
	}
}
