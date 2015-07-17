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
 * 支付表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_pay")
public class Pay implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="pay_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "pay_ssid",length=8)
	private Integer ssid;			//让用户来看的流水号：支付ID
	
	@Column(name = "pay_mdid",length=20)
	private String mdid;			//支付-用户-标记
	
	@Column(name = "pay_userid",length=8)
	private Integer userid;			//买家用户的id
	
	@Column(name = "pay_username",length=32)
	private String username;		//买家用户的名称
	
	@Column(name = "pay_ordermdid",length=32)
	private String ordermdid;		//支付用户的订单的MDID
	
	@Column(name = "pay_ordermemo",length=255)
	private String ordermemo;		//支付对应的订单摘要

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "pay_ctime")
	private Date ctime=new Date();				//创建时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "pay_utime")
	private Date utime=new Date();				//修改时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "pay_btime")
	private Date btime=new Date();				//开始时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "pay_etime")
	private Date etime=new Date();				//结束时间
	
	@Column(name = "pay_interface")
	private String payInterface;	//---支付接口
	
	@Column(name = "pay_need",length=8)
	private Integer need;			//支付应付金额
	
	@Column(name = "pay_money",length=8)
	private Integer money;			//支付实付金额
	
	@Column(name = "pay_state",length=1)
	private Integer state;			//支付状态0，不成功1成功
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "pay_note")
	private String note;			//附记
	
	@Column(name = "pay_isdel",length=1)
	private Integer isdel = 0;			//是否删除：0，否1是

	
	
	
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

	public String getMdid() {
		return mdid;
	}

	public void setMdid(String mdid) {
		this.mdid = mdid;
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

	public String getOrdermdid() {
		return ordermdid;
	}

	public void setOrdermdid(String ordermdid) {
		this.ordermdid = ordermdid;
	}

	public String getOrdermemo() {
		return ordermemo;
	}

	public void setOrdermemo(String ordermemo) {
		this.ordermemo = ordermemo;
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

	public String getPayInterface() {
		return payInterface;
	}

	public void setPayInterface(String payInterface) {
		this.payInterface = payInterface;
	}

	public Integer getNeed() {
		return need;
	}

	public void setNeed(Integer need) {
		this.need = need;
	}

	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}
	
	
	
	
	
}
