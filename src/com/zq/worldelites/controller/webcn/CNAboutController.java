package com.zq.worldelites.controller.webcn;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import util.Constants;
import util.StringUtil;

import com.zq.worldelites.model.Article;
import com.zq.worldelites.service.web.AboutService;

@Controller() 
@RequestMapping("/about_cn")
public class CNAboutController{
	@Resource
	private AboutService aboutService;
	
	@RequestMapping("about")
	public void About(Model model,String id){
		List<Article> aboutList=aboutService.getAboutList();
		model.addAttribute("aboutlist", aboutList);
		if(StringUtil.isNullOrEmpty(id)&&aboutList.size()>0){
			id=String.valueOf(aboutList.get(0).getId());
		}
		
		model.addAttribute("classid", id);
		
		List<Article> aboutOneContent=aboutService.getAboutOneContent(id);
		model.addAttribute("aboutonecontent", aboutOneContent);
		
	}

	@RequestMapping("joinus")
	public void JoinUs(Model model,String id){
		List<Article> joinusList=aboutService.getJoinUsList();
		model.addAttribute("joinuslist", joinusList);
		
		if(StringUtil.isNullOrEmpty(id)&&joinusList.size()>0){
			id=String.valueOf(joinusList.get(0).getId());
		}
		
		model.addAttribute("classid", id);
		
		List<Article> joinUsOneContent=aboutService.getJoinUsOneContent(id);
		model.addAttribute("joinusonecontent", joinUsOneContent);
		
		//附加的文章
		List<Article> othersArticle=aboutService.getOthersArticleByType(Constants.JOIN_ARTICLE);
		model.addAttribute("othersarticle", othersArticle);
	}
	
	@RequestMapping("joinsshow")
	public void JoinUsshow(Model model,String id,Integer articleid){
		List<Article> joinusList=aboutService.getJoinUsList();
		model.addAttribute("joinuslist", joinusList);
		
		model.addAttribute("classid", id);
		
		Article article=aboutService.getArticleById(articleid);
		model.addAttribute("article", article);
		
	}
	
	//输出文章的方法
	@RequestMapping("help")
	public void Help(Model model,String id){
		List<Article> helpList=aboutService.getHelpList();
		model.addAttribute("helplist", helpList);
		
		model.addAttribute("classid", id);
		
		List<Article> helpOneContent=aboutService.getHelpOneContent(id);
		model.addAttribute("helponecontent", helpOneContent);
	}
	
	@RequestMapping("article")
	public void Article(Model model,String id){
		List<Article> articleList=aboutService.getArticleList();
		model.addAttribute("articlelist", articleList);
		
		model.addAttribute("classid", id);
		
		List<Article> articleOneContent=aboutService.getArticleOneContent(id);
		model.addAttribute("articleonecontent", articleOneContent);
		
	}
	@RequestMapping("partnership")
	public void Partnership(Model model,Integer id){
		List<Article> partnershipList=aboutService.getPartnershipList();
		model.addAttribute("partnershiplist", partnershipList);
		
		if(id==null&&partnershipList.size()>0){
			id=partnershipList.get(0).getId();
		}
		
		model.addAttribute("classid", id);
		
		List<Article> partnershipOneContent=aboutService.getPartnershipOneContent(id);
		model.addAttribute("partnershiponecontent", partnershipOneContent);
		
	}
	
}
