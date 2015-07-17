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
 * 信息表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_message")
public class Message implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="message_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "message_ssid",length=8)
	private Integer ssid;			//让用户来看的流水号：消息ID
	
	@Column(name = "message_fromuserid",length=8)
	private Integer fromuserid;			//来自哪个用户：ID
	
	@Column(name = "message_fromusername",length=50)
	private String fromusername;			//来自哪个用户：名称
	
	@Column(name = "message_touserid",length=8)
	private Integer touserid;			//发至哪个用户：ID
	
	@Column(name = "message_tousername",length=50)
	private String tousername;			//发至哪个用户：名称
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "message_content")
	private String content;			//具体消息内容
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "message_ctime")
	private Date ctime;				//消息创建时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "message_utime")
	private Date utime;				//消息修改时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "message_btime")
	private Date btime;				//消息开始时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "message_etime")
	private Date etime;				//消息结束时间
	
	@Column(name = "message_state",length=1)
	private Integer state;			//消息状态：0未读
	
	@Column(name = "message_isdel",length=1)
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}
	
	

}
