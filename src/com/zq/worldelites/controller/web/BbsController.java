package com.zq.worldelites.controller.web;


import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import util.Constants;
import util.JsonUtil;
import util.StringUtil;

import com.zq.worldelites.model.Article;
import com.zq.worldelites.model.Menu;
import com.zq.worldelites.model.School;
import com.zq.worldelites.model.Thread;
import com.zq.worldelites.service.manage.ApartmentService;
import com.zq.worldelites.service.web.BbsService;
import com.zq.worldelites.service.web.WebService;
import com.zq.worldelites.vo.UserVo;

@Controller() 
@RequestMapping("/bbs")
public class BbsController{
	
	@Autowired
	private BbsService bbsService;
	@Resource
	private ApartmentService apartmentService;
	@Resource
	private WebService webService;

	@RequestMapping("bbs")
	public void bbs(HttpServletRequest request,Model model){
		String universityid = request.getParameter("universityid");//大学的id
		String tagid = request.getParameter("tagid");//帖子标签的id
		if(StringUtil.isNullOrEmpty(universityid))
			universityid=null;
		if(StringUtil.isNullOrEmpty(tagid))
			tagid=null;
		
		model.addAttribute("universityid", universityid);
		model.addAttribute("tagid", tagid);
		
		//获取大学列表
		List<School> schoolList = this.bbsService.getAllSchool();
		model.addAttribute("schoollist", schoolList);//学校的列表
		List<Menu> mList=bbsService.getAllThreadTag();
		model.addAttribute("threadtag", mList);//附加的帖子项
	}
	
	//bbs
	@ResponseBody
	@RequestMapping("refreshBbs")
	public String refreshBbs(Integer start,Integer schoolId,Integer tagId){
		List<Thread> list=bbsService.refreshBbs(start, 10, schoolId,tagId);
		
		return JsonUtil.getJsonFormatDateFromArray(list);
	}
	
	@RequestMapping("bbslist")
	public void bbsList(HttpServletRequest request,Model model){
		Integer universityid = Integer.parseInt(request.getParameter("universityid"));
		String pageIndexStr = request.getParameter("pageindex");
		String act = request.getParameter("act");
		
		if(StringUtil.isNullOrEmpty(act))
			act="now";
		if(StringUtil.isNullOrEmpty(pageIndexStr))
			pageIndexStr="1";
		
		int pageSize = 20;
		int pageIndex = this.bbsService.getPageIndex(pageIndexStr, act, pageSize,2,universityid);
		
		int count = this.bbsService.getThreadCount(universityid);
		
		int countPageNo = count%pageSize==0?count/pageSize:count/pageSize+1;
		if(countPageNo == 0)
			countPageNo = 1;
		
		model.addAttribute("pageindex", pageIndex);
		model.addAttribute("countpageno", countPageNo);
		
		List<Thread> list = this.bbsService.getPageThread(pageIndex, pageSize,universityid);
		model.addAttribute("threadslist", list);
		
		//获取所有Thread的精品,不分类型
		List<Thread> threadList = this.bbsService.getChannelThread(pageSize,universityid);
		model.addAttribute("threadlist",threadList);
		//公共板块的帖子列表
		List<Thread> noticeList = this.bbsService.getChannelNotice(pageSize,universityid);
		model.addAttribute("noticelist", noticeList);
		
		model.addAttribute("universityid", universityid);
		
		School school=apartmentService.getOneSchool(universityid);
		
		model.addAttribute("oneschool", school);
		model.addAttribute("universityid", universityid);
	}
	
	@ResponseBody
	@RequestMapping("refreshThread")
	public List<Thread> refreshThread(Integer start,Integer schoolId){
		
		List<Thread> list=bbsService.refreshThread2(start, 10, schoolId);
		
		return list;
	}
	
	
	@RequestMapping("bbsadd")
	public void BbsAdd(String universityid,Model model){
		model.addAttribute("universityid", universityid);
	}
	
	@RequestMapping("bbssave")
	public String BbsSave(Thread thread,String universityid,HttpSession session){
		if(session.getAttribute(Constants.FRONT_LOGIN)!=null){
			UserVo userVo=(UserVo) session.getAttribute(Constants.FRONT_LOGIN);
			thread.setAuthorid(userVo.getId());
			thread.setAuthorname(userVo.getName());
			thread.setTypecode(universityid);
			thread.setReplayuserid(userVo.getId());
			thread.setReplayusername(userVo.getName());
			thread.setIsenable(1);
			thread.setType(Constants.BBS_TYPE_THREAD);
			thread.setChannel(Constants.BBS_TYPE_THREAD);
			thread.setBtime(new Date());
			thread.setUtime(new Date());
			thread.setCtime(new Date());
			thread.setEtime(new Date());
			thread.setReplaytime(new Date());
			bbsService.save(thread);
			return "redirect:bbslist.html?universityid="+thread.getUniversityid();
		}else{
			return "redirect:../index.html?act=login";
		}
		
	}
	
	@RequestMapping("bbsshow")
	public void bbsshow(Model model,HttpServletRequest request){
		
		int bbsId = Integer.parseInt(request.getParameter("id"));
		
		Thread threadOneBbs= bbsService.getOneThread(bbsId);
		
		model.addAttribute("threadonebbs", threadOneBbs);
		
		if(!StringUtil.isNullOrEmpty(threadOneBbs.getKeyword())){
			Integer bk=Integer.valueOf(threadOneBbs.getKeyword());//帖子板块
			model.addAttribute("ThreadTag", bbsService.getThreadTagBuyId(bk));
		}
		if(!StringUtil.isNullOrEmpty(threadOneBbs.getType())){
			Integer xx=Integer.valueOf(threadOneBbs.getType());//学校id
			model.addAttribute("schoolTag",apartmentService.getOneSchool(xx));
		}
		
		
		/*int universityId=bbsService.getSchoolByThread(bbsId);
		String pageIndexStr = request.getParameter("pageindex");
		String act = request.getParameter("act");
		
		if(StringUtil.isNullOrEmpty(act))
			act="now";
		if(StringUtil.isNullOrEmpty(pageIndexStr))
			pageIndexStr="1";
		
		int pageSize = 20;
		int pageIndex = this.bbsService.getPageIndex(pageIndexStr, act, pageSize,2,universityId);
		
		int count = this.bbsService.getThreadCount(universityId);
		
		int countPageNo = count%pageSize==0?count/pageSize:count/pageSize+1;
		if(countPageNo == 0)
			countPageNo = 1;
		
		//获取所有Thread的精品,不分类型
		List<Thread> threadList = this.bbsService.getChannelThread(pageSize,universityId);
		model.addAttribute("threadlist",threadList);
		//公共板块的帖子列表
		List<Thread> noticeList = this.bbsService.getChannelNotice(pageSize,universityId);
		model.addAttribute("noticelist", noticeList);
		
		model.addAttribute("universityid", universityId);*/
	}
	
	@RequestMapping("community")
	public void community(String type,String id,Model model,HttpServletRequest request,HttpSession session){
		
		List<Article> communityList=bbsService.getCommunityList();
		model.addAttribute("communitycloumnlist", communityList);
		
		model.addAttribute("pagetype", type);
		
		if(StringUtil.isNullOrEmpty(id)&&communityList.size()>0){
			id=String.valueOf(communityList.get(0).getId());
		}
		
		model.addAttribute("classid", id);
		
		
		
		//获取所有Thread的精品,不分类型
		
		List<Thread> threadList = this.bbsService.getThreadForCommunity(type);
		model.addAttribute("communitytypelist",threadList);
	}
	
	/*@ResponseBody
	@RequestMapping("refreshThread")
	public List<Thread> refreshThread(Integer start,String pagetype){
		
		List<Thread> list=bbsService.refreshThread(start, 10, pagetype);
		
		return list;
	}*/
	
	
}
