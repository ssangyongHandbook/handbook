package com.sns.handbook.serivce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.handbook.mapper.BookmarkMapperInter;

@Service
public class BookmarkService implements BookmarkServiceInter {

	@Autowired
	BookmarkMapperInter mapper;
	
}
