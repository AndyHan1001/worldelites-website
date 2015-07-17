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
 * 日志表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_log")
public class Log  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="log_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "log_ssid",length=8)
	private Integer ssid;			//让用户来看的流水号：日志ID
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "log_ctime")
	private Date ctime;				//创建时间

	@Column(name = "log_fromuserid",length=8)
	private Integer fromuserid;			//行为人ID
	
	@Column(name = "log_fromusername",length=255)
	private String fromusername;			//行为人名称
	
	@Column(name = "log_obttype",length=255)
	private String obttype;			//目标类型
	
	@Column(name = "log_obtid",length=8)
	private Integer obtid;			//行为目标ID
	
	@Column(name = "log_obtname",length=255)
	private String obtname;			//行为目标名称
	
	@Column(name = "log_action",length=50)
	private String action;			//行为：审核通过、新发布、修改、删除、评论、回复、点赞、浏览
	
	@Column(name = "log_value",length=8)
	private Integer value;			//行为值
	
	@Column(name = "log_result",length=255)
	private String result;			//行为结果
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "log_memo")
	private String memo;			//行为结果描述
	
	@Column(name = "log_isdel",length=1)
	private Integer isdel = 0;			//是否删除：1是，0否

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

	public Date getCtime() {
		return ctime;
	}

	public void setCtime(Date ctime) {
		this.ctime = ctime;
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

	public void setObtid(Integer obid) {
		this.obtid = obid;
	}

	public String getObtname() {
		return obtname;
	}

	public void setObtname(String obname) {
		this.obtname = obname;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}
	
	
	
}
