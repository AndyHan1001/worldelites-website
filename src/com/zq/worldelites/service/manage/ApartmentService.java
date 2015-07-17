package com.zq.worldelites.service.manage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Apartment;
import com.zq.worldelites.model.Menu;
import com.zq.worldelites.model.School;


@Service("apartmentService")
public class ApartmentService extends CommonService {
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("Apartment", " where isdel = 0 ", pageNo, pageSize);
		List<Apartment> list = (List<Apartment>) hm.get("rows");
		List<Apartment> list2 =new ArrayList<Apartment>();
		HashMap hm2 = new HashMap();
		School school = null;
		for(Apartment one : list){//调取学校名-重填
			school = this.getOneSchool(one.getParentid()==null?0:one.getParentid());
			if(school!=null){
				one.setParentname(school.getName());
			}else{
				one.setParentname("N/A");
			}
			list2.add(one);
		}
		
		hm2.put("rows", list2);
		hm2.put("total", hm.get("total"));
		
		return hm2;
	}
	
	public List<School> getSomeSchoolByWordKey(){
		List<School> allLikeList=find("from School s where s.isdel=0 and s.isenable=1");

		return allLikeList;
	}
	
	//过去的菜单表中的数据
	public List<Menu> getAllMenuSet(Integer parentid){
		List<Menu> allLikeList=find("from Menu m where m.isdel=0 and m.parentid=? and m.isenable=1",parentid);

		return allLikeList;
	}
	
	public List<Apartment> getAllApartment(){
		List<Apartment> school=find("from Apartment a where a.isdel=0");
		return school;
	}
	
	public School getOneSchool(Integer id){
		School school=(School) findById(School.class, id);
		return school;
	}
	
	//切字符串
	public String setString(String value){
		String[] str=value.split(",");
		String s="[";
		for(String oneStr:str){
			s=s+"'"+oneStr+"',";
		}
		s.substring(0, s.length()-2);
		/*return s+"]";*/
		return "['wowo','wowo']";
	}

	
}
