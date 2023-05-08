package com.sns.handbook.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sns.handbook.dto.MessageDto;

@Mapper
public interface MessageMapperInter {

	public List<MessageDto> selectAllChatMemeber(String user_num);
	public MessageDto selectRecentMessage(Map<String, String> map);
	public List<MessageDto> selectAllByGroup(Map<String, Object> map);
	public void insertMessage(MessageDto dto);
	public int getRecentGroup(String user_num);
}
