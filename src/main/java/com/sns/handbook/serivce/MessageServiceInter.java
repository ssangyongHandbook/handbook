package com.sns.handbook.serivce;

import java.util.List;

import com.sns.handbook.dto.MessageDto;

public interface MessageServiceInter {

	public List<MessageDto> selectAllChatMemeber(String unum);
}
