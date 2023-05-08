package com.sns.handbook.serivce;

import java.util.List;

import com.sns.handbook.dto.PostDto;

public interface PostServiceInter {

	public int getTotalCount();
	public void insertPost(PostDto dto);
	public List<PostDto> postList(int offset);
	public void deletePost(int post_num);
	public void updatePost(PostDto dto);
	public PostDto getDataByNum(String post_num);
	public void updatePhoto(String post_num,String post_file);

}
