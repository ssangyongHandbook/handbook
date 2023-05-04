package com.sns.handbook.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sns.handbook.dto.CommentDto;

@Mapper
public interface CommentMapperInter {

	public int getMaxNum();
	public void updateStep(Map<String, Integer> map);
	public void insert(CommentDto dto);
	public void delete(String comment_num);
	public CommentDto getData(String comment_num);
	public void update(CommentDto dto);
	public List<CommentDto> selectScroll(Map<String, Object> map);
	public List<CommentDto> getAllDatas();
}
