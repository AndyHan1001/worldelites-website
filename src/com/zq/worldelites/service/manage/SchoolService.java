package com.zq.worldelites.service.manage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import util.Constants;

import com.zq.worldelites.model.Geography;
import com.zq.worldelites.model.Menu;
import com.zq.worldelites.model.School;


@Service("schoolService")
public class SchoolService extends CommonService {
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("School", " where isdel = 0 ", pageNo, pageSize);
		HashMap hmNew = new HashMap();
		List<School> list = (List<School>) hm.get("rows");
		List<School> list2 = new ArrayList<School>();
		Geography geography = null;
		for(School one : list){
			geography = (Geography)getById("Geography", one.getParentid()==null?0:one.getParentid());
			if(geography!=null){
				one.setParentname(geography.getName());
				list2.add(one);
			}
		}
		hmNew.put("rows", list2);
		hmNew.put("total", hm.get("total"));
		return hmNew;
	}
	
	public List<Geography> getSomePrvcByWordKey(){
		List<Geography> allLikeList=find("from Geography g where g.isdel=0 and g.isenable=1");

		return allLikeList;
	}
	
	public List<School> getAllSchoolList(){
		List<School> list=find("from School s where s.isdel=0 and s.isenable=1");
		return list;
	}
	public List<School> getAllSchool(){
		List<School> list=find("from School s where s.isdel=0");
		return list;
	}
	
	public List<Menu> getAllThradTag(){
		List<Menu> list=find("from Menu m where m.isdel=0 and m.isenable=1 and m.parentid=?",Constants.MENU_TYPE_THREAD);
		return list;
	}
}
