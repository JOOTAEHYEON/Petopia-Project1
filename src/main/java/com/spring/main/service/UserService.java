package com.spring.main.service;

import javax.servlet.http.HttpSession;

import com.spring.main.vo.UserVO;

public interface UserService {
   
   UserVO loginCheck(UserVO userVO, HttpSession session);
   
   void logout(HttpSession session);
   
   void insertUser(UserVO userVO);
   
   UserVO selectUserInfo(UserVO userVO);
   
   void updateUser(UserVO userVO);   

   void deleteUser(UserVO userVO);
   
   String findEmail(UserVO userVO); 
   void pwUpdate(UserVO userVO);
   UserVO loginCheck2(String email, HttpSession session);

   

   
      
   
   
   
   
   
   
   //ArrayList<SawonVO> getAllSawon();
   //service는 serviceImpl이 필요하지만
   //dao는 interface 상태로 막 바로 mapper와 연결되므로 daoImpl은 필요 없음
}