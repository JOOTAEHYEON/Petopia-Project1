package com.spring.main.service.impl;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.main.service.UserService;
import com.spring.main.service.dao.UserDAO;
import com.spring.main.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

   private final UserDAO userDAO;

    @Autowired
    public UserServiceImpl(UserDAO userDAO) {
        this.userDAO = userDAO;
    }
   @Override
   public UserVO loginCheck(UserVO userVO, HttpSession session) {
       UserVO vo = userDAO.loginCheck(userVO);
       if (vo != null) { // 로그인 성공 시 세션에 사용자 정보 저장
           session.setAttribute("vo", vo);
       } else {
           // 로그인 실패 시 세션 초기화
           session.invalidate();
       }
       return vo;
   }

   @Override
   public void logout(HttpSession session) {
       session.removeAttribute("vo"); // 세션에서 사용자 정보 제거
       session.invalidate(); // 세션 초기화
   }

   
   @Override
   public void insertUser(UserVO userVO) {
      userDAO.userInsert(userVO);
   }
   
   @Override
   public UserVO selectUserInfo(UserVO userVO) {
       return userDAO.userSelect(userVO);
   }
   
   @Override
    public void updateUser(UserVO userVO) {
        userDAO.updateUser(userVO);
    }

    @Override
    public void deleteUser(UserVO userVO) {
        userDAO.deleteUser(userVO);
    }
     
   @Override
   public String findEmail(UserVO userVO) {
      return userDAO.findEmail(userVO);
   }
   
   
   @Override
   public void pwUpdate(UserVO userVO) {
      userDAO.pwUpdate(userVO);
      
   }
   
   @Override
   public UserVO loginCheck2(String email, HttpSession session) {
      UserVO vo = userDAO.loginCheck2(email);
       if (vo != null) { // 로그인 성공 시 세션에 사용자 정보 저장
           session.setAttribute("vo", vo);
       } else {
           // 로그인 실패 시 세션 초기화
           session.invalidate();
       }
       return vo;
   }  

   
   

   

   
    /*
   @Override
   public ArrayList<SawonVO> getAllSawon() {
      // TODO Auto-generated method stub
      return null;
   }
*/
   
   
   
   
   
   
   
   
   



   
   
   
   
}