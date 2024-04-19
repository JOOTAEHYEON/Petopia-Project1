package com.spring.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

@Controller
public class UserCheckController {

   @RequestMapping(value = "/checkEmail.do", method = RequestMethod.POST)
   @ResponseBody
   public String checkEmail(HttpServletRequest request, Model model) throws ClassNotFoundException, SQLException {
      String email = request.getParameter("userEmail");
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      int result = 1;
      Class.forName("oracle.jdbc.driver.OracleDriver");
      con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
      String sql = "SELECT * FROM userTable WHERE email = ?";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, email);
      rs = pstmt.executeQuery();

      System.out.println("rs.next():" + rs.getClass().getName());
      boolean b1 = (boolean)rs.next();
      if (b1) {
         result = 0; // 이메일이 이미 존재하는 경우
      }

      rs.close();
      pstmt.close();
      con.close();

      return result + "";
   }

   
   @RequestMapping(value = "/checkPw.do", method = RequestMethod.POST)
   @ResponseBody
   public String checkPw(HttpServletRequest request, Model model) 
                               throws ClassNotFoundException, SQLException {
      String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
      
      int result = 0;

      if (password1.equals(password2)) {
         result = 1;
      }
      return result + "";
   }
   
   
   @RequestMapping(value = "/checkPhone.do", method = RequestMethod.POST)
   @ResponseBody
   public String checkPhone(HttpServletRequest request, Model model) throws ClassNotFoundException, SQLException {
      String phone = request.getParameter("userPhone");
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      int result = 1;
      Class.forName("oracle.jdbc.driver.OracleDriver");
      con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
      String sql = "SELECT * FROM userTable WHERE tel = ?";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, phone);
      rs = pstmt.executeQuery();
      System.out.println("rs.next():" + rs.getClass().getName());
      boolean b1 = (boolean)rs.next();
      if (b1) {
         result = 0; // 전화번호가 이미 존재하는 경우
      }
      rs.close();
      pstmt.close();
      con.close();
      
      return result + "";
   }
   @RequestMapping(value = "/infoCheckPhone.do", method = RequestMethod.POST)
   @ResponseBody
   public String infoCheckPhone(HttpServletRequest request, Model model) throws ClassNotFoundException, SQLException {
      String phone1 = request.getParameter("userPhone1");
      String phone2 = request.getParameter("userPhone2");
      String email = request.getParameter("userEmail");
      System.out.println("phone1+2: "+phone1+phone2);
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      Class.forName("oracle.jdbc.driver.OracleDriver");
      con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
      String sql = "SELECT tel FROM userTable";
      pstmt = con.prepareStatement(sql);
      rs = pstmt.executeQuery();
      System.out.println("rs.next():" + rs.getClass().getName());
      int result = 1; // 기본적으로 전화번호가 이미 존재한다고 가정

      while (rs.next()) { // 전화번호가 이미 존재하는 경우
          String dbPhone = rs.getString("tel"); // 데이터베이스에서 전화번호 가져오기
          if (dbPhone.equals(phone2) && !phone1.equals(phone2)) {
              result = 0; // 입력된 전화번호와 데이터베이스의 전화번호가 다른 경우
          } 
      } 
      System.out.println("result: "+result);
      rs.close();
      pstmt.close();
      con.close();
      
      return result + "";
   }

   
   
   @RequestMapping(value = "/insetCheck.do", method = RequestMethod.POST)
   @ResponseBody
   public String checkColors(HttpServletRequest request) {
      String emailColor = request.getParameter("emailColor");
      String pwColor = request.getParameter("pwColor");
      String phoneColor = request.getParameter("phoneColor");

      int result = 0;
      
      System.out.println(extractNumberFromRGB(emailColor));
      System.out.println(extractNumberFromRGB(pwColor));
      System.out.println(extractNumberFromRGB(phoneColor));
      // 문자열에서 RGB 값에서 숫자를 추출하여 확인
      if (extractNumberFromRGB(emailColor)==128 &&
          extractNumberFromRGB(pwColor)==128 &&
          extractNumberFromRGB(phoneColor)==128) {
         result=1;
      }
      System.out.println("result: "+result);
      return result + "";      
   }
   

   private int extractNumberFromRGB(String color) {
       // 문자열에서 숫자를 추출하기 위한 정규 표현식
       Pattern pattern = Pattern.compile("\\d+");
       Matcher matcher = pattern.matcher(color);

       // RGB 값 중 숫자만 추출하여 합산
       int sum = 0;
       while (matcher.find()) {
           sum += Integer.parseInt(matcher.group());
       }

       return sum;
   }
   
   
   
   public ServletRequest getRequest() {
      return getRequest();
   }

   public void setRequest(ServletRequest request) {
   }

}