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
 * 图片表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_picture")
public class Picture implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="picture_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "picture_ssid",length=8)
	private Integer ssid;			//让用户来看的流水号：图片ID
	
	@Column(name = "picture_channel",length=255)
	private String channel;			//所属主体
	
	@Column(name = "picture_parentid",length=8)
	private Integer parentid;		//所属主体ID
	
	@Column(name = "picture_type",length=255)
	private String type;			//图片类型
	
	@Column(name = "picture_typecode",length=8)
	private String typecode;			//类型代码
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "picture_ctime")
	private Date ctime;				//创建时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "picture_utime")
	private Date utime;				//修改时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "picture_btime")
	private Date btime;				//开始时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "picture_etime")
	private Date etime;				//结束时间	
	
	@Column(name = "picture_title",length=255)
	private String title;			//图片标题
	
	@Column(name = "picture_author",length=255)
	private String author;			//图片作者
	
	@Column(name = "picture_keyword",length=255)
	private String keyword;			//图片关键字
	
	@Column(name = "picture_source",length=255)
	private String source;			//图片来源
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "picture_note")
	private String note;			//图片附记
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "picture_memo")
	private String memo;			//图片摘要
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "picture_content")
	private String content;			//图片内容
	
	@Column(name = "picture_logo",length=255)
	private String logo;			//图片缩略图URL
	
	@Column(name = "picture_url",length=255)
	private String url;				//图片URL

	@Column(name = "picture_isenable",length=1)
	private Integer isenable;		//图片是否通过审核1：是0：否
	
	@Column(name = "picture_stick",length=1)
	private Integer stick = 0;		//图片是否置顶1：是0：否
	
	@Column(name = "picture_visit",length=8)
	private Integer visit = 0;		//图片浏览量
	
	@Column(name = "picture_comment",length=8)
	private Integer comment = 0;	//图片评论数量
	
	@Column(name = "picture_isdel",length=1)
	private Integer isdel = 0;		//图片是否删除：1是，0否

	
	
	
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

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
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
