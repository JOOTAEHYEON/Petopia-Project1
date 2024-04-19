package com.spring.main.vo;

public class UserVO {
   
   private String email;
    private String password;
   private String tel;
   private int adp;
   private String ad;
   private String ad1;
   
   
   public UserVO() {}
   
   public UserVO(String email, String password, 
         String tel, int adp, String ad, String ad1) {
      super();
      this.email = email;
      this.password = password;
      this.tel = tel;
      this.adp = adp;
      this.ad = ad;
      this.ad1 = ad1;
   }
   
    public UserVO(String password, String tel, int adp,
          String ad, String ad1,String email) {
        this.password = password;
        this.tel = tel;
        this.adp = adp;
        this.ad = ad;
        this.ad1 = ad1;
        this.email = email;
    }
   
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getPassword() {
      return password;
   }
   public void setPassword(String password) {
      this.password = password;
   }
   public String getTel() {
      return tel;
   }
   public void setTel(String tel) {
      this.tel = tel;
   }
   public int getAdp() {
      return adp;
   }
   public void setAdp(int adp) {
      this.adp = adp;
   }
   public String getAd() {
      return ad;
   }
   public void setAd(String ad) {
      this.ad = ad;
   }
   public String getAd1() {
      return ad1;
   }
   public void setAd1(String ad1) {
      this.ad1 = ad1;
   }

   


   
}