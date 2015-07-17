package util;

import javax.servlet.http.HttpServletRequest;

import com.zq.worldelites.model.User;
import com.zq.worldelites.vo.UserVo;


public class SystemUtil {
	
	public static UserVo getFrontLogin(HttpServletRequest request){
		if (request.getSession().getAttribute(Constants.FRONT_LOGIN) != null) 
			return (UserVo) request.getSession().getAttribute(Constants.FRONT_LOGIN);
		else
			return null;
	}

	public static User getBackLogin(HttpServletRequest request){
		if (request.getSession().getAttribute(Constants.BACK_LOGIN) != null) 
			return (User)request.getSession().getAttribute(Constants.BACK_LOGIN);
		else
			return null;
	}
	
	public static void setLogin(HttpServletRequest request,User user){
			request.getSession().setAttribute(Constants.BACK_LOGIN,user);
	}
	
}
