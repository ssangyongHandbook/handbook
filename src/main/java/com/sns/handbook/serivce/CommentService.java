package com.sns.handbook.serivce;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.handbook.dto.CommentDto;
import com.sns.handbook.mapper.CommentMapperInter;

@Service
public class CommentService implements CommentServiceInter {

	@Autowired
	CommentMapperInter mapper;
	
	@Override
	public void delete(String comment_num) {
		// TODO Auto-generated method stub
		mapper.delete(comment_num);
	}
	
	@Override
	public CommentDto getData(String comment_num) {
		// TODO Auto-generated method stub
		return mapper.getData(comment_num);
	}
	
	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return mapper.getMaxNum();
	}
	
	@Override
	public void update(CommentDto dto) {
		// TODO Auto-generated method stub
		mapper.update(dto);
	}
	
	@Override
	public void updateStep(int comment_group, int comment_step) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<>();
		
		map.put("comment_group", comment_group);
		map.put("comment_step", comment_step);
		mapper.updateStep(map);
	}
	
	@Override
	public void insert(CommentDto dto) {
		// TODO Auto-generated method stub
		String comment_num=dto.getComment_num();
		int comment_group=dto.getComment_group();
		int comment_step=dto.getComment_step();
		int comment_level=dto.getComment_level();
		
		if(comment_num.equals("0")) {  //새글
			
			comment_group=this.getMaxNum()+1;
			comment_step=0;
			comment_level=0;
		}  else {     //답글
			

			this.updateStep(comment_group, comment_step);
			
			//그 이후에 전달받은 값보다 1크게 db에 저장
			comment_step++;
			comment_level++;
		}
		
		//변경된 값을 다시 dto에 담는다
		dto.setComment_group(comment_group);
		dto.setComment_step(comment_step);
		dto.setComment_level(comment_level);
		
		mapper.insert(dto);
	}
	
	@Override
	public List<CommentDto> selectScroll(String post_num,int offset) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<>();
		
		map.put("post_num", post_num);
		map.put("offset",offset);
		
		
		return mapper.selectScroll(map);
	}
	
	@Override
	public List<CommentDto> getAllDatas() {
		// TODO Auto-generated method stub
		return mapper.getAllDatas();
	}
}
