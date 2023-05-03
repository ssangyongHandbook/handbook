package com.sns.handbook.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sns.handbook.dto.UserDto;

@Mapper
public interface UserMapperInter {

	public int getTotalCount();
	public int loginIdPassCheck(Map<String, String> map);
	public void updateCover(Map<String, String> map);
	public List<UserDto> getAllUsers();
	//이 아래 김희수 구현
	public void insertUserInfo(UserDto dto);
	//이 위 김희수 구현
}
