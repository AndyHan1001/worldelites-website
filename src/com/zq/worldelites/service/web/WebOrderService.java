package com.zq.worldelites.service.web;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Order;
import com.zq.worldelites.service.manage.CommonService;


@Service("webOrderService")
public class WebOrderService extends CommonService {
	
	public Order getOrderByOrderId(String orderId){
		List<Order> list= find("from Order o where o.isdel=0 and o.orderid=?",orderId);
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	
}
