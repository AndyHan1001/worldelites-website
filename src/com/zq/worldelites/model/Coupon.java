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
 * 优惠表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_coupon")
public class Coupon implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="coupon_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "coupon_userid",length=8)
	private Integer userid;			//买家用户的id
	
	@Column(name = "coupon_username")
	private String username;			//买家用户名称
	
	@Column(name = "coupon_userlastname")
	private String userlastname;			//买家
	
	@Column(name = "coupon_usermail")
	private String usermail;			//买家用户名称
	
	@Column(name = "coupon_apartmentid")
	private Integer apartmentid;			//商品ID
	
	@Column(name = "coupon_apartmentname")
	private String apartmentname;			//订单名称
	
	@Column(name = "coupon_schoolid")
	private Integer schoolid;			//学校ID
	
	@Column(name = "coupon_schoolname")
	private String schoolname;			//学校名称
	
	@Column(name = "coupon_usercountry")
	private String usercountry;			//国籍
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "coupon_ctime")
	private Date ctime;				//创建时间
	
	
	@Column(name = "coupon_price")
	private String price;			//实际价格
	
	@Column(name = "coupon_discountprice")
	private String discountprice;		//优惠价
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "coupon_memo")
	private String memo;		//摘要
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "coupon_content")
	private String content;			//订单内容
	
	@Column(name = "coupon_logo")
	private String logo;			//订单缩略图
	
	@Column(name = "coupon_file1")
	private String file1;			//订单附件1
	
	@Column(name = "coupon_file2")
	private String file2;			//订单附件2
	
	@Column(name = "coupon_knowweby")
	private String knowweby;			//知道我们通过
	
	@Column(name = "coupon_pm")
	private String pm;			//渠道
	
	@Column(name = "coupon_isdel",length=1)
	private Integer isdel = 0;			//是否删除：1是，0否

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Date getCtime() {
		return ctime;
	}

	public void setCtime(Date ctime) {
		this.ctime = ctime;
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

	public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}

	public String getFile2() {
		return file2;
	}

	public void setFile2(String file2) {
		this.file2 = file2;
	}

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
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

	public String getUsermail() {
		return usermail;
	}

	public void setUsermail(String usermail) {
		this.usermail = usermail;
	}

	public String getUserlastname() {
		return userlastname;
	}

	public void setUserlastname(String userlastname) {
		this.userlastname = userlastname;
	}

	public String getKnowweby() {
		return knowweby;
	}

	public void setKnowweby(String knowweby) {
		this.knowweby = knowweby;
	}

	public String getPm() {
		return pm;
	}

	public void setPm(String pm) {
		this.pm = pm;
	}

	public String getUsercountry() {
		return usercountry;
	}

	public void setUsercountry(String usercountry) {
		this.usercountry = usercountry;
	}

	
}
