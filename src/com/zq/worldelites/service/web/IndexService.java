package com.zq.worldelites.service.web;

import java.util.List;

import org.springframework.stereotype.Service;
import com.zq.worldelites.model.Thread;
import com.zq.worldelites.model.Article;
import com.zq.worldelites.service.manage.CommonService;


@Service("indexService")
public class IndexService extends CommonService {
	
	public List<Article> getArticleForIndex(String type,int size){
		String hql = " from Article a where a.type = '" + type + "' and a.isenable=1 and a.isdel = 0 order by a.visit desc";
		List<Article> list = find(hql, 0, size);
		return list;
	}
	
	public List<Thread> getThreadForIndex_left(String type,int size){
		String hql = " from Thread t where t.channel='"+type+"' and t.stick = 1  and t.isdel = 0 order by t.utime desc";
		List<Thread> list = find(hql, 0, size);
		return list;
	}
	
	public List<Thread> getThreadForIndex15(){
		String hql = " from Thread t where  t.isdel = 0 order by t.comment desc";
		List<Thread> list = find(hql, 0, 15);
		return list;
	}
	
	public List<Thread> getThreadForIndex_right(String type,int size){
		String hql = " from Thread t where  t.channel='"+type+"' and t.good = 1 and t.isdel = 0 order by t.utime desc";
		List<Thread> list = find(hql, 0, size);
		return list;
	}
	
	
	
}
