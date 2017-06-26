package com.gisbim.service.auth;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gisbim.common.LogicException;
import com.gisbim.common.UserInfo;
import com.gisbim.model.pri.Fun;
import com.gisbim.repo.auth.LoginRepo;
import com.gisbim.vo.auth.Function;
import com.gisbim.vo.auth.Role;
import com.gisbim.vo.auth.User;

@Service
public class LoginService {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	
	@Autowired LoginRepo loginRepo;
	
    public User findBy(String employeeNo, String password) throws LogicException {
    	User currentUser = null;

    	try {
    		currentUser = loginRepo.findBy(employeeNo);
    		if(currentUser == null) {
    			throw new LogicException("Wrong id or password."+ employeeNo);
    		}
    		
    		Map<String, Object> criteria = new HashMap<String, Object>();
    		criteria.put("employeeNo", employeeNo);
    		
    		if(User.ENCRYPT_TYPE_PLAIN.equals(currentUser.getEncryptType())) {
    			criteria.put("password",     password);    		
    		} else if(User.ENCRYPT_TYPE_MD5.equals(currentUser.getEncryptType())) {
    			criteria.put("md5Password",     password);    		
    		}
    		
    		currentUser = loginRepo.ValidateBy(criteria);
    		if(currentUser == null) {
    			throw new LogicException("Wrong id or password.");
    		}
    	} catch (LogicException le) {
    		throw le;
    	} catch (Exception e) {
    		e.printStackTrace();
    		throw new LogicException("Fail during validating. wrong id or password:"+ e.getMessage());
    	}
    	return currentUser;
    }
    
    public UserInfo createUserInfo(User user) throws LogicException {
    	
    	UserInfo userInfo = null;
    	try {
    		userInfo = new UserInfo();
        	// searchRoleAuth
        	List<Role> roles = loginRepo.findDutyBy(user.getId());
        	if(roles.isEmpty()) {
        		throw new LogicException("No role for the user. you are not allowed for login. "
        				+ "Please contact system administrator.");
        	}
        	userInfo.setRoles(roles);
        	logger.info(String.format("User(%s) have Roles:", user.getUserName(), roles));
        	
        	// getRoleFunctions
        	TreeMap<Role, List<Function>> roleFunctions = new TreeMap<Role, List<Function>>( // 預設以role的id進行比較
                (Comparator<?super Role>) new Comparator<Role>(){  
        		    public int compare(Role role1, Role role2) {  
        			    return role2.getId().compareTo(role1.getId());  
        			}  
        		}  
            );
        	for(Role r: roles) {
        		logger.info("Role:"+BeanUtils.describe(r)); 		
        		List<Function> functions = loginRepo.findFunBy(r.getId());
        		functions = findTop(functions); // link parent-child relationship
        		
        		roleFunctions.put(r, functions);
        	}
        	userInfo.setRoleFunctions(roleFunctions);
	    } catch (LogicException le) {
		    throw le;
	    } catch (Exception e) {
		    e.printStackTrace();
		    throw new LogicException("Fail during create userInfo.:"+ e.getMessage());
	    }
    	return userInfo;   	  
    }
    
    
    private List<Function> findTop(List<Function> functions) {
    	List<Function> linked = new ArrayList<Function>();
    	for(Function f: functions) {
    	    if(f.getParentFunId() == null ) {    	        
    	        f = link(functions, f);
    	        linked.add(f);
    	    }
    	}
    	return linked;
    }
    
    private Function link(List<Function> funs, Function parent) {
    	List<Fun> childs = parent.getFuns() == null ? new ArrayList<Fun>() : parent.getFuns();
    	for(Function fun: funs) {
    	    if(fun.getParentFunId() != null &&     	        
    	    	fun.getParentFunId().equals(parent.getId())){
    	    	fun.setFun(parent);
    	    	childs.add(fun);      	    	
    	    	link(funs, fun);
    	    }
    	}
    	parent.setFuns(childs);
    	return parent;
    }
}
