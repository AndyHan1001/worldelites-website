package util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;
import java.util.ResourceBundle;


public class PropertiesUtil {
	/**
	 * 获取指定配置文件的key
	 * @param propertiesFile 文件名（不带扩展名）,如果参数为null或为空，则返回空
	 * @param key
	 * @return
	 */
	public static String getPropertiesText(String propertiesFile, String key) {
		
		if(propertiesFile==null || "".equals(propertiesFile))
			return null;
		if(key==null || "".equals(key))
			return null;

		String val = "";
		try {
			ResourceBundle resource = ResourceBundle.getBundle(propertiesFile);
			val = resource.getString(key);
			val = new String(val.getBytes("ISO-8859-1"), "utf-8");

		} catch (Exception e) {
			val = null;
		}
		return val;
	}
	/**
	 * 使用完整全部路径
	 * @param propertiesPath
	 * @param key
	 * @return
	 */
	public static String readProperties(String propertiesPath,String key){
		Properties property = new Properties();
		String value = null;
		try {
			property.load(new FileInputStream(propertiesPath));
			value = property.getProperty(key);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			return value;
		}
		
		
	}
}
