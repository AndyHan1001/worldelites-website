package com.zq.worldelites.service.web;

import java.util.List;

import org.springframework.stereotype.Service;

import util.Constants;
import util.StringUtil;

import com.zq.worldelites.model.Article;
import com.zq.worldelites.service.manage.CommonService;

@Service("aboutService")
public class AboutService extends CommonService{
	
	public List<Article> getAboutList(){
		List<Article> list=find("from Article a where a.isdel=8 and a.type=? order by a.comment desc",Constants.ARTICLE_ABOUT);
		return list;
	}
	
	public List<Article> getAboutOneContent(String id){
		List<Article> list=null;
		if(StringUtil.isNullOrEmpty(id))
		{
			list=find("from Article a where a.isdel=8 and a.type=? order by a.utime desc",Constants.ARTICLE_ABOUT);
			
		}else{
			list=find("from Article a where a.isdel=8 and a.id=?",Integer.valueOf(id));
		}
		
		return list;
	}
	
	public List<Article> getJoinUsList(){
		List<Article> list=find("from Article a where a.isdel=8 and a.type=? order by a.comment desc",Constants.ARTICLE_JOINUS);
		return list;
	}
	
	public List<Article> getJoinUsOneContent(String id){
		List<Article> list=null;
		if(StringUtil.isNullOrEmpty(id))
		{
			list=find("from Article a where a.isdel=8 and a.type=? order by a.utime desc",Constants.ARTICLE_JOINUS);
			
		}else{
			list=find("from Article a where a.isdel=8 and a.id=?",Integer.valueOf(id));
		}
		
		return list;
	}
	
	
	
	public List<Article> getHelpList(){
		List<Article> list=find("from Article a where a.isdel=8 and a.type=? order by a.comment desc",Constants.ARTICLE_HELP);
		return list;
	}
	
	public List<Article> getHelpOneContent(String id){
		List<Article> list=null;
		if(StringUtil.isNullOrEmpty(id))
		{
			list=find("from Article a where a.isdel=8 and a.type=? order by a.utime desc",Constants.ARTICLE_HELP);
			
		}else{
			list=find("from Article a where a.isdel=8 and a.id=?",Integer.valueOf(id));
		}
		
		return list;
	}
	
	
	
	public List<Article> getArticleList(){
		List<Article> list=find("from Article a where a.isdel=0 and a.type=? order by a.utime desc",Constants.ARTICLE_TYPE_HISTORY);
		return list;
	}
	
	public List<Article> getArticleOneContent(String id){
		List<Article> list=null;
		if(StringUtil.isNullOrEmpty(id))
		{
			list=find("from Article a where a.isdel=0 and a.type=? order by a.utime desc",Constants.ARTICLE_TYPE_HISTORY);
			
		}else{
			list=find("from Article a where a.isdel=0 and a.id=?",Integer.valueOf(id));
		}
		
		return list;
	}
	
	
	
	public List<Article> getPartnershipList(){
		List<Article> list=find("from Article a where a.type=? and a.isdel=8 order by a.comment desc",Constants.ARTICLE_PARTNERSHIP);
		return list;
	}
	
	public List<Article> getPartnershipOneContent(Integer id){
		List<Article> list=null;
		if(id==null)
		{
			list=find("from Article a where  a.type=? order by a.utime desc",Constants.ARTICLE_PARTNERSHIP);
			
		}else{
			list=find("from Article a where  a.id=?",id);
		}
		
		return list;
	}
	
	public List<Article> getOthersArticleByType(String type){
		if(StringUtil.isNullOrEmpty(type))
			return null;
		List<Article> list=find("from Article a where a.isdel=0 and a.type=?",type);
		return list;
	}
	
	public Article getArticleById(Integer id){
		if(id==null)
			return null;
		Article article=(Article) findById(Article.class, id);
		if(article!=null)
			return article;
		return null;
	}
}
