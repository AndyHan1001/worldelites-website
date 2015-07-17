package com.zq.worldelites.vo;

public class OrderVo {
	private String productName;
	private double buyPrice;
	private String userName;
	
	/**
	 * 产品最新名称   通过订单内的产品id查询出来
	 * @return
	 */
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	/**
	 * 购买价格   Order表中的值
	 * @return
	 */
	public double getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(double buyPrice) {
		this.buyPrice = buyPrice;
	}
	
	/**
	 * 通过UserId从User表中关联查询出来的
	 * @return
	 */
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
}
