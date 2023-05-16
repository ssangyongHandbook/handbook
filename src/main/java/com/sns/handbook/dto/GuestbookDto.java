package com.sns.handbook.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("GuestbookDto")
public class GuestbookDto {

	private int guest_num;
	private int write_num;
	private int owner_num;
	private String guest_content;
	private String guest_file;
	private String guest_access;
	private Timestamp guest_writeday;
	
	//add
	private String type="guest";
	
	
}
