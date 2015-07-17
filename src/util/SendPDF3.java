package util;

import java.awt.Color;
import java.io.FileOutputStream;

import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.PdfWriter;

public class SendPDF3 {

	private String filePath;
	private String BGImage;
	
	//用户信息
	private String UserName;
	private String CouponId;
	private String Date;
	private String ApartmentName;
	private String SchoolName;
	private String ApartmentDiscount;
	
	private String tips;//动态提示

	/**
	 * 初始化
	 * @param filePath:pdf路径包含文件名。xx.pdf
	 * @param BGImage:背景图片的文件路径（含文件名）
	 * @param UserName:用户名
	 * @param CouponId:coupon编号
	 * @param Date:时间
	 * @param ApartmentName:公寓名
	 * @param SchoolName:学校名
	 * @param ApartmentDiscount:优惠
	 */
	public final void init(String filePath1,String BGImage1,String UserName1,String CouponId1,
			String Date1,String ApartmentName1,String SchoolName1,String ApartmentDiscount1,String tips){
		
		this.filePath=filePath1;
		this.BGImage=BGImage1;
		
		//用户信息
		this.UserName=UserName1;
		this.CouponId=CouponId1;
		this.Date=Date1;
		this.ApartmentName=ApartmentName1;
		this.SchoolName=SchoolName1;
		this.ApartmentDiscount=ApartmentDiscount1;
		this.tips=tips;
	}
	
	
 public final int publishPDF() {
	 //调用第一个方法，向C盘生成一个名字为ITextTest.pdf 的文件
	  try {
	   writeSimplePdf();
	  } 
	  catch (Exception e) { e.printStackTrace();return 0; }
	  //调用第二个方法，向C盘名字为ITextTest.pdf的文件，添加章节。
	  try {
	   writeCharpter();
	  } 
	  catch (Exception e) { e.printStackTrace(); return 0;}
	  
	  return 1;
 }
  
  public final void writeSimplePdf() throws Exception {

	// 1.新建document对象
	  // 第一个参数是页面大小。接下来的参数分别是左、右、上和下页边距。
	  Document document = new Document(PageSize.A4, 50, 50, 50, 50);

	  // 2.建立一个书写器(Writer)与document对象关联，通过书写器(Writer)可以将文档写入到磁盘中。
	  // 创建 PdfWriter 对象 第一个参数是对文档对象的引用，第二个参数是文件的实际名称，在该名称中还会给出其输出路径。
	  PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(filePath));

	  // 3.打开文档
	  document.open();

	  // 4.向文档中添加内容
	  // 通过 com.lowagie.text.Paragraph 来添加文本。可以用文本及其默认的字体、颜色、大小等等设置来创建一个默认段落
	  document.add(new Paragraph("First page of the document."));
	  document.add(new Paragraph("Some more text on the  first page with different color and font type.", FontFactory.getFont(FontFactory.COURIER, 14, Font.BOLD, new Color(255, 150, 200))));

	  // 5.关闭文档
	  document.close();
 } 
 
 /**
  * 添加含有章节的pdf文件
  * @throws Exception
  */
 public final void writeCharpter() throws Exception {

  // 新建document对象 第一个参数是页面大小。接下来的参数分别是左、右、上和下页边距。
  Document document = new Document(new Rectangle(1018,763), 20, 20, 20, 20);

  // 建立一个书写器(Writer)与document对象关联，通过书写器(Writer)可以将文档写入到磁盘中。
  PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(filePath));

  // 打开文件
  document.open();

  //背景图
	  Image jpeg = Image.getInstance(BGImage);
	  //设置显示方式
	  jpeg.setAlignment(Image.UNDERLYING);
	  //设置绝对位置
	  jpeg.setAbsolutePosition(0, 0); 
	  //设置图片大小595,842为A4纸的大小
	  jpeg.scaleAbsolute(1018,763);  
	  document.add(jpeg);
  // 标题
  document.addTitle("WorldElites Coupon");
  // 作者
  document.addAuthor("worldelites");
  // 主题
  document.addSubject("WE,Coupon");
  document.addKeywords("WE,Coupon!");
  // document.newPage();
  // 向文档中添加内容
  document.add(new Paragraph("\n"));
  document.add(new Paragraph(UserName, FontFactory.getFont(FontFactory.defaultEncoding, 26, Font.BOLD, new Color(255, 255, 255))));
  document.add(new Paragraph("Coupon No.:"+CouponId, FontFactory.getFont(FontFactory.defaultEncoding, 18, Font.BOLD, new Color(255, 255, 255))));
  document.add(new Paragraph("Coupon Issue Date:"+Date, FontFactory.getFont(FontFactory.defaultEncoding, 18, Font.BOLD, new Color(255, 255, 255))));
  document.add(new Paragraph("\n"));
  document.add(new Paragraph("\n"));
  document.add(new Paragraph("\n"));
  document.add(new Paragraph(SchoolName, FontFactory.getFont(FontFactory.defaultEncoding, 18, Font.BOLD, new Color(255, 255, 255))));
  document.add(new Paragraph(ApartmentName, FontFactory.getFont(FontFactory.defaultEncoding, 18, Font.BOLD, new Color(255, 255, 255))));
  document.add(new Paragraph(ApartmentDiscount, FontFactory.getFont(FontFactory.defaultEncoding, 28, Font.BOLD, new Color(255, 255, 255))));
  document.add(new Paragraph("WE Housing Exclusive Offer | WE Guide You Home", FontFactory.getFont(FontFactory.defaultEncoding, 16, Font.BOLD, new Color(255, 255, 255))));
  document.add(new Paragraph("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"));
  document.add(new Paragraph(tips, FontFactory.getFont(FontFactory.defaultEncoding, 16, Font.BOLD, new Color(0, 0, 0))));
  // 关闭文档
  document.close();
 }
  
 } 
 
