package com.sns.handbook.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapperInter {

	public int getTotalCount();
	public int loginIdPassCheck(Map<String, String> map);
}
