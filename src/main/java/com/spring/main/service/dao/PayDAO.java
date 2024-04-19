package com.spring.main.service.dao;

import java.util.ArrayList;

import com.spring.main.vo.PayVO;




//mapper interface 

public interface PayDAO { //interface // 3.0 interface & mapping


    void payInsert(PayVO payVO);	
    ArrayList<PayVO> paySearch(String email);	
	void payDelete(String merchant_uid);
	PayVO paySearchDetail (String merchant_uid);
	
	
}
