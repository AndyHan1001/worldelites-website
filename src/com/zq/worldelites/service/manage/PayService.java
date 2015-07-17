package com.zq.worldelites.service.manage;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Pay;




@Service("PayService")
public class PayService extends CommonService {
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("Pay", " where isdel = 0 ", pageNo, pageSize);
		return hm;
	}
	
	public List<Pay> getAllPay(){
		List<Pay> list=find("from Pay p where p.isdel=0");
		return list;
	}
}
