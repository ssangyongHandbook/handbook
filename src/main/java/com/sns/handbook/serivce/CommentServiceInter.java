package com.sns.handbook.serivce;



import com.sns.handbook.dto.CommentDto;

public interface CommentServiceInter {

	public int getMaxNum();
	public void updateStep(int comment_group,int comment_step);
	public void insert(CommentDto dto);
	public void delete(String comment_num);
	public CommentDto getData(String comment_num);
	public void update(CommentDto dto);
}
