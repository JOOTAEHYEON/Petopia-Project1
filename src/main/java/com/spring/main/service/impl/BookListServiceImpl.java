package com.spring.main.service.impl;



import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.spring.main.service.BookListService;


import com.spring.main.service.dao.BookListDAO;
import com.spring.main.vo.BookListVO;

@Service("BookListService")
public  class BookListServiceImpl implements BookListService {
	
	@Autowired
	private BookListDAO BookListDAO ;

	@Override
	public void insertBookList(BookListVO BookListVO) {
		// TODO Auto-generated method stub
		BookListDAO.insertBookList(BookListVO);
		
	}


	@Override
	public ArrayList<BookListVO> searchBookList(String email) {
		// TODO Auto-generated method stub
		
		
		return BookListDAO.searchBookList( email);
	}


	@Override
	public BookListVO getBookingDetail(String roder) {
		// TODO Auto-generated method stub
		return BookListDAO.getBookingDetail(roder);
	}


	@Override
	public void deleteBooking(String roder) {
		// TODO Auto-generated method stub
		BookListDAO.deleteBooking(roder);
	}


	

	
	

}
