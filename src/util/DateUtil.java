package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	
	/**
	 * 将某种类型的时间格式的字符串转换为Date类型
	 * @param dateStr
	 * @param format
	 * @return
	 */
	public static Date getDateFromStr(String dateStr,String format){
		if(StringUtil.isNullOrEmpty(dateStr))
			return null;
		try {
			Date date = new SimpleDateFormat(format).parse(dateStr);
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 将时间格式化为字符串
	 * @param date			要格式化的时间
	 * @param format		要格式化的样式  yyyyMMddhhmmss
	 * @return
	 */
	public static String getDateFormat(Date date,String format){
		if(date != null && !StringUtil.isNullOrEmpty(format))
			return new SimpleDateFormat(format).format(date);
		else
			return null;
	}
	
	/**
	 * 将某种日期类型的字符串例如：格林尼治时间类型，转换为想要的某种格式的字符串例如：yyyy/MM/dd HH:mm:ss
	 * 
	 * @param dateStr
	 *            原始字符串
	 * @param formatStr
	 *            要转换为的类型格式 如：yyyy-MM-dd HH:mm:ss
	 * @return 转换完成的字符串格式，如果传入的两个值其中一个为空或者传入格式不正确引起报错等情况会返回null
	 */
	public static String formatDateStrToStr(String dateStr, String format) {
		if(!StringUtil.isNullOrEmpty(dateStr) && !StringUtil.isNullOrEmpty(format)){
			try {
				Date date = new Date(dateStr);
				return getDateFormat(date, format);
			} catch (Exception e) {
				return null;
			}
		}
		else
			return null;
	}
	
	/**
	 * 创建指定的时间类型对象
	 * @param getType创建方式   0 自己计算  1 方法内计算
	 * @param year
	 * @param month
	 * @param day
	 * @param hours 24
	 * @param minutes
	 * @param seconds
	 * @return
	 */
	public static Date getDate(int getType,int year,int month,int day,int hours,int minutes,int seconds){
		if(getType == 1){
			if(hours > 0)
				hours--;
			if(minutes > 0)
				minutes--;
			if(month > 0)
				month--;
			if(year > 1900)
				year = year - 1900;
		}
		return new Date(year, month, day, hours, minutes, seconds);
	}
	
	/**
	 * 在某个日期的基础上加减多少天
	 * @param date	某个日期对象
	 * @param day	加或减多少天   减去为负数
	 * @return
	 */
	public static Date getDateSubDay(Date date,int day){
		if(date == null)
			return null;
		if(day == 0)
			return null;
		
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DATE, day);
		return calendar.getTime();
	}
	
}
