package com.zq.worldelites.service.manage;

import java.util.HashMap;
import java.util.List;


import org.springframework.stereotype.Service;

import com.zq.worldelites.model.User;

@Service("userService")
public class UserService extends CommonService{
	public User getUser(String mail,String password){
		List<User> list = find("from User u where u.type='-1' and u.mail = ? and u.password = ?", new Object[]{mail,password});
		if(list != null && list.size() > 0)
			return list.get(0);
		return null;
	}
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("User", " where isdel = 0 ", pageNo, pageSize);
		return hm;
	}
	
	public boolean testUser(String passport){
		List<User> list= find("from User u where u.passport = ?", passport);
		System.out.println(list.size());
		boolean flag=false;
		if(list.size()==0){
			flag=true;
		}
		
		return flag;
	}
	
	public List<User> getAllUser(){
		List<User> list=find("from User u");
		
		return list;
	}
	
	public List<User> getAllUserOne(){
		List<User> list=find("from User u where u.id>105");
		
		return list;
	}
	
	
}
