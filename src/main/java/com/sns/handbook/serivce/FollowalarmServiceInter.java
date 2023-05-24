package com.sns.handbook.serivce;

import java.util.List;

import com.sns.handbook.dto.FollowalarmDto;

public interface FollowalarmServiceInter {

	public void insertFollowalarm(FollowalarmDto dto);
	public List<FollowalarmDto> getAllFollowalarm(String reciever_num);
	public int getAllCountFollowalarm(String receiver_num);
}
