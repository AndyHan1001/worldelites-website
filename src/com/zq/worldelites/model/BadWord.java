package com.zq.worldelites.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 违禁词表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_badword")
public class BadWord implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="badword_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "badword_word",length=255)
	private String word;			//违禁词

	@Column(name = "badword_isdel",length=1)
	private Integer isdel = 0;		//是否删除   0否  1是 
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}
	
	
}
