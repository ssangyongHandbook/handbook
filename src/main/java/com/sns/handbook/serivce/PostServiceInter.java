package com.sns.handbook.serivce;

import java.util.List;

import com.sns.handbook.dto.PostDto;

public interface PostServiceInter {

	public int getTotalCount();
	public void insertPost(PostDto dto);
	public List<PostDto> postList();
}
