package com.spring.main.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.main.service.PayService;


import com.spring.main.vo.PayVO;
import com.spring.main.service.dao.PayDAO;


@Service("PayService")
public class PayServiceImpl implements PayService {

	@Autowired
	private PayDAO PayDAO;


	@Override
	public void payInsert(PayVO payVO) {
		// TODO Auto-generated method stub

		PayDAO.payInsert(payVO);
	}


	@Override
	public ArrayList<PayVO> paySearch(String email) {
		// TODO Auto-generated method stub
		System.out.println(email+"impl");
		return PayDAO.paySearch(email);
	}


	@Override
	public PayVO paySearchDetail(String merchant_uid) {
		// TODO Auto-generated method stub
		return PayDAO.paySearchDetail(merchant_uid);
	}


	@Override
	public void payDelete(String merchant_uid) {
		// TODO Auto-generated method stub
		PayDAO.payDelete(merchant_uid);
	}
	
	

}
