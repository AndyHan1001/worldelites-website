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
 * 文章表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_article")
public class Article  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="article_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "article_ssid",length=8)
	private Integer ssid;			//让用户来看的流水号：文章ID
	
	@Column(name = "article_type",length=200)
	private String type;			//文章类型
	
	@Column(name = "article_typecode",length=8)
	private String typecode;		//类型Code
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "article_ctime")
	private Date ctime;				//创建时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "article_utime")
	private Date utime;				//修改时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "article_btime")
	private Date btime;				//开始时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "article_etime")
	private Date etime;				//结束时间
	
	@Column(name = "article_title")
	private String title;			//文章标题
	
	@Column(name = "article_title_cn")
	private String title_cn;			//文章标题
	
	@Column(name = "article_userid",length=8)
	private Integer userid;			//文章发布者ID
	
	@Column(name = "article_username")
	private String username;		//文章发布者名称
	
	@Column(name = "article_author")
	private String author;			//文章作者
	
	@Column(name = "article_keyword",length=255)
	private String keyword;			//文章关键字
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "article_note")
	private String note;			//文章备注
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "article_source")
	private String source;			//文章来源
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "article_memo")
	private String memo;			//文章摘要
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "article_content")
	private String content;			//文章内容
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "article_content_cn")
	private String content_cn;			//文章内容
	
	@Column(name = "article_logo")
	private String logo;			//文章缩略图-路径
	
	@Column(name = "article_isenable",length=1)
	private Integer isenable;		//文章是否通过审核
	
	@Column(name = "article_stick",length=1)
	private Integer stick;		//文章是否置顶
	
	@Column(name = "article_good",length=1)
	private Integer good;			//文章是否加精	1为加精  默认为0或空
	
	@Column(name = "article_visit",length=8)
	private Integer visit;			//文章浏览次数
	
	@Column(name = "article_comment",length=8)
	private Integer comment;		//文章评论数量
	
	@Column(name = "article_isdel",length=1,nullable=false)
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

	public Integer getGood() {
		return good;
	}

	public void setGood(Integer good) {
		this.good = good;
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

	public String getTitle_cn() {
		return title_cn;
	}

	public void setTitle_cn(String title_cn) {
		this.title_cn = title_cn;
	}

	public String getContent_cn() {
		return content_cn;
	}

	public void setContent_cn(String content_cn) {
		this.content_cn = content_cn;
	}
	
	
	
}
