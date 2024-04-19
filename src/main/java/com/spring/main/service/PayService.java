package com.spring.main.service;

import java.util.ArrayList;


import com.spring.main.vo.PayVO;


public interface PayService {


	void payInsert(PayVO payVO);

	ArrayList<PayVO> paySearch(String email);	

	void payDelete(String merchant_uid);

	PayVO paySearchDetail (String merchant_uid);



 
	
	//service는 serviceImpl이 필요하지만
	//dao는 interface 상태로 막 바로 mapper와 연결되므로 daoImpl은 필요 없음
}


