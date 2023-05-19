package com.sns.handbook.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sns.handbook.dto.BookmarkDto;

@Mapper
public interface BookmarkMapperInter {
	
	public void insertBookmark(BookmarkDto dto);
	public void deleteBookmark(Map<String, String> map);
	public int bookmarkCheck(Map<String, String> map);
	
}
