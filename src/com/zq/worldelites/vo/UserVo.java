package com.zq.worldelites.vo;

public class UserVo {
	private int id;
	private String mail;
	private String name;
	private String lastname;
	private String newschool;
	private String logo;
	
	
	public UserVo() {
		super();
	}
	public UserVo(int id, String mail, String name, String lastname,
			String newschool,String logo) {
		super();
		this.id = id;
		this.mail = mail;
		this.name = name;
		this.lastname = lastname;
		this.newschool = newschool;
		this.logo = logo;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getNewschool() {
		return newschool;
	}
	public void setNewschool(String newschool) {
		this.newschool = newschool;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	
	
}
