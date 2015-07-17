package util;


public class Constants {
	 public static final int PORT = 80;                     //tomcat使用端口
	 
	 
	 public static final String BACK_LOGIN = "buser";		//后台管理用户登录标识
	 public static final String FRONT_LOGIN = "fuser";		//用户标记
	 
	 public static final String[] ALGORITHM = {"SHA1","SHA-256","SHA-384","SHA-512","MD2","MD5"};		//加密算法
	 
	 public static final int ORDERLISTSIZE = 10;
	 //=========================代订状态==========================================
	/* public static final String ORDERSTATE_SUBMIT="Application Submitted";//"提交代订";
	 public static final String ORDERSTATE_CONFIRM="Acknowledgement of application";//"确认申请";
	 public static final String ORDERSTATE_SIGN="The signing of the lease";//签订租约";
	 public static final String ORDERSTATE_PAY="Online payment";//在线支付";
	 public static final String ORDERSTATE_FINISH="Reservation";//预订成功";
*/	 
	//============================原菜单表修改为其他附加项：设施，配置，公司表，帖子类型表=================
	 public static final int MENU_TYPE_COMPANY= 1;//房产公司
	 public static final int MENU_TYPE_FEATRUE= 2;//公寓配置
	 public static final int MENU_TYPE_AMENITIES= 3;//社区设施
	 public static final int MENU_TYPE_DISCOUNTPROJECT= 4;//优惠项目
	 public static final int MENU_TYPE_OTHERS= 5;//包含杂费项目
	 public static final int MENU_TYPE_APARTMENTTAG= 6;//公寓标签
	 public static final int MENU_TYPE_THREAD= 7;//帖子标签
	 //==========================================================================
	 public static final String CON_MAP = "map";
	 public static final String CON_ABOUTME = "aboutme";
	 public static final String CON_PARTNERSHIP = "partnership";
	 public static final String CON_TACT = "tact";
	 public static final String CON_EWM = "ewm";
	 public static final String CON_CAPYRIGHT = "copyright";
	 public static final String CON_KOUHAO = "kouhao";
	 public static final String JOIN_ARTICLE = "join_article";
	 public static final String USERCENTERWELCOME = "usercenterwelcome"; 
	 public static final String USERCENTERWELCOME_CN = "usercenterwelcome_cn"; 
	 
	 //======================================about=====================================
	 public static final String ARTICLE_ABOUT = "about";
	 public static final String ARTICLE_JOINUS = "joinus";
	 public static final String ARTICLE_HELP = "help";
	 public static final String ARTICLE_COMMUNITY = "community";
	 public static final String ARTICLE_PARTNERSHIP = "partnership";
	 
	 //===========================文章类型/板块常量================================================
	 public static final String ARTICLE_TYPE_HISTORY = "history";  //调用七条		good = 1
	 public static final String ARTICLE_TYPE_PARTNERSHIP = "partnership";  //调用七条		good = 1
	 public static final String ARTICLE_TYPE_USERCASE1 = "usercase1";		//一条
	 public static final String ARTICLE_TYPE_USERCASE2 = "usercase2";		//一条
	 
	 //==================================Thread板块常量===============================================
	 public static final String BBS_TYPE_THREAD = "thread";	//用户帖子
	 public static final String BBS_TYPE_NOTICE = "notice";	//论坛公告
	 public static final String BBS_TYPE_RESOURCE = "resource";	//社区——资源
	 public static final String BBS_TYPE_ACTIVITY = "activity";	//社区——线下活动
	 public static final String BBS_TYPE_SPONSOR = "sponsor";	//社区——赞助community.jsp
	 //======================================翻页=====================================
	 public static final String PAGE_PREV = "prev";
	 public static final String PAGE_NEXT = "next";
	 //=======================================邮件模板类型===================================	[@NAME]	[@ORDERCODE]
	 public static final String WEBSITE="http://www.worldelites.com";	//网站域名
	 public static final String ORDER_MODEL="order_model";	//代订模版；
	 public static final int MAIL_EFFECTIVE=3;	//邮件失效时间（天）
	 public static final String USER_INITPW="we666666";	//新用户初始密码
	 public static final String EMAIL_ACTIVE = "active";		//注册激活 
	 public static final String EMAIL_ACTIVE_CN = "新用户激活邮件";
	 public static final String EMAIL_WELCOME = "welcome";		//欢迎界面 
	 public static final String EMAIL_WELCOME_CN = "欢迎新用户邮件";
	 public static final String EMAIL_RESETPASSWORD = "resetpassword";	//找回密码密码   1
	 public static final String EMAIL_RESETPASSWORD_CN = "用户找回密码邮件";	
	 public static final String EMAIL_COUPON_USER = "coupon_user";		//优惠券 发给用户。
	 public static final String EMAIL_COUPON_USER_CN = "优惠券(用户)邮件";
	 public static final String EMAIL_COUPON_ADMIN = "coupon_admin";		//优惠券 发给管理人员
	 public static final String EMAIL_COUPON_ADMIN_CN = "优惠券(管理)邮件";
	 public static final String EMAIL_ORDER_USER_NEW = "order_user_new";	//新订单 1  1  1
	 public static final String EMAIL_ORDER_USER_NEW_CN = "新订单(用户)邮件";
	 public static final String EMAIL_ORDER_ADMIN_NEW = "order_admin_new";	//新订单
	 public static final String EMAIL_ORDER_ADMIN_NEW_CN = "新订单(管理)邮件";
	 
	 public static final String EMAIL_ORDER_USER_VALID = "order_user_valid";	//审核通过订单 
	 public static final String EMAIL_ORDER_ADMIN_VALID = "order_admin_valid";	//审核通过订单
	 public static final String EMAIL_ORDER_USER_SIGN = "order_user_sign";	//已签约订单
	 public static final String EMAIL_ORDER_ADMIN_SIGN = "order_admin_sign";	//已签约订单
	 public static final String EMAIL_ORDER_USER_PAY = "order_user_pay";		//已支付定金订单 1 
	 public static final String EMAIL_ORDER_ADMIN_PAY = "order_admin_pay";	//已支付定金订单
	 public static final String EMAIL_PAYMENT_USER = "payment_user";		//代缴费 1
	 public static final String EMAIL_PAYMENT_ADMIN = "payment_admin";	//代缴费
	 
	 public static final String PAY_ID = "23209797";	//支付接口-商户号
	 public static final String PAY_URL = "http://www.worldelites.com/pay/AutoReceive.html";	//支付接口-返回地址
	 public static final String PAY_KEY = "worldelites-chinabank-test";		//支付接口-key
	 
	/* public static final String  PDF_URL="d:/TOM/wtpwebapps/worldelites/fileupload/pdf/";
	 public static final String  FILE_URL="d:/TOM/wtpwebapps/worldelites/fileupload/files/";*/
	 
	public static final String  PDF_URL="/usr/local/myapp/worldelites/fileupload/pdf/";
	 public static final String  FILE_URL="/usr/local/myapp/worldelites/fileupload/files/";
	 //====================================登陆错误提示=========================================================
	 public static final String LOGIN_FRONT_ERROR_MESSAGE = "用户名密码错误，请重新输入!";
	 //=====================================类型表类型Code==================================================================
	 public static final String PAYTYPE = "5";
	 
}
