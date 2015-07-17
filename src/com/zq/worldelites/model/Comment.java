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
 * 评论表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_comment")
public class Comment implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="comment_id",length=8,unique=true,nullable=false)
	private Integer id;					//主键id 自动增长 
	
	@Column(name = "comment_ssid",length=8)
	private Integer ssid;				//让用户来看的流水号：评论ID
	
	@Column(name = "comment_channel",length=8)
	private Integer channel;			//评论主体
	
	@Column(name = "comment_parentid",length=8)
	private Integer parentid;			//评论主体ID
	
	@Column(name = "comment_fromuserid",length=8)
	private Integer fromuserid;			//发起评论用户的id
	
	@Column(name = "comment_fromusername",length=255)
	private String fromusername;		//发起评论用户名称
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "comment_ctime")
	private Date ctime;				//创建时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "comment_utime")
	private Date utime;				//修改时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "comment_btime")
	private Date btime;				//开始时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "comment_etime")
	private Date etime;				//结束时间
	
	@Column(name = "comment_title",length=255)
	private String title;			//评论标题
	
	@Column(name = "comment_keyword",length=255)
	private String keyword;			//评论关键字
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "comment_note")
	private String note;			//附记
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "comment_source")
	private String source;			//评论来源
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "comment_memo")
	private String memo;			//摘要
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "comment_content")
	private String content;			//评论内容
	
	@Column(name = "comment_logo",length=255)
	private String logo;			//评论缩略图
	
	@Column(name = "comment_isenable",length=1)
	private Integer isenable = 0;	//是否通过审核
	
	@Column(name = "comment_stick",length=1)
	private Integer stick = 0;			//是否置顶
	
	@Column(name = "comment_visit",length=8)
	private Integer visit;			//评论浏览数量
	
	@Column(name = "comment_isdel",length=1)
	private Integer isdel = 0;			//是否删除：1：删除0：不删

	
	
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

	public Integer getChannel() {
		return channel;
	}

	public void setChannel(Integer channel) {
		this.channel = channel;
	}

	public Integer getParentid() {
		return parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

	public Integer getFromuserid() {
		return fromuserid;
	}

	public void setFromuserid(Integer fromuserid) {
		this.fromuserid = fromuserid;
	}

	public String getFromusername() {
		return fromusername;
	}

	public void setFromusername(String fromusername) {
		this.fromusername = fromusername;
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

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}
	
	
	
}
