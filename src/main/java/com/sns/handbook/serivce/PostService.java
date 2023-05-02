package com.sns.handbook.serivce;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.handbook.dto.PostDto;
import com.sns.handbook.mapper.PostMapperInter;

@Service
public class PostService implements PostServiceInter {

	@Autowired
	PostMapperInter pmapperInter;

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return pmapperInter.getTotalCount();
	}

	@Override
	public void insertPost(PostDto dto) {
		// TODO Auto-generated method stub
		pmapperInter.insertPost(dto);
	}

	@Override
	public List<PostDto> postList() {
		// TODO Auto-generated method stub
		return pmapperInter.postList();
	}
	
}
