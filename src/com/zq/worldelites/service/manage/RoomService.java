package com.zq.worldelites.service.manage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Apartment;
import com.zq.worldelites.model.Geography;
import com.zq.worldelites.model.Room;
import com.zq.worldelites.model.School;



@Service("roomService")
public class RoomService extends CommonService {
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("Room", " where isdel = 0 ", pageNo, pageSize);
		HashMap hmNew = new HashMap();
		List<Room> list = (List<Room>) hm.get("rows");
		List<Room> list2 = new ArrayList<Room>();
		Apartment apartment = null;
		for(Room one : list){
			apartment = (Apartment)getById("Apartment", one.getParentid()==null?0:one.getParentid());
			if(apartment!=null){
				one.setParentname(apartment.getName());
				list2.add(one);
			}
		}
		hmNew.put("rows", list2);
		hmNew.put("total", hm.get("total"));
		
		return hmNew;
	}
	
	public List<Apartment> getSomeApartmentByWordKey(){
		List<Apartment> allLikeList=find("from Apartment a where a.isdel=0 and a.isenable=1");

		return allLikeList;
	}
	
	public List<Room> getAllRoom(){
		List<Room> allLikeList=find("from Room r where r.isdel=0");

		return allLikeList;
	}
	
}
