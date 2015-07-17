package com.zq.worldelites.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 基础表--职业表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_industry")
public class Industry  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="industry_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "industry_ssid",length=8)
	private Integer ssid;			//让用户来看的流水号
	
	@Column(name = "industry_name",length=255)
	private String name;			//行业名称

	@Column(name = "industry_parentid",length=8)
	private Integer parentid;			//行业名称父级ID
	
	@Column(name = "industry_logo",length=255)
	private String logo;			//行业图片路径	
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "industry_memo")
	private String memo;			//摘要
	
	@Column(name = "industry_paixu",length=8)
	private Integer paixu;			//行业排序
	
	@Column(name = "industry_isenable",length=1)
	private Integer isenable;			//是否启用
	
	@Column(name = "industry_isdel",length=1)
	private Integer isdel = 0;			//是否删除：0否，1是

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSsid() {
		return ssid;
	}

	public void setSsid(Integer ssid) {
		this.ssid = ssid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getParentid() {
		return parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Integer getPaixu() {
		return paixu;
	}

	public void setPaixu(Integer paixu) {
		this.paixu = paixu;
	}

	public Integer getIsenable() {
		return isenable;
	}

	public void setIsenable(Integer isenable) {
		this.isenable = isenable;
	}

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}

	
	
}
