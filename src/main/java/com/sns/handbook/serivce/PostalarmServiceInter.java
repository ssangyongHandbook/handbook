package com.sns.handbook.serivce;

import java.util.List;

import com.sns.handbook.dto.PostalarmDto;

public interface PostalarmServiceInter {
	public void insertPostAlarm(PostalarmDto dto);
	public List<PostalarmDto> getAllPostAlarm(String receiver_num);
	public int getTotalCountPostAlarm(String receiver_num);
	public void deleteallPostAlarm(String receiver_num);
}
