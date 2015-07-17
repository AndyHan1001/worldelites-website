package com.zq.worldelites.service.manage;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.zq.worldelites.model.Others;

import util.StringUtil;

public class CommonService  extends BaseService {
	@Resource
	private UserService userService;
	
	public int getMaxId(String entityName){
		String hql = "select max(id) from "+entityName;
		return getCount(hql);
	}
	
	public int getMaxSsid(String entityName){
		if(StringUtil.isNullOrEmpty(entityName))
			return 0;
		String hql = "select max(ssid) from "+entityName;
		return getCount(hql);
	}
	
	@Transactional
	public int delete(String entityName,int id){
		return bulkUpdate("update "+entityName+" set isdel = 1 where id = ?", id);
	}
	
	public Object getById(String entityName,int id){
		List list = find("from "+entityName+" where id = ? and isdel != 1", id);
		if(list != null && list.size() > 0)
			return list.get(0);
		else
			return null;
	}
	
	//搜索系统
	public List searchSystem(String table,String searchType,String searchKeyWord){
		List list=find("from "+table+" t where t.isdel=0 and t."+searchType+" like '%"+searchKeyWord+"%'");
		
		return list;
	}
	
	/**
	 * 获取邮件模板
	 * @param type
	 * @return
	 */
	public String getMailTemplate(String type){
		List<Others> list=find("from Others o where o.type='"+type+"'");
		if(list!=null&&list.size()>0){
			return list.get(0).getContent();
		}
		return null;
	}
	
	
	

	
}
