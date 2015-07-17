package util;

import java.util.Date;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.codehaus.jackson.map.ObjectMapper;

public class JsonUtil {
	/**
	 * 解读json串
	 * @param jsonStr
	 * @param ifCharset 是否设置字符集  0为不设置 大于0为设置   全英文不需要设置
	 * @return	
	 * 读取Map中值  例：String accessToken = map.get("access_token").toString();
	 */
	public static Map readJson(String jsonStr,int ifCharset){
		ObjectMapper mapper = new ObjectMapper();
		Map map = null;
		try {
			if(ifCharset>0){
				jsonStr = new String(jsonStr.getBytes("ISO-8859-1"),"utf-8");
			}
			map = mapper.readValue(jsonStr, Map.class);
		} catch (Exception e) {
			map = null;
			e.printStackTrace();
		}
		return map;
	}
	
	public static String getJson(Object object){
		if(object == null)
			return null;
		JSONObject json = JSONObject.fromObject(object);
		return json.toString();
	}
	
	public static String getJsonFromArray(Object object){
		if(object == null)
			return null;
		JSONArray json = JSONArray.fromObject(object);
		return json.toString();
	}
	
	
	/**
	 * 向前台抛出json数据的时候可以用此方法  
	 * @param object	Array数组  List
	 * @return
	 */
	public static String getJsonFormatDateFromArray(Object object){
		if(object == null)
			return "";
		JsonConfig jsonConfig = new JsonConfig();

		// 璁剧疆javabean涓棩鏈熻浆鎹㈡椂鐨勬牸寮�
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor("yyyy-MM-dd'T'HH:mm:ss"));
		// 鑾峰彇json鏁扮粍
		JSONArray jsonArray = JSONArray.fromObject(object, jsonConfig);
		
		return jsonArray.toString();
	}
	
	/**
	 * 向前台抛出json数据的时候可以使用此方法
	 * @param object	单个实体类	Map HashMap Entity
	 * @return
	 */
	public static String getJsonFormatDateFromObject(Object object){
		if(object == null)
			return "";
		JsonConfig jsonConfig = new JsonConfig();

		// 璁剧疆javabean涓棩鏈熻浆鎹㈡椂鐨勬牸寮�
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss"));
		// 鑾峰彇json鏁扮粍
		JSONObject jsonObject = JSONObject.fromObject(object, jsonConfig);
		
		return jsonObject.toString();
	}
}
