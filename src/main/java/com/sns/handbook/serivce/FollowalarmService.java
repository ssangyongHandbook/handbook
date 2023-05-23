package com.sns.handbook.serivce;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.handbook.dto.FollowalarmDto;
import com.sns.handbook.mapper.FollowalarmMapperInter;

@Service
public class FollowalarmService implements FollowalarmServiceInter {

	@Autowired
	FollowalarmMapperInter mapperInter;
	
	@Override
	public void insertFollowalarm(FollowalarmDto dto) {
		// TODO Auto-generated method stub
		mapperInter.insertFollowalarm(dto);
	}

	@Override
	public List<FollowalarmDto> getAllFollowalarm(String reciever_num) {
		// TODO Auto-generated method stub
		return mapperInter.getAllFollowalarm(reciever_num);
	}

	@Override
	public int getAllCountFollowalarm(String receiver_num) {
		// TODO Auto-generated method stub
		return mapperInter.getAllCountFollowalarm(receiver_num);
	}

}
