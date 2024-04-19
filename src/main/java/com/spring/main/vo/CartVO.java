package com.spring.main.vo;

public class CartVO {

	private String email; // 이메일
	private String name;// 상품명
	private int price;// 상품 가격
	private int priceCnt;// 상품 수량
	private String option3;// 옵션
	
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPriceCnt() {
		return priceCnt;
	}
	
	public void setPriceCnt(int priceCnt) {
		this.priceCnt = priceCnt;
	}
	
	public String getOption3() {
		return option3;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	






}
