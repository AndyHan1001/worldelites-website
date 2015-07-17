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

import org.hibernate.annotations.Type;

/**
 * 基础表--公寓房间表
 * @author xx
 *
 */

@Entity
@Table(name = "t_room")
public class Room  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="room_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "room_ssid",length=8)
	private Integer ssid;			//让用户来看的流水号：地理ID
	
	@Column(name = "room_mark")
	private String mark;			//公寓内部编号
	
	@Column(name = "room_name")
	private String name;			//房间名称
	
	@Column(name = "room_area")
	private String area;			//房间面积
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "room_info")
	private String info;			//房间描述
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "room_info_cn")
	private String info_cn;			//房间描述
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "user_entertime")
	private Date entertime;			//入住时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "user_endtime")
	private Date endtime;			//截止时间
	
	@Column(name = "room_enterlong")
	private String enterlong;		//入住期长
	
	@Column(name = "room_enterlong_cn")
	private String enterlong_cn;		//入住期长
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "user_outtime")
	private Date outtime;			//搬出时间
	
	@Column(name = "room_price")
	private String price;			//房间租金
	
	@Column(name = "room_discountprice")
	private String discountprice;			//we折扣
	
	@Type(type="text")
	@Column(name = "room_discountmethod")
	private String discountmethod;	//we优惠项目
	
	@Type(type="text")
	@Column(name = "room_discountmethod_cn")
	private String discountmethod_cn;	//we优惠项目
	
	@Type(type="text")
	@Column(name = "room_discount")
	private String discount;	//we折扣及优惠
	
	@Type(type="text")
	@Column(name = "room_discount_cn")
	private String discount_cn;	//we折扣及优惠
	
	@Column(name = "room_deposit")
	private String deposit;			//上级的公寓名称
	
	@Column(name = "room_parentid",length=8)
	private Integer parentid;			//上级的公寓ID
	
	@Column(name = "room_parentname")
	private String parentname;			//上级的公寓名称
	
	@Column(name = "room_logo",length=255)
	private String logo;			//地理图片路径	
	
	@Column(name = "room_expand1")
	private String expand1;			//扩展1
	
	@Column(name = "room_expand2")
	private String expand2;			//扩展2
	
	@Column(name = "room_sort",length=8)
	private Integer sort = 0;			//房间排序
	
	@Column(name = "room_state",length=1)
	private Integer state=1;			//是否被预订
	
	@Column(name = "room_isbook",length=1)
	private Integer isbook = 1;			//是否可预订
	
	@Column(name = "room_iscoupon",length=1)
	private Integer iscoupon = 1;			//是否可得到优惠券
	
	@Column(name = "room_isdel",length=1)
	private Integer isdel = 0;			//是否删除：0否，1是

	
	public Integer getIsbook() {
		return isbook;
	}

	public void setIsbook(Integer isbook) {
		this.isbook = isbook;
	}

	public Integer getIscoupon() {
		return iscoupon;
	}

	public void setIscoupon(Integer iscoupon) {
		this.iscoupon = iscoupon;
	}

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Date getEntertime() {
		return entertime;
	}

	public void setEntertime(Date entertime) {
		this.entertime = entertime;
	}

	public String getEnterlong() {
		return enterlong;
	}

	public void setEnterlong(String enterlong) {
		this.enterlong = enterlong;
	}

	public Date getOuttime() {
		return outtime;
	}

	public void setOuttime(Date outtime) {
		this.outtime = outtime;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDiscountprice() {
		return discountprice;
	}

	public void setDiscountprice(String discountprice) {
		this.discountprice = discountprice;
	}

	public String getDiscountmethod() {
		return discountmethod;
	}

	public void setDiscountmethod(String discountmethod) {
		this.discountmethod = discountmethod;
	}

	public Integer getParentid() {
		return parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

	public String getParentname() {
		return parentname;
	}

	public void setParentname(String parentname) {
		this.parentname = parentname;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getExpand1() {
		return expand1;
	}

	public void setExpand1(String expand1) {
		this.expand1 = expand1;
	}

	public String getExpand2() {
		return expand2;
	}

	public void setExpand2(String expand2) {
		this.expand2 = expand2;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
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

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public String getInfo_cn() {
		return info_cn;
	}

	public void setInfo_cn(String info_cn) {
		this.info_cn = info_cn;
	}

	public String getEnterlong_cn() {
		return enterlong_cn;
	}

	public void setEnterlong_cn(String enterlong_cn) {
		this.enterlong_cn = enterlong_cn;
	}

	public String getDiscountmethod_cn() {
		return discountmethod_cn;
	}

	public void setDiscountmethod_cn(String discountmethod_cn) {
		this.discountmethod_cn = discountmethod_cn;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public String getDiscount_cn() {
		return discount_cn;
	}

	public void setDiscount_cn(String discount_cn) {
		this.discount_cn = discount_cn;
	}

	public String getDeposit() {
		return deposit;
	}

	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}

	
}
