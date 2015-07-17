package com.zq.worldelites.vo;

import java.util.List;

import com.zq.worldelites.model.Room;


public class RoomVo {

	private List<String> roomDiscount;
	private Room room;
	private String enterDate="N/A";
	private String outDate="N/A";
	private int iscoupon=0;
	private int isbook=0;
	public List<String> getRoomDiscount() {
		return roomDiscount;
	}
	public void setRoomDiscount(List<String> roomDiscount) {
		this.roomDiscount = roomDiscount;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public String getEnterDate() {
		return enterDate;
	}
	public void setEnterDate(String enterDate) {
		this.enterDate = enterDate;
	}
	public String getOutDate() {
		return outDate;
	}
	public void setOutDate(String outDate) {
		this.outDate = outDate;
	}
	public int getIscoupon() {
		return iscoupon;
	}
	public void setIscoupon(int iscoupon) {
		this.iscoupon = iscoupon;
	}
	public int getIsbook() {
		return isbook;
	}
	public void setIsbook(int isbook) {
		this.isbook = isbook;
	}
	
	
	
}
