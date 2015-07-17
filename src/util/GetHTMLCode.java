package util;
import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;

public class GetHTMLCode {
	
	public static void main(String[] args) throws Exception {
		GetHTMLCode getHTMLCode=new GetHTMLCode();
		String re=getHTMLCode.getHTML("http://www.baidu.com");
		System.out.println(re);
	}

	public String getHTML(String urlString) throws Exception {
	URL url = new URL(urlString);

	URLConnection conn = url.openConnection();//获得UrlConnection 连接对象

	InputStream is = conn.getInputStream();//获得输入流
	// isr = new InputStreamReader(System.in);//system.in标准系统输入
	BufferedReader br = new BufferedReader(new InputStreamReader(is));//buffered表示缓冲类
	String str;
	StringBuffer s=new StringBuffer();
	while(null!=(str = br.readLine())){
	s.append(str);
	}
	br.close();
	is.close();
	return s.toString();
	/*// InputStream is = url.openStream();
	OutputStream os = new FileOutputStream("D:\\html.txt");
	byte[] buffer = new byte[2048];
	int length = 0;
	while(-1 !=(length=is.read(buffer,0,buffer.length))){
	os.write(buffer,0,length);
	System.out.println(is.read());
	}*/
	/*os.close();*/

	}
}
