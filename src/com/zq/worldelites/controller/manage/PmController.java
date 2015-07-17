package com.zq.worldelites.controller.manage;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 会员管理
 * 
 * @author Jason
 * 
 */
@Controller
@RequestMapping("/pm")
public class PmController {
	
	@RequestMapping("index")
	public String index(HttpServletRequest request,HttpServletResponse response,String pmid){
		String s ="无";
		try {
			s = new String(pmid.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		request.getSession().setAttribute("tuiguang", s);
		
		return "redirect:../index.html";
	}
}
