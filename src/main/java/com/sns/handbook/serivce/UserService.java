package com.sns.handbook.serivce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.handbook.mapper.UserMapperInter;

@Service
public class UserService implements UserServiceInter{

	@Autowired
	UserMapperInter mapperInter;

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getTotalCount();
	}
	
}
