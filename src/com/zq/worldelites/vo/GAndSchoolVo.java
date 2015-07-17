package com.zq.worldelites.vo;

import java.util.List;

import com.zq.worldelites.model.Apartment;
import com.zq.worldelites.model.Geography;
import com.zq.worldelites.model.School;

public class GAndSchoolVo {

	private Geography geography;
	private List<School> schoolList;
	
	public Geography getGeography() {
		return geography;
	}
	public void setGeography(Geography geography) {
		this.geography = geography;
	}
	public List<School> getSchoolList() {
		return schoolList;
	}
	public void setSchoolList(List<School> schoolList) {
		this.schoolList = schoolList;
	}
	
	
	
	
}
