package com.zq.worldelites.interceptor;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import util.Constants;
import util.SystemUtil;

import com.zq.worldelites.model.Article;
import com.zq.worldelites.model.Others;
import com.zq.worldelites.model.School;
import com.zq.worldelites.model.User;
import com.zq.worldelites.service.web.OthersService;
import com.zq.worldelites.service.web.WebService;
import com.zq.worldelites.vo.UserVo;

public class LoginInterceptor implements HandlerInterceptor {
	
	@Resource
	private WebService webService;
	@Resource
	private OthersService otherssService;
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object obj, Exception e)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj, ModelAndView model) throws Exception {
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		String url = request.getRequestURI().toString();

		if(request.getSession().getAttribute("WebLanguageVersion")!=null)//如果是繁体的网站就设置页面转换
		if(request.getSession().getAttribute("WebLanguageVersion").equals("fa"))
			request.setAttribute("WebLanguageVersion", "fa");//如果是繁体的网站就设置页面转换
		if(url != null && !"".equals(url)){
			String[] urlArr = url.split("/");
			if(urlArr.length >= 1){
				//相应头部
				HttpSession session=request.getSession();
				List<Article> list=null;
				
				if(session.getAttribute("headaboutlist")==null){
					list=webService.getHeadCloumn(Constants.ARTICLE_ABOUT);
					session.setAttribute("headaboutlist", list);
				}
				if(session.getAttribute("headjoinuslist")==null){
					list=webService.getHeadCloumn(Constants.ARTICLE_JOINUS);
					session.setAttribute("headjoinuslist", list);
				}
				if(session.getAttribute("headcommunitylist")==null){
					list=webService.getHeadCloumn(Constants.ARTICLE_COMMUNITY);
					session.setAttribute("headcommunitylist", list);
				}
				
				//partnership
				
				if(session.getAttribute("footerpartnershiplist")==null){
					list=webService.getHeadCloumn(Constants.ARTICLE_PARTNERSHIP);
					session.setAttribute("footerpartnershiplist", list);
				}
				
				
				if(session.getAttribute("headschoollist")==null){
					List<School> schoolList=webService.getAllSchoolList(8);
					session.setAttribute("headschoollist", schoolList);
				}
				
				
				//footer
				List<Others> listFooter = otherssService.getOthersList();
				if(listFooter != null){
					for(Others other:listFooter){
						if(session.getAttribute(other.getType())==null)
						session.setAttribute(other.getType(), other);
					}
				}
				//end
				if(urlArr[1].equals("web")){
					int index = url.indexOf("about")+url.indexOf("apartment")+url.indexOf("bbs")+url.indexOf("docs");
					if(index < 0){
						UserVo user = SystemUtil.getFrontLogin(request);
						if(user == null){
							response.sendRedirect("/" + urlArr[1] + "/web/index.html?act=login");
							return false;
						}
					}
				}
				
				
			}
		}
		
		//后台登陆拦截
		//String url = request.getRequestURI().toString();
		if(url != null && !"".equals(url)){
			String[] urlArr = url.split("/");
			if(urlArr.length >= 3){
				if(urlArr[1].equals("manage")){
					if(!urlArr[2].equals("login.html")&&!urlArr[2].equals("check.html")){
						int index = url.indexOf("about")+url.indexOf("apartment")+url.indexOf("bbs")+url.indexOf("docs");
						if(index < 0){
							User user = SystemUtil.getBackLogin(request);
							if(user == null){
								response.sendRedirect("/" + urlArr[1] + "/login.html");
								return false;
							}
						}
					}
				}else{
				}
			}
		}

		return true;
	}
}
