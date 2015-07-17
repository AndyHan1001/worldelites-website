package com.zq.worldelites.vo;

import java.util.List;

import com.zq.worldelites.model.Apartment;

public class SearchVo {
	private Integer schoolId;
	private String schoolName;
	private String schoolAbb;
	private String schoolLogo;
	private List<Apartment> allApartment;
	public Integer getSchoolId() {
		return schoolId;
	}
	public void setSchoolId(Integer schoolId) {
		this.schoolId = schoolId;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getSchoolLogo() {
		return schoolLogo;
	}
	
	public String getSchoolAbb() {
		return schoolAbb;
	}
	public void setSchoolAbb(String schoolAbb) {
		this.schoolAbb = schoolAbb;
	}
	public void setSchoolLogo(String schoolLogo) {
		this.schoolLogo = schoolLogo;
	}
	public List<Apartment> getAllApartment() {
		return allApartment;
	}
	public void setAllApartment(List<Apartment> allApartment) {
		this.allApartment = allApartment;
	}
	
	
}
