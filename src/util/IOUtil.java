package util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class IOUtil {
	
	/**
	 * 打印日志的方法
	 * @param str	要打印的信息
	 * @param path	要打印的文件的路径
	 */
	public static void log(String str,String path){
		
		 try{
				BufferedWriter writer = new BufferedWriter(new FileWriter(new File(path)));
		        writer.write(str);
		        writer.flush();
		        writer.close();
		    }catch(Exception e){
		    	e.printStackTrace();
		    }
	}
	
	/**
	 * 向请求方打印信息
	 * @param response
	 * @param msg
	 */
	public static void responseOut(HttpServletResponse response,String msg){
		 response.setContentType("text/html;charset=UTF-8");
		 PrintWriter out = null;
         try {
        	 out = response.getWriter();
             out.println(msg);                      
         }catch (Exception e) {
        	 e.printStackTrace();
         }finally {   
        	out.flush();
            out.close();
        }
	}

	
	/**
	 * 基于SpringMVC框架上传图片  需要在applicationContext.xml中配置<bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver" />  
	 * 貌似也可以上传文件
	 * @param uploadFile	SpringMVC提供的封装好的工具
	 * @param session			
	 * @param picFoler	要将图片上传到哪个文件夹下
	 * @param fileName	上传图片的名字
	 * @return		如果上传成功则将fileName原样返回，如果出错则返回error
	 */
	public static String upload(MultipartFile uploadFile,HttpSession session,String picFoler,String fileName){
	  	File file = null;
			try {
				String path = session.getServletContext().getRealPath(picFoler);
				file = new File(path, fileName);
				uploadFile.transferTo(file);
			} catch (Exception e) {
				fileName = "error";
				e.printStackTrace();
			}
		return fileName;
	}
	
	/**
	 * 将本地文件以读取字节流的方式下载到客户端，注意，在网络不稳定或者网络断掉的时候会抛出IO异常，并极大可能不支持断线下载
	 * 注意 ，在客户端使用迅雷下载的时候会抛出套接字链接异常，因为迅雷下载使用套接字来支持断线下载，并且迅雷下载是多线程的，但是本方法没有加多线程，只做单线程处理，并且在本地读写完成之后会断开输出流的操作，所以不支持迅雷下载，但用迅雷是可以下载下来的。
	 * 所以此方法不抛错，在内部把客户端多次请求产生的异常内部消化掉
	 * 每次读取1024字节   可自行调节
	 * 下载文件不限制格式
	 * @param request
	 * @param response
	 * @param filePath		文件的路径   不 包括文件名    例：D:\\abcd
	 * @param fileName 文件的名称  如aaa.rar
	 * @throws IOException
	 */
	public static void redDownLoad(HttpServletRequest request,HttpServletResponse response,String filePath,String fileName){
	    response.setHeader("Content-disposition","attachment; filename="+fileName+"");
	    BufferedInputStream buffInput = null;
	    BufferedOutputStream buffout = null;
	    try{
	    	buffInput=new BufferedInputStream(new FileInputStream(filePath+File.separator+fileName));
	 	    buffout=new BufferedOutputStream(response.getOutputStream());
	 	    int length=-1;
	 	    byte[] buff=new byte[1024];
	 	    while((length=buffInput.read(buff))!=-1)
	 	    {
	 	       buffout.write(buff, 0, length);
	 	    }
	 	    buffout.flush();
	 	    buffInput.close();
	 	    buffout.close();
	    }catch(Exception e){
	    	
	    }finally{
				try {
					if(buffout!=null)
						buffout.flush();
					if(buffInput != null)
			    		buffInput.close();
			    	if(buffout != null)
			    		buffout.close();
				} catch (IOException e) {
				}
	    }
	   
	}
}
