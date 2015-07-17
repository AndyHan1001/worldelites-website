package com.zq.worldelites.controller.manage;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import util.IOUtil;

@Controller()
@RequestMapping("upload")
public class UploadController {
	
	@RequestMapping("uploadfile")
	public void uploadfile(HttpServletRequest request,Model model,HttpSession session){
		String chl=request.getParameter("chl");
		if(chl==null||chl=="")
			chl="coupon";
		model.addAttribute("chl",chl);
		session.setAttribute("chl",chl);
		
	}
	
	//上传的四个附件
	@RequestMapping("uploadfile1")
	public void uploadfile1(HttpServletRequest request,Model model,HttpSession session){
	}
	
	@RequestMapping("uploadfile2")
	public void uploadfile2(HttpServletRequest request,Model model,HttpSession session){
	}
	
	@RequestMapping("uploadfile3")
	public void uploadfile3(HttpServletRequest request,Model model,HttpSession session){
	}
	
	@RequestMapping("uploadfile4")
	public void uploadfile4(HttpServletRequest request,Model model,HttpSession session){
	}
	
	@RequestMapping("uploadfile5")
	public void uploadfile5(HttpServletRequest request,Model model,HttpSession session){
	}
	
	@RequestMapping("uploadf1")
	public void uploadf1(@RequestParam MultipartFile uploadFile,HttpServletRequest request,HttpSession session, Model model){
		long size=uploadFile.getSize();
		if(size>5000000){
			model.addAttribute("fileName","long");
		}else{
			String filename = uploadFile.getOriginalFilename();
			Integer a=filename.lastIndexOf(".");
			String fileExp=filename.substring(a,filename.length());
			if(!this.fileType(fileExp)){
				model.addAttribute("fileName","type");
			}else{
				/*String fileNewName=Calendar.getInstance().getTimeInMillis()+fileExp;旧的命名规范*/
				String firstname = request.getParameter("firstname");
				String lastname = request.getParameter("lastname");
				String fileNewName = "WE Housing_"+firstname.toUpperCase()+" "+lastname.toUpperCase()+"_Passport"+fileExp;//新的命名规范
				IOUtil.upload(uploadFile, session, "/fileupload/files", fileNewName);
				model.addAttribute("fileName",fileNewName);
				model.addAttribute("fileOldName",filename);
			}
		}
    		
    }
	
	@RequestMapping("uploadf2")
	public void uploadf2(@RequestParam MultipartFile uploadFile,HttpServletRequest request,HttpSession session, Model model){
		long size=uploadFile.getSize();
		if(size>5000000){
			model.addAttribute("fileName","long");
		}else{
			String filename = uploadFile.getOriginalFilename();
			Integer a=filename.lastIndexOf(".");
			String fileExp=filename.substring(a,filename.length());
			if(!this.fileType(fileExp)){
				model.addAttribute("fileName","type");
			}else{
				/*String fileNewName=Calendar.getInstance().getTimeInMillis()+fileExp;旧的命名规范*/
				String firstname = request.getParameter("firstname");
				String lastname = request.getParameter("lastname");
				String fileNewName = "WE Housing_"+firstname.toUpperCase()+" "+lastname.toUpperCase()+"_I-20 DS2109"+fileExp;//新的命名规范
				IOUtil.upload(uploadFile, session, "/fileupload/files", fileNewName);
				model.addAttribute("fileName",fileNewName);
				model.addAttribute("fileOldName",filename);
			}
		}
    		
    }
	
	@RequestMapping("uploadf3")
	public void uploadf3(@RequestParam MultipartFile uploadFile,HttpServletRequest request,HttpSession session, Model model){
		long size=uploadFile.getSize();
		if(size>5000000){
			model.addAttribute("fileName","long");
		}else{
			String filename = uploadFile.getOriginalFilename();
			Integer a=filename.lastIndexOf(".");
			String fileExp=filename.substring(a,filename.length());
			if(!this.fileType(fileExp)){
				model.addAttribute("fileName","type");
			}else{
				/*String fileNewName=Calendar.getInstance().getTimeInMillis()+fileExp;旧的命名规范*/
				String firstname = request.getParameter("firstname");
				String lastname = request.getParameter("lastname");
				String fileNewName = "WE Housing_"+firstname.toUpperCase()+" "+lastname.toUpperCase()+"_VISA"+fileExp;//新的命名规范
				IOUtil.upload(uploadFile, session, "/fileupload/files", fileNewName);
				model.addAttribute("fileName",fileNewName);
				model.addAttribute("fileOldName",filename);
			}
		}
    		
    }
	
	@RequestMapping("uploadf4")
	public void uploadf4(@RequestParam MultipartFile uploadFile,HttpServletRequest request,HttpSession session, Model model){
		long size=uploadFile.getSize();
		if(size>5000000){
			model.addAttribute("fileName","long");
		}else{
			String filename = uploadFile.getOriginalFilename();
			Integer a=filename.lastIndexOf(".");
			String fileExp=filename.substring(a,filename.length());
			if(!this.fileType(fileExp)){
				model.addAttribute("fileName","type");
			}else{
				/*String fileNewName=Calendar.getInstance().getTimeInMillis()+fileExp;旧的命名规范*/
				String firstname = request.getParameter("firstname");
				String lastname = request.getParameter("lastname");
				String fileNewName = "WE Housing_"+firstname.toUpperCase()+" "+lastname.toUpperCase()+"_Others"+fileExp;//新的命名规范
				IOUtil.upload(uploadFile, session, "/fileupload/files", fileNewName);
				model.addAttribute("fileName",fileNewName);
				model.addAttribute("fileOldName",filename);
			}
		}
    		
    }
	
	@RequestMapping("uploadf5")
	public void uploadf5(@RequestParam MultipartFile uploadFile,HttpServletRequest request,HttpSession session, Model model){
		long size=uploadFile.getSize();
		if(size>5000000){
			model.addAttribute("fileName","long");
		}else{
			String filename = uploadFile.getOriginalFilename();
			Integer a=filename.lastIndexOf(".");
			String fileExp=filename.substring(a,filename.length());
			if(!this.fileType(fileExp)){
				model.addAttribute("fileName","type");
			}else{
				/*String fileNewName=Calendar.getInstance().getTimeInMillis()+fileExp;旧的命名规范*/
				String firstname = request.getParameter("firstname");
				String lastname = request.getParameter("lastname");
				String fileNewName = "WE Housing_"+firstname.toUpperCase()+" "+lastname.toUpperCase()+"_Coupon"+fileExp;//新的命名规范
				IOUtil.upload(uploadFile, session, "/fileupload/files", fileNewName);
				model.addAttribute("fileName",fileNewName);
				model.addAttribute("fileOldName",filename);
			}
		}
    		
    }
	//end
	
	public boolean fileType(String exp){//附件上传的 可用后缀--
		String[] expArr=new String[]{".bmp",".jpg",".jpeg",".png",".gif",".pdf",".BMP",".JPG",".JPEG",".PNG",".GIF",".PDF"};
		for(String one:expArr){
			if(exp.equals(one)){
				return true;
			}
		}
		return false;
	}
	
	@RequestMapping("uploadfiletest")
	public void uploadfiletest(){
		
	}
	
	@RequestMapping("uploadf")
	public void uploadf(@RequestParam MultipartFile uploadFile,HttpSession session, Model model){
			String filename = uploadFile.getOriginalFilename();
			
			Integer a=filename.lastIndexOf(".");
			String fileExp=filename.substring(filename.length()-a,filename.length());
			String fileNewName=Calendar.getInstance().getTimeInMillis()+fileExp;
	 		IOUtil.upload(uploadFile, session, "/fileupload/files", fileNewName);
    		model.addAttribute("fileName",fileNewName);
    		
    }
	
	@RequestMapping("uploadpicstest")
	public void uploadpicstest(HttpSession session){
		session.setAttribute("ufn", null);
	}
	
	@RequestMapping("uploadpics")
	public void uploadpics(HttpSession session, Model model){
		//session.setAttribute("ufn", null);
	}
	@RequestMapping("uploadlogo")
	public void uploadlogo(HttpServletRequest request,Model model ){
		String act=request.getParameter("act");
		model.addAttribute("act",act);
	}
	@RequestMapping("uploadonepicok")
	public void uploadonepicok(){
		
	}
	@RequestMapping("uploadp")
	public void uploadp(@RequestParam MultipartFile uploadFile,
			HttpServletRequest request,HttpServletResponse response,
			HttpSession session) throws ServletException, IOException{
		List<String> uploadFileNameList = new ArrayList<String>();
		String uploadPicName = request.getParameter("uploadPicName");
		String act = request.getParameter("act");

		if("add".equals(act)){
			File targetFile = null;
			try {
				IOUtil.upload(uploadFile, session, "/fileupload/images", uploadPicName);
				
				if(session.getAttribute("ufn") == null){
					uploadFileNameList.add(0, uploadPicName);
					session.setAttribute("ufn", uploadFileNameList);
				}else{
					
					uploadFileNameList = (List<String>) session.getAttribute("ufn");
					uploadFileNameList.add(uploadFileNameList.size(), uploadPicName);
					session.setAttribute("ufn", uploadFileNameList);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if("del".equals(act)){
			uploadFileNameList = (List<String>) session.getAttribute("ufn");
			int i = 0;
			int j = 0;
			for(String s:uploadFileNameList){
				if(s.equals(uploadPicName)||s==uploadPicName){
					j = i;
				}
				i++;
			}
			uploadFileNameList.remove(j);
			if(uploadFileNameList.size()<1)
			{
				session.setAttribute("ufn", null);
			}else{
				session.setAttribute("ufn", uploadFileNameList);
			}
			
		}
		
			//request.setAttribute("upPic", uploadPicName);
		//	request.setAttribute("isOk", 100);
		request.getRequestDispatcher("uploadpics.html").forward(request,response);

    }
	
	
	@RequestMapping("uploadonepic")
	public void uploadonepic(@RequestParam MultipartFile uploadFile,HttpServletRequest request,HttpServletResponse response,HttpSession session, Model model){
			//String filename = uploadFile.getOriginalFilename();
			String uploadPicName = request.getParameter("uploadPicName");
			String act=request.getParameter("act");
	 		IOUtil.upload(uploadFile, session, "/fileupload/images", uploadPicName);
    		request.setAttribute("logo", uploadPicName);
    		request.setAttribute("act",act);
    		try {
				request.getRequestDispatcher("uploadonepicok.html").forward(request,response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    }
}
