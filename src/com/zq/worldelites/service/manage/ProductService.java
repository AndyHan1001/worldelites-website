package com.zq.worldelites.service.manage;


import java.util.HashMap;


import org.springframework.stereotype.Service;




@Service("productService")
public class ProductService extends CommonService {
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("Product", " where isdel = 0 ", pageNo, pageSize);
		
		return hm;
	}
	
	
}
