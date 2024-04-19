package com.spring.main.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

import com.spring.main.vo.CartVO;

public interface CartService {

	void cartInsert(CartVO cartVO); // 상품 결제하려는것을 장바구니에 넣기

	ArrayList<CartVO> purchase_list(String email); // 이메일로 구매목록 조회

	void cartUpdate(CartVO existingItem);

	ArrayList<CartVO> getCartItem(CartVO cartVO);
	ArrayList<CartVO> multipay (CartVO cartVO);

	void cartDelete(CartVO cartVO);

	

	

}
