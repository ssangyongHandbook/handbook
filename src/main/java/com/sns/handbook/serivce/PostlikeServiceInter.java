package com.sns.handbook.serivce;

import com.sns.handbook.dto.PostlikeDto;

public interface PostlikeServiceInter {

	public int getTotalLike();
	public void insertLike(PostlikeDto dto);
	public void deleteLike(String plike_num);
	
}
