package com.sns.handbook.serivce;

import java.util.List;
import java.util.Map;

import com.sns.handbook.dto.PostDto;

public interface PostServiceInter {

	public int getTotalCount();
	public void insertPost(PostDto dto);
	public List<PostDto> postList(String searchcolumn, String searchword,int offset); //파리미터값 변경
	public void deletePost(int post_num);
	public void updatePost(PostDto dto);
	public PostDto getDataByNum(String post_num);
	public void updatePhoto(String post_num,String post_file);
}
