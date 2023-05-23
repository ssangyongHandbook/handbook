package com.sns.handbook.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sns.handbook.dto.FollowalarmDto;

@Mapper
public interface FollowalarmMapperInter {

	public void insertFollowalarm(FollowalarmDto dto);
	public List<FollowalarmDto> getAllFollowalarm(String reciever_num);
	public int getAllCountFollowalarm(String receiver_num);
}
