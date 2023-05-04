package com.sns.handbook.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sns.handbook.dto.FollowingDto;

@Mapper
public interface FollowingMapperInter {

	public int checkFollowing(Map<String, String> map);
	public int checkFollower(Map<String, String> map);
	public int getTotalFollowing(String from_user);
	public int getTotalFollower(String to_user);
	public void insertFollowing(FollowingDto dto);
	public void deleteFollowing(String to_user);
	public List<FollowingDto> getFollowList(Map<String, Object> map);
	public int togetherFollow(Map<String, String> map);
	
	
	
}
