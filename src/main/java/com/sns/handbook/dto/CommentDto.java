package com.sns.handbook.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("CommentDto")
public class CommentDto {

	private String comment_num;
	private String user_num;
	private String post_num;
	private String comment_content;
	private Timestamp comment_writeday;
}
