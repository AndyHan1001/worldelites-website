package util;

import java.util.Random;

public class RandomUtil {

	/**
	 * 生成随机数
	 * @param range 范围  0-range
	 * @return
	 */
	public static int getRandom(int range){
		return (int)(Math.random()*range);
	}
	
	/**
	 * 生成随机字符串
	 * @param length	生成的字符串长度
	 * @return
	 */
	public static String getRandomString(int length) {
		String base = "abcdefghijklmnopqrstuvwxyz0123456789";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			int number = random.nextInt(base.length());
			sb.append(base.charAt(number));
		}
		return sb.toString();
	}
	
	
}
