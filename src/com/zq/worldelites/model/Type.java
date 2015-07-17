package com.zq.worldelites.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 类型表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_type")
public class Type  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="type_id",length=5,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "type_channel",length=255)
	private String channel;			//类型主体名称：user\news\prdt\CMS栏目\BBS板块栏目\图集、图片、订单、支付
	
	@Column(name = "type_code",length=8)
	private Integer code;			//类型代码
	
	@Column(name = "type_ssid",length=8)
	private Integer ssid;			//id
	
	@Column(name = "type_name",length=255)
	private String name;			//类型实际名称

	@Column(name = "type_parentid",length=8)
	private Integer parentid;		//类型父级ID
	
	@Column(name = "type_logo",length=255)
	private String logo;			//类型附加图
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "type_memo")
	private String memo;			//类型备忘
	
	@Column(name = "type_paixu",length=8)
	private Integer paixu;		//类型排序
	
	@Column(name = "type_isenable",length=1)
	private Integer isenable;		//类型是否通过审核，0否，1是
	
	@Column(name = "type_isdel",length=1)
	private Integer isdel = 0;		//类型是否进行删除：0否.1是

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
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

	public Integer getParentid() {
		return parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
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

	public Integer getPaixu() {
		return paixu;
	}

	public void setPaixu(Integer paixu) {
		this.paixu = paixu;
	}

	public Integer getIsenable() {
		return isenable;
	}

	public void setIsenable(Integer isenable) {
		this.isenable = isenable;
	}

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}
	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}
	

}
