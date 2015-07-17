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

@Entity
@Table(name = "t_emaillog")
public class EmailLog  implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="emaillog_id",length=8,unique=true,nullable=false)
	private Integer id;			//主键id
	
	@Column(name = "emaillog_type")
	private String type;	//邮件类型
	
	@Column(name = "emaillog_touserid",length=8)
	private Integer touserid;	//收件人ID
	
	@Column(name = "emaillog_toaddres")
	private String toaddres;	//收件人地址
	
	@Column(name = "emaillog_fromaddres")
	private String fromaddres;	//发件人地址
	
	@Column(name = "emaillog_token")
	private String token;		//唯一标识   用uuid来作为唯一标识
	
	@Column(name = "emaillog_title")
	private String title;	//发件人地址
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "emaillog_content")
	private String content;		//邮件内容
	
	@Column(name = "emaillog_url")
	private String url;			//找回密码或者用于验证的url  http://we/passwordzhaohui?token=sdfsdfds
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "emaillog_senddate")
	private	Date senddate;	//发送时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "emaillog_validdate")
	private Date validdate;		//有效截止时间
	
	@Column(name = "emaillog_clicked",length=8)
	private Integer clicked=0;	//是否点击
	
	@Column(name = "emaillog_isdel")
	private Integer isdel=0;		//是否删除

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTouserid() {
		return touserid;
	}

	public void setTouserid(Integer touserid) {
		this.touserid = touserid;
	}

	public String getToaddres() {
		return toaddres;
	}

	public void setToaddres(String toaddres) {
		this.toaddres = toaddres;
	}

	public String getFromaddres() {
		return fromaddres;
	}

	public void setFromaddres(String fromaddres) {
		this.fromaddres = fromaddres;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Date getSenddate() {
		return senddate;
	}

	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}

	public Date getValiddate() {
		return validdate;
	}

	public void setValiddate(Date validdate) {
		this.validdate = validdate;
	}

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getClicked() {
		return clicked;
	}

	public void setClicked(Integer clicked) {
		this.clicked = clicked;
	}

	
	
}
