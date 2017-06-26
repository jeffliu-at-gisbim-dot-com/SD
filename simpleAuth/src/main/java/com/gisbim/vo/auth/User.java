package com.gisbim.vo.auth;

import com.gisbim.model.pri.AppUser;

public class User extends AppUser{
	public static String ENCRYPT_TYPE_PLAIN =  "1";
	public static String ENCRYPT_TYPE_MD5   =  "2";
	
	private static final long serialVersionUID = 1L;
	
	public User() {
		super();
	}
	
}
