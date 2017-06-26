package com.gisbim.repo.auth;

import java.util.List;
import java.util.Map;

import com.gisbim.vo.auth.Function;
import com.gisbim.vo.auth.Role;
import com.gisbim.vo.auth.User;

public interface LoginRepo {
	
	/* this method would be replaced with ldap certification*/
	public User findBy(String employeeNo);
	
	public User ValidateBy(Map<String, Object> criteria);

	public List<Role> findDutyBy(Integer userId);
	
	public List<Function> findFunBy(Integer roleId);
}
