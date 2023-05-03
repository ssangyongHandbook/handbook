package com.sns.handbook.serivce;

import java.util.List;
import java.util.Map;

import com.sns.handbook.dto.MessageDto;

public interface MessageServiceInter {

	public List<Map<String, Object>> selectAllChatMemeber(String user_num);
	public MessageDto selectRecentMessage(String user_num,String other);
}
