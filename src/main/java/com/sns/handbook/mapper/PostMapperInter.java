package com.sns.handbook.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sns.handbook.dto.PostDto;

@Mapper
public interface PostMapperInter {
	public int getTotalCount();
	public void insertPost(PostDto dto);
	public List<PostDto> postList(int offset);
	public void deletePost(int num);

 
}
