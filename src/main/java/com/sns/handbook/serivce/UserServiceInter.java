package com.sns.handbook.serivce;

public interface UserServiceInter {

	public int getTotalCount();
	public int loginIdPassCheck(String user_id, String user_pass);
}
