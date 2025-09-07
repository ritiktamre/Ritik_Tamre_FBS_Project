package com.shop.servlet;

public class Product {
	    private int pid;
	    private String pname;
	    private String ptype;
	    private String pinfo;
	    private double pprice;
	    private String pquantity;
	    private String image; 
	    private boolean freeDelivery;
	    private double discount;
	    private double rating;
	    
	    public Product() {
			// TODO Auto-generated constructor stub
		}

	   

		public Product(int pid, String pname, String ptype, String pinfo, double pprice, String pquantity, String image,
				boolean freeDelivery, double discount, double rating) {
			super();
			this.pid = pid;
			this.pname = pname;
			this.ptype = ptype;
			this.pinfo = pinfo;
			this.pprice = pprice;
			this.pquantity = pquantity;
			this.image = image;
			this.freeDelivery = freeDelivery;
			this.discount = discount;
			this.rating = rating;
		}



		public int getPid() {
			return pid;
		}

		public void setPid(int pid) {
			this.pid = pid;
		}

		public String getPname() {
			return pname;
		}

		public void setPname(String pname) {
			this.pname = pname;
		}

		public String getPtype() {
			return ptype;
		}

		public void setPtype(String ptype) {
			this.ptype = ptype;
		}

		public String getPinfo() {
			return pinfo;
		}

		public void setPinfo(String pinfo) {
			this.pinfo = pinfo;
		}

		public double getPprice() {
			return pprice;
		}

		public void setPprice(double pprice) {
			this.pprice = pprice;
		}

		public String getPquantity() {
			return pquantity;
		}

		public void setPquantity(String pquantity) {
			this.pquantity = pquantity;
		}

		public String getImage() {
			return image;
		}

		void setImage(String image) {
			this.image = image;
		}



		public boolean isFreeDelivery() {
			return freeDelivery;
		}



		public void setFreeDelivery(boolean freeDelivery) {
			this.freeDelivery = freeDelivery;
		}



		public double getDiscount() {
			return discount;
		}



		public void setDiscount(double discount) {
			this.discount = discount;
		}



		public double getRating() {
			return rating;
		}



		public void setRating(double rating) {
			this.rating = rating;
		}
 
		
		
	    
	    
}
