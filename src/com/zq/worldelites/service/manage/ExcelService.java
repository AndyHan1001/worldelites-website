package com.zq.worldelites.service.manage;
	import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zq.worldelites.model.Apartment;
import com.zq.worldelites.model.Coupon;
import com.zq.worldelites.model.Geography;
import com.zq.worldelites.model.Order;
import com.zq.worldelites.model.Pay;
import com.zq.worldelites.model.Room;
import com.zq.worldelites.model.School;
import com.zq.worldelites.model.User;

@Service("excelService")
public class ExcelService  extends BaseService {
		
	@Resource
	private UserService userService;
	@Resource
	private ApartmentService apartmentService;
	
	private void outPutExcel(String fileStr, HSSFWorkbook wb,HttpServletResponse response) throws Exception{
		File file = new File(fileStr);
		// 第六步，将文件写入
		OutputStream os = new FileOutputStream(file);
		
		wb.write(os);
		os.close();
		response.setContentType("application/msexcel;charset=UTF-8");
		String fileName = file.getName();
		String nowPath = file.getPath();
		File file1 = new File(nowPath);
		response.reset();
		response.addHeader("Content-Disposition", "attachment;filename="
				.concat(String.valueOf(URLEncoder.encode(fileName, "UTF-8"))));
		response.addHeader("Content-Length", "" + file1.length());
		response.setHeader("Connection", "close");
		response.setHeader("Content-Type", "application/vnd.ms-excel");
		// 以流的形式下载文件
		try {
			InputStream fis = new BufferedInputStream(new FileInputStream(
					nowPath));
			byte[] buffer = new byte[fis.available()];
			fis.read(buffer);
			fis.close();
			OutputStream outPutStream = new BufferedOutputStream(
					response.getOutputStream());
			outPutStream.write(buffer);
			outPutStream.flush();
			outPutStream.close();
		} catch (Exception e) {
			throw e;
		}
	}
	
	/**
	 * @param 1 : user
	 * @param 2	: coupon
	 * @param 3 : school
	 * @param 4 : pay
	 * @param 5	: order
	 * @param 6	: apartment
	 * @param 7 : room
	 */
	@RequestMapping("outExcel")
	public void outExcel(HttpServletResponse response,String c[],List list,int type,String exdent) throws Exception{
		// 第一步，创建一个webbook，对应一个Excel文件
				HSSFWorkbook wb = new HSSFWorkbook();
				// 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
				HSSFSheet sheet = wb.createSheet("AssetExportExcel");
				sheet.setDefaultColumnWidth(20);
				// 第三步，在sheet中添加表头第0行
				HSSFRow row = sheet.createRow((int) 0);
				// 第四步，创建单元格，并设置值表头 设置表头居中
				HSSFCellStyle style = wb.createCellStyle();
				style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式
				String heads[] = c;
	
				for (int i = 0; i < heads.length; i++) {
					HSSFCell cell = row.createCell(i);
					cell.setCellValue(heads[i]);
					cell.setCellStyle(style);
				}
				//上方设置Excel表头已占用第一行，所以一下打印的Excel中的内容每向下一行都要加一，下标从0开始
				//转换为各自的lsit
				
				//打印Excel内容，可改为循环打印
				//判断是什么实体类
				if(type==1){
					for(int i=0;i<list.size();i++){
						row = sheet.createRow(i+1);
						User user= (User) list.get(i);
						row.createCell(0).setCellValue(user.getId()==null?00:user.getId());
						row.createCell(1).setCellValue(user.getPassport()==null?"":user.getPassport());
						row.createCell(2).setCellValue(user.getPassword()==null?"":user.getPassword());
						row.createCell(3).setCellValue(user.getNick()==null?"":user.getNick());
						row.createCell(4).setCellValue(user.getLastname()==null?"":user.getLastname());
						row.createCell(5).setCellValue(user.getName()==null?"":user.getName());
						row.createCell(6).setCellValue(user.getSex()==null?"":user.getSex());
						row.createCell(7).setCellValue(user.getBirthday()==null?"":user.getBirthday().toString());
						row.createCell(8).setCellValue(user.getNationality()==null?"":user.getNationality());
						row.createCell(9).setCellValue(user.getPassportNo()==null?"":user.getPassportNo());
						row.createCell(10).setCellValue(user.getNewschool()==null?"":user.getNewschool());
						double d=0;
						if(user.getNewschoolid()!=null){
							d=user.getNewschoolid();
						}
						row.createCell(11).setCellValue(d);
						row.createCell(12).setCellValue(user.getGrade()==null?"":user.getGrade());
						row.createCell(13).setCellValue(user.getFulltime()==null?00:user.getFulltime());
						row.createCell(14).setCellValue(user.getProfessional()==null?"":user.getProfessional());
						row.createCell(15).setCellValue(user.getOldschool()==null?"":user.getOldschool());
						row.createCell(16).setCellValue(user.getKnowweby()==null?"":user.getKnowweby());
						row.createCell(17).setCellValue(user.getAddr()==null?"":user.getAddr());
						row.createCell(18).setCellValue(user.getPrvc()==null?"":user.getPrvc());
						row.createCell(19).setCellValue(user.getCity()==null?"":user.getCity());
						row.createCell(20).setCellValue(user.getZip()==null?"":user.getZip());
						row.createCell(21).setCellValue(user.getNowstate()==null?"":user.getNowstate());
						row.createCell(22).setCellValue(user.getCountries()==null?"":user.getCountries());
						row.createCell(23).setCellValue(user.getCredit()==null?"":user.getCredit());
						row.createCell(24).setCellValue(user.getPhone()==null?"":user.getPhone());
						row.createCell(25).setCellValue(user.getMail()==null?"":user.getMail());
						row.createCell(26).setCellValue(user.getRelativesname()==null?"":user.getRelativesname());
						row.createCell(27).setCellValue(user.getRelatives()==null?"":user.getRelatives());
						row.createCell(28).setCellValue(user.getRelativesaddr()==null?"":user.getRelativesaddr());
						row.createCell(29).setCellValue(user.getRelativesprvc()==null?"":user.getRelativesprvc());
						row.createCell(30).setCellValue(user.getRelativescity()==null?"":user.getRelativescity());
						row.createCell(31).setCellValue(user.getRelativeszip()==null?"":user.getRelativeszip());
						row.createCell(32).setCellValue(user.getRelativescountries()==null?"":user.getRelativescountries());
						row.createCell(33).setCellValue(user.getRelativestel()==null?"":user.getRelativestel());
						row.createCell(34).setCellValue(user.getRelativesphone()==null?"":user.getRelativesphone());
						row.createCell(35).setCellValue(user.getRelativesmail()==null?"":user.getRelativesmail());
						row.createCell(36).setCellValue(user.getFile1()==null?"":user.getFile1());
						row.createCell(37).setCellValue(user.getFile2()==null?"":user.getFile2());
						row.createCell(38).setCellValue(user.getFile3()==null?"":user.getFile3());
						row.createCell(39).setCellValue(user.getFile4()==null?"":user.getFile4());
						row.createCell(40).setCellValue(user.getLogo()==null?"":user.getLogo());
						row.createCell(41).setCellValue(user.getHobbies()==null?"":user.getHobbies());
						row.createCell(42).setCellValue(user.getTypecode()==null?"":user.getTypecode());
						row.createCell(43).setCellValue(user.getMemo()==null?"":user.getMemo());
						row.createCell(44).setCellValue(user.getContent()==null?"":user.getContent());
						row.createCell(45).setCellValue(user.getState()==null?00:user.getState());
						row.createCell(46).setCellValue(user.getCtime()==null?"":user.getCtime().toString());
						row.createCell(47).setCellValue(user.getLogtime()==null?"":user.getLogtime().toString());
						row.createCell(48).setCellValue(user.getLoginip()==null?"":user.getLoginip());
					
					}
				}else if(type==2){//coupon
					User user = null;
					for(int i=0;i<list.size();i++){
						row = sheet.createRow(i+1);
						Coupon coupon= (Coupon) list.get(i);
						user = (User)userService.getById("User", coupon.getUserid()==null?0:coupon.getUserid());
						if(user!=null){
							coupon.setUsercountry(user.getCountries());
						}else{
							coupon.setUsercountry("N/A");
						}
						row.createCell(0).setCellValue(coupon.getId()==null?00:coupon.getId());
						row.createCell(1).setCellValue(coupon.getUserid()==null?00:coupon.getUserid());
						row.createCell(2).setCellValue(coupon.getUsername()==null?"":coupon.getUsername());
						row.createCell(3).setCellValue(coupon.getUserlastname()==null?"":coupon.getUserlastname());
						row.createCell(4).setCellValue(coupon.getUsercountry()==null?"":coupon.getUsercountry());
						
						row.createCell(5).setCellValue(coupon.getUsermail()==null?"":coupon.getUsermail());
						row.createCell(6).setCellValue(coupon.getPm()==null?"":coupon.getPm());
						row.createCell(7).setCellValue(coupon.getKnowweby()==null?"":coupon.getKnowweby());
						
						row.createCell(8).setCellValue(coupon.getCtime()==null?"":coupon.getCtime().toString());
						row.createCell(9).setCellValue(coupon.getSchoolid()==null?00:coupon.getSchoolid());
						row.createCell(10).setCellValue(coupon.getSchoolname()==null?"":coupon.getSchoolname());
						row.createCell(11).setCellValue(coupon.getApartmentid()==null?00:coupon.getApartmentid());
						row.createCell(12).setCellValue(coupon.getApartmentname()==null?"":coupon.getApartmentname());
						row.createCell(13).setCellValue(coupon.getPrice()==null?"":coupon.getPrice());
						row.createCell(14).setCellValue(coupon.getDiscountprice()==null?"":coupon.getDiscountprice());
						row.createCell(15).setCellValue(coupon.getMemo()==null?"":coupon.getMemo());
						row.createCell(16).setCellValue(coupon.getContent()==null?"":coupon.getContent());
						row.createCell(17).setCellValue(coupon.getLogo()==null?"":coupon.getLogo());
						row.createCell(18).setCellValue(coupon.getFile1()==null?"":coupon.getFile1());
						row.createCell(19).setCellValue(coupon.getFile2()==null?"":coupon.getFile2());
					}
				}else if(type==3){//sc
					Geography geography = null;
					for(int i=0;i<list.size();i++){
						row = sheet.createRow(i+1);
						School school= (School) list.get(i);
						geography = (Geography)apartmentService.getById("Geography", school.getParentid()==null?0:school.getParentid());
						if(geography!=null){
							school.setParentname(geography.getName());
						}
						row.createCell(0).setCellValue(school.getId()==null?00:school.getId());
						row.createCell(1).setCellValue(school.getMark()==null?"":school.getMark());
						row.createCell(2).setCellValue(school.getName()==null?"":school.getName());
						row.createCell(3).setCellValue(school.getMemo()==null?"":school.getMemo());
						row.createCell(4).setCellValue(school.getInfo()==null?"":school.getInfo());
						row.createCell(5).setCellValue(school.getInfo_cn()==null?"":school.getInfo_cn());
						row.createCell(6).setCellValue(school.getParentid()==null?00:school.getParentid());
						row.createCell(7).setCellValue(school.getParentname()==null?"":school.getParentname());
						row.createCell(8).setCellValue(school.getLogo()==null?"":school.getLogo());
						row.createCell(9).setCellValue(school.getAtlas()==null?"":school.getAtlas());
						row.createCell(10).setCellValue(school.getLocation()==null?"":school.getLocation());
						row.createCell(11).setCellValue(school.getSort()==null?00:school.getSort());
						row.createCell(12).setCellValue(school.getIsenable()==null?00:school.getIsenable());
					}
				}else if(type==4){//pay
					for(int i=0;i<list.size();i++){
						row = sheet.createRow(i+1);
						Pay pay= (Pay) list.get(i);
						row.createCell(0).setCellValue(pay.getId()==null?00:pay.getId());
						row.createCell(1).setCellValue(pay.getSsid()==null?00:pay.getSsid());
						row.createCell(2).setCellValue(pay.getMdid()==null?"":pay.getMdid());
						row.createCell(3).setCellValue(pay.getUserid()==null?00:pay.getUserid());
						row.createCell(4).setCellValue(pay.getUsername()==null?"":pay.getUsername());
						row.createCell(5).setCellValue(pay.getOrdermdid()==null?"":pay.getOrdermdid());
						row.createCell(6).setCellValue(pay.getOrdermemo()==null?"":pay.getOrdermemo());
						row.createCell(7).setCellValue(pay.getCtime()==null?"":pay.getCtime().toString());
						row.createCell(8).setCellValue(pay.getPayInterface()==null?"":pay.getPayInterface());
						row.createCell(9).setCellValue(pay.getNeed()==null?00:pay.getNeed());
						row.createCell(10).setCellValue(pay.getMoney()==null?00:pay.getMoney());
						row.createCell(11).setCellValue(pay.getState()==null?00:pay.getState());
						row.createCell(12).setCellValue(pay.getNote()==null?"":pay.getNote());
					}
				}else if(type==5){//order
					//   这里会有两种情况--1. idArr 的长度大于0的--单条导出 2. idArr的长度小于o的--全部导出
					//  
					
					String[] idArr = exdent.split("-");
					User user=null;
					boolean isAll=false;//是不是选择导出
					if(idArr.length<=0){
						isAll=true;//是全部
					}
					int nowRow=0;
					for(int i=0;i<list.size();i++){
						Order order= (Order) list.get(i);
						if(!isAll&&this.IsPut(idArr, order.getId()))//--函数里的作用是，如果在出过来的数组里找到了 对应的一个id。那么就不进行continue。把这条数据，输出出来
							continue;
						try {
							if(order==null)
								continue;
							user=(User) userService.getById("User", order.getUserid());
							if(user==null)
								continue;
						} catch (Exception e) {
							e.printStackTrace();
							continue;
						}
						row = sheet.createRow(nowRow+1);
						nowRow++;
						row.createCell(0).setCellValue(order.getId()==null?00:order.getId());
						row.createCell(1).setCellValue(order.getOrderid()==null?"":order.getOrderid());
						row.createCell(2).setCellValue(order.getRoomid()==null?00:order.getRoomid());
						row.createCell(3).setCellValue(order.getRoomname()==null?"":order.getRoomname());
						row.createCell(4).setCellValue(order.getLogo()==null?"":order.getLogo());
						row.createCell(5).setCellValue(order.getSchoolid()==null?00:order.getSchoolid());
						row.createCell(6).setCellValue(order.getSchoolname()==null?"":order.getSchoolname());
						row.createCell(7).setCellValue(order.getApartmentid()==null?00:order.getApartmentid());
						row.createCell(8).setCellValue(order.getApartmentname()==null?"":order.getApartmentname());
						row.createCell(9).setCellValue(order.getUserid()==null?00:order.getUserid());
						row.createCell(10).setCellValue(order.getUsername()==null?"":order.getUsername());
						row.createCell(11).setCellValue(order.getUserlastname()==null?"":order.getUserlastname());
						row.createCell(12).setCellValue(order.getUserpassportno()==null?"":order.getUserpassportno());
						row.createCell(13).setCellValue(order.getUserphone()==null?"":order.getUserphone());
						row.createCell(14).setCellValue(order.getUsermail()==null?"":order.getUsermail());
						row.createCell(15).setCellValue(order.getPrice()==null?"":order.getPrice());
						row.createCell(16).setCellValue(order.getPricenote()==null?"":order.getPricenote());
						row.createCell(17).setCellValue(order.getEntertime()==null?"":order.getEntertime());
						row.createCell(18).setCellValue(order.getLeavetime()==null?"":order.getLeavetime());
						row.createCell(19).setCellValue(order.getEndtime()==null?"":order.getEndtime());
						row.createCell(20).setCellValue(order.getSubmittime()==null?"":order.getSubmittime());
						row.createCell(21).setCellValue(order.getConfirmtime()==null?"":order.getConfirmtime());
						row.createCell(22).setCellValue(order.getSigntime()==null?"":order.getSigntime());
						row.createCell(23).setCellValue(order.getPaytime()==null?"":order.getPaytime());
						row.createCell(24).setCellValue(order.getFinishtime()==null?"":order.getFinishtime());
						row.createCell(25).setCellValue(order.getState()==null?"":order.getState());
						row.createCell(26).setCellValue(order.getStatenote()==null?"":order.getStatenote());
						row.createCell(27).setCellValue(order.getTitle()==null?"":order.getTitle());
						row.createCell(28).setCellValue(order.getContent()==null?"":order.getContent());
						//把相关的用户信息写进去
						row.createCell(29).setCellValue("用户全部信息→");
						row.createCell(30).setCellValue(user.getId()==null?00:user.getId());
						row.createCell(31).setCellValue(user.getPassport()==null?"":user.getPassport());
						row.createCell(32).setCellValue(user.getPassword()==null?"":user.getPassword());
						row.createCell(33).setCellValue(user.getNick()==null?"":user.getNick());
						row.createCell(34).setCellValue(user.getLastname()==null?"":user.getLastname());
						row.createCell(35).setCellValue(user.getName()==null?"":user.getName());
						row.createCell(36).setCellValue(user.getSex()==null?"":user.getSex());
						row.createCell(37).setCellValue(user.getBirthday()==null?"":user.getBirthday().toString());
						row.createCell(38).setCellValue(user.getNationality()==null?"":user.getNationality());
						row.createCell(39).setCellValue(user.getPassportNo()==null?"":user.getPassportNo());
						row.createCell(40).setCellValue(user.getNewschool()==null?"":user.getNewschool());
						double d=0;
						if(user.getNewschoolid()!=null){
							d=user.getNewschoolid();
						}
						row.createCell(41).setCellValue(d);
						row.createCell(42).setCellValue(user.getGrade()==null?"":user.getGrade());
						row.createCell(43).setCellValue(user.getFulltime()==null?00:user.getFulltime());
						row.createCell(44).setCellValue(user.getProfessional()==null?"":user.getProfessional());
						row.createCell(45).setCellValue(user.getOldschool()==null?"":user.getOldschool());
						row.createCell(46).setCellValue(user.getKnowweby()==null?"":user.getKnowweby());
						row.createCell(47).setCellValue(user.getAddr()==null?"":user.getAddr());
						row.createCell(48).setCellValue(user.getPrvc()==null?"":user.getPrvc());
						row.createCell(49).setCellValue(user.getCity()==null?"":user.getCity());
						row.createCell(50).setCellValue(user.getZip()==null?"":user.getZip());
						row.createCell(51).setCellValue(user.getNowstate()==null?"":user.getNowstate());
						row.createCell(52).setCellValue(user.getCountries()==null?"":user.getCountries());
						row.createCell(53).setCellValue(user.getCredit()==null?"":user.getCredit());
						row.createCell(54).setCellValue(user.getPhone()==null?"":user.getPhone());
						row.createCell(55).setCellValue(user.getMail()==null?"":user.getMail());
						row.createCell(56).setCellValue(user.getRelativesname()==null?"":user.getRelativesname());
						row.createCell(57).setCellValue(user.getRelatives()==null?"":user.getRelatives());
						row.createCell(58).setCellValue(user.getRelativesaddr()==null?"":user.getRelativesaddr());
						row.createCell(59).setCellValue(user.getRelativesprvc()==null?"":user.getRelativesprvc());
						row.createCell(60).setCellValue(user.getRelativescity()==null?"":user.getRelativescity());
						row.createCell(61).setCellValue(user.getRelativeszip()==null?"":user.getRelativeszip());
						row.createCell(62).setCellValue(user.getRelativescountries()==null?"":user.getRelativescountries());
						row.createCell(63).setCellValue(user.getRelativestel()==null?"":user.getRelativestel());
						row.createCell(64).setCellValue(user.getRelativesphone()==null?"":user.getRelativesphone());
						row.createCell(65).setCellValue(user.getRelativesmail()==null?"":user.getRelativesmail());
						row.createCell(66).setCellValue(user.getFile1()==null?"":user.getFile1());
						row.createCell(67).setCellValue(user.getFile2()==null?"":user.getFile2());
						row.createCell(68).setCellValue(user.getFile3()==null?"":user.getFile3());
						row.createCell(69).setCellValue(user.getFile4()==null?"":user.getFile4());
						row.createCell(70).setCellValue(user.getLogo()==null?"":user.getLogo());
						row.createCell(71).setCellValue(user.getHobbies()==null?"":user.getHobbies());
						row.createCell(72).setCellValue(user.getTypecode()==null?"":user.getTypecode());
						row.createCell(73).setCellValue(user.getMemo()==null?"":user.getMemo());
						row.createCell(74).setCellValue(user.getContent()==null?"":user.getContent());
						row.createCell(75).setCellValue(user.getState()==null?00:user.getState());
						row.createCell(76).setCellValue(user.getCtime()==null?"":user.getCtime().toString());
						row.createCell(77).setCellValue(user.getLogtime()==null?"":user.getLogtime().toString());
						row.createCell(78).setCellValue(user.getLoginip()==null?"":user.getLoginip());
					}
				}else if(type==6){
					School school = null;
					for(int i=0;i<list.size();i++){
						row = sheet.createRow(i+1);
						Apartment apartment= (Apartment) list.get(i);
						
						school = apartmentService.getOneSchool(apartment.getParentid()==null?0:apartment.getParentid());
						if(school!=null)
							apartment.setParentname(school.getName());
						else
							apartment.setParentname("N/A");
							
						row.createCell(0).setCellValue(apartment.getId()==null?00:apartment.getId());
						row.createCell(1).setCellValue(apartment.getMark()==null?"":apartment.getMark());
						row.createCell(2).setCellValue(apartment.getName()==null?"":apartment.getName());
						row.createCell(3).setCellValue(apartment.getNameabb()==null?"":apartment.getNameabb());
						row.createCell(4).setCellValue(apartment.getCorporation()==null?"":apartment.getCorporation());
						row.createCell(5).setCellValue(apartment.getCsname()==null?"":apartment.getCsname());
						row.createCell(6).setCellValue(apartment.getCsmail()==null?"":apartment.getCsmail());
						row.createCell(7).setCellValue(apartment.getMail()==null?"":apartment.getMail());
						row.createCell(8).setCellValue(apartment.getTel()==null?"":apartment.getTel());
						row.createCell(9).setCellValue(apartment.getFax()==null?"":apartment.getFax());
						row.createCell(10).setCellValue(apartment.getWorktime()==null?"":apartment.getWorktime());
						row.createCell(11).setCellValue(apartment.getWorktime_cn()==null?"":apartment.getWorktime_cn());
						row.createCell(12).setCellValue(apartment.getDiscount()==null?"":apartment.getDiscount());
						row.createCell(13).setCellValue(apartment.getMarketprice()==null?"":apartment.getMarketprice());
						row.createCell(14).setCellValue(apartment.getDiscounttype()==null?"":apartment.getDiscounttype());
						row.createCell(15).setCellValue(apartment.getUniquediscount()==null?"":apartment.getUniquediscount());
						row.createCell(16).setCellValue(apartment.getUniquediscount_cn()==null?"":apartment.getUniquediscount_cn());
						row.createCell(17).setCellValue(apartment.getAddr()==null?"":apartment.getAddr());
						row.createCell(18).setCellValue(apartment.getWebsite()==null?"":apartment.getWebsite());
						row.createCell(19).setCellValue(apartment.getNews()==null?"":apartment.getNews());
						row.createCell(20).setCellValue(apartment.getNews_cn()==null?"":apartment.getNews_cn());
						row.createCell(21).setCellValue(apartment.getTag()==null?"":apartment.getTag());
						row.createCell(22).setCellValue(apartment.getTag_cn()==null?"":apartment.getTag_cn());
						row.createCell(23).setCellValue(apartment.getIntroduction()==null?"":apartment.getIntroduction());
						row.createCell(24).setCellValue(apartment.getIntroduction_cn()==null?"":apartment.getIntroduction_cn());
						row.createCell(25).setCellValue(apartment.getFeature()==null?"":apartment.getFeature());
						row.createCell(26).setCellValue(apartment.getFeature_cn()==null?"":apartment.getFeature_cn());
						row.createCell(27).setCellValue(apartment.getAmenities()==null?"":apartment.getAmenities());
						row.createCell(28).setCellValue(apartment.getAmenities_cn()==null?"":apartment.getAmenities_cn());
						row.createCell(39).setCellValue(apartment.getPeripheral()==null?"":apartment.getPeripheral());
						row.createCell(30).setCellValue(apartment.getPeripheral_cn()==null?"":apartment.getPeripheral_cn());
						row.createCell(31).setCellValue(apartment.getUtility()==null?"":apartment.getUtility());
						row.createCell(32).setCellValue(apartment.getUtility_cn()==null?"":apartment.getUtility_cn());
						row.createCell(33).setCellValue(apartment.getLeasingtype()==null?"":apartment.getLeasingtype());
						row.createCell(34).setCellValue(apartment.getLeasingtype_cn()==null?"":apartment.getLeasingtype_cn());
						row.createCell(35).setCellValue(apartment.getPetpolicy()==null?"":apartment.getPetpolicy());
						row.createCell(36).setCellValue(apartment.getPetpolicy_cn()==null?"":apartment.getPetpolicy_cn());
						row.createCell(37).setCellValue(apartment.getDeposit()==null?"":apartment.getDeposit());
						row.createCell(38).setCellValue(apartment.getApplicationfee()==null?"":apartment.getApplicationfee());
						row.createCell(39).setCellValue(apartment.getApplicationfee_cn()==null?"":apartment.getApplicationfee_cn());
						row.createCell(40).setCellValue(apartment.getActivityfee()==null?"":apartment.getActivityfee());
						row.createCell(41).setCellValue(apartment.getManagementfee()==null?"":apartment.getManagementfee());
						row.createCell(42).setCellValue(apartment.getParking()==null?"":apartment.getParking());
						row.createCell(43).setCellValue(apartment.getParking_cn()==null?"":apartment.getParking_cn());
						row.createCell(44).setCellValue(apartment.getOtherfee()==null?"":apartment.getOtherfee());
						row.createCell(45).setCellValue(apartment.getOtherfee_cn()==null?"":apartment.getOtherfee_cn());
						row.createCell(46).setCellValue(apartment.getEnterearly()==null?"":apartment.getEnterearly());
						row.createCell(47).setCellValue(apartment.getEnterearly_cn()==null?"":apartment.getEnterearly_cn());
						row.createCell(48).setCellValue(apartment.getMatching()==null?"":apartment.getMatching());
						row.createCell(49).setCellValue(apartment.getMatching_cn()==null?"":apartment.getMatching_cn());
						row.createCell(50).setCellValue(apartment.getParentid()==null?00:apartment.getParentid());
						row.createCell(51).setCellValue(apartment.getParentname()==null?"":apartment.getParentname());
						row.createCell(52).setCellValue(apartment.getLogo()==null?"":apartment.getLogo());
						row.createCell(53).setCellValue(apartment.getCoupon()==null?"":apartment.getCoupon());
						row.createCell(54).setCellValue(apartment.getMemo()==null?"":apartment.getMemo());
						row.createCell(55).setCellValue(apartment.getAtlas()==null?"":apartment.getAtlas());
						row.createCell(56).setCellValue(apartment.getLocation()==null?"":apartment.getLocation());
						row.createCell(57).setCellValue(apartment.getSort()==null?00:apartment.getSort());
						row.createCell(58).setCellValue(apartment.getIfvote()==null?00:apartment.getIfvote());
						row.createCell(59).setCellValue(apartment.getIsenable()==null?00:apartment.getIsenable());
						row.createCell(60).setCellValue(apartment.getIscoupon()==null?0:apartment.getIscoupon());
						row.createCell(61).setCellValue(apartment.getIsbook()==null?0:apartment.getIsbook());
					}
				}else if(type==7){
						Apartment apartment = null;
					for(int i=0;i<list.size();i++){
						row = sheet.createRow(i+1);
						Room room= (Room) list.get(i);
						apartment = (Apartment) apartmentService.getById("Apartment", room.getParentid()==null?0:room.getParentid());
						if(apartment!=null){
							room.setParentname(apartment.getName());
						}
						row.createCell(0).setCellValue(room.getId()==null?00:room.getId());
						row.createCell(1).setCellValue(room.getMark()==null?"":room.getMark());
						row.createCell(2).setCellValue(room.getName()==null?"":room.getName());
						row.createCell(3).setCellValue(room.getArea()==null?"":room.getArea());
						row.createCell(4).setCellValue(room.getInfo()==null?"":room.getInfo());
						row.createCell(5).setCellValue(room.getInfo_cn()==null?"":room.getInfo_cn());
						row.createCell(6).setCellValue(room.getEntertime()==null?"":room.getEntertime().toString());
						row.createCell(7).setCellValue(room.getOuttime()==null?"":room.getOuttime().toString());
						row.createCell(8).setCellValue(room.getEndtime()==null?"":room.getEndtime().toString());
						row.createCell(9).setCellValue(room.getEnterlong()==null?"":room.getEnterlong());
						row.createCell(10).setCellValue(room.getEnterlong_cn()==null?"":room.getEnterlong_cn());
						row.createCell(11).setCellValue(room.getPrice()==null?"":room.getPrice());
						row.createCell(12).setCellValue(room.getDiscountprice()==null?"":room.getDiscountprice());
						row.createCell(13).setCellValue(room.getDiscountmethod()==null?"":room.getDiscountmethod());
						row.createCell(14).setCellValue(room.getDiscountmethod_cn()==null?"":room.getDiscountmethod_cn());
						row.createCell(15).setCellValue(room.getDiscount()==null?"":room.getDiscount());
						row.createCell(16).setCellValue(room.getDiscount_cn()==null?"":room.getDiscount_cn());
						row.createCell(17).setCellValue(room.getDeposit()==null?"":room.getDeposit());
						row.createCell(18).setCellValue(room.getParentid()==null?00:room.getParentid());
						row.createCell(19).setCellValue(room.getParentname()==null?"":room.getParentname());
						row.createCell(20).setCellValue(room.getLogo()==null?"":room.getLogo());
						row.createCell(21).setCellValue(room.getExpand2()==null?"":room.getExpand2());
						row.createCell(22).setCellValue(room.getSort()==null?00:room.getSort());
						row.createCell(23).setCellValue(room.getState()==null?00:room.getState());
					}
					
				}
				
				//至此Excel内容生成完成，其中需要加上各种各样的容错代码，否则中途有一次报错此次打印失败
				String str = "/";
				/*String str = "c:/Excel打印示例.xls";*/
				File file = new File(str);
				if (!file.exists()) {
					file.mkdir();
				}
				//此方法中做的事情为先把Excel保存到本地，在把刚保存的文件打印到客户端
				this.outPutExcel(str + File.separator + "Excel打印示例.xls",wb,response);
	}
	
	public boolean IsPut(String[] idArr,Integer nowId){
		for(String one : idArr){
			if(one.equals(nowId.toString())){
				return false;
			}
		}
		return true;
	}
		
} 














