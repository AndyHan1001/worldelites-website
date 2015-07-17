package com.zq.worldelites.service.web;

import java.util.List;

import org.springframework.stereotype.Service;

import util.Constants;
import util.StringUtil;

import com.zq.worldelites.model.Article;
import com.zq.worldelites.model.Menu;
import com.zq.worldelites.model.Thread;
import com.zq.worldelites.model.School;
import com.zq.worldelites.service.manage.CommonService;

@Service("bbsService")
public class BbsService extends CommonService{

	public List<School> getPageSchool(int pageIndex,int pageSize){
		String hql = " FROM School s WHERE s.isdel = 0 ";
		List<School> list = find(hql, (pageIndex-1) * pageSize, pageSize);
		return list;
		
	}
	
	public int getSchoolCount(){
		return getCount(" SELECT COUNT(*) FROM School s WHERE s.isdel = 0 ");
	}
	
	public int getPageIndex(String pageIndex,String act,int pageSize,int type,int universityid){
		int index = 1;
		if(StringUtil.isNullOrEmpty(pageIndex) || StringUtil.isNullOrEmpty(act))
			return index;
		else
			index = Integer.parseInt(pageIndex);
		
		if(act.equals(Constants.PAGE_PREV)){
			if(index > 1)
				index--;
		}else if(act.equals(Constants.PAGE_NEXT)){
			int count = 0;
			if(type == 1)
				count = getSchoolCount();
			else
				count = getThreadCount(universityid);
			int size = (index - 1) * pageSize;
			if(size < count)
				index++;
		}else{
			index = 1;
		}
		return index;
	}
	
	public List<School> getAllSchool(){
		List<School> list=find("from School s where s.isdel=0 and s.isenable=1");
		return list;
	}
	
	public List<Thread> getThread(int size){
		String hql = " FROM Thread t WHERE t.good = 1 or t.stick=1 and t.isdel = 0 and t.isenable = 1 and t.channel='"+Constants.BBS_TYPE_THREAD+"' ORDER BY t.utime DESC ";
		List<Thread> list = find(hql, 0, size);
		return list;
	}
	
	public List<Thread> getNotice(int size){
		String hql = " FROM Thread t WHERE t.isdel = 0 and t.isenable = 1 and t.channel='"+Constants.BBS_TYPE_NOTICE+"' ORDER BY t.utime DESC ";
		List<Thread> list = find(hql, 0, size);
		return list;
	}
	
	public List<Thread> getPageThread(int pageIndex,int pageSize,int universityid){
		String hql = " FROM Thread t WHERE t.channel='"+Constants.BBS_TYPE_THREAD+"' and t.typecode = " + universityid + " and t.isdel = 0 ORDER BY t.stick DESC,t.good DESC,t.id DESC ";
		List<Thread> list = find(hql, (pageIndex-1) * pageSize, pageSize);
		return list;
	}
	
	public int getThreadCount(int universityid){
		String hql = " SELECT COUNT(*) FROM Thread t WHERE t.channel='"+Constants.BBS_TYPE_THREAD+"' and t.typecode = " + universityid + " AND t.isdel = 0 ";
		return getCount(hql);
	}
	
	public List<Thread> getChannelThread(int size,int universityid){
		String hql = " FROM Thread t WHERE  t.channel='"+Constants.BBS_TYPE_THREAD+"' and t.typecode = " + universityid + " AND t.good = 1 and t.isdel = 0 ";
		List<Thread> list = find(hql, 0, size);
		return list;
	}
	
	public List<Thread> getChannelNotice(int size,int universityid){
		String hql = " FROM Thread t WHERE t.channel='"+Constants.BBS_TYPE_NOTICE+"' and  t.typecode = " + universityid + " AND t.isdel = 0 ORDER BY t.good DESC,t.id DESC ";
		List<Thread> list = find(hql, 0, size);
		return list;
	}
	
	public Integer getSchoolByThread(Integer bbsid){
		Thread thread=(Thread) findById(Thread.class, bbsid);
		
		return Integer.valueOf(thread.getTypecode());
	}
	
	public Thread getOneThread(Integer bbsid){
		Thread thread=(Thread) findById(Thread.class, bbsid);
		
		return thread;
	}
	
	public List<Thread> refreshThread(Integer start,Integer end,String type){
		List<Thread> list=find("from Thread t where t.isdel=0 and t.channel='"+type+"' and t.isenable=1 order by t.utime desc",start,end);
		return list;
	}
	
	public List<Article> getCommunityList(){
		List<Article> list=find("from Article a where a.isdel=8 and a.type=? order by a.visit desc",Constants.ARTICLE_COMMUNITY);
		return list;
	}
	
	//刷新攻略
	public List<Thread> refreshThread2(Integer start,Integer end,Integer schoolId){
		List<Thread> list=find("from Thread t where t.isdel=0 and t.channel='"+Constants.BBS_TYPE_THREAD+"' and t.isenable=1 and t.typecode="+schoolId,start,end);
		return list;
	}
	
	//刷新攻略bbs页面
	public List<Thread> refreshBbs(Integer start,Integer end,Integer schoolId,Integer tagId){
		if(tagId==null){
			if(schoolId==null){
				List<Thread> list=find("from Thread t where t.isdel=0 and t.channel='"+Constants.BBS_TYPE_THREAD+"' and t.isenable=1",start,end);			
				return list;
			}else{
				List<Thread> list=find("from Thread t where t.isdel=0 and t.channel='"+Constants.BBS_TYPE_THREAD+"' and t.isenable=1 and t.type="+schoolId,start,end);
				return list;
			}
		}else{
			if(schoolId==null){
				List<Thread> list=find("from Thread t where t.isdel=0 and t.channel='"+Constants.BBS_TYPE_THREAD+"' and t.keyword='"+tagId+"' and t.isenable=1",start,end);			
				return list;
			}else{
				List<Thread> list=find("from Thread t where t.isdel=0 and t.channel='"+Constants.BBS_TYPE_THREAD+"' and t.keyword='"+tagId+"' and t.isenable=1 and t.type="+schoolId,start,end);
				return list;
			}
		}
		
	}
	
	//得到社区的官方活动帖子
	public List<Thread> getThreadForCommunity(String type){
		String hql = " FROM Thread t WHERE t.isdel = 0 and t.isenable = 1 and t.channel='"+type+"' ORDER BY t.utime DESC ";
		List<Thread> list = find(hql);
		return list;
	}
	
	//得到附加的帖子标签
	public List<Menu> getAllThreadTag(){
		List<Menu> list=find("from Menu m where m.isenable=1 and m.isdel=0 and m.parentid=?",Constants.MENU_TYPE_THREAD);
		return list;
	}
	
	//从表中得到标签
	public Menu getThreadTagBuyId(Integer id){
		Menu menu=(Menu)findById(Menu.class, id);
		return menu;
	}
}
