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
 * 小组表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_group")
public class Group  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="group_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "group_ssid",length=8)
	private Integer ssid;			//让用户来看的流水号:群组ID
	
	@Column(name = "group_channel",length=255)
	private String channel;			//群组主体
	
	@Column(name = "group_parentid",length=8)
	private Integer parentid;			//群组父级ID
	
	@Column(name = "group_type",length=200)
	private String type;			//群组类型
	
	@Column(name = "group_typecode",length=8)
	private String typecode;			//群组类型代码
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "group_ctime")
	private Date ctime;				//创建时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "group_utime")
	private Date utime;				//修改时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "group_btime")
	private Date btime;				//开始时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "group_etime")
	private Date etime;				//结束时间

	@Column(name = "group_title",length=255)
	private String title;			//群组标题
	
	@Column(name = "group_userid",length=8)
	private Integer userid;			//群组作者ID
	
	@Column(name = "group_username",length=255)
	private String username;			//群组作者名称
	
	@Column(name = "group_keyword",length=255)
	private String keyword;			//群组关键字
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "group_note")
	private String note;			//群组备注，附记
	
	@Column(name = "group_source",length=255)
	private String source;			//群组来源
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "group_memo")
	private String memo;			//群组摘要
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "group_content")
	private String content;			//群组内容
	
	@Column(name = "group_logo",length=255)
	private String logo;			//群组缩略图
	
	@Column(name = "group_atlas",length=8)
	private Integer atlas;			//群组图集ID
	
	@Column(name = "group_isenable",length=1)
	private Integer isenable = 0;	//是否通过审核
	
	@Column(name = "group_stick",length=1)
	private Integer stick;			//是否置顶
	
	@Column(name = "group_good",length=1)
	private Integer good = 0;		//是否加精
	
	@Column(name = "group_visit",length=8)
	private Integer visit = 0;			//浏览次数
	
	@Column(name = "group_comment",length=8)
	private Integer comment = 0;		//群组数量
	
	@Column(name = "group_isdel",length=1)
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
	
	
	
}
