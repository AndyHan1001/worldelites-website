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

import com.zq.worldelites.model.Article;
import com.zq.worldelites.model.Atlas;
import com.zq.worldelites.model.Comment;
import com.zq.worldelites.model.Picture;
import com.zq.worldelites.service.manage.ArticleService;
import com.zq.worldelites.service.manage.AtlasService;
import com.zq.worldelites.service.manage.ColumnService;
import com.zq.worldelites.service.manage.CommentService;
import com.zq.worldelites.service.manage.PictureService;

/**
 * 文章管理
 * @author Jason
 *
 */
@Controller() 
@RequestMapping("/manage/docs")
public class DocsController {

	@Resource
	private ArticleService articleService;
	@Resource
	private ColumnService columnService;
	@Resource
	private CommentService commentService;
	@Resource
	private PictureService pictureService;
	@Resource
	private AtlasService atlasService;
	
	
	
	
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
		List list=articleService.searchSystem(table, searchType, searchKeyWord);
		
		return JsonUtil.getJsonFromArray(list);
	}
//-----------------------------------  Article  -----------------------------------------------------//
	
	@RequestMapping("article")
	public void article(){
		
	}
	
	@ResponseBody
	@RequestMapping("getArticleList")
	public String getArticleList(int page,int rows){
		HashMap hm=articleService.getPageList(page, rows);
		return JsonUtil.getJson(hm);
	}
	
	@RequestMapping("saveArticle")
	public String saveArticle(Article article,HttpServletRequest request){
		article.setCtime(new Date());
		article.setUtime(new Date());
		article.setBtime(new Date());
		article.setEtime(new Date());
		
		if(article.getSsid()==null||article.getSsid()==0)
			article.setSsid(articleService.getMaxSsid("Article")+1);
		articleService.save(article);
		
		return "redirect:article.html";
	}
	
	@ResponseBody
	@RequestMapping("getArticleById")
	public String getArticleById(int id){
		Article article=(Article)articleService.getById("Article",id);
		return JsonUtil.getJsonFormatDateFromObject(article);
	}
	
	@RequestMapping("updateArticle")
	public String updateArticle(Article article,HttpServletRequest request){
		article.setCtime(new Date());
		article.setUtime(new Date());
		article.setBtime(new Date());
		article.setEtime(new Date());
		articleService.update(article);
		return "redirect:article.html";
	}
	
	@ResponseBody
	@RequestMapping("delArticleById")
	public int delArticleById(int id){
		return articleService.delete("Article",id);
	}
	
	
//-----------------------------------  Comment  -----------------------------------------------------//
	@RequestMapping("comment")
	public void comment(){
		
	}
	
	@ResponseBody
	@RequestMapping("getCommentList")
	public String getCommentList(int page,int rows){
		HashMap hm=commentService.getPageList(page, rows);
		
		return JsonUtil.getJson(hm);
	}
	
	@RequestMapping("saveComment")
	public String saveComment(String ctime_as,String utime_as,String btime_as,String etime_as,Comment comment,HttpServletRequest request){
		comment.setCtime(DateUtil.getDateFromStr(ctime_as, "yyyy-MM-dd hh:mm:ss"));
		comment.setUtime(DateUtil.getDateFromStr(utime_as, "yyyy-MM-dd hh:mm:ss"));
		comment.setBtime(DateUtil.getDateFromStr(btime_as, "yyyy-MM-dd hh:mm:ss"));
		comment.setEtime(DateUtil.getDateFromStr(etime_as, "yyyy-MM-dd hh:mm:ss"));
		if(comment.getSsid()==null||comment.getSsid()==0)
			comment.setSsid(commentService.getMaxSsid("Comment")+1);
		commentService.save(comment);
		
		return "redirect:comment.html";
	}
	
	@ResponseBody
	@RequestMapping("getCommentById")
	public String getCommentById(int id){
		Comment comment=(Comment)commentService.getById("Comment",id);
	
		return JsonUtil.getJsonFormatDateFromObject(comment);
	}
	
	@RequestMapping("updateComment")
	public String updateComment(String ctime_es,String utime_es,String btime_es,String etime_es,Comment comment,HttpServletRequest request){
		comment.setCtime(DateUtil.getDateFromStr(ctime_es, "yyyy-MM-dd hh:mm:ss"));
		comment.setUtime(DateUtil.getDateFromStr(utime_es, "yyyy-MM-dd hh:mm:ss"));
		comment.setBtime(DateUtil.getDateFromStr(btime_es, "yyyy-MM-dd hh:mm:ss"));
		comment.setEtime(DateUtil.getDateFromStr(etime_es, "yyyy-MM-dd hh:mm:ss"));
		commentService.update(comment);
		return "redirect:comment.html";
		
	}
	
	@ResponseBody
	@RequestMapping("delCommentById")
	public int delCommentById(int id){
		
		return commentService.delete("Comment",id);
	}
//-----------------------------------  Picture  -----------------------------------------------------//
	@RequestMapping("picture")
	public void picture(){
		
	}
	
	@ResponseBody
	@RequestMapping("getPictureList")
	public String getPictureList(int page,int rows){
		HashMap hm=pictureService.getPageList(page, rows);
		
		return JsonUtil.getJson(hm);
	}
	
	@RequestMapping("savePicture")
	public String savePicture(String ctime_as,String utime_as,String btime_as,String etime_as,Picture picture,HttpServletRequest request){
		picture.setCtime(DateUtil.getDateFromStr(ctime_as, "yyyy-MM-dd hh:mm:ss"));
		picture.setUtime(DateUtil.getDateFromStr(utime_as, "yyyy-MM-dd hh:mm:ss"));
		picture.setBtime(DateUtil.getDateFromStr(btime_as, "yyyy-MM-dd hh:mm:ss"));
		picture.setEtime(DateUtil.getDateFromStr(etime_as, "yyyy-MM-dd hh:mm:ss"));
		if(picture.getSsid()==null||picture.getSsid()==0)
			picture.setSsid(pictureService.getMaxSsid("Picture")+1);
		pictureService.save(picture);
		return "redirect:picture.html";
	}
	
	@ResponseBody
	@RequestMapping("getPictureById")
	public String getPictureById(int id){
		Picture picture=(Picture)pictureService.getById("Picture",id);
	
		return JsonUtil.getJsonFormatDateFromObject(picture);
	}
	
	@RequestMapping("updatePicture")
	public String updatePicture(String ctime_es,String utime_es,String btime_es,String etime_es,Picture picture,HttpServletRequest request){
		picture.setCtime(DateUtil.getDateFromStr(ctime_es, "yyyy-MM-dd hh:mm:ss"));
		picture.setUtime(DateUtil.getDateFromStr(utime_es, "yyyy-MM-dd hh:mm:ss"));
		picture.setBtime(DateUtil.getDateFromStr(btime_es, "yyyy-MM-dd hh:mm:ss"));
		picture.setEtime(DateUtil.getDateFromStr(etime_es, "yyyy-MM-dd hh:mm:ss"));
		pictureService.update(picture);
		return "redirect:picture.html";
	}
	
	@ResponseBody
	@RequestMapping("delPictureById")
	public int delPictureById(int id){
		return pictureService.delete("Picture",id);
	}
	
//-----------------------------------  Atlas    -----------------------------------------------------//
	@RequestMapping("atlas")
	public void atlas(){
		
	}
	
	@ResponseBody
	@RequestMapping("getAtlasList")
	public String getAtlasList(int page,int rows){
		HashMap hm=atlasService.getPageList(page, rows);
		
		return JsonUtil.getJson(hm);
	}
	
	@RequestMapping("saveAtlas")
	public String saveAtlas(String ctime_as,String utime_as,String btime_as,String etime_as,Atlas atlas,HttpServletRequest request){
		atlas.setCtime(DateUtil.getDateFromStr(ctime_as, "yyyy-MM-dd hh:mm:ss"));
		atlas.setUtime(DateUtil.getDateFromStr(utime_as, "yyyy-MM-dd hh:mm:ss"));
		atlas.setBtime(DateUtil.getDateFromStr(btime_as, "yyyy-MM-dd hh:mm:ss"));
		atlas.setEtime(DateUtil.getDateFromStr(etime_as, "yyyy-MM-dd hh:mm:ss"));
		if(atlas.getSsid()==null||atlas.getSsid()==0)
			atlas.setSsid(atlasService.getMaxSsid("Atlas")+1);
		atlasService.save(atlas);
		return "redirect:atlas.html";
	}
	
	@ResponseBody
	@RequestMapping("getAtlasById")
	public String getAtlasById(int id){
		Atlas atlas=(Atlas)atlasService.getById("Atlas",id);

		return JsonUtil.getJsonFormatDateFromObject(atlas);
	}
	
	@RequestMapping("updateAtlas")
	public String updateAtlas(String ctime_es,String utime_es,String btime_es,String etime_es,Atlas atlas,HttpServletRequest request){
		atlas.setCtime(DateUtil.getDateFromStr(ctime_es, "yyyy-MM-dd hh:mm:ss"));
		atlas.setUtime(DateUtil.getDateFromStr(utime_es, "yyyy-MM-dd hh:mm:ss"));
		atlas.setBtime(DateUtil.getDateFromStr(btime_es, "yyyy-MM-dd hh:mm:ss"));
		atlas.setEtime(DateUtil.getDateFromStr(etime_es, "yyyy-MM-dd hh:mm:ss"));
		atlasService.update(atlas);
		return "redirect:atlas.html";
	}
	
	@ResponseBody
	@RequestMapping("delAtlasById")
	public int delAtlasById(int id){
		return atlasService.delete("Atlas",id);
	}
	
//-----------------------------------  column  -----------------------------------------------------//

	@RequestMapping("column")
	public void column(){
		
	}
	
	@ResponseBody
	@RequestMapping("getColumnList")
	public String getColumnList(int page,int rows){
		HashMap hm=columnService.getPageList(page, rows);
		return JsonUtil.getJson(hm);
	}
	
	@RequestMapping("saveColumn")
	public String saveColumn(Article article,HttpServletRequest request){
		article.setCtime(new Date());
		article.setUtime(new Date());
		article.setBtime(new Date());
		article.setEtime(new Date());
		article.setIsdel(8);
		if(article.getSsid()==null||article.getSsid()==0)
			article.setSsid(articleService.getMaxSsid("Article")+1);
		articleService.save(article);
		
		return "redirect:column.html";
	}
	
	@ResponseBody
	@RequestMapping("getColumnById")
	public String getColumnById(int id){
		Article column=(Article)columnService.getById(id);
		return JsonUtil.getJsonFormatDateFromObject(column);
	}
	
	@RequestMapping("updateColumn")
	public String updateColumn(Article article,HttpServletRequest request){
		article.setCtime(new Date());
		article.setUtime(new Date());
		article.setBtime(new Date());
		article.setEtime(new Date());
		article.setIsdel(8);
		columnService.update(article);
		return "redirect:column.html";
	}

}
