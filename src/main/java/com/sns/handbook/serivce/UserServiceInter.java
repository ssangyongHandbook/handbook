package com.sns.handbook.serivce;

import java.util.List;

import com.sns.handbook.dto.UserDto;

public interface UserServiceInter {

	public int getTotalCount();
	public int loginIdPassCheck(String user_id, String user_pass);
	public void updateCover(String user_num,String user_cover);
	public List<UserDto> getAllUsers();
}
