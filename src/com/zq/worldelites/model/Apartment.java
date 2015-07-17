package com.zq.worldelites.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 基础表--公寓表
 * @author xx
 *
 */

@Entity
@Table(name = "t_apartment")
public class Apartment  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="apartment_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "apartment_ssid",length=8)
	private Integer ssid;			//让用户来看的流水号：公寓ID
	
	@Column(name = "apartment_mark")
	private String mark;			//公寓内部编号
	
	@Column(name = "apartment_name")
	private String name;			//公寓名称
	
	@Column(name = "apartment_nameabb")
	private String nameabb;			//公寓名称缩写
	
	@Column(name = "apartment_corporation")
	private String corporation;		//房产公司
	
	@Column(name = "apartment_csname")
	private String csname;			//客服经理
	
	@Column(name = "apartment_csmail")
	private String csmail;			//客服经理邮箱
	
	@Column(name = "apartment_mail")
	private String mail;			//公寓经理邮箱
	
	@Column(name = "apartment_tel")
	private String tel;			//公寓联系电话
	
	@Column(name = "apartment_fax")
	private String fax;			//公寓联系传真
	
	@Column(name = "apartment_worktime")
	private String worktime;			//公寓办公时间
	
	@Column(name = "apartment_worktime_cn")
	private String worktime_cn;			//公寓办公时间
	
	@Column(name = "apartment_discount")
	private String discount;		//公寓供折扣
	
	@Column(name = "apartment_discounttype")
	private String discounttype;		//公寓提供折扣类型
	
	@Column(name = "apartment_discounttype_back")
	private Double discounttype_back;		//公寓提供折扣类型-数值
	
	@Column(name = "apartment_discount_cn")
	private String discount_cn;		//公寓供折扣
	
	@Column(name = "apartment_discounttype_cn")
	private String discounttype_cn;		//公寓提供折扣类型
	
	@Column(name = "apartment_lowestprice")
	private String lowestprice;		//公寓户型最低价格
	
	@Column(name = "apartment_marketprice")
	private String marketprice;			//月租
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_uniquediscount")
	private String uniquediscount;		//公寓独家折扣
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_uniquediscount_cn")
	private String uniquediscount_cn;		//公寓独家折扣 cn
	
	@Column(name = "apartment_addr")
	private String addr;			//地址
	
	@Column(name = "apartment_website")
	private String website;			//网址
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_news")
	private String news;			//公寓特惠，新闻
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_news_cn")
	private String news_cn;			//公寓特惠，新闻
	
	@Column(name = "apartment_tag")
	private String tag;			//公寓标签
	
	@Column(name = "apartment_tag_cn")
	private String tag_cn;			//公寓标签
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_video")
	private String video;			//公寓视频
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_hignlight")
	private String hignlight;		//公寓亮点
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_hignlight_cn")
	private String hignlight_cn;		//公寓亮点 cn
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_introduction")
	private String introduction;	//公寓介绍
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_introduction_cn")
	private String introduction_cn;	//公寓介绍 cn
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_feature")
	private String feature;			//公寓配置
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_amenities")
	private String amenities;			//社区设施
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_feature_cn")
	private String feature_cn;			//公寓配置cn
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_amenities_cn")
	private String amenities_cn;			//社区设施cn
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_peripheral")
	private String peripheral;			//公寓周边
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_peripheral_cn")
	private String peripheral_cn;			//公寓周边cn
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_utility")
	private String utility;			//水电网费
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_utility_cn")
	private String utility_cn;			//水电网费
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_leasingtype")
	private String leasingtype;		//租赁方式
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_leasingtype_cn")
	private String leasingtype_cn;		//租赁方式cn
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_petpolicy")
	private String petpolicy;		//宠物政策
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_petpolicy_cn")
	private String petpolicy_cn;		//宠物政策
	
	@Column(name = "apartment_deposit")
	private String deposit;			//押金
	
	@Column(name = "apartment_deposit_cn")
	private String deposit_cn;			//押金cn
	
	@Column(name = "apartment_applicationfee")
	private String applicationfee;		//申请费
	
	@Column(name = "apartment_applicationfee_cn")
	private String applicationfee_cn;		//申请费
	
	@Column(name = "apartment_activityfee")
	private String activityfee;			//活动经费
	
	@Column(name = "apartment_managementfee")
	private String managementfee;		//社区管理费
	
	@Column(name = "apartment_parking")
	private String parking;		//停车场
	
	@Column(name = "apartment_parking_cn")
	private String parking_cn;		//停车场
	
	@Column(name = "apartment_otherfee")
	private String otherfee;		//其他费

	@Column(name = "apartment_otherfee_cn")
	private String otherfee_cn;		//其他费cn
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_discountproject")
	private String apartment_discountproject;		//优惠项目cn
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_discountproject_cn")
	private String apartment_discountproject_cn;	//优惠项目cn
	
	@Column(name = "apartment_forpay")
	private String forpay;		//代缴费

	@Column(name = "apartment_forpay_cn")
	private String forpay_cn;		//待机费cn
	
	@Column(name = "apartment_enterearly")
	private String enterearly;		//是否可以提前入住

	@Column(name = "apartment_enterearly_cn")
	private String enterearly_cn;		//提前入住cn
	
	@Column(name = "apartment_matching")
	private String matching;		//是否室友匹配服务

	@Column(name = "apartment_matching_cn")
	private String matching_cn;		//是否室友匹配服务cn
	
	@Column(name = "apartment_parentid",length=8)
	private Integer parentid;			//学校ID
	
	@Column(name = "apartment_parentname",length=255)
	private String parentname;			//学校名称
	
	@Column(name = "apartment_logo",length=255)
	private String logo;			//公寓缩略图
	
	@Column(name = "apartment_coupon",length=255)
	private String coupon;			//公寓缩略图
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "apartment_memo")
	private String memo;			//附录
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "school_atlas")
	private String atlas;			//地理学校图集路径串
	
	@Column(name = "school_location",length=255)
	private String location;			//地理学校经纬
	
	@Column(name = "apartment_sort",length=8)
	private Integer sort;			//地理排序
	
	@Column(name = "apartment_isenable",length=1)
	private Integer isenable=1;			//是否启用
	
	@Column(name = "apartment_ifvote",length=1)
	private Integer ifvote=0;			//是否推荐   0不推荐  1推荐
	
	@Column(name = "apartment_isdel",length=1)
	private Integer isdel = 0;			//是否删除：0否，1是
	
	@Column(name = "apartment_tips")
	private String tips = "";				//是否删除：0否，1是
	
	@Column(name = "apartment_isbook",length=1)
	private Integer isbook = 1;			//是否可预订
	
	@Column(name = "apartment_iscoupon",length=1)
	private Integer iscoupon = 1;			//是否可得到优惠券
	
	
	public String getCoupon() {
		return coupon;
	}

	public void setCoupon(String coupon) {
		this.coupon = coupon;
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

	public String getNameabb() {
		return nameabb;
	}

	public void setNameabb(String nameabb) {
		this.nameabb = nameabb;
	}

	public String getCorporation() {
		return corporation;
	}

	public void setCorporation(String corporation) {
		this.corporation = corporation;
	}

	public String getCsname() {
		return csname;
	}

	public void setCsname(String csname) {
		this.csname = csname;
	}

	public String getCsmail() {
		return csmail;
	}

	public void setCsmail(String csmail) {
		this.csmail = csmail;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}


	public String getLowestprice() {
		return lowestprice;
	}

	public void setLowestprice(String lowestprice) {
		this.lowestprice = lowestprice;
	}

	public String getMarketprice() {
		return marketprice;
	}

	public void setMarketprice(String marketprice) {
		this.marketprice = marketprice;
	}

	public String getUniquediscount() {
		return uniquediscount;
	}

	public void setUniquediscount(String uniquediscount) {
		this.uniquediscount = uniquediscount;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getNews() {
		return news;
	}

	public void setNews(String news) {
		this.news = news;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public String getHignlight() {
		return hignlight;
	}

	public void setHignlight(String hignlight) {
		this.hignlight = hignlight;
	}

	public String getFeature() {
		return feature;
	}

	public void setFeature(String feature) {
		this.feature = feature;
	}

	public String getAmenities() {
		return amenities;
	}

	public void setAmenities(String amenities) {
		this.amenities = amenities;
	}

	public String getPeripheral() {
		return peripheral;
	}

	public void setPeripheral(String peripheral) {
		this.peripheral = peripheral;
	}

	public String getUtility() {
		return utility;
	}

	public void setUtility(String utility) {
		this.utility = utility;
	}

	public String getLeasingtype() {
		return leasingtype;
	}

	public void setLeasingtype(String leasingtype) {
		this.leasingtype = leasingtype;
	}

	public String getPetpolicy() {
		return petpolicy;
	}

	public void setPetpolicy(String petpolicy) {
		this.petpolicy = petpolicy;
	}

	public String getDeposit() {
		return deposit;
	}

	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}

	public String getApplicationfee() {
		return applicationfee;
	}

	public void setApplicationfee(String applicationfee) {
		this.applicationfee = applicationfee;
	}

	public String getActivityfee() {
		return activityfee;
	}

	public void setActivityfee(String activityfee) {
		this.activityfee = activityfee;
	}

	public String getManagementfee() {
		return managementfee;
	}

	public void setManagementfee(String managementfee) {
		this.managementfee = managementfee;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getOtherfee() {
		return otherfee;
	}

	public void setOtherfee(String otherfee) {
		this.otherfee = otherfee;
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

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getAtlas() {
		return atlas;
	}

	public void setAtlas(String atlas) {
		this.atlas = atlas;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Integer getIsenable() {
		return isenable;
	}

	public void setIsenable(Integer isenable) {
		this.isenable = isenable;
	}

	public Integer getIfvote() {
		return ifvote;
	}

	public void setIfvote(Integer ifvote) {
		this.ifvote = ifvote;
	}

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}

	

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getIntroduction_cn() {
		return introduction_cn;
	}

	public void setIntroduction_cn(String introduction_cn) {
		this.introduction_cn = introduction_cn;
	}

	public String getUniquediscount_cn() {
		return uniquediscount_cn;
	}

	public void setUniquediscount_cn(String uniquediscount_cn) {
		this.uniquediscount_cn = uniquediscount_cn;
	}

	public String getHignlight_cn() {
		return hignlight_cn;
	}

	public void setHignlight_cn(String hignlight_cn) {
		this.hignlight_cn = hignlight_cn;
	}

	public String getFeature_cn() {
		return feature_cn;
	}

	public void setFeature_cn(String feature_cn) {
		this.feature_cn = feature_cn;
	}

	public String getAmenities_cn() {
		return amenities_cn;
	}

	public void setAmenities_cn(String amenities_cn) {
		this.amenities_cn = amenities_cn;
	}

	public String getPeripheral_cn() {
		return peripheral_cn;
	}

	public void setPeripheral_cn(String peripheral_cn) {
		this.peripheral_cn = peripheral_cn;
	}

	public String getUtility_cn() {
		return utility_cn;
	}

	public void setUtility_cn(String utility_cn) {
		this.utility_cn = utility_cn;
	}

	public String getLeasingtype_cn() {
		return leasingtype_cn;
	}

	public void setLeasingtype_cn(String leasingtype_cn) {
		this.leasingtype_cn = leasingtype_cn;
	}

	public String getPetpolicy_cn() {
		return petpolicy_cn;
	}

	public void setPetpolicy_cn(String petpolicy_cn) {
		this.petpolicy_cn = petpolicy_cn;
	}

	public String getDeposit_cn() {
		return deposit_cn;
	}

	public void setDeposit_cn(String deposit_cn) {
		this.deposit_cn = deposit_cn;
	}

	public String getOtherfee_cn() {
		return otherfee_cn;
	}

	public void setOtherfee_cn(String otherfee_cn) {
		this.otherfee_cn = otherfee_cn;
	}

	public String getNews_cn() {
		return news_cn;
	}

	public void setNews_cn(String news_cn) {
		this.news_cn = news_cn;
	}

	public String getTag_cn() {
		return tag_cn;
	}

	public void setTag_cn(String tag_cn) {
		this.tag_cn = tag_cn;
	}

	public String getForpay() {
		return forpay;
	}

	public void setForpay(String forpay) {
		this.forpay = forpay;
	}

	public String getForpay_cn() {
		return forpay_cn;
	}

	public void setForpay_cn(String forpay_cn) {
		this.forpay_cn = forpay_cn;
	}

	public String getEnterearly() {
		return enterearly;
	}

	public void setEnterearly(String enterearly) {
		this.enterearly = enterearly;
	}

	public String getEnterearly_cn() {
		return enterearly_cn;
	}

	public void setEnterearly_cn(String enterearly_cn) {
		this.enterearly_cn = enterearly_cn;
	}

	public String getApartment_discountproject() {
		return apartment_discountproject;
	}

	public void setApartment_discountproject(String apartment_discountproject) {
		this.apartment_discountproject = apartment_discountproject;
	}

	public String getApartment_discountproject_cn() {
		return apartment_discountproject_cn;
	}

	public void setApartment_discountproject_cn(String apartment_discountproject_cn) {
		this.apartment_discountproject_cn = apartment_discountproject_cn;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getWorktime() {
		return worktime;
	}

	public void setWorktime(String worktime) {
		this.worktime = worktime;
	}

	public String getWorktime_cn() {
		return worktime_cn;
	}

	public void setWorktime_cn(String worktime_cn) {
		this.worktime_cn = worktime_cn;
	}

	public String getMatching() {
		return matching;
	}

	public void setMatching(String matching) {
		this.matching = matching;
	}

	public String getMatching_cn() {
		return matching_cn;
	}

	public void setMatching_cn(String matching_cn) {
		this.matching_cn = matching_cn;
	}

	public String getDiscounttype() {
		return discounttype;
	}

	public void setDiscounttype(String discounttype) {
		this.discounttype = discounttype;
	}

	public String getDiscount_cn() {
		return discount_cn;
	}

	public void setDiscount_cn(String discount_cn) {
		this.discount_cn = discount_cn;
	}

	public String getDiscounttype_cn() {
		return discounttype_cn;
	}

	public void setDiscounttype_cn(String discounttype_cn) {
		this.discounttype_cn = discounttype_cn;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public String getApplicationfee_cn() {
		return applicationfee_cn;
	}

	public void setApplicationfee_cn(String applicationfee_cn) {
		this.applicationfee_cn = applicationfee_cn;
	}

	public String getParking_cn() {
		return parking_cn;
	}

	public void setParking_cn(String parking_cn) {
		this.parking_cn = parking_cn;
	}

	public Double getDiscounttype_back() {
		return discounttype_back;
	}

	public void setDiscounttype_back(Double discounttype_back) {
		this.discounttype_back = discounttype_back;
	}

	public String getTips() {
		return tips;
	}

	public void setTips(String tips) {
		this.tips = tips;
	}

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

}
