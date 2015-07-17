package com.zq.worldelites.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 基础表--学校
 * @author xx
 *
 */

@Entity
@Table(name = "t_school")
public class School  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="school_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "school_ssid",length=8)
	private Integer ssid;			//让用户来看的流水号：地理ID
	
	@Column(name = "school_mark")
	private String mark;			//公寓内部编号
	
	@Column(name = "school_name",length=255)
	private String name;			//学校名称
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "school_info")
	private String info;			//学校介绍

	@org.hibernate.annotations.Type(type="text")
	@Column(name = "school_info_cn")
	private String info_cn;			//学校介绍 cn
	
	@Column(name = "school_parentid",length=8)
	private Integer parentid;			//学校所在州ID
	
	@Column(name = "school_parentname",length=32)
	private String parentname;			//学校所在州
	
	@Column(name = "school_logo",length=255)
	private String logo;			//地理图片路径
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "school_atlas")
	private String atlas;			//地理学校图集路径串
	
	@Column(name = "school_location",length=255)
	private String location;			//地理学校经纬
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "school_memo")
	private String memo;			//摘要
	
	@Column(name = "school_sort",length=8)
	private Integer sort;			//地理排序
	
	@Column(name = "school_isenable",length=1)
	private Integer isenable=1;			//是否启用
	
	@Column(name = "school_isdel",length=1)
	private Integer isdel = 0;			//是否删除：0否，1是

	
	@Column(name = "school_meta_title",length=512)
	private String meta_title;			
	
	@Column(name = "school_meta_description",length=512)
	private String meta_description;		
	
	@Column(name = "school_meta_keywords",length=512)
	private String meta_keywords;		
	
	
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

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Integer getParentid() {
		return parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

	public String getParentname() {
		return parentname;
	}

	public void setParentname(String parentname) {
		this.parentname = parentname;
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



	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAtlas() {
		return atlas;
	}

	public void setAtlas(String atlas) {
		this.atlas = atlas;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
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

	public String getInfo_cn() {
		return info_cn;
	}

	public void setInfo_cn(String info_cn) {
		this.info_cn = info_cn;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public String getMeta_title() {
		return meta_title;
	}

	public void setMeta_title(String meta_title) {
		this.meta_title = meta_title;
	}

	public String getMeta_description() {
		return meta_description;
	}

	public void setMeta_description(String meta_description) {
		this.meta_description = meta_description;
	}

	public String getMeta_keywords() {
		return meta_keywords;
	}

	public void setMeta_keywords(String meta_keywords) {
		this.meta_keywords = meta_keywords;
	}
	
	
	
}
