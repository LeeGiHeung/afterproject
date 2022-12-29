package com.lgh.mysql.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.lgh.mysql.dao.UserDao;

public class Constant {
	public static BCryptPasswordEncoder passwordEncoder;
	
	//Data Access Object
	public static UserDao udao;
}
