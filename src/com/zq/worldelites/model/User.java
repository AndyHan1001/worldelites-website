package com.zq.worldelites.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 用户表
 * @author Jason
 *
 */

@Entity
@Table(name = "t_user")
public class User  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="user_id",length=8,unique=true,nullable=false)
	private Integer id;				//主键id 自动增长 
	
	@Column(name = "user_ssid",length=8)
	private Integer ssid;			//让用户来看的流水号：用户ID
	
	@Column(name = "user_passport")
	private String passport;			//账号
	
	@Column(name = "user_password")
	private String password;			//密码
	
	@Column(name = "user_nick")
	private String nick;			//称呼
	
	@Column(name = "user_name")
	private String name;			//名
	
	@Column(name = "user_lastname")
	private String lastname;			//姓
	
	@Column(name = "user_sex",length=4)
	private String sex;			//性别
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "user_birthday")
	private Date birthday=new Date();			//生日
	
	@Column(name = "user_nationality")
	private String nationality;			//国籍
	
	@Column(name = "user_passportno")
	private String passportNo;			//护照号
	
	@Column(name = "user_newschoolid")
	private Integer newschoolid;			//将要就读的学校id
	
	@Column(name = "user_newschool")
	private String newschool;			//将要就读的学校
	
	@Column(name = "user_grade")
	private String grade;			//年级
	
	@Column(name = "user_fulltime",length=1)
	private Integer fulltime = 0;	//是否全日制学生
	
	@Column(name = "user_professional")
	private String professional;		//专业
	
	@Column(name = "user_oldschool")
	private String oldschool;			//以前的学校
	
	@Column(name = "user_knowweby")
	private String knowweby;			//知道我们通过什么方式
	
	@Column(name = "user_addr")
	private String addr;			//联系地址
	
	@Column(name = "user_prvc")
	private String prvc;				//  省/州
	
	@Column(name = "user_city")
	private String city;				//  市/县
	
	@Column(name = "user_zip")
	private String zip;					//邮编
	
	@Column(name = "user_nowstate")
	private String nowstate;			//现状，学历
	
	@Column(name = "user_countries")
	private String countries;			//国家
	
	@Column(name = "user_county")
	private String county;				//县
	
	@Column(name = "user_credit")
	private String credit;			//信用卡类型
	
	@Column(name = "user_phone")
	private String phone;			//手机
	
	@Column(name = "user_mail")
	private String mail;			//mail
	
//紧急情况联系人----------------------------------	
	@Column(name = "user_relativesname")
	private String relativesname;		//亲属全名

	@Column(name = "user_relatives")
	private String relatives;		    //亲属与用户关系
	
	@Column(name = "user_relativesaddr")
	private String relativesaddr;		//亲属联系地址
	
	@Column(name = "user_relativesprvc")
	private String relativesprvc;			//亲属  省/州
	
	@Column(name = "user_relativescity")
	private String relativescity;			//亲属  市/县
	
	@Column(name = "user_relativeszip")
	private String relativeszip;			//亲属   邮编
	
	@Column(name = "user_relativescountries")
	private String relativescountries;			//亲属 国家
	
	@Column(name = "user_relativestel")
	private String relativestel;			//亲属座机
	
	@Column(name = "user_relativesphone")
	private String relativesphone;			//亲属手机
	
	@Column(name = "user_relativesmail")
	private String relativesmail;			//亲属   邮箱
	
	@Column(name = "user_file1")
	private String file1;					//附件
	
	@Column(name = "user_file2")
	private String file2;					//附件
	
	@Column(name = "user_file3")
	private String file3;					//附件
	
	@Column(name = "user_file4")
	private String file4;					//附件
	
	@Column(name = "user_file5")
	private String file5;					//附件
	
	@Column(name = "user_roommate1")
	private String roommate1;					//室友
	@Column(name = "user_roommatemail1")
	private String roommatemail1;					//室友邮箱
	
	@Column(name = "user_roommate2")
	private String roommate2;					//室友
	@Column(name = "user_roommatemail2")
	private String roommatemail2;					//室友邮箱
	
	@Column(name = "user_roommate3")
	private String roommate3;					//室友
	@Column(name = "user_roommatemail3")
	private String roommatemail3;					//室友邮箱
//未要求----------------------------------------------------------	

	
	@Column(name = "user_logo")
	private String logo;			//头像
	
	@Column(name = "user_hobbies")
	private String hobbies;				//爱好
	
	@Column(name = "user_type")
	private String type;				//用户类型
	
	@Column(name = "user_typecode")
	private String typecode;			//用户类型code
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "user_memo")
	private String memo;				//用户备注
	
	@org.hibernate.annotations.Type(type="text")
	@Column(name = "user_content")
	private String content;				//用户详细介绍
	
	@Column(name = "user_money",length=8)
	private Integer money = 0;			//用户账户余额
	
	@Column(name = "user_integral",length=8)
	private Integer integral = 0;			//用户积分
		
	@Column(name = "user_numarticle",length=8)
	private Integer numarticle = 0;			//发表文章数
	
	@Column(name = "user_numatlas",length=8)
	private Integer numatlas = 0;			//发表图集总数
	
	@Column(name = "user_numthread",length=8)
	private Integer numthread = 0;			//发帖总数
	
	@Column(name = "user_numpicture",length=8)
	private Integer numpicture = 0;			//发图数
	
	@Column(name = "user_sumpay",length=8)
	private Integer sumpay = 0;				//订单总数
	
	@Column(name = "user_visit",length=8)
	private Integer visit = 0;				//访问量
	
	@Column(name = "user_state",length=8)
	private Integer state = 0;				//用户账号状态：0禁用  1 激活
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "user_ctime")
	private Date ctime=new Date();				//创建时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "user_utime")
	private Date utime=new Date();				//修改时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "user_btime")
	private Date btime=new Date();				//开始时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "user_etime")
	private Date etime=new Date();				//结束时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "user_logtime")
	private Date logtime=new Date();			//登陆时间
	
	@Column(name = "user_loginip",length=20)
	private String loginip;			//登陆IP
	
	@Column(name = "user_isdel",length=1)
	private Integer isdel = 0;		//是否删除：0否，1是

	
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSsid() {
		return ssid;
	}

	public void setSsid(Integer ssid) {
		this.ssid = ssid;
	}

	public String getPassport() {
		return passport;
	}

	public void setPassport(String passport) {
		this.passport = passport;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getPassportNo() {
		return passportNo;
	}

	public void setPassportNo(String passportNo) {
		this.passportNo = passportNo;
	}

	public String getNewschool() {
		return newschool;
	}

	public void setNewschool(String newschool) {
		this.newschool = newschool;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public Integer getFulltime() {
		return fulltime;
	}

	public void setFulltime(Integer fulltime) {
		this.fulltime = fulltime;
	}

	public String getProfessional() {
		return professional;
	}

	public void setProfessional(String professional) {
		this.professional = professional;
	}

	public String getOldschool() {
		return oldschool;
	}

	public void setOldschool(String oldschool) {
		this.oldschool = oldschool;
	}

	public String getKnowweby() {
		return knowweby;
	}

	public void setKnowweby(String knowweby) {
		this.knowweby = knowweby;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPrvc() {
		return prvc;
	}

	public void setPrvc(String prvc) {
		this.prvc = prvc;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getCountries() {
		return countries;
	}

	public void setCountries(String countries) {
		this.countries = countries;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getRelativesname() {
		return relativesname;
	}
	
	

	public String getNowstate() {
		return nowstate;
	}

	public void setNowstate(String nowstate) {
		this.nowstate = nowstate;
	}

	public String getCredit() {
		return credit;
	}

	public void setCredit(String credit) {
		this.credit = credit;
	}

	public void setRelativesname(String relativesname) {
		this.relativesname = relativesname;
	}

	public String getRelatives() {
		return relatives;
	}

	public void setRelatives(String relatives) {
		this.relatives = relatives;
	}

	public String getRelativesaddr() {
		return relativesaddr;
	}

	public void setRelativesaddr(String relativesaddr) {
		this.relativesaddr = relativesaddr;
	}

	public String getRelativesprvc() {
		return relativesprvc;
	}

	public void setRelativesprvc(String relativesprvc) {
		this.relativesprvc = relativesprvc;
	}

	public String getRelativescity() {
		return relativescity;
	}

	public void setRelativescity(String relativescity) {
		this.relativescity = relativescity;
	}

	public String getRelativeszip() {
		return relativeszip;
	}

	public void setRelativeszip(String relativeszip) {
		this.relativeszip = relativeszip;
	}

	public String getRelativescountries() {
		return relativescountries;
	}

	public void setRelativescountries(String relativescountries) {
		this.relativescountries = relativescountries;
	}

	public String getRelativestel() {
		return relativestel;
	}

	public void setRelativestel(String relativestel) {
		this.relativestel = relativestel;
	}

	public String getRelativesphone() {
		return relativesphone;
	}

	public void setRelativesphone(String relativesphone) {
		this.relativesphone = relativesphone;
	}

	public String getRelativesmail() {
		return relativesmail;
	}

	public void setRelativesmail(String relativesmail) {
		this.relativesmail = relativesmail;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getHobbies() {
		return hobbies;
	}

	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTypecode() {
		return typecode;
	}

	public void setTypecode(String typecode) {
		this.typecode = typecode;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}

	public Integer getIntegral() {
		return integral;
	}

	public void setIntegral(Integer integral) {
		this.integral = integral;
	}

	public Integer getNumarticle() {
		return numarticle;
	}

	public void setNumarticle(Integer numarticle) {
		this.numarticle = numarticle;
	}

	public Integer getNumatlas() {
		return numatlas;
	}

	public void setNumatlas(Integer numatlas) {
		this.numatlas = numatlas;
	}

	public Integer getNumthread() {
		return numthread;
	}

	public void setNumthread(Integer numthread) {
		this.numthread = numthread;
	}

	public Integer getNumpicture() {
		return numpicture;
	}

	public void setNumpicture(Integer numpicture) {
		this.numpicture = numpicture;
	}

	public Integer getSumpay() {
		return sumpay;
	}

	public void setSumpay(Integer sumpay) {
		this.sumpay = sumpay;
	}

	public Integer getVisit() {
		return visit;
	}

	public void setVisit(Integer visit) {
		this.visit = visit;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Date getCtime() {
		return ctime;
	}

	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}

	public Date getUtime() {
		return utime;
	}

	public void setUtime(Date utime) {
		this.utime = utime;
	}

	public Date getBtime() {
		return btime;
	}

	public void setBtime(Date btime) {
		this.btime = btime;
	}

	public Date getEtime() {
		return etime;
	}

	public void setEtime(Date etime) {
		this.etime = etime;
	}

	public Date getLogtime() {
		return logtime;
	}

	public void setLogtime(Date logtime) {
		this.logtime = logtime;
	}

	public String getLoginip() {
		return loginip;
	}

	public void setLoginip(String loginip) {
		this.loginip = loginip;
	}

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}

	public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}

	public String getFile2() {
		return file2;
	}

	public void setFile2(String file2) {
		this.file2 = file2;
	}

	public String getFile3() {
		return file3;
	}

	public void setFile3(String file3) {
		this.file3 = file3;
	}

	public String getFile4() {
		return file4;
	}

	public void setFile4(String file4) {
		this.file4 = file4;
	}

	public String getFile5() {
		return file5;
	}

	public void setFile5(String file5) {
		this.file5 = file5;
	}

	public String getRoommate1() {
		return roommate1;
	}

	public void setRoommate1(String roommate1) {
		this.roommate1 = roommate1;
	}

	public String getRoommatemail1() {
		return roommatemail1;
	}

	public void setRoommatemail1(String roommatemail1) {
		this.roommatemail1 = roommatemail1;
	}

	public String getRoommate2() {
		return roommate2;
	}

	public void setRoommate2(String roommate2) {
		this.roommate2 = roommate2;
	}

	public String getRoommatemail2() {
		return roommatemail2;
	}

	public void setRoommatemail2(String roommatemail2) {
		this.roommatemail2 = roommatemail2;
	}

	public String getRoommate3() {
		return roommate3;
	}

	public void setRoommate3(String roommate3) {
		this.roommate3 = roommate3;
	}

	public String getRoommatemail3() {
		return roommatemail3;
	}

	public void setRoommatemail3(String roommatemail3) {
		this.roommatemail3 = roommatemail3;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public Integer getNewschoolid() {
		return newschoolid;
	}

	public void setNewschoolid(Integer newschoolid) {
		this.newschoolid = newschoolid;
	}

	
	
	
}
