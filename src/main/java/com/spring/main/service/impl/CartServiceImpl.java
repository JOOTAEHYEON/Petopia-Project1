package com.spring.main.service.impl;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.main.service.CartService;
import com.spring.main.service.dao.CartDAO;
import com.spring.main.vo.CartVO;

@Service("cartService")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO cartdao;

	// 상품 장바구니에 담는(insert) 함수
	@Override
	@Transactional
	public void cartInsert(CartVO cartVO) {
		cartdao.cartInsert(cartVO);
	}

	public ArrayList<CartVO> purchase_list(String email) {

		return cartdao.purchase_list(email);
	}

	@Override
	public void cartUpdate(CartVO existingItem) {

		cartdao.cartUpdate(existingItem);

	}

	@Override
	public ArrayList<CartVO> getCartItem(CartVO cartVO) {
		// TODOAuto-generated method stub return
		return cartdao.getCartItem(cartVO);

	}

	@Override
	public void cartDelete(CartVO cartVO) {
		// TODO Auto-generate method stub
		cartdao.cartDelete(cartVO);

	}

	@Override
	public ArrayList<CartVO> multipay(CartVO cartVO) {
	    // cartVO를 기반으로 처리를 수행하여 새로운 CartVO 객체를 생성하고 리스트에 추가
	    ArrayList<CartVO> processedCartVO = multipay (cartVO);
	  
	    return processedCartVO;
	}

	


}
