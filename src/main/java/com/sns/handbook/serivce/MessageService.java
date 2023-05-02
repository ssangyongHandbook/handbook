package com.sns.handbook.serivce;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.handbook.dto.MessageDto;
import com.sns.handbook.mapper.MessageMapperInter;

@Service
public class MessageService implements MessageServiceInter {
	
	@Autowired
	MessageMapperInter mapperInter;

	@Override
	public List<MessageDto> selectAllChatMemeber(String unum) {
		// 나를 제외한 다른 사용자와 해당 메시지의 그룹만 뽑아서 넘겨준다
		return mapperInter.selectAllChatMemeber(unum);
	}

}
