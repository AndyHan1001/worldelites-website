package com.zq.worldelites.filter;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

/**
 * 推广的过滤 过滤/pm/*
 */
public class UrlFilter implements Filter {

public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException
 {
	
	HttpServletRequest re=(HttpServletRequest)request;
	
		String url = re.getRequestURI().toString();
		if(url != null && !"".equals(url)){
			String[] urlArr = url.split("/");
			if(urlArr.length >= 2){
				String a=urlArr[urlArr.length-1];
				String s ="null";
				try {
					s = new String(a.getBytes("ISO-8859-1"),"UTF-8");
				} catch (UnsupportedEncodingException e1) {
					e1.printStackTrace();
				}
				re.getSession().setAttribute("tuiguang", s);
			}
	}
	//request.getRequestDispatcher("/web/index.do").forward(request, response);
	HttpServletResponse res=(HttpServletResponse) response;
	res.sendRedirect("../index.html");
	return;
 }

 public void destroy()
 {
 }

 public void init(FilterConfig filterConfig) throws ServletException
 {
 }
}
