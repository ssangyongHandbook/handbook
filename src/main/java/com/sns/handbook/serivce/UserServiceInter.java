package com.sns.handbook.serivce;

import com.sns.handbook.dto.UserDto;

public interface UserServiceInter {

	public int getTotalCount();
	public int loginIdPassCheck(String user_id, String user_pass);
	
	//예지
	public UserDto getUserById(String user_id);
	public UserDto getUserByNum(String user_num);
}
