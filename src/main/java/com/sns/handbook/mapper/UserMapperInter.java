package com.sns.handbook.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sns.handbook.dto.UserDto;

@Mapper
public interface UserMapperInter {

	public int getTotalCount();
	public int loginIdPassCheck(Map<String, String> map);
	//이 아래 김희수 구현
	public void insertUserInfo(UserDto dto);
	public UserDto getUserDtoById(String user_id);
	//이 위 김희수 구현 
}
