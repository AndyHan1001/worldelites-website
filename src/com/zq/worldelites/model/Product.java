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
 * 商品表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_product")
public class Product  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="product_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "product_ssid",length=8)
	private Integer ssid;			//让用户来看的流水号：产品ID
	
	@Column(name = "product_type",length=255)
	private String type;			//产品类型
	
	@Column(name = "product_typecode",length=8)
	private String typecode;			//产品类型代码

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "product_ctime")
	private Date ctime;				//创建时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "product_utime")
	private Date utime;				//修改时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "product_btime")
	private Date btime;				//开始时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "product_etime")
	private Date etime;			//结束时间
	
	@Column(name = "product_title",length=255)
	private String title;		//产品名称
	
	@Column(name = "product_pp",length=255)
	private String pp;			//产品品牌
	
	@Column(name = "product_gg",length=255)
	private String gg;			//产品规格
	
	@Column(name = "product_xh",length=255)
	private String xh;			//产品型号
	
	@Column(name = "product_ys",length=255)
	private String ys;			//产品颜色
	
	@Column(name = "product_num",length=8)
	private Integer num;		//产品库存
	
	@Column(name = "product_p1",length=255)
	private String p1;			//产品成本价
	
	@Column(name = "product_p2",length=255)
	private String p2;			//产品市场价
	
	@Column(name = "product_p3",length=255)
	private String p3;			//产品销售价
	
	@Column(name = "product_p4",length=255)
	private String p4;			//产品会员价
	
	@Column(name = "product_p5",length=255)
	private Double p5;			//产品成交价
	
	@Column(name = "product_v1",length=255)
	private String v1;			//扩展1
	
	@Column(name = "product_v2",length=255)
	private String v2;			//扩展2
	
	@Column(name = "product_v3",length=255)
	private String v3;			//扩展3
	
	@Column(name = "product_v4",length=255)
	private String v4;			//扩展4
	
	@Column(name = "product_v5",length=255)
	private String v5;			//扩展5
	
	@Column(name = "product_v6",length=255)
	private String v6;			//扩展6
	
	@Column(name = "product_keyword",length=255)
	private String keyword;			//关键字
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "product_note")
	private String note;			//附记
	
	@Column(name = "product_source",length=255)
	private String source;			//来源
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "product_memo")
	private String memo;			//摘要
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "product_content")
	private String content;			//内容
	
	@Column(name = "product_logo")
	private String logo;			//产品缩略图

	@Column(name = "product_atlas",length=8)
	private Integer atlas;			//产品图集ID
	
	@Column(name = "product_isenable",length=1)
	private Integer isenable;		//是否通过审核：0否.1是
	
	@Column(name = "product_stick",length=1)
	private Integer stick = 0;			//是否置顶
	
	@Column(name = "product_visit",length=8)
	private Integer visit = 0;			//浏览量
	
	@Column(name = "product_isdel",length=1)
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

	public String getPp() {
		return pp;
	}

	public void setPp(String pp) {
		this.pp = pp;
	}

	public String getGg() {
		return gg;
	}

	public void setGg(String gg) {
		this.gg = gg;
	}

	public String getXh() {
		return xh;
	}

	public void setXh(String xh) {
		this.xh = xh;
	}

	public String getYs() {
		return ys;
	}

	public void setYs(String ys) {
		this.ys = ys;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getP1() {
		return p1;
	}

	public void setP1(String p1) {
		this.p1 = p1;
	}

	public String getP2() {
		return p2;
	}

	public void setP2(String p2) {
		this.p2 = p2;
	}

	public String getP3() {
		return p3;
	}

	public void setP3(String p3) {
		this.p3 = p3;
	}

	public String getP4() {
		return p4;
	}

	public void setP4(String p4) {
		this.p4 = p4;
	}

	public Double getP5() {
		return p5;
	}

	public void setP5(Double p5) {
		this.p5 = p5;
	}

	public String getV1() {
		return v1;
	}

	public void setV1(String v1) {
		this.v1 = v1;
	}

	public String getV2() {
		return v2;
	}

	public void setV2(String v2) {
		this.v2 = v2;
	}

	public String getV3() {
		return v3;
	}

	public void setV3(String v3) {
		this.v3 = v3;
	}

	public String getV4() {
		return v4;
	}

	public void setV4(String v4) {
		this.v4 = v4;
	}

	public String getV5() {
		return v5;
	}

	public void setV5(String v5) {
		this.v5 = v5;
	}

	public String getV6() {
		return v6;
	}

	public void setV6(String v6) {
		this.v6 = v6;
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

	public Integer getVisit() {
		return visit;
	}

	public void setVisit(Integer visit) {
		this.visit = visit;
	}

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}
	
	
	
	
	
}
