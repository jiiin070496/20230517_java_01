package com.kh.practice.chap01_poly.model.vo.book;

public class CookBook extends Book{

	private boolean coupon;
	
	CookBook(){}
	public CookBook(String title, String author, String publisher, boolean coupon){
		super(title, author, publisher);
		this.coupon = coupon;
	}
	@Override
	public String toString() {
		return "CookBook [" + super.toString() + "쿠폰 : " + coupon + "]";
	}
	
	public boolean isCoupon() {
		return coupon;
	}
	public void setCoupon(boolean coupon) {
		this.coupon = coupon;
	}
	
	
}
