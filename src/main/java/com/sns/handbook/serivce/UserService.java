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
	
}
