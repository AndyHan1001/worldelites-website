package com.zq.worldelites.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 基础表--州信息
 * @author xx
 *
 */

@Entity
@Table(name = "t_geography")
public class Geography  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="geography_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "geography_ssid",length=8)
	private Integer ssid;			//让用户来看的流水号：地理ID
	
	@Column(name = "geography_mark")
	private String mark;			//公寓内部编号
	
	@Column(name = "geography_name")
	private String name;			//州名称

	@Column(name = "geography_parentid",length=8)
	private Integer parentid=0;		//州父级ID
	
	@Column(name = "geography_logo")
	private String logo;			//地理图片路径	
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "geography_memo")
	private String memo;			//摘要
	
	@Column(name = "geography_paixu",length=8)
	private Integer paixu = 0;			//地理排序
	
	@Column(name = "geography_isenable",length=8)
	private Integer isenable = 1;		//是否启用
	
	@Column(name = "geography_isdel",length=8)
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

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	
	
	
}
