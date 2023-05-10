package com.sns.handbook.serivce;

import java.util.List;

import com.sns.handbook.dto.FollowingDto;
import com.sns.handbook.dto.MailDto;
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
	public void updateUserInfo(UserDto dto);
	public List<FollowingDto> getFollowList(String from_user, int offset);
	//우형 끝	

	//희수 시작
	public void insertUserInfo(UserDto dto);
	public UserDto getUserDtoById(String user_id);
	public int loginEmailCheck(String user_email);

	public MailDto createMailAndChangePassword(String memberEmail);
	public void updatePassword(String user_num, String user_pass);
	public String getTempPassword();
	public void mailSend(MailDto mailDto);
	public String getUserIdByEmail(String user_email);
	//희수 끝
	
	//예지
	public List<UserDto> getUserByName(String user_name);
}
