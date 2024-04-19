package com.spring.main.vo;

public class ConrimVO {
	
	    private String ProductID;
	    private String category;
	    private String name;
	    private int price;
	    private int shippingFee;
	    private String seller;
	    private int quantity;
	    private String option;
	   
		
	
		public int getQuantity() {
			return quantity;
		} 
		public void setQuantity(int quantity) {
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
	
		public String getProductID() {
			return ProductID;
		}
		public void setProductID(String productID) {
			this.ProductID = productID;
		}


}
