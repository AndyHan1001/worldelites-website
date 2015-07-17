package com.zq.worldelites.service.manage;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zq.worldelites.dao.BaseDao;


@Service("baseService")
public class BaseService {

	@Resource
	private BaseDao baseDao;
	
	/**
	 * 根据主键id查询单条记录
	 * @param entityClass
	 * @param id
	 * @return
	 */
	public Object findById(Class entityClass,int id){
		return baseDao.findById(entityClass, id);
	}
	public List find(String hql){
		return baseDao.find(hql);
	}
	/**
	 * 根据hql语句条件查询 from User
	 * @param hql
	 * @param objects
	 * @return
	 */
	public List find(String hql,Object object){
		return baseDao.find(hql,object);
	}
	public List find(String hql,Object[] objects){
		return baseDao.find(hql, objects);
	}
	
	/**
	 * 根据hql语句的条件分页查询
	 * @param hql
	 * @param firstResult   从0开始
	 * @param maxResults	一共多少条
	 * @return
	 */
	public List find(String hql,int firstResult,int maxResults){
		  return this.baseDao.find(hql, firstResult, maxResults);
	}
	
	
	/**
	 * 
	 * @param entityName
	 * @param swhere	
	 * @param pageNo	1开始
	 * @param pageSize
	 * @return
	 */
	public HashMap getPageList(String entityName,String swhere,int pageNo, int pageSize) {              
		
		if(swhere == null)
			swhere = "";
		
		String countHql = "select count(*) from " + entityName +" "+ swhere;
		String hql = "from "+entityName+swhere;
		                                                                                                            
		List list =  this.baseDao.find(hql, (pageNo-1)*pageSize, pageSize);
		int total = baseDao.getCount(countHql); 
		
		HashMap hm = new HashMap();
		hm.put("rows", list);
		hm.put("total", total);
		return hm;
		                                                                                                            
	}
	
	public int getCount(String hql){
		return baseDao.getCount(hql);
	}
	
	
	/**
	 * 保存
	 * @param object
	 */
	public void save(Object object){
		this.baseDao.save(object);
	}
	
	/**
	 * 保存或修改  根据有没有主键id判断
	 * @param object
	 */
	public void saveOrUpdate(Object object){
		this.baseDao.saveOrUpdate(object);
	}
	
	/**
	 * 修改
	 * @param object
	 */
	public void update(Object object){
		this.baseDao.update(object);
	}
	
	/**
	 * 根据指定属性更新
	 * @param hql update User u set u.name = ? where id = ?
	 * @param object
	 * @return 执行数量
	 */
	public int bulkUpdate(String hql,Object object) {
		return baseDao.bulkUpdate(hql, object);
	}
	/**
	 * 根据指定属性更新
	 * @param hql
	 * @param objects
	 * @return 执行数量
	 */
	public int bulkUpdate(String hql,Object[] objects) {
		return baseDao.bulkUpdate(hql, objects);
	}
	
	
	/**
	 * 根据传入的实体类的id删除记录
	 * 注意:传入的实体类要set主键id
	 * @param object
	 */
	public void delete(Object object) {
		this.baseDao.delete(object);
	}
	
}
