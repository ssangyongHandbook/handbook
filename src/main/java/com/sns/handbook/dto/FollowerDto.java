package com.sns.handbook.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("FollowerDto")
public class FollowerDto {

	private String fwer_num;
	private String to_user;
	private String from_user;
}
