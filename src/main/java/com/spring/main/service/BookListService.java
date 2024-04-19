package com.spring.main.service;


import java.util.ArrayList;

import com.spring.main.vo.BookListVO;


public interface BookListService {
	
	void insertBookList(BookListVO BookListVO);
	ArrayList<BookListVO> searchBookList (String email);
	BookListVO getBookingDetail (String roder);
	void deleteBooking (String roder);


}
