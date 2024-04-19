package com.spring.main.service.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.spring.main.vo.BookListVO;




@Mapper
public interface BookListDAO { 
	
	//병원 전체 리스트
	void insertBookList( BookListVO BookListVO);
	
	ArrayList<BookListVO> searchBookList (String email);
	
	BookListVO getBookingDetail (String roder);

	void deleteBooking (String roder);
	
	

}


