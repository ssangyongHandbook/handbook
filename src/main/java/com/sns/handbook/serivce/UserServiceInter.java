package com.sns.handbook.serivce;

import java.util.List;

import com.sns.handbook.dto.PostDto;
import com.sns.handbook.dto.UserDto;

public interface UserServiceInter {

	public int getTotalCount();
	public int loginIdPassCheck(String user_id, String user_pass);
	
	//예지
	public UserDto getUserById(String user_id);
	public UserDto getUserByNum(String user_num);
	
	//우형 시작	
	public void updateCover(String user_num,String user_cover);
	public List<UserDto> getAllUsers();
	public void updatePhoto(String user_num,String user_photo);
	public List<PostDto> getPost(String user_num);
	//우형 끝	

	//이 아래 김희수 구현
	public void insertUserInfo(UserDto dto);
	public UserDto getUserDtoById(String user_id);
	//이 위 김희수 구현

}
