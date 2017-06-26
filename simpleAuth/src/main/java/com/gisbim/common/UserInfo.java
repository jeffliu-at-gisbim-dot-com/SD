package com.gisbim.common;

import java.io.Serializable;
import java.util.List;
import java.util.TreeMap;

import com.gisbim.vo.auth.Function;
import com.gisbim.vo.auth.Role;

public class UserInfo implements Serializable{
	private static final long serialVersionUID = 1L;

	/* 使用者登入帳號  人事代碼(六碼)*/
	private String userId;
	
	/* 使用者 具有的角色*/
	private List<Role> roles;
	
	/* 使用者目前使用的角色 */
	private Role currentRole;
	
	/* 使用者各角色可執行的功能 */
	private TreeMap<Role, List<Function>> roleFunctions;

	/**
	 * @return 使用者各角色可執行的功能
	 */
	public TreeMap<Role, List<Function>>  getRoleFunctions() {
		return roleFunctions;
	}

	/**
	 * 設定  使用者各角色可執行的功能
	 * 
	 * @param roleFunctions 使用者各角色可執行的功能
	 */
	public void setRoleFunctions(TreeMap<Role, List<Function>> roleFunctions) {
		this.roleFunctions = roleFunctions;
	}

	/**
	 * @return 使用者登入帳號  人事代碼(六碼)
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * 設定  使用者登入帳號  人事代碼(六碼)
	 *  
	 * @param userId 使用者登入帳號  人事代碼(六碼)
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * 取得  使用者 具有的角色
	 * 
	 * @return 使用者 具有的角色
	 */
	public List<Role> getRoles() {
		return roles;
	}
	
	/* 取得使用者目前的角色, 預設為第一個角色 */
	public Role getCurrentRole() {
		if(this.currentRole != null) {
			return currentRole;
		}
        if( this.roleFunctions != null && !this.roleFunctions.isEmpty()) {
        	this.currentRole =  roleFunctions.firstKey(); 
        	return this.currentRole;
        } else {
        	return null;
        }
	}
	/**
	 * 設定  使用者 具有的角色
	 * 
	 * @param roles 使用者 具有的角色
	 */
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
}
