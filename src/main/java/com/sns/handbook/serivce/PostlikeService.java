package com.sns.handbook.serivce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.handbook.dto.PostlikeDto;
import com.sns.handbook.mapper.PostlikeMapperInter;

@Service
public class PostlikeService implements PostlikeServiceInter {

	@Autowired
	PostlikeMapperInter plInter;
	
	@Override
	public int getTotalLike( ) {
		// TODO Auto-generated method stub
		return plInter.getTotalLike();
	}

	@Override
	public void insertLike(PostlikeDto dto) {
		// TODO Auto-generated method stub
		plInter.insertLike(dto);
	}

	@Override
	public void deleteLike(String plike_num) {
		// TODO Auto-generated method stub
		plInter.deleteLike(plike_num);
	}

}
