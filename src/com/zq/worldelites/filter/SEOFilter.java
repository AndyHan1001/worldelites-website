package com.zq.worldelites.filter;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 */
public class SEOFilter implements Filter {

public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException
 {
	
	HttpServletRequest re=(HttpServletRequest)request;

	String url = re.getRequestURI().toString();
	if(url != null && !"".equals(url)&&url.indexOf(".html")==-1&&url.indexOf(".js")==-1&&url.indexOf(".css")==-1){
			String[] urlArr = url.split("/");
			HttpServletResponse res=(HttpServletResponse) response;
			if(urlArr.length == 3&&(urlArr[urlArr.length-1].equals("university")||urlArr[urlArr.length-1].equals("university_cn"))){//全部州下的学校 
				if(url.indexOf("university_cn")!=-1){//University
					re.getRequestDispatcher("/apartment_cn/university.html").forward(re, res);
				}else{
					re.getRequestDispatcher("/apartment/university.html").forward(re, res);
				}
				return;
			}else if(urlArr.length == 4){//学校
				String universityName=urlArr[urlArr.length-1];
				universityName = new String(universityName.getBytes("ISO-8859-1"),"UTF-8");
				if(url.indexOf("university_cn")!=-1){//University
					re.getRequestDispatcher("/apartment_cn/universityshow.html?name="+universityName.replace("%20", " ")).forward(re, res);
				}else{
					re.getRequestDispatcher("/apartment/universityshow.html?name="+universityName.replace("%20", " ")).forward(re, res);
				}
				return;
			}else if(urlArr.length == 5){//公寓
				String apartmentName=urlArr[urlArr.length-1];
				apartmentName = new String(apartmentName.getBytes("ISO-8859-1"),"UTF-8");
				if(url.indexOf("university_cn")!=-1){
					re.getRequestDispatcher("/apartment_cn/apartment.html?name="+apartmentName.replace("_", " ").replace("%20", " ")).forward(re, res);
				}else{
					re.getRequestDispatcher("/apartment/apartment.html?name="+apartmentName.replace("_", " ").replace("%20", " ")).forward(re, res);
				}
				return;
			}
	}
	filterChain.doFilter(request, response);
 }

 public void destroy()
 {
 }

 public void init(FilterConfig filterConfig) throws ServletException
 {
 }
}
