package com.zq.worldelites.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 栏目表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_menu")
public class Menu  implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="menu_id",length=8,unique=true,nullable=false)
	private Integer id;					//主键id 自动增长 
	
	@Column(name = "menu_ssid",length=8)
	private Integer ssid;				//让用户来看的流水号：文章ID

	@Column(name = "menu_name")
	private String name;				//栏目名称
	
	@Column(name = "munu_parentid",length=8)
	private Integer parentid;			//栏目父级ID
	
	@Column(name = "menu_url")
	private String url;					//栏目URL
	
	@Column(name = "menu_logo")
	private String logo;				//栏目缩略图
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "menu_memo")
	private String memo;				//栏目备注
	
	@Column(name = "munu_paixu",length=8)
	private Integer paixu=0;			//栏目排序
	
	@Column(name = "munu_isenable",length=1)
	private Integer isenable=1;			//栏目是否启用：0否，1是
	
	@Column(name = "munu_isdel",length=1)
	private Integer isdel = 0;			//栏目是否删除：0否，1是

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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
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
