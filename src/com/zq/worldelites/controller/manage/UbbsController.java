package com.zq.worldelites.controller.manage;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import util.DateUtil;
import util.JsonUtil;

import com.zq.worldelites.model.Menu;
import com.zq.worldelites.model.Order;
import com.zq.worldelites.model.Replay;
import com.zq.worldelites.model.School;
import com.zq.worldelites.model.Thread;
import com.zq.worldelites.model.Type;
import com.zq.worldelites.model.User;
import com.zq.worldelites.service.manage.ReplayService;
import com.zq.worldelites.service.manage.SchoolService;
import com.zq.worldelites.service.manage.ThreadService;

/**
 * 用户社区管理
 * @author Jason
 *
 */
@Controller() 
@RequestMapping("/manage/ubbs")
public class UbbsController {
	@Resource
	private ThreadService threadService;
	@Resource
	private ReplayService replayService;
	@Resource
	private SchoolService schoolService;
	
	
		/**
		 * //搜索系统
		 * @param table--实体类名
		 * @param searchType--搜索类型（实体类中）
		 * @param searchKeyWord--关键字
		 * @return
		 */
		@ResponseBody
		@RequestMapping("searchsystem")
		public String searchsystem(String table,String searchType,String searchKeyWord){
			List list=threadService.searchSystem(table, searchType, searchKeyWord);
			
			return JsonUtil.getJsonFromArray(list);
		}
	//-----------------------------------------Thread------------------------------------------------------------//
		@RequestMapping("thread")
		public void thread(){
			
		}
		
		@ResponseBody
		@RequestMapping("getAllUserJson")
		public String getAllUserJson(){
			List<User> list = threadService.getAllUserJson();
			
			return JsonUtil.getJsonFromArray(list);
		}
		
		@ResponseBody
		@RequestMapping("getThreadList")
		public String getThreadList(int page,int rows){
			HashMap hm=threadService.getPageList(page, rows);
			
			return JsonUtil.getJson(hm);
		}
		
		@RequestMapping("saveThread")
		public String saveThread(String ctime_as,Thread thread,HttpServletRequest request){
			thread.setCtime(DateUtil.getDateFromStr(ctime_as, "yyyy-MM-dd hh:mm:ss"));
			thread.setUtime(new Date());
			thread.setBtime(new Date());
			thread.setEtime(new Date());
			thread.setReplaytime(new Date());
			if(thread.getSsid()==null||thread.getSsid()==0)
				thread.setSsid(threadService.getMaxSsid("Thread")+1);
			threadService.save(thread);
			
			return "redirect:thread.html";
		}
		
		@ResponseBody
		@RequestMapping("getThreadById")
		public String getThreadById(int id){
			Thread thread=(Thread)threadService.getById("Thread",id);
			
			return JsonUtil.getJsonFormatDateFromObject(thread);
		}
		
		@RequestMapping("updateThread")
		public String updateProduct(String ctime_es,Thread thread,HttpServletRequest request){
			thread.setCtime(DateUtil.getDateFromStr(ctime_es, "yyyy-MM-dd hh:mm:ss"));
			thread.setUtime(new Date());
			thread.setBtime(new Date());
			thread.setEtime(new Date());
			thread.setReplaytime(new Date());
			threadService.update(thread);
			return "redirect:thread.html";
		}
		
		@ResponseBody
		@RequestMapping("delThreadById")
		public int delThreadById(int id){
			
			return threadService.delete("Thread",id);
		}
		
		@ResponseBody
		@RequestMapping("getAllTypeJsonForThread")
		public String getAllTypeJsonForThread(){
			List<Type> list=threadService.find("from Type t", 0, 100);
			
			return JsonUtil.getJsonFormatDateFromArray(list);
		}
		
		@ResponseBody
		@RequestMapping("getAllSchoolList")
		public String getAllSchoolList(){
			List<School> list=schoolService.getAllSchoolList();
			
			return JsonUtil.getJsonFromArray(list);
		}
		
		
		@ResponseBody
		@RequestMapping("getAllThreadTagList")
		public String getAllThreadTagList(){
			List<Menu> list=schoolService.getAllThradTag();
			
			return JsonUtil.getJsonFromArray(list);
		}

//-----------------------------------------Replay------------------------------------------------------------//
	@RequestMapping("replay")
	public void replay(){
		
	}
	
	@ResponseBody
	@RequestMapping("getReplayList")
	public String getReplayList(int page,int rows){
		HashMap hm=replayService.getPageList(page, rows);
		
		return JsonUtil.getJson(hm);
	}
	
	@RequestMapping("saveReplay")
	public String saveReplay(String ctime_as,String utime_as,String btime_as,String etime_as,Replay replay,HttpServletRequest request){
		replay.setCtime(DateUtil.getDateFromStr(ctime_as, "yyyy-MM-dd hh:mm:ss"));
		replay.setUtime(DateUtil.getDateFromStr(utime_as, "yyyy-MM-dd hh:mm:ss"));
		replay.setBtime(DateUtil.getDateFromStr(btime_as, "yyyy-MM-dd hh:mm:ss"));
		replay.setEtime(DateUtil.getDateFromStr(etime_as, "yyyy-MM-dd hh:mm:ss"));
		if(replay.getSsid()==null||replay.getSsid()==0)
			replay.setSsid(replayService.getMaxSsid("Replay")+1);
		replayService.save(replay);
		
		return "redirect:replay.html";
	}
	
	@ResponseBody
	@RequestMapping("getReplayById")
	public String getReplayById(int id){
		Replay replay=(Replay)replayService.getById("Replay",id);
		
		return JsonUtil.getJsonFormatDateFromObject(replay);
	}
	
	@RequestMapping("updateReplay")
	public String updateProduct(String ctime_es,String utime_es,String btime_es,String etime_es,Replay replay,HttpServletRequest request){
		replay.setCtime(DateUtil.getDateFromStr(ctime_es, "yyyy-MM-dd hh:mm:ss"));
		replay.setUtime(DateUtil.getDateFromStr(utime_es, "yyyy-MM-dd hh:mm:ss"));
		replay.setBtime(DateUtil.getDateFromStr(btime_es, "yyyy-MM-dd hh:mm:ss"));
		replay.setEtime(DateUtil.getDateFromStr(etime_es, "yyyy-MM-dd hh:mm:ss"));
		replayService.update(replay);
		return "redirect:replay.html";
	}
	
	@ResponseBody
	@RequestMapping("delReplayById")
	public int delReplayById(int id){
		
		return replayService.delete("Replay",id);
	}
	
	@ResponseBody
	@RequestMapping("getAllThreadJsonForReplay")
	public String getAllThreadJsonForReplay(){
		List<Thread> list=replayService.find("from Thread t",0,10);
		
		return JsonUtil.getJsonFormatDateFromArray(list);
	}
	
}
