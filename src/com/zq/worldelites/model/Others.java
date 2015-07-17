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
 * 杂项表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_others")
public class Others  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="others_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键编号
	
	@Column(name = "others_title")
	private String title;			//栏目标题
	
	@Column(name = "others_type")
	private String type;			//栏目类型
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "others_content")
	private String content;			//栏目内容

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
	
}
