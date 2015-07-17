package com.zq.worldelites.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * 图集表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_atlas")
public class Atlas implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="atlas_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "atlas_ssid",length=8)
	private Integer ssid;			//让用户来看的流水号：图集ID
	
	@Column(name = "atlas_channel",length=255)
	private String channel;			//图集所属主体
	
	@Column(name = "atlas_parentid",length=8)
	private Integer parentid;		//图集所属主体ID
	
	@Column(name = "atlas_type",length=255)
	private String type;			//图集类型
	
	@Column(name = "atlas_typecode",length=8)
	private String typecode;		//图集类型代码
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "atlas_ctime")
	private Date ctime;				//创建时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "atlas_utime")
	private Date utime;				//修改时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "atlas_btime")
	private Date btime;				//开始时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "atlas_etime")
	private Date etime;				//结束时间
	
	@Column(name = "atlas_title",length=255)
	private String title;			//图集标题
	
	@Column(name = "atlas_author",length=255)
	private String author;			//图集发布者
	
	@Column(name = "atlas_keyword",length=255)
	private String keyword;			//图集关键字
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "atlas_note")
	private String note;			//图集附记
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "atlas_source")
	private String source;			//图集来源
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "atlas_memo")
	private String memo;			//图集摘要
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "atlas_content")
	private String content;			//图集内容
	
	@Column(name = "atlas_logo")
	private String logo;			//图集缩略图
	
	@Column(name = "atlas_isenable",length=1)
	private Integer isenable;		//图集是否通过审核
	
	@Column(name = "atlas_stick",length=1)
	private Integer stick = 0;		//图集是否置顶
	
	@Column(name = "atlas_visit",length=8)
	private Integer visit = 0;		//图集浏览次数
	
	@Column(name = "atlas_comment",length=8)
	private Integer comment = 0;	//图集评论数量
	
	@Column(name = "atlas_isdel",length=1)
	private Integer isdel = 0;			//是否删除   0否  1是 

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

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public Integer getParentid() {
		return parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTypecode() {
		return typecode;
	}

	public void setTypecode(String typecode) {
		this.typecode = typecode;
	}

	public Date getCtime() {
		return ctime;
	}

	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}

	public Date getUtime() {
		return utime;
	}

	public void setUtime(Date utime) {
		this.utime = utime;
	}

	public Date getBtime() {
		return btime;
	}

	public void setBtime(Date btime) {
		this.btime = btime;
	}

	public Date getEtime() {
		return etime;
	}

	public void setEtime(Date etime) {
		this.etime = etime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public Integer getIsenable() {
		return isenable;
	}

	public void setIsenable(Integer isenable) {
		this.isenable = isenable;
	}

	public Integer getStick() {
		return stick;
	}

	public void setStick(Integer stick) {
		this.stick = stick;
	}

	public Integer getVisit() {
		return visit;
	}

	public void setVisit(Integer visit) {
		this.visit = visit;
	}

	public Integer getComment() {
		return comment;
	}

	public void setComment(Integer comment) {
		this.comment = comment;
	}

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}

	
}
