package com.spring.main.service.dao;


import com.spring.main.vo.UserVO;



public interface UserDAO {

   UserVO loginCheck(UserVO userVO); //로그인
   
   void userInsert(UserVO userVO); //회원가입
      
   UserVO userSelect(UserVO userVO); //내정보   
      
   void updateUser(UserVO userVO);

   void deleteUser(UserVO userVO);
   
   String findEmail(UserVO userVO);

   
   void pwUpdate(UserVO userVO);

   UserVO loginCheck2(String email);//네아로
   
   
   
   
 








   

   
}
