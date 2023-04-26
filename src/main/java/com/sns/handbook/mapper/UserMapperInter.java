package com.sns.handbook.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapperInter {

	public int getTotalCount();
}
