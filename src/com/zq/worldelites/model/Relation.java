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
 * 关系表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_relation")
public class Relation implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="relation_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "relation_ssid",length=8)
	private Integer ssid;			//让用户来看的流水号：关系ID
	
	@Column(name = "relation_fromuserid",length=8)
	private Integer fromuserid;			//发出人ID
	
	@Column(name = "relation_fromusername",length=255)
	private String fromusername;			//发出人名称
	
	@Column(name = "relation_obttype",length=255)
	private String obttype;			//目标类型
	
	@Column(name = "relation_obtid",length=8)
	private Integer obtid;			//目标ID
	
	@Column(name = "relation_obtname",length=255)
	private String obtname;			//目标名称
	
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
	
	@Column(name = "relation_state",length=1)
	private Integer state = 0;			//状态
	
	@Column(name = "relation_isdel",length=1)
	private Integer isdel = 0;			//是否删除0否，1是

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

	public String getObttype() {
		return obttype;
	}

	public void setObttype(String obttype) {
		this.obttype = obttype;
	}

	public Integer getObtid() {
		return obtid;
	}

	public void setObtid(Integer obtid) {
		this.obtid = obtid;
	}

	public String getObtname() {
		return obtname;
	}

	public void setObtname(String obtname) {
		this.obtname = obtname;
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
