package com.zq.worldelites.service.manage;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Order;
import com.zq.worldelites.model.Others;
import com.zq.worldelites.model.User;

@Service("orderService")
public class OrderService extends CommonService {
	
	@Resource
	private ProductService productService;
	
	@Resource
	private UserService userService;
	
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("Order", " where isdel = 0  order by id desc", pageNo, pageSize);
		return hm;
	}
	
	public List<Order> find(int productId,int size){
		return find("from Order o where o.productid = "+productId+" and isdel = 0 order by ctime desc", 0,  size);
	}
	
	public List<Order> getAllOrder(){
		return find("from Order o where o.isdel = 0 ");
	}
	
	public User getUserById(Integer id){
		User user=(User) findById(User.class, id);
		return user;
	}

	
}
