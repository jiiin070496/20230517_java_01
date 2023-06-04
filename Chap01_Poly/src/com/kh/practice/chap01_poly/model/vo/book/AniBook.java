package com.kh.practice.chap01_poly.model.vo.book;

public class AniBook extends Book{

	public int accessAge;
	
	public AniBook() {}
	public AniBook(String title, String author, String publisher, int accessAge) {
		super(title, author, publisher);
		this.accessAge = accessAge;
	}
	@Override
	public String toString() {
		return "AniBook[" + super.toString() + "나이 제한: " + accessAge +"]";
	}
	
	public int getAccessAge() {
		return accessAge;
	}
	public void setAccessAge(int accessAge) {
		this.accessAge = accessAge;
	}
	
	
}
