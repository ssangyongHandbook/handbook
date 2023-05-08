package com.sns.handbook.mapper;

import com.sns.handbook.dto.PostlikeDto;

public interface PostlikeMapperInter {
	public int getTotalLike();
	public void insertLike(PostlikeDto dto);
	public void deleteLike(String plike_num);
}
