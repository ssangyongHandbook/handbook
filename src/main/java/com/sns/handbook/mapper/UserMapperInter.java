package com.sns.handbook.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sns.handbook.dto.UserDto;

@Mapper
public interface UserMapperInter {

	public int getTotalCount();
	public int loginIdPassCheck(Map<String, String> map);
	
	//예지
	public UserDto getUserById(String user_id);
	public UserDto getUserByNum(String user_num);
}
