package com.zq.worldelites.vo;

public class UserAndUserRelationVO {
	private int fromUserId;
	private int toUserID;
	private String toUserName;
	private String toUserLogo; 
	private String bothRelation="关注";//0表示无好友关系,1表示有关系
	
	public int getFromUserId() {
		return fromUserId;
	}
	public void setFromUserId(int fromUserId) {
		this.fromUserId = fromUserId;
	}
	public int getToUserID() {
		return toUserID;
	}
	public void setToUserID(int toUserID) {
		this.toUserID = toUserID;
	}
	public String getToUserName() {
		return toUserName;
	}
	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}
	public String getToUserLogo() {
		return toUserLogo;
	}
	public void setToUserLogo(String toUserLogo) {
		this.toUserLogo = toUserLogo;
	}
	public String getBothRelation() {
		return bothRelation;
	}
	public void setBothRelation(String bothRelation) {
		this.bothRelation = bothRelation;
	}
	
	
}
