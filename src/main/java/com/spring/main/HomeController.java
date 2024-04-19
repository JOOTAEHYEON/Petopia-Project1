package com.spring.main;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Properties;
import java.util.Random;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.BookListService;
import com.spring.main.service.CartService;
import com.spring.main.service.HosListService;
import com.spring.main.service.HotListService;
import com.spring.main.service.StoreService;
import com.spring.main.service.UserService;

import com.spring.main.vo.BoardVO;
import com.spring.main.vo.BookListVO;
import com.spring.main.vo.CartVO;
import com.spring.main.vo.ConrimVO;
import com.spring.main.vo.HosListVO;
import com.spring.main.vo.HotListVO;
import com.spring.main.vo.PayVO;
import com.spring.main.vo.ReplyVO;
import com.spring.main.vo.SalListVO;
import com.spring.main.vo.StoreVO;
import com.spring.main.vo.StrayAnimalVO;
import com.spring.main.vo.TaxiVO;
import com.spring.main.vo.UserVO;
import com.spring.main.service.PayService;
import com.spring.main.service.SalListService;
import com.spring.main.service.StrayAnimalService;
import com.spring.main.service.TaxiService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.main.service.BoardService;
import com.spring.main.service.ReplyService;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	// ------------------------------ 메인 & 회원가입 ================================
	@Inject
	private UserService userService;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	// 메인
	@RequestMapping(value = "/main.do")
	public String showMain() {

		return "001_main";
		// return "Pay";

	}

//

	// (화면이동:회원가입페이지)
	@RequestMapping(value = "/register.do")
	public String registerpage() {
		return "002_register";
	}

	// 회원가입 insert 실행
	@RequestMapping(value = "/userInsert.do")
	public String userInsert(@ModelAttribute("userVO") UserVO userVO, Model model) {

		String encodedPassword = passwordEncoder.encode(userVO.getPassword());
		userVO.setPassword(encodedPassword);

		userService.insertUser(userVO);
		model.addAttribute("insertSuccess", "ok");
		return "002_Login";
	}

	// 내정보보기 select 실행
	@RequestMapping(value = "/MyInfo.do")
	public String getUserInfo(@ModelAttribute("userVO") UserVO userVO, Model model) {
		userVO = userService.selectUserInfo(userVO);
		model.addAttribute("result", userVO);

		return "003_MyInfo";
	}

	// 내정보수정 update 실행
	@RequestMapping(value = "/userUpdate.do", method = RequestMethod.POST)
	public String userUpdate(@ModelAttribute("userVO") UserVO userVO, HttpSession session, Model model) {
		UserVO vo = userService.selectUserInfo(userVO);

		if (!userVO.getPassword().equals(vo.getPassword())) {
			userVO.setPassword(passwordEncoder.encode(userVO.getPassword()));
		} else {
			userVO.setPassword(vo.getPassword());
		}

		userService.updateUser(userVO);
		session.setAttribute("result", userVO);
		model.addAttribute("message", "updateSuccese");
		return "003_MyInfo";
	}

	// 회원탈퇴 delete 실행
	@RequestMapping(value = "/userDelete.do")
	public String userDelete(@ModelAttribute("userVO") UserVO userVO) {
		userService.deleteUser(userVO);

		return "002_Login";
	}

	// 이메일 찾기 : 실행
	@RequestMapping(value = "/emailFind.do", method = RequestMethod.POST)
	public String findEmail(@ModelAttribute("userVO") UserVO userVO, Model model) {

		String email = userService.findEmail(userVO);
		if (email != null) {
			model.addAttribute("email", email);
		} else {
			model.addAttribute("message", "noEmail");
		}
		return "002_IdPwFind";
	}

	// (화면이동: 비밀번호&아이디찾기)
	@RequestMapping(value = "/IdPwFindp.do")
	public String IdPwFind() {

		return "002_IdPwFind";
	}

	// 비번찾기 인증번호 발송 실행
	@RequestMapping(value = "/IdPwFind.do", method = RequestMethod.POST)
	public ModelAndView pw_auth(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request,
			HttpServletResponse response) throws IOException, AddressException, MessagingException {
		ModelAndView mav = new ModelAndView();
		String toEmail = (String) request.getParameter("email");// 받는 사람의 이메일 주소
		String tel = (String) request.getParameter("tel");
		UserVO userInfo = userService.selectUserInfo(userVO);

		if (userInfo == null) {
			mav.setViewName("002_IdPwFind");
			mav.addObject("message", "noEmail");
		} else {

			if (userInfo != null && userInfo.getTel().equals(tel)) {

				String FROM = "z1654230@gmail.com"; // *** 회사메일 ***
				String PASSWORD = "kdxs wpbk acfn cora"; // *** 회사메일 *** 계정 비밀번호
				String HOST = "smtp.gmail.com"; // 구글 메일 서버 호스트 이름

				Random randon = new Random();
				int num = randon.nextInt(999999);
				try {
					// SMTP 프로토콜 설정
					Properties props = new Properties();
					props.setProperty("mail.smtp.host", HOST);
					props.setProperty("mail.smtp.port", "587");
					props.setProperty("mail.smtp.auth", "true");
					props.setProperty("mail.smtp.starttls.enable", "true");

					// 보내는 사람 계정 정보 설정
					Session session = Session.getInstance(props, new Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication("z1654230@gmail.com", "kdxs wpbk acfn cora");
						}
					});

					// 메일 내용 작성
					Message msg = new MimeMessage(session);
					msg.setFrom(new InternetAddress(FROM));
					msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
					msg.setSubject("#비밀번호 설정 인증코드#");
					msg.setText("안녕하세요 " + toEmail + "님 회원님의 인증번호는 " + num + " 입니다.");

					// 메일 보내기
					Transport.send(msg);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
				mav.setViewName("002_Injeong");
				mav.addObject("num", num);
				mav.addObject("email", toEmail);
				mav.addObject("message", "injeung");
			} else {
				mav.setViewName("002_IdPwFind");
				mav.addObject("message", "error");
			}
		}
		return mav;
	}

	// 이메일 인증번호 확인 실행
	@RequestMapping(value = "/pw_set.do", method = RequestMethod.POST)
	public String pw_set(@RequestParam(value = "email_injeung") String email_injeung,
			@RequestParam(value = "num") String num, Model model, HttpServletRequest request) throws IOException {

		String email = (String) request.getParameter("email");
		if (email_injeung.equals(num)) {
			model.addAttribute("email", email);
			model.addAttribute("message", "injeungOk");
			return "002_pw_new";
		} else {
			model.addAttribute("message", "error");
			model.addAttribute("email", email);
			model.addAttribute("num", num);
			return "002_Injeong";
		}
	}

	// 비밀번호 변경 실행 컨트롤러
	@RequestMapping(value = "/pw_new.do", method = RequestMethod.POST)
	public String pw_new(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request, Model model)
			throws IOException {
		String email = (String) request.getParameter("email");
		String password2 = (String) request.getParameter("password2");

		if (password2.equals(userVO.getPassword())) {
			userVO.setPassword(passwordEncoder.encode(userVO.getPassword()));
			userService.pwUpdate(userVO);
			model.addAttribute("pwChangeOk", "ok");
			return "002_Login";
		} else {
			model.addAttribute("message", "error");
			model.addAttribute("email", email);
			return "002_pw_new";
		}

	}

//------------------------------ 병원 서비스 : 병원 리스트 & 병원 상세 보기  ================================

	@Resource(name = "hosListService") // @Resource
	private HosListService hosListService;

	// 전체 병원 보기 실행
	@RequestMapping(value = "/hospital.do")
	public String hospitalAll(HttpServletRequest request, Model model) {
		String pageNumber = request.getParameter("pageNumber");
		int currentPage = 1;
		if (pageNumber != null && !pageNumber.isEmpty()) {
			try {
				currentPage = Integer.parseInt(pageNumber);
			} catch (NumberFormatException e) {
				currentPage = 1;
			}
		}
		ArrayList<HosListVO> hosalist = hosListService.getHosAllList();
		int pageSize = 10;
		int totalItems = hosalist.size();
		int totalPages = (int) Math.ceil((double) totalItems / pageSize);
		int startPage = (int) Math.ceil((double) (currentPage - 10) / 10) * 10 + 1;
		int endPage = startPage + 9;
		if (endPage > totalPages) {
			endPage = totalPages;
		}
		int startIndex = (currentPage - 1) * pageSize;
		int endIndex = Math.min(startIndex + pageSize, totalItems);
		ArrayList<HosListVO> paginatedhosalist = new ArrayList<HosListVO>(hosalist.subList(startIndex, endIndex));

		model.addAttribute("startPage", startPage); // 시작 페이지를 모델에 추가
		model.addAttribute("endPage", endPage); // 끝 페이지를 모델에 추가
		model.addAttribute("pageNumber", currentPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("hosalist", paginatedhosalist);

		return "004_Hospital";
	}

	// 각 병원에 대한 내용 보기 실행
	@RequestMapping(value = "/detailhospital.do")
	public String detailhospital(@RequestParam String hname, Model model) {

		// 정보를 model에 저장
		model.addAttribute("dto2", hosListService.getHosListinfo(hname));

		// return "005_detailhospital";
		return "005_DetailHospital";

	}

	// ------------------------------ 호텔 서비스 : 호텔 리스트 &호텔 상세 보기
	// ================================

	// 호텔 리스트 객체
	@Inject
	HotListService hotListService;

//호텔 상품 리스틍 실행 &호텔 상품 리스트 select 동시에 페이징 처리
	@RequestMapping(value = "/hotel.do")
	public String HotAll(HttpServletRequest request, Model model) {
		String pageNumber = request.getParameter("pageNumber");
		int currentPage = 1;
		if (pageNumber != null && !pageNumber.isEmpty()) {
			try {
				currentPage = Integer.parseInt(pageNumber);
			} catch (NumberFormatException e) {
				currentPage = 1;
			}
		}
		ArrayList<HotListVO> hotalist = hotListService.getHotAllList();

		int pageSize = 10;
		int totalItems = hotalist.size();
		int totalPages = (int) Math.ceil((double) totalItems / pageSize);
		int startIndex = (currentPage - 1) * pageSize;
		int endIndex = Math.min(startIndex + pageSize, totalItems);

		ArrayList<HotListVO> paginatedList = new ArrayList<HotListVO>(hotalist.subList(startIndex, endIndex));
		System.out.println("paginatedList: " + paginatedList);

		model.addAttribute("pageNumber", currentPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("hotalist", paginatedList);

		return "004_hotel";
	}

//호텔 상품상세보기 실행 
	@RequestMapping(value = "/detailhotel.do")
	public String detailhotel(@RequestParam String htname, Model model) {

		// 정보를 model에 저장
		model.addAttribute("dto", hotListService.getHotListinfo(htname));

		return "005_detailhotel";

	}

	// ------------------------------ 미용 서비스 리스트 & 상세 보기
	// ================================

	@Inject
	SalListService salListService;

// 미용 상품 리스트 
	// 미용 상품 리스트 select 동시에 페이징 처리
	@RequestMapping(value = "/salon.do")
	public String SalonAll(HttpServletRequest request, Model model) {
		String pageNumber = request.getParameter("pageNumber");
		int currentPage = 1;
		if (pageNumber != null && !pageNumber.isEmpty()) {
			try {
				currentPage = Integer.parseInt(pageNumber);
			} catch (NumberFormatException e) {
				currentPage = 1;
			}
		}
		ArrayList<SalListVO> salalist = salListService.getSalAllList();
		int pageSize = 10;
		int totalItems = salalist.size();
		int totalPages = (int) Math.ceil((double) totalItems / pageSize);
		int startPage = (int) Math.ceil((double) (currentPage - 10) / 10) * 10 + 1;
		int endPage = startPage + 9;
		if (endPage > totalPages) {
			endPage = totalPages;
		}
		int startIndex = (currentPage - 1) * pageSize;
		int endIndex = Math.min(startIndex + pageSize, totalItems);
		ArrayList<SalListVO> paginatedhosalist = new ArrayList<SalListVO>(salalist.subList(startIndex, endIndex));

		model.addAttribute("startPage", startPage); // 시작 페이지를 모델에 추가
		model.addAttribute("endPage", endPage); // 끝 페이지를 모델에 추가
		model.addAttribute("pageNumber", currentPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("salalist", paginatedhosalist);

		return "004_salon";

	}

//미용상품상세보기 
	@RequestMapping(value = "/detailsalon.do")
	public String detailsalon(@RequestParam String lsname, Model model) {

		// 정보를 model에 저장
		model.addAttribute("dto3", salListService.getSalListinfo(lsname));

		return "005_detailsalon";

	}

	// ------------------------------ 유기견 확인 서비스 ================================

	@Resource(name = "StrayAnimalService") // @Resource
	private StrayAnimalService StrayAnimalService;

	// 유기견 페이지
	@RequestMapping(value = "/StrayAnimal.do")
	public String StrayAnimal(Model model) {
		ArrayList<StrayAnimalVO> alist = StrayAnimalService.getAllSA();
		model.addAttribute("alist", alist);

		return "004_StrayAnimal";
	}

	// 유기견 조건 검색
	@RequestMapping(value = "/animalSelect.do")
	public String StrayAnimal2(StrayAnimalVO StrayAnimalVO, Model model) {

		System.out.println("we are here111111:" + StrayAnimalVO);
		ArrayList<StrayAnimalVO> alist = StrayAnimalService.getStrayAnimals(StrayAnimalVO);

		model.addAttribute("alist", alist);

		System.out.println("we are here:2222" + alist);
		return "004_StrayAnimal";
	}

	@RequestMapping(value = "/StrayAnimalDetail.do")
	public String StrayAnimalDetail(@RequestParam int asoo, StrayAnimalVO StrayAnimalVO, Model model) {

		StrayAnimalVO = StrayAnimalService.getSADetail(asoo);
		model.addAttribute("alist", StrayAnimalVO);

		return "005_StrayAnimalDetail";
	}

	// ---------택시 예약 서비스 -----------
	@Resource(name = "TaxiService")
	private TaxiService TaxiService;

	@RequestMapping(value = "/Taxi.do")
	public String taxiReserve() {

		return "009_Pettaxi";
	}

	@RequestMapping(value = "/inserttaxi.do")
	public String inserttaxi(TaxiVO TaxiVO, Model model) {

		TaxiService.inserttaxi(TaxiVO);

		String email = TaxiVO.getEmail();

		model.addAttribute("email", email);

		return "redirect:/BookList.do";

	}

	@RequestMapping(value = "/BookingtaxiDetails.do")
	public String BookingtaxiDetailsPage(@RequestParam String random, TaxiVO TaxiVO, Model model) {

		TaxiVO = TaxiService.search2taxi(random);

		model.addAttribute("TaxiVO", TaxiVO);

		return "003_BookingtaxiDetails";

	}

	@RequestMapping(value = "/taxidelete.do")
	public String taxideletePage(@RequestParam String random, Model model) {

		TaxiService.deletetaxi(random);

		return "redirect:/BookList.do";

	}

	// ------------------------------ 예약 진행 서비스 ================================

	@Resource(name = "BookListService") // @Resource: name@Autowired : type
	private BookListService BookListService;

	// 상세페이지에서 예약 재 확인 실행
	@RequestMapping(value = "/Bookingconfirm.do")
	public String BookingconfirmPage(@ModelAttribute("BookListVO") BookListVO BookListVO, Model model) {

		model.addAttribute("BookListVO", BookListVO);

		return "007_Bookingconfirm";
	}

	// 병원 서비스예약하고 예약리스트 실행
	@RequestMapping(value = "/insertBookList.do")
	public String insertpage(@ModelAttribute("BookListVO") BookListVO BookListVO, Model model) {

		BookListService.insertBookList(BookListVO);

		if (BookListVO != null) {
			// BookListVO가 null이 아닌 경우, 예약이 완료되었다는 알림 띄우기
			model.addAttribute("message", "예약이 완료되었습니다.");
			// JavaScript를 사용하여 알림 창 띄우기
			model.addAttribute("showAlert", true);
		}

		String email = BookListVO.getEmail();
		model.addAttribute("email", email);

		return "redirect:/BookList.do";
		// return "003_BookList";
	}

	// 예약내역바로 확인하기 실행
	@RequestMapping(value = "/BookList.do")
	public String showBookListPage(@RequestParam String email, Model model) {

		ArrayList<BookListVO> alist = BookListService.searchBookList(email);
		ArrayList<TaxiVO> alist2 = TaxiService.searchtaxi(email);

		model.addAttribute("alist", alist);
		model.addAttribute("alist2", alist2);

		return "003_BookList";
	}

	// 예약내역에서 한 예약내역상세보기 실행
	@RequestMapping(value = "/BookingDetails.do")
	public String BookingDetailsPage(@RequestParam String rorder, BookListVO BookListVO, Model model) {

		BookListVO = BookListService.getBookingDetail(rorder);

		model.addAttribute("BookListVO", BookListVO);

		return "003_BookingDetails";
	}

	// 예약삭제실행
	@RequestMapping(value = "/deleteBooking.do")
	public String deletepage(@RequestParam String rorder, @RequestParam String email, Model model) {

		BookListService.deleteBooking(rorder);
		model.addAttribute("email", email);

		return "redirect:/BookList.do";
	}

	// ------------------------------ 스토어 상품 리스트 & 상세페이지
	// ================================

	@Resource(name = "storeService") // @Resource: name@Autowired : type
	private StoreService storeService;

	// 스토어 상품 리스트 찾기 실행 (강아지 & 고양이)
	@RequestMapping(value = "/storeList.do")
	public String storeListPage(HttpServletRequest request, Model model) {
		String pageNumber = request.getParameter("pageNumber");
		int currentPage = 1;
		if (pageNumber != null && !pageNumber.isEmpty()) {
			try {
				currentPage = Integer.parseInt(pageNumber);
			} catch (NumberFormatException e) {
				currentPage = 1;
			}
		}
		ArrayList<StoreVO> alist = storeService.getAllStore();
		ArrayList<StoreVO> alist2 = storeService.getAllStoreCat();

		int pageSize = 8;
		int totalItems = alist.size();
		int totalPages = (int) Math.ceil((double) totalItems / pageSize);
		int startIndex = (currentPage - 1) * pageSize;
		int endIndex = Math.min(startIndex + pageSize, totalItems);

		ArrayList<StoreVO> paginatedList = new ArrayList<StoreVO>(alist.subList(startIndex, endIndex));

		model.addAttribute("pageNumber", currentPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("alist", paginatedList);

		model.addAttribute("alist2", alist2);

		return "004_StoreList";
	}

	// 스토어 상품 상세 보기 실행
	@RequestMapping(value = "/DetailPage.do")
	public String DetailPagePage(StoreVO StoreVO, Model model) {
		// StoreVO를 서비스를 통해 가져오는 코드
		StoreVO = storeService.getAllDetail(StoreVO);

		model.addAttribute("StoreVO", StoreVO);

		return "005_DetailStore";
	}

	// 상품 구매 확인 페이지 이동 실행
	@RequestMapping(value = "/Orderconfirm.do")
	public String OrderconfirmPage(@ModelAttribute("CorimVO") ConrimVO ConrimVO, Model model) {

		model.addAttribute("ConrimVO", ConrimVO);

		int s = ConrimVO.getShippingFee();
		int p = ConrimVO.getPrice() * ConrimVO.getQuantity();
		int totalprice = s + p;

		model.addAttribute("totalprice", totalprice);

		return "007_Orderconfirm";
	}

	// ------------------------------ 스토어 상품 결제 ================================

	@Resource(name = "PayService") // @Resource: name@Autowired : type
	private PayService PayService;// 객체변수 //sawonService에는 서비스 객체가 초기치로

	// 결제 실행
	@RequestMapping(value = "/payInsert.do")
	public String payInsert(@ModelAttribute("PayVO") @RequestParam String buyer_email, PayVO payVO, Model model) {

		PayService.payInsert(payVO);

		model.addAttribute("PayVO", payVO);

		model.addAttribute("email", buyer_email);

		return "003_MyOrders";

	}

	// 구매내역찾기 실행
	@RequestMapping(value = "/MyOrders.do")
	public String showMyOrdersPage(@RequestParam String email, Model model) {
//		
		ArrayList<PayVO> alist = PayService.paySearch(email);
//		
		model.addAttribute("payVO", alist);// 넣어주니 서치 가능

		System.out.println(email + "직전입니다!!!!!!문턲까지왔어! ");
		return "003_MyOrders";
	}

	// 구매상세 내역 실행
	@RequestMapping(value = "/OrderDetails.do")
	public String OrderDetailsPage(@RequestParam String merchant_uid, PayVO payVO, Model model) {

		payVO = PayService.paySearchDetail(merchant_uid);
		int price = payVO.getAmount();
		int point = Integer.parseInt(payVO.getPoint());

		int originprice = price + point - 2500;
		int originprice1 = price + point;

		model.addAttribute("PayVO", payVO);
		model.addAttribute("originprice", originprice);
		model.addAttribute("originamount", originprice1);

		return "003_OrderDetails";
	}

	// 구매 내역 삭제
	@RequestMapping(value = "/payDelete.do")
	public String payDelete(@RequestParam String merchant_uid, @RequestParam String email, PayVO payVO, Model model) {

		System.out.println("@");

		PayService.payDelete(merchant_uid);
		model.addAttribute("email", email);

		System.out.println("pay");
		return "redirect:/MyOrders.do";

	}

	// ------------------------------유기견 통계 현황 ================================

	@RequestMapping(value = "/Lovedog.do")
	public String Lovedog() {

		return "009_Lovedog";
	}

	// -------------------------------장바구니
	// ============================================

	@Resource(name = "cartService")
	CartService cartService;

	@RequestMapping(value = "/Cartmain.do")
	public String showCart2Page(@RequestParam String email, Model model) {

		ArrayList<CartVO> test = cartService.purchase_list(email);

		model.addAttribute("purchase_list", test);

		return "003_cart";
	}

	@RequestMapping(value = "/Cart.do")
	public String showCartPage(@RequestParam String email, @ModelAttribute CartVO cartVO, Model model) {
		// 카트에 삽입된 상품 정보를 가져옴
		ArrayList<CartVO> existingItems = cartService.getCartItem(cartVO);
		// 기존에 카트에 있는 상품과 동일한 상품이 있는 경우
		if (existingItems != null && !existingItems.isEmpty()) {
			//found라는 boolean 변수를 선언하고 false로 초기화합니다.
			boolean found = false;
			for (CartVO existingItem : existingItems) {
				if (existingItem.getName().equals(cartVO.getName())
						&& existingItem.getOption3().equals(cartVO.getOption3())) {
					// 해당 상품이 이미 카트에 존재함
	                // 기존 수량에 새로운 상품의 수량을 추가함
					existingItem.setPriceCnt(existingItem.getPriceCnt() + cartVO.getPriceCnt());
					// 카트에 있는 상품의 수량을 업데이트
					cartService.cartUpdate(existingItem);
					//found를 true로 설정하여 해당 상품이 이미 카트에 존재함을 표시합니다.
					found = true;
					break;
				}
			}
			if (!found) {
				// 카트에 해당 상품이 없는 경우에는 새로 추가
				cartService.cartInsert(cartVO);
			}
		} else {
			// 카트가 비어 있는 경우에는 새로 추가
			cartService.cartInsert(cartVO);
		}
		// 장바구니 페이지로 이동
		model.addAttribute("email", email);
		return "redirect:/Cartmain.do";
	}

	@RequestMapping(value = "/CartDelete.do")
	public String DeleteCartPage(@RequestParam String email, @ModelAttribute CartVO cartVO, Model model) {

		cartService.cartDelete(cartVO);

		// 장바구니 페이지로 이동
		model.addAttribute("email", email);

		// return "003_cart";

		return "redirect:/Cartmain.do";
	}

	

//-----------------------------------

	// 검색 바
	@RequestMapping(value = "/AllList.do")
	public String search(HttpServletRequest request, Model model) {
		String area = request.getParameter("area");
		System.out.println("area: " + area);
		// alist=========================================================
		String pageNumber = request.getParameter("pageNumber");
		int currentPage = 1;
		if (pageNumber != null && !pageNumber.isEmpty()) {
			try {
				currentPage = Integer.parseInt(pageNumber);
			} catch (NumberFormatException e) {
				currentPage = 1;
			}
		}
		ArrayList<StoreVO> alist = storeService.getAreaStore(area);
		System.out.println("alistz.size(): " + alist.size());
		int pageSize = 8;
		int totalItems = alist.size();
		int totalPages = (int) Math.ceil((double) totalItems / pageSize);
		int startIndex = (currentPage - 1) * pageSize;
		int endIndex = Math.min(startIndex + pageSize, totalItems);
		ArrayList<StoreVO> paginatedList = new ArrayList<StoreVO>(alist.subList(startIndex, endIndex));
		model.addAttribute("pageNumber", currentPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("alist", paginatedList);

		// alist2=========================================================
		String pageNumber2 = request.getParameter("pageNumber2");
		int currentPage2 = 1;
		if (pageNumber2 != null && !pageNumber2.isEmpty()) {
			try {
				currentPage2 = Integer.parseInt(pageNumber2);
			} catch (NumberFormatException e) {
				currentPage2 = 1;
			}
		}
		ArrayList<HotListVO> alist2 = hotListService.getHotAreaList(area);
		System.out.println("alist2.size(): " + alist2.size());

		int pageSize2 = 8;
		int totalItems2 = alist2.size();
		int totalPages2 = (int) Math.ceil((double) totalItems2 / pageSize2);
		int startIndex2 = (currentPage2 - 1) * pageSize2;
		int endIndex2 = Math.min(startIndex2 + pageSize2, totalItems2);
		ArrayList<HotListVO> paginatedList2 = new ArrayList<HotListVO>(alist2.subList(startIndex2, endIndex2));
		model.addAttribute("pageNumber2", currentPage2);
		model.addAttribute("totalPages2", totalPages2);
		model.addAttribute("alist2", paginatedList2);

		// alist3=========================================================
		String pageNumber3 = request.getParameter("pageNumber3");
		int currentPage3 = 1;
		if (pageNumber3 != null && !pageNumber3.isEmpty()) {
			try {
				currentPage3 = Integer.parseInt(pageNumber3);
			} catch (NumberFormatException e) {
				currentPage3 = 1;
			}
		}
		ArrayList<HosListVO> alist3 = hosListService.getHosAreaList(area);
		System.out.println("alist3.size(): " + alist3.size());

		int pageSize3 = 8;
		int totalItems3 = alist3.size();
		int totalPages3 = (int) Math.ceil((double) totalItems3 / pageSize3);
		int startIndex3 = (currentPage3 - 1) * pageSize3;
		int endIndex3 = Math.min(startIndex3 + pageSize3, totalItems3);
		ArrayList<HosListVO> paginatedList3 = new ArrayList<HosListVO>(alist3.subList(startIndex3, endIndex3));
		model.addAttribute("pageNumber3", currentPage3);
		model.addAttribute("totalPages3", totalPages3);
		model.addAttribute("alist3", paginatedList3);

		// alist4=========================================================
		String pageNumber4 = request.getParameter("pageNumber4");
		int currentPage4 = 1;
		if (pageNumber4 != null && !pageNumber4.isEmpty()) {
			try {
				currentPage4 = Integer.parseInt(pageNumber4);
			} catch (NumberFormatException e) {
				currentPage4 = 1;
			}
		}
		ArrayList<SalListVO> alist4 = salListService.getSalAreaList(area);
		System.out.println("alist4.size(): " + alist4.size());

		int pageSize4 = 8;
		int totalItems4 = alist4.size();
		int totalPages4 = (int) Math.ceil((double) totalItems4 / pageSize4);
		int startIndex4 = (currentPage4 - 1) * pageSize4;
		int endIndex4 = Math.min(startIndex4 + pageSize4, totalItems4);
		ArrayList<SalListVO> paginatedList4 = new ArrayList<SalListVO>(alist4.subList(startIndex4, endIndex4));
		model.addAttribute("pageNumber4", currentPage4);
		model.addAttribute("totalPages4", totalPages4);
		model.addAttribute("alist4", paginatedList4);

		model.addAttribute("area", area);

		return "004_AllList";
	}

	// =============================== 게시판 & 댓글
	// ======================================//
	@Resource(name = "BoardService") // @Resource: name@Autowired : type
	private BoardService BoardService;

	@Resource(name = "ReplyService") // @Resource: name@Autowired : type
	private ReplyService ReplyService;

	// 게시글 작성화면 이동
	@RequestMapping(value = "/boardwrite.do")
	public String boardwritePage() {

		return "008_boardwrite";

	}

	// 게시글 작성
	@RequestMapping(value = "/insertBoard.do")
	public String insertBoard(@ModelAttribute BoardVO boardVO, HttpServletRequest request, Model model) {

		// 로그인된 세션 끌고와서 userid에 이메일 넣기
		HttpSession session = request.getSession(false);
		if (session != null) {
			UserVO userVO = (UserVO) session.getAttribute("result");
			boardVO.setUserid(userVO.getEmail());
		}
		System.out.println(boardVO);

		// 현재 날짜를 받아와서 BoardVO에 설정 //현재 시간의 Date 객체 생성
		Date currentDate = new Date(System.currentTimeMillis());
		boardVO.setBbsdate(currentDate);

		boolean result = BoardService.insertBoard(boardVO);

		return "redirect:/board.do";

	}

	// 게시글 수정화면 이동
	@RequestMapping(value = "/boardrewrite.do")
	public String boardrewritePage(@RequestParam int bbsid, Model model) {

		BoardVO boardVO = BoardService.getBoardDetail(bbsid);
		model.addAttribute("update", boardVO);
		return "008_boardrewrite";

	}

	// 게시글 수정
	@RequestMapping(value = "/updateBoard.do")
	public String updateBoard(@ModelAttribute("BoardVO") BoardVO boardVO, Model model) {

		System.out.println(boardVO);

		// 현재 날짜를 받아와서 BoardVO에 설정 //현재 시간의 Date 객체 생성
		Date currentDate = new Date(System.currentTimeMillis());
		boardVO.setBbsdate(currentDate);

		BoardService.updateBoard(boardVO);

		System.out.println(boardVO + "22222");

		return "redirect:/board.do";

	}

	// 게시글 삭제
	@RequestMapping(value = "/deleteBoard.do")
	public String deleteBoard(@RequestParam int bbsid, Model model) {

		BoardService.deleteBoard(bbsid);
		model.addAttribute("bbsid", bbsid);

		return "redirect:/board.do";
	}

	// 게시판 - 게시글 목록
	@RequestMapping(value = "/board.do")
	public String getAllBoard(Model model) {

		ArrayList<BoardVO> boardlist = BoardService.getAllBoard();

		model.addAttribute("boardlist", boardlist);

		return "008_board";

	}

	// 게시글 상세 조회 + 해당 게시글 댓글 목록
	@RequestMapping(value = "/viewboard.do", method = RequestMethod.GET)
	public String getBoardDetail(BoardVO BoardVO, @RequestParam int bbsid, Model model) throws Exception {

		// 정보를 model에 저장
		model.addAttribute("bto", BoardService.getBoardDetail(BoardVO.getBbsid()));

		// 댓글
		List<ReplyVO> replyList;
		replyList = ReplyService.readReply(BoardVO.getBbsid());
		model.addAttribute("replyList", replyList);

		return "008_viewboard";

	}

	// 댓글 작성
	@RequestMapping(value = "/writeReply.do")
	public String writeReply(@ModelAttribute ReplyVO replyVO, HttpServletRequest request, Model model)
			throws Exception {

		// 로그인된 세션 끌고와서 userid에 이메일 넣기
		HttpSession session = request.getSession(false);

		if (session != null) {
			UserVO userVO = (UserVO) session.getAttribute("result");
			replyVO.setRpywriter(userVO.getEmail());
		}

		System.out.println(replyVO);

		// 현재 날짜를 받아와서 BoardVO에 설정 //현재 시간의 Date 객체 생성
		Date currentDate = new Date(System.currentTimeMillis());
		replyVO.setRpydate(currentDate);

		ReplyService.writeReply(replyVO);

		return "redirect:/board.do";

	}

	// 업로드 사진 화면에 보여지게
	@RequestMapping(value = "/display.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<FileSystemResource> display(@RequestParam("filename") String filename) {
		String path = "C:\\Temp\\";
		String folder = "";
		FileSystemResource resource = new FileSystemResource(path + folder + filename);
		if (!resource.exists())
			return new ResponseEntity<FileSystemResource>(HttpStatus.NOT_FOUND);

		HttpHeaders header = new HttpHeaders();
		Path filePath = null;
		try {
			filePath = Paths.get(path + folder + filename);
			header.add("Content-type", Files.probeContentType(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<FileSystemResource>(resource, header, HttpStatus.OK);
	}

	// ==================결제 ========================
//@ExceptionHandler public String handleException(Exception e){ 
//        
//        return"viewError";
//     }
//	   

//	

	// --------------------------------------------------------------------------------

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

}
