package com.sns.handbook.serivce;




import com.sns.handbook.dto.FollowingDto;

public interface FollowingServiceInter {

	public int checkFollowing(String from_user,String to_user);
	public int checkFollower(String to_user,String from_user);
	public int getTotalFollowing(String from_user);
	public int getTotalFollower(String to_user);
	public void insertFollowing(FollowingDto dto);
	public void deleteFollowing(String to_user);
}
