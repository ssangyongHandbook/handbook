package com.sns.handbook.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sns.handbook.dto.PostDto;
import com.sns.handbook.dto.UserDto;

@Mapper
public interface UserMapperInter {

	public int getTotalCount();
	public int loginIdPassCheck(Map<String, String> map);
	
	//예지
	public UserDto getUserById(String user_id);
	public UserDto getUserByNum(String user_num);

	//우형 시작
	public void updateCover(Map<String, String> map);
	public List<UserDto> getAllUsers();
	public void updatePhoto(Map<String, String> map);
	public List<PostDto> getPost(String user_num);
	public void updateUserInfo(UserDto dto);
	//우형 끝
	
	//이 아래 김희수 구현
	public void insertUserInfo(UserDto dto);

	public UserDto getUserDtoById(String user_id);
	//이 위 김희수 구현 

}
