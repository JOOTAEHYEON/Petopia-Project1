package com.spring.main.vo;

public class StoreVO {
	
	    private String ProductID;
	    private String category;
	    private String name;
	    private int price;
	    private int shippingFee;
	    private String seller;
	    private String option1;
	    private String option2;
	    private String quantity;
	    private String option;
	  

		
		public String getQuantity() {
			return quantity;
		} 
		public void setQuantity(String quantity) {
			this.quantity = quantity;
		}
		public String getOption() {
			return option;
		}
		public void setOption(String option) {
			this.option = option;
		}
	
		
		public String getCategory() {
			return category;
		}
		public void setCategory(String category) {
			this.category = category;
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
		public int getShippingFee() {
			return shippingFee;
		}
		public void setShippingFee(int shippingFee) {
			this.shippingFee = shippingFee;
		}
		public String getSeller() {
			return seller;
		}
		public void setSeller(String seller) {
			this.seller = seller;
		}
		public String getOption1() {
			return option1;
		}
		public void setOption1(String option1) {
			this.option1 = option1;
		}
		public String getOption2() {
			return option2;
		}
		public void setOption2(String option2) {
			this.option2 = option2;
		}
		public String getProductID() {
			return ProductID;
		}
		public void setProductID(String productID) {
			this.ProductID = productID;
		}


}
