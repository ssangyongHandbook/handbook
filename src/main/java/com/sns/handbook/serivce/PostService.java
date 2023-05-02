package com.sns.handbook.serivce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
