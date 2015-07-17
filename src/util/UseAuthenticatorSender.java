package util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * 
 * @ClassName: UseAuthenticatorSender
 * @Description: 邮件发送类
 * @author hiylo
 * @date 2014年12月30日 下午2:32:34
 * 
 */
@Component("useAuthenticatorSender")
public final class UseAuthenticatorSender {
	private String smtpServer;
	private String from;
	private String username;
	private String password;
	private String subject;
	private String protocol;

	/**
	 * 邮件发送系统
	 * @param to-接收方的邮箱地址
	 * @param title-邮件标题
	 * @param body-邮件内容
	 * @param mailType-邮件类型-使用于那种邮件模板-coupon？user？order、
	 * @param couponName-如果是coupon-那么他的名字是什么
	 */
	public final void sendMail(String to,String title, String body,Integer mailType,String couponName) throws Exception {
		init(mailType);
			
		Properties props = new Properties();
		Authenticator auth = new SimpleAuthenticator(username, password);
		props.setProperty("mail.transport.protocol", protocol);
		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.host", smtpServer);
		Session session = Session.getInstance(props, auth);
		session.setDebug(true);
		MimeMessage msg = new MimeMessage(session);
		msg.setFrom(new InternetAddress(from));
		msg.setRecipient(javax.mail.Message.RecipientType.TO,new InternetAddress(to));
		msg.setSubject(title);
		msg.setSentDate(new Date());
		Multipart mp = new MimeMultipart("related");
		BodyPart bodyPart = new MimeBodyPart();
		bodyPart.setDataHandler(new DataHandler(body, "text/html;charset=GBK"));
		mp.addBodyPart(bodyPart);
		if(mailType==1){
			// 添加附件的内容
			 File attachment = new File(Constants.PDF_URL+couponName);
			//File attachment = new File("c:/"+couponName);
	        if (attachment != null) {
	            BodyPart attachmentBodyPart = new MimeBodyPart();
	            DataSource source = new FileDataSource(attachment);
	            attachmentBodyPart.setDataHandler(new DataHandler(source));
	            attachmentBodyPart.setFileName(MimeUtility.encodeWord(attachment.getName()));
	            mp.addBodyPart(attachmentBodyPart);
	        }
		}
		
		msg.setContent(mp);
		Transport.send(msg);
	}
	
	/**
	 * 邮件发送系统
	 * @param to-接收方的邮箱地址
	 * @param title-邮件标题
	 * @param body-邮件内容
	 * @param mailType-邮件类型-使用于那种邮件模板-coupon？user？order、
	 * @param couponName-如果是coupon-那么他的名字是什么
	 */
	public final void sendMailForOrder(String to,String title, String body,Integer mailType,List<String> files) throws Exception {
		init(mailType);
			
		Properties props = new Properties();
		Authenticator auth = new SimpleAuthenticator(username, password);
		props.setProperty("mail.transport.protocol", protocol);
		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.host", smtpServer);
		Session session = Session.getInstance(props, auth);
		session.setDebug(true);
		MimeMessage msg = new MimeMessage(session);
		msg.setFrom(new InternetAddress(from));
		msg.setRecipient(javax.mail.Message.RecipientType.TO,new InternetAddress(to));
		msg.setSubject(title);
		msg.setSentDate(new Date());
		Multipart mp = new MimeMultipart("related");
		BodyPart bodyPart = new MimeBodyPart();
		bodyPart.setDataHandler(new DataHandler(body, "text/html;charset=GBK"));
		mp.addBodyPart(bodyPart);
		if(mailType==1){
			// 添加附件的内容
			for(String one:files){
				File attachment = new File(Constants.FILE_URL+one);
		        if (attachment != null) {
		            BodyPart attachmentBodyPart = new MimeBodyPart();
		            DataSource source = new FileDataSource(attachment);
		            attachmentBodyPart.setDataHandler(new DataHandler(source));
		            attachmentBodyPart.setFileName(MimeUtility.encodeWord(attachment.getName()));
		            mp.addBodyPart(attachmentBodyPart);
		        }
			}
		}
		
		msg.setContent(mp);
		Transport.send(msg);
	}

	/**
	 * @Title: init
	 * @Description: 初始化邮件发送的参数,从src/mail.properties读出
	 * @return void
	 * @throws
	 */
	private final void init(Integer type) {
		try {
			Properties props = new Properties();
			if(type==1){//0是support 邮箱配置。2 是订单 1 是coupon
				props.load(new FileInputStream(new File(getClass().getClassLoader().getResource("mailCoupon.properties").getPath())));
			}else{
				props.load(new FileInputStream(new File(getClass().getClassLoader().getResource("mailUser.properties").getPath())));
			}
			smtpServer = props.getProperty("smtpServer");
			from = props.getProperty("from");
			username = props.getProperty("username");
			password = props.getProperty("password");
			subject = props.getProperty("subject");
			protocol = props.getProperty("protocol");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @Title: testname
	 * @Description: 邮件发送测试方法
	 * @throws Exception
	 * @return void
	 * @throws
	 */
	public static void main(String[] arys) {
		UseAuthenticatorSender u=new UseAuthenticatorSender();
		try {
			u.sendMail("443672581@qq.com", "test", "<a src='www.baidu.com'>aaa</a>",1,"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
