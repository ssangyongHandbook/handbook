package com.sns.handbook.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.sns.handbook.encryption.HandbookPasswordEncoder;

@Configuration
public class AppConfig {
	
	//PasswordEncoder 빈 등록
	@Bean
	@Scope("singleton")
	public PasswordEncoder passwordEncoder() {
		return new HandbookPasswordEncoder();
	}
}
