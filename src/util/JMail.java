package util;

import com.ykmaiz.mail.MailSupport;

public class JMail {
	/**
	 * 发送邮件
	 * @param sendToMail
	 * @param title
	 * @param content
	 */

	public static void sendMail(String sendToMail,String title,String content) { 
        MailSupport mailSupport = new MailSupport("smtp.163.com", "13240444875", "nizaidaohao!", false); 
        mailSupport.send("13240444875@163.com",sendToMail,title,content);
        
	}
	
}
