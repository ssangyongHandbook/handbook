package com.sns.handbook.serivce;

import com.sns.handbook.dto.BookmarkDto;

public interface BookmarkServiceInter {
	public void insertBookmark(BookmarkDto dto);
	public void deleteBookmark(String owner_num, String	bfriend_num);
	public int bookmarkCheck(String owner_num, String bfriend_num);
}
