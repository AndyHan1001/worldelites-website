package com.zq.worldelites.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

@Repository("baseDao")
public class BaseDao {
	@Resource
	private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	
	public List findBySql(Class entityClass,String sql){
		return this.hibernateTemplate.getSessionFactory().getCurrentSession().createSQLQuery(sql).addEntity(entityClass).list();
	}
	
	/**
	 * 根据主键id查询单条记录
	 * @param entityClass	Article.Class
	 * @param id
	 * @return
	 */
	public Object findById(Class entityClass,int id){
		return hibernateTemplate.get(entityClass, id);
	}
	
	/**
	 * 根据hql语句查询实体类的集合
	 * @param hql		from Article a where a.name like '%123%'
	 * @return
	 */
	public List find(String hql){
		return hibernateTemplate.find(hql);
	}
	/**
	 * 根据hql语句条件查询 
	 * @param hql	from User u where u.name like '%?%'
	 * @param objects	1234
	 * @return
	 */
	public List find(String hql,Object object){
		return hibernateTemplate.find(hql,object);
	}
	
	/**
	 *用途同上  区别在于  它可以有多个？的参数 
	 * @param hql	from User u where u.id = ? and u.name = ?
	 * @param objects   new Object[]{1,abcd}
	 * @return
	 */
	public List find(String hql,Object[] objects){
		return hibernateTemplate.find(hql, objects);
	}
	/**
	 * 根据hql语句的条件分页查询
	 * @param hql
	 * @param firstResult   从0开始
	 * @param maxResults
	 * @return
	 */
	public List find(String hql,int firstResult,int maxResults){
		  Session session = getHibernateTemplate().getSessionFactory().openSession();
		  Query q = session.createQuery(hql);
		  q.setFirstResult(firstResult);
		  q.setMaxResults(maxResults);
		  List list=q.list();
		  session.close();
		  return list;
	}
	
	/**
	 * 根据hql语句的条件查询数量   实例：select count(*) from User u where u.sex = 1
	 * @param hql
	 * @return
	 */
	public int getCount(String hql){
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		Object o = query.uniqueResult();
		session.close();
		if(o == null)
			return 0;
		return Integer.parseInt(o.toString());
	}
	
	/**
	 * 保存
	 * @param object
	 */
	public void save(Object object){
		this.hibernateTemplate.save(object);
	}
	
	/**
	 * 保存或修改  根据有没有主键id判断
	 * @param object
	 */
	public void saveOrUpdate(Object object){
		this.hibernateTemplate.saveOrUpdate(object);
	}
	
	/**
	 * 修改
	 * @param object
	 */
	public void update(Object object){
		this.hibernateTemplate.update(object);
	}
	
	/**
	 * 根据指定属性更新
	 * @param hql update User u set u.name = '2323' where id = ?
	 * @param object
	 * @return 执行数量
	 */
	public int bulkUpdate(String hql,Object object) {
		return hibernateTemplate.bulkUpdate(hql, object);
	}
	/**
	 * 根据指定属性更新
	 * @param hql	update User u set u.name = ? where id = ?
	 * @param objects
	 * @return 执行数量
	 */
	public int bulkUpdate(String hql,Object[] objects) {
		return hibernateTemplate.bulkUpdate(hql, objects);
	}
	
	/**
	 * 根据传入的实体类的id删除记录
	 * 注意:传入的实体类要set主键id
	 * @param object
	 */
	public void delete(Object object) {
		hibernateTemplate.delete(object);
	}
	
	/**
	 * 执行sql语句的方法，只能用于增，删，改的操作，不能用于查询
	 * @param sql	查询用的sql语句
	 * @return	返回执行成功的条数
	 */
	public int executeSql(String sql){
		Session session = null; 
		Transaction ts = null; 
		Connection conn = null; 
		PreparedStatement ps = null;
		
		session = this.hibernateTemplate.getSessionFactory().openSession(); 
		ts = session.beginTransaction(); 
		conn = session.connection(); 
		int result = 0;
		try {
			ps = conn.prepareStatement(sql);
			//ps.executeQuery();
			result = ps.executeUpdate();
			ts.commit();
		} catch (Exception e1) {
			ts.rollback();
			e1.printStackTrace();
		}finally{
				try {
					if(ps!=null){
						ps.close();
					}
					if(conn!=null){
						conn.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				if(session!=null){
					session.close();
				}
		} 
		
		return result;
	}
}
