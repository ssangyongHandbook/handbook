package com.sns.handbook.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("FollowingDto")
public class FollowingDto {

	private String fing_num;
	private String from_user;
	private String to_user;
}
