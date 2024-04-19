package com.spring.main.service.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.main.vo.CartVO;

public interface CartDAO {

	void cartInsert(CartVO cartVO); // 상품 결제하려는것을 장바구니에 넣기

	ArrayList<CartVO> purchase_list(String email); // 이메일로 구매목록 조회

	void cartUpdate(CartVO existingItem);

	ArrayList<CartVO> getCartItem(CartVO cartVO);
	
	void cartDelete(CartVO cartVO);

	

	

}
