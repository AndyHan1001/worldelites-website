package com.zq.worldelites.service.manage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.zq.worldelites.model.Menu;
import com.zq.worldelites.vo.MenuVo;

@Service("menuService")
public class MenuService extends CommonService{
	
	/**
	 * 
	 * @param entityName
	 * @param swhere	
	 * @param pageNo	1开始
	 * @param pageSize
	 * @return
	 */
	public HashMap getPageList(int pageNo, int pageSize) {              
		HashMap hm = getPageList("Menu", " where isdel = 0 ", pageNo, pageSize);
		List<Menu> list = (List<Menu>) hm.get("rows");
		List<MenuVo> voList = new ArrayList<MenuVo>();
		MenuVo menuVo = null;
		for(Menu menu:list){
			menuVo = new MenuVo();
			menuVo.setId(menu.getId());
			menuVo.setSsid(menu.getSsid());
			menuVo.setName(menu.getName());
			menuVo.setParentid(menu.getParentid());
			int parentid = menu.getParentid();
			if(parentid == 0){
				menuVo.setParentname("..");
			}else{
				Menu m = (Menu)getById("Menu",parentid);
				if(m != null)
					menuVo.setParentname(m.getName());
			}
			menuVo.setUrl(menu.getUrl());
			menuVo.setLogo(menu.getLogo());
			menuVo.setMemo(menu.getMemo());
			menuVo.setPaixu(menu.getPaixu());
			menuVo.setIsenable(menu.getIsenable());
			menuVo.setIsdel(menu.getIsdel());
			voList.add(menuVo);
		}
		hm.remove("rows");
		hm.put("rows", voList);
		return hm;
	}
}
