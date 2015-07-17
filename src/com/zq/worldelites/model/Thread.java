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
 * 帖子表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_thread")
public class Thread  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="thread_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "thread_ssid",length=8)
	private Integer ssid;			//让用户来看的流水号：帖子ID
	
	@Column(name = "thread_channel",length=255)
	private String channel;			//主体
	
	@Column(name = "thread_universityid",length=10)
	private Integer universityid;		//关联学校板块的id
	
	@Column(name = "thread_parentid",length=8)
	private Integer parentid;			//父级ID
	
	@Column(name = "thread_type",length=255)
	private String type;			//帖子类型
	
	@Column(name = "thread_typecode",length=8)
	private String typecode;			//类型代码
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "thread_ctime")
	private Date ctime;				//创建时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "thread_utime")
	private Date utime;				//修改时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "thread_btime")
	private Date btime;				//开始时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "thread_etime")
	private Date etime;				//结束时间
	
	@Column(name = "thread_title",length=255)
	private String title;			//帖子标题
	
	@Column(name = "thread_authorid",length=8)
	private Integer authorid;			//帖子作者ID
	
	@Column(name = "thread_authorname",length=255)
	private String authorname;			//帖子作者名称
	
	@Column(name = "thread_keyword",length=255)
	private String keyword;			//帖子关键字
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "thread_note")
	private String note;			//帖子备注
	
	@Column(name = "thread_source",length=255)
	private String source;			//帖子来源
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "thread_memo")
	private String memo;			//帖子摘要
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "thread_content")
	private String content;			//帖子内容
	
	@Column(name = "thread_logo",length=255)
	private String logo;			//帖子缩略图
	
	@Column(name = "thread_atlas",length=8)
	private Integer atlas;			//帖子图集ID
	
	@Column(name = "thread_isenable",length=1)
	private Integer isenable;			//帖子是否通过审核	0不通过  1通过
	
	@Column(name = "thread_stick",length=1)
	private Integer stick = 0;			//帖子是否置顶
	
	@Column(name = "thread_visit",length=8)
	private Integer visit = 0;			//帖子访问量
	
	@Column(name = "thread_good",length=1)
	private Integer good = 0;			//帖子是否加精	
	
	@Column(name = "thread_comment",length=8)
	private Integer comment = 0;			//帖子回复数量
	
	@Column(name = "thread_vote",length=8)
	private Integer vote = 0;			//帖子点赞数量
	
	@Column(name = "thread_replayuserid",length=8)
	private Integer replayuserid;			//帖子最后回复ID
	
	@Column(name = "thread_replayusername",length=50)
	private String replayusername;			//帖子最后回复用户
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "thread_replaytime")
	private Date replaytime;				//最后回复时间
	
	@Column(name = "thread_isdel",length=1)
	private Integer isdel = 0;			//帖子是否删除：0否

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

	public Integer getAuthorid() {
		return authorid;
	}

	public void setAuthorid(Integer authorid) {
		this.authorid = authorid;
	}

	public String getAuthorname() {
		return authorname;
	}

	public void setAuthorname(String authorname) {
		this.authorname = authorname;
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
	

	public Integer getUniversityid() {
		return universityid;
	}

	public void setUniversityid(Integer universityid) {
		this.universityid = universityid;
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

	public Integer getAtlas() {
		return atlas;
	}

	public void setAtlas(Integer atlas) {
		this.atlas = atlas;
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

	public Integer getGood() {
		return good;
	}

	public void setGood(Integer good) {
		this.good = good;
	}

	public Integer getComment() {
		return comment;
	}

	public void setComment(Integer comment) {
		this.comment = comment;
	}

	public Integer getVote() {
		return vote;
	}

	public void setVote(Integer vote) {
		this.vote = vote;
	}

	public Integer getReplayuserid() {
		return replayuserid;
	}

	public void setReplayuserid(Integer replayuserid) {
		this.replayuserid = replayuserid;
	}

	public String getReplayusername() {
		return replayusername;
	}

	public void setReplayusername(String replayusername) {
		this.replayusername = replayusername;
	}

	public Date getReplaytime() {
		return replaytime;
	}

	public void setReplaytime(Date replaytime) {
		this.replaytime = replaytime;
	}

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}
	
	
	
	
	
}
