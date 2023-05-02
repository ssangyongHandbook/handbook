package com.sns.handbook.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PostMapperInter {
	public int getTotalCount();
}
