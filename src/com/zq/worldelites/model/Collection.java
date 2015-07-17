package com.zq.worldelites.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 用户收藏表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_collection")
public class Collection implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="collection_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "collection_userid",length=8)
	private Integer userid;			//用户ID
	
	@Column(name = "collection_username")
	private String username;			//用户名
	
	@Column(name = "collection_productid",length=8)
	private Integer productid;		//商品(房间的ID)
	
	@Column(name = "collection_productname")
	private String productname;			//商品名
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "collection_memo")
	private String memo;			//附录
	
	@Column(name = "collection_isdel",length=1)
	private Integer isdel = 0;		//是否删除   0否  1是 

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getProductid() {
		return productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}
	
	
}
