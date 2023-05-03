package com.sns.handbook.serivce;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.handbook.dto.UserDto;
import com.sns.handbook.mapper.UserMapperInter;

@Service
public class UserService implements UserServiceInter{

	@Autowired
	UserMapperInter mapperInter;

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getTotalCount();
	}

	@Override
	public int loginIdPassCheck(String user_id, String user_pass) {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_pass", user_pass);
		return mapperInter.loginIdPassCheck(map);
	}

	//예지
	@Override
	public UserDto getUserById(String user_id) {
		// TODO Auto-generated method stub
		return mapperInter.getUserById(user_id);
	}

	@Override
	public UserDto getUserByNum(String user_num) {
		// TODO Auto-generated method stub
		return mapperInter.getUserByNum(user_num);
	}

	//우형 시작	
	@Override
	public void updateCover(String user_num, String user_cover) {
		// TODO Auto-generated method stub
		Map<String, String>map=new HashMap<>();
		map.put("user_num", user_num);
		map.put("user_cover", user_cover);
		
		mapperInter.updateCover(map);
		
	}

	@Override
	public List<UserDto> getAllUsers() {
		// TODO Auto-generated method stub
		return mapperInter.getAllUsers();
	//우형 끝	
	}

	//이 아래 김희수
	@Override
	public void insertUserInfo(UserDto dto) {
		mapperInter.insertUserInfo(dto);
	}
	
	@Override
	public UserDto getUserDtoById(String user_id) {
		// TODO Auto-generated method stub
		return mapperInter.getUserDtoById(user_id);
	}
	//이 위 김희수


	
}
