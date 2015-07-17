package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * 
 * @ClassName: SimpleAuthenticator
 * @Description: jmail的验证信息,包含用户名和密码
 * @author xx
 * @date 2014年12月30日 下午2:31:58
 * 
 */
class SimpleAuthenticator extends Authenticator {
	private String user;
	private String pwd;

	public SimpleAuthenticator(String user, String pwd) {
		this.user = user;
		this.pwd = pwd;
	}

	@Override
	protected final PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(user, pwd);
	}
}
