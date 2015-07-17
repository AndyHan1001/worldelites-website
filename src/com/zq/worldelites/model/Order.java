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
 * 订单表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_order")
public class Order implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="order_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "order_orderid")
	private String orderid;			//订单ID	
	
	@Column(name = "order_type")
	private String type;			//订单类型
	
	@Column(name = "order_logo")
	private String logo;			//商品缩略图
	
	@Column(name = "order_roomid")
	private Integer roomid;			//房间ID
	
	@Column(name = "order_roomname")
	private String roomname;		//房间名称
	
	@Column(name = "order_schoolid")
	private Integer schoolid;			//大学ID
	
	@Column(name = "order_schoolname")
	private String schoolname;			//大学名称
	
	@Column(name = "order_apartmentid")
	private Integer apartmentid;		//公寓ID
	
	@Column(name = "order_apartmentname")
	private String apartmentname;		//公寓名称
	
	@Column(name = "order_userid",length=8)
	private Integer userid;			//买家用户-id
	
	@Column(name = "order_userlastname")
	private String userlastname;	//买家用户-姓
	
	@Column(name = "order_username")
	private String username;		//买家用户-名

	@Column(name = "order_userpassportno")
	private String userpassportno;		//买家用户-护照
	
	@Column(name = "order_userphone")
	private String userphone;		//买家用户-电话
	
	@Column(name = "order_usermail")
	private String usermail;		//买家用户-邮箱
	
	@Column(name = "order_price")
	private String price;		//价格结算
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "order_pricenote")
	private String pricenote;		//价格详情列表
	
	@Column(name = "order_title")
	private String title;			//订单邮件标题
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "order_content")
	private String content;			//订单邮件内容
	
	@Column(name = "order_entertime")
	private String entertime;		//入住时间
	
	@Column(name = "order_leavetime")
	private String leavetime;		//搬出时间
	
	@Column(name = "order_endtime")
	private String endtime;			//签约截止日期
	
	@Column(name = "order_submittime")
	private String submittime;		//提交待定时间
	
	@Column(name = "order_confirmtime")
	private String confirmtime;		//提交订单确认时间
	
	@Column(name = "order_signtime")
	private String signtime;		//签订租约日期
	
	@Column(name = "order_paytime")
	private String paytime;		//在线支付日期
	
	@Column(name = "order_finishtime")
	private String finishtime;		//待定成功日期
	
	@Column(name = "order_state")
	private String state;		//状态
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "order_statenote")
	private String statenote;		//状态描述
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "order_mailcontent")
	private String mailcontent;		//邮件内容
	
	@Column(name = "order_isPay")
	private String isPay= "no";			//是否已经支付
	
	@Column(name = "order_isdel")
	private Integer isdel = 0;			//是否删除：1是，0否

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public Integer getRoomid() {
		return roomid;
	}

	public void setRoomid(Integer roomid) {
		this.roomid = roomid;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public Integer getSchoolid() {
		return schoolid;
	}

	public void setSchoolid(Integer schoolid) {
		this.schoolid = schoolid;
	}

	public String getSchoolname() {
		return schoolname;
	}

	public void setSchoolname(String schoolname) {
		this.schoolname = schoolname;
	}

	public Integer getApartmentid() {
		return apartmentid;
	}

	public void setApartmentid(Integer apartmentid) {
		this.apartmentid = apartmentid;
	}

	public String getApartmentname() {
		return apartmentname;
	}

	public void setApartmentname(String apartmentname) {
		this.apartmentname = apartmentname;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getUserlastname() {
		return userlastname;
	}

	public void setUserlastname(String userlastname) {
		this.userlastname = userlastname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpassportno() {
		return userpassportno;
	}

	public void setUserpassportno(String userpassportno) {
		this.userpassportno = userpassportno;
	}

	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	public String getUsermail() {
		return usermail;
	}

	public void setUsermail(String usermail) {
		this.usermail = usermail;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPricenote() {
		return pricenote;
	}

	public void setPricenote(String pricenote) {
		this.pricenote = pricenote;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEntertime() {
		return entertime;
	}

	public void setEntertime(String entertime) {
		this.entertime = entertime;
	}

	public String getLeavetime() {
		return leavetime;
	}

	public void setLeavetime(String leavetime) {
		this.leavetime = leavetime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getSubmittime() {
		return submittime;
	}

	public void setSubmittime(String submittime) {
		this.submittime = submittime;
	}

	public String getConfirmtime() {
		return confirmtime;
	}

	public void setConfirmtime(String confirmtime) {
		this.confirmtime = confirmtime;
	}

	public String getSigntime() {
		return signtime;
	}

	public void setSigntime(String signtime) {
		this.signtime = signtime;
	}

	public String getPaytime() {
		return paytime;
	}

	public void setPaytime(String paytime) {
		this.paytime = paytime;
	}

	public String getFinishtime() {
		return finishtime;
	}

	public void setFinishtime(String finishtime) {
		this.finishtime = finishtime;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getStatenote() {
		return statenote;
	}

	public void setStatenote(String statenote) {
		this.statenote = statenote;
	}

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}

	public String getMailcontent() {
		return mailcontent;
	}

	public void setMailcontent(String mailcontent) {
		this.mailcontent = mailcontent;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getIsPay() {
		return isPay;
	}

	public void setIsPay(String isPay) {
		this.isPay = isPay;
	}
	
}
