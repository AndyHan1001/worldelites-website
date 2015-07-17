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
 * 回复表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_replay")
public class Replay  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="replay_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "replay_ssid",length=8)
	private Integer ssid;			//让用户来看的流水号：回复ID
	
	@Column(name = "replay_threadid",length=8)
	private Integer threadid;			//原帖ID
	
	@Column(name = "replay_threadtitle",length=255)
	private String threadtitle;			//原帖标题
	
	@Column(name = "replay_threadauthorid",length=8)
	private Integer threadauthorid;			//原帖作者ID
	
	@Column(name = "replay_threadauthorname",length=255)
	private String threadauthorname;			//原帖作者名称
	
	@Column(name = "replay_fromuserid",length=8)
	private Integer fromuserid;			//发起回复用户的id
	
	@Column(name = "replay_fromusername",length=255)
	private String fromusername;		//发起回复用户名称
	
	@Column(name = "replay_touserid",length=8)
	private Integer touserid;			//被回复用户的id
	
	@Column(name = "replay_tousername",length=255)
	private String tousername;			//被回复用户名称
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "relation_ctime")
	private Date ctime;				//创建时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "relation_utime")
	private Date utime;				//修改时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "relation_btime")
	private Date btime;				//开始时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "relation_etime")
	private Date etime;				//结束时间
	
	@Column(name = "replay_title",length=255)
	private String title;			//回复标题
	
	@Column(name = "replay_keyword",length=255)
	private String keyword;			//回复关键字
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "replay_note")
	private String note;			//回复备注
	
	@Column(name = "replay_source",length=255)
	private String source;			//回复来源
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "replay_memo")
	private String memo;			//摘要
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "replay_content")
	private String content;			//回复内容
	
	@Column(name = "replay_logo")
	private String logo;			//回复缩略图
	
	@Column(name = "replay_isenable",length=1)
	private Integer isenable;			//是否通过审核0否，1是
	
	@Column(name = "replay_stick",length=1)
	private Integer stick = 0;			//是否置顶 ：0否，1是
	
	@Column(name = "replay_visit",length=8)
	private Integer visit = 0;			//浏览量
	
	@Column(name = "replay_comment",length=8)
	private Integer comment = 0;		//回复数量
	
	@Column(name = "replay_isdel",length=1)
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

	public Integer getThreadid() {
		return threadid;
	}

	public void setThreadid(Integer threadid) {
		this.threadid = threadid;
	}



	public String getThreadtitle() {
		return threadtitle;
	}

	public void setThreadtitle(String threadtitle) {
		this.threadtitle = threadtitle;
	}

	public Integer getThreadauthorid() {
		return threadauthorid;
	}

	public void setThreadauthorid(Integer threadauthorid) {
		this.threadauthorid = threadauthorid;
	}

	public String getThreadauthorname() {
		return threadauthorname;
	}

	public void setThreadauthorname(String threadauthorname) {
		this.threadauthorname = threadauthorname;
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

	public Integer getTouserid() {
		return touserid;
	}

	public void setTouserid(Integer touserid) {
		this.touserid = touserid;
	}

	public String getTousername() {
		return tousername;
	}

	public void setTousername(String tousername) {
		this.tousername = tousername;
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
