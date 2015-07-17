package com.zq.worldelites.service.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import util.Constants;
import util.JsonUtil;
import util.StringUtil;

import com.zq.worldelites.model.Apartment;
import com.zq.worldelites.model.Article;
import com.zq.worldelites.model.EmailLog;
import com.zq.worldelites.model.Geography;
import com.zq.worldelites.model.Industry;
import com.zq.worldelites.model.Order;
import com.zq.worldelites.model.Picture;
import com.zq.worldelites.model.Room;
import com.zq.worldelites.model.School;
import com.zq.worldelites.model.User;
import com.zq.worldelites.service.manage.CommonService;
import com.zq.worldelites.vo.ApartmentSearchVo;
import com.zq.worldelites.vo.SearchVo;
import com.zq.worldelites.vo.UserVo;


@Service("webService")
public class WebService extends CommonService {
	
	/**
	 * 首页查询功能
	 * @param keywork
	 * @return
	 */
	public List<SearchVo> seachSchool(String keyword){
		List<School> list=find("from School s where s.isdel=0 and s.isenable=1 and s.name like'%"+keyword+"%' order by s.sort asc");
		List<School> list2=find("from School s where s.isdel=0 and s.isenable=1 and s.memo like'%"+keyword+"%' order by s.sort asc");
		if(list!=null&&list.size()>0){
			List<SearchVo> searchList=new ArrayList<SearchVo>();
			for(School oneSchool:list){
				if(oneSchool!=null){
					SearchVo searchVo=new SearchVo();
					searchVo.setSchoolId(oneSchool.getId());
					searchVo.setSchoolName(oneSchool.getName());
					searchVo.setSchoolLogo(oneSchool.getLogo());
					searchVo.setSchoolAbb(oneSchool.getMemo());
					List<Apartment> apartmentList=find("from Apartment a where a.isdel=0 and a.isenable=1 and a.parentid=?",oneSchool.getId());
					if(apartmentList!=null&&apartmentList.size()>0)
						searchVo.setAllApartment(apartmentList);
					searchList.add(searchVo);
				}
			}
			return searchList;
		}else if(list2!=null&&list2.size()>0){
			List<SearchVo> searchList=new ArrayList<SearchVo>();
			for(School oneSchool:list2){
				if(oneSchool!=null){
					SearchVo searchVo=new SearchVo();
					searchVo.setSchoolId(oneSchool.getId());
					searchVo.setSchoolName(oneSchool.getName());
					searchVo.setSchoolLogo(oneSchool.getLogo());
					searchVo.setSchoolAbb(oneSchool.getMemo());
					List<Apartment> apartmentList=find("from Apartment a where a.isdel=0 and a.isenable=1 and a.parentid=?",oneSchool.getId());
					if(apartmentList!=null&&apartmentList.size()>0)
						searchVo.setAllApartment(apartmentList);
					searchList.add(searchVo);
				}
			}
			return searchList;
		}
		return null;
	}
	
	/**
	 * 首页公寓查询功能
	 * @param keywork
	 * @return
	 */
	public List<ApartmentSearchVo> seachApartment(String keywork){
		List<Apartment> apartmentList=find("from Apartment a where a.isdel=0 and a.isenable=1 and a.name like '%"+keywork+"%' order by a.sort desc");
		List<ApartmentSearchVo> apartmentSearchVos=new ArrayList<ApartmentSearchVo>();
		ApartmentSearchVo apartmentSearchVo=null;
		for(Apartment oneApartment:apartmentList){
			apartmentSearchVo=new ApartmentSearchVo();
			List<School> schoolList=find("from School s where s.isdel=0 and s.id=?",oneApartment.getParentid());
			if(schoolList.size()<=0||schoolList==null)
				continue;
			apartmentSearchVo.setNameabb(schoolList.get(0).getMemo()==null?"":schoolList.get(0).getMemo());//学校的ABB
			apartmentSearchVo.setSchoolid(schoolList.get(0).getId());//学校ID
			apartmentSearchVo.setId(oneApartment.getId());//公寓ID
			apartmentSearchVo.setName(oneApartment.getName()==null?"":oneApartment.getName());//公寓名字
			apartmentSearchVos.add(apartmentSearchVo);
		}
		return apartmentSearchVos;
	}
	
	/**
	 * 用户登录验证
	 * @param passport
	 * @param password
	 * @return
	 */
	public String ValidateLogin(String mail,String password){
		List<User> userList=find("from User u where u.isdel=0 and u.mail=?", mail);
		if(userList.size()==0){
			return "The user name does not exist!";
		}else{
			if(userList.get(0).getState()==0){
				return "Not activated";
			}else if(userList.get(0).getPassword()!=null&&userList.get(0).getPassword().equals(password)){
				return "loginSuccess";
			}else{
				return "Password input error!";
			}
		}
		
	}
	
	public User getUserByMailAny(String mail){
		if(mail!=null){
			String hql = " FROM User u WHERE u.mail = ?";
			List<User> list = find(hql,mail);
			if(list != null && list.size() > 0){
				return list.get(0);
			}else{
				return null;
			}
		}else{
			return null;
		}
	}
	
	/**
	 * 登陆成功返回用户数据
	 * @param mail
	 * @param password
	 * @return
	 */

	public UserVo checkLogin(String mail,String password){
		String hql = " FROM User u WHERE u.mail = ? AND u.password = ? ";
		List<User> list = find(hql, new Object[]{mail,password});
		if(list != null && list.size() > 0){
			User user = list.get(0);
			UserVo userVo = new UserVo(user.getId(),user.getMail(),user.getName(),user.getLastname(),user.getNewschool(),user.getLogo());
			return userVo;
		}else{
			return null;
		}
	}
	
	public String getAllSchool(){
		List<School> list=find("from School s where s.isdel=0 and s.isenable=1");
		return JsonUtil.getJsonFormatDateFromArray(list);
	}
	
	public String getAllCountyies(){
		List<Industry> list=find("from Industry i where i.isdel=0 and i.isenable=1 order by i.paixu asc");
		return JsonUtil.getJsonFormatDateFromArray(list);
	}
	
	/*通过州名得到他下属的学校列表
	 */
	public String getAllSchoolByPrvcName(String name){
		List<Geography> list=find("from Geography g where g.isdel=0 and g.isenable=1 and g.name=?",name);
		if(list.size()!=0){
		List<School> schoolList=find("from School s where s.isdel=0 and s.parentid=?",list.get(0).getId());
		return JsonUtil.getJsonFormatDateFromArray(schoolList);
		}
		return null;
	}
	
	
	public String validateRegMail(String mail){
		List<User> userList=find("from User u where u.isdel=0 and u.mail=?", mail);
		
		if(userList.size()==0){
			return "ok";
		}else{
			if(userList.get(0).getState()==0)
				return "ok";
			else
			return null;
		}
		
	}	
	
	public List<Picture> getPicture(){
		String hql = " from Picture p where p.isdel = 0 ";
		List<Picture> list = find(hql);
		return list;
		
	}
	
	//得到邮件记录
	public EmailLog getEmailLogByUserId(Integer userId,String token){
		if(userId!=null){
			List<EmailLog> list=find("from EmailLog e where e.isdel=0 and e.touserid=? and e.token=? and e.clicked=?",new Object[]{userId,token,0});
			if(list.size()>0&&list!=null){
				return list.get(0);
			}else{
				return null;
			}
		}else{
			return null;
		}
		
	}
	
	public User getUserByMail(String mail){
		List<User> list=find("from User u where u.isdel=0 and u.mail=?",mail);
		if(list.size()!=0){
			return list.get(0);
		}
		return null;
	}
	
	public User getUserByMailAndStateO(String mail){
		List<User> list=find("from User u where u.isdel=0 and u.mail=? and u.state=0",mail);
		if(list.size()!=0){
			return list.get(0);
		}
		return null;
	}
	
	public List<Article> getHeadCloumn(String type){
		List<Article> list=find("from Article a where a.isdel=8 and a.type=? order by a.comment desc",type);
		return list;
	}
	
	public List<School> getAllSchoolList(Integer size){
		List<School> list=find("from School s where s.isdel=0 and s.isenable=1 order by s.sort desc",0,size);
		return list;
	}
	
	
	
	/////////////////////////////////order--------
	/**
	 * 得到一个房间的数据
	 * @param id
	 * @return
	 */
	public List<Room> getOneRoom(Integer id){
		List<Room> list=find("from Room r where r.isdel=0 and r.id=?",id);
		
		return list;
	}
	
	/**
	 * 得到一个公寓下的所有户型
	 * @return
	 */
	public List<Room> getRoomListByApartmentId(Integer apartmentId){
		List<Room> list=find("from Room s where s.isdel=0 and s.parentid=?",apartmentId);
		return list;
	}
	
	/**
	 * 得到一个公寓下的所有户型（可预订）
	 * @return
	 */
	public List<Room> getRoomListByApartmentIdStateIsYes(Integer apartmentId){
		List<Room> list=find("from Room s where s.isdel=0 and s.state=1 and s.isbook=1 and s.parentid=?",apartmentId);
		return list;
	}
	
	
}
