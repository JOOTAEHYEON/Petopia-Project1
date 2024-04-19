package com.spring.main;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.spring.main.service.UserService;
import com.spring.main.vo.UserVO;

@Controller
public
class LoginController {
	

	@Inject
	   private UserService userService;
	
	 @Autowired
	    BCryptPasswordEncoder passwordEncoder;
	/* NaverLoginBO */ 
	
	 private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	
	@Autowired	
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {		
		this.naverLoginBO = naverLoginBO;	
		}
	// 로그인 첫 화면 요청 메소드 
	@RequestMapping(value = "/login.do", method = {RequestMethod.GET, RequestMethod.POST }) 
			public String login(Model model,HttpSession session) { 
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의getAuthorizationUrl메소드 호출 */ 
		String naverAuthUrl =naverLoginBO.getAuthorizationUrl(session);
		
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);
        //네이버 
        model.addAttribute("url",naverAuthUrl); 
        return "002_Login"; 
        } 
	
	
	//네이버 로그인 성공시 callback호출 메소드  
	   @RequestMapping(value = "/naver_callback.do", method = { RequestMethod.GET,RequestMethod.POST }) 
	   public String callback(Model model, @RequestParam String code, @RequestParam String state, 
	                        HttpSession session)throws IOException, ParseException { 
	      System.out.println("여기는 callback");
	       OAuth2AccessToken oauthToken; 
	       oauthToken = naverLoginBO.getAccessToken(session, code, state);
	       //1. 로그인 사용자 정보를 읽어온다.

	       apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터 
	       /** apiResult json 구조 
	        {"resultcode":"00", 
	        "message":"success",
	        "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
	         **/ 
	       //2. String형식인 apiResult를 json형태로 바꿈 
	       JSONParser parser = new JSONParser(); 
	       Object obj = parser.parse(apiResult); 
	       JSONObject jsonObj = (JSONObject) obj; 
	       
	       //3. 데이터 파싱 
	       //Top레벨 단계 _response 파싱 
	       JSONObject response_obj = (JSONObject)jsonObj.get("response"); 
	       //response의 nickname값 파싱 
	       String email = (String)response_obj.get("email");

	       System.out.println("email: "+email); 
	       
	       UserVO vo = userService.loginCheck2(email, session);
	       
	        if (vo != null) {
	              session.setAttribute("result", vo);
	              model.addAttribute("apiResult", apiResult); 
	              return "001_main";
	          } else {
	              model.addAttribute("message2", "error");
	              return "002_Login";
	          }
	    } 
	
	
	  //로그인
	   @RequestMapping(value = "/login_check.do", method = RequestMethod.POST)
	   public String login_check(@ModelAttribute UserVO userVO, HttpSession session, Model model) {
	       UserVO vo = userService.loginCheck(userVO, session);
	       if (vo != null && passwordEncoder.matches(userVO.getPassword(), vo.getPassword())) {
	           session.setAttribute("result", vo);
	           return "001_main";
	       } else {
	           model.addAttribute("message", "error");
	           return "002_Login";
	       }
	   }
	
    // 로그아웃
	@RequestMapping(value = "/logout.do", method = { RequestMethod.GET, RequestMethod.POST }) 
    public String logout(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        System.out.println("여기는 logout");

        // 세션에서 사용자 정보 제거
        session.removeAttribute("result");


        // 로그아웃 후 리다이렉트할 URL 지정
        redirectAttributes.addFlashAttribute("message", "로그아웃되었습니다.");

        // 로그인 페이지로 리다이렉트
        //return "redirect:/001_main"; 
        return "001_main"; 
    }
}
    