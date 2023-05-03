package com.sns.handbook.serivce;

import com.sns.handbook.dto.UserDto;

public interface UserServiceInter {

	public int getTotalCount();
	public int loginIdPassCheck(String user_id, String user_pass);
	//이 아래 김희수 구현
	public void insertUserInfo(UserDto dto);
	//이 위 김희수 구현
}
