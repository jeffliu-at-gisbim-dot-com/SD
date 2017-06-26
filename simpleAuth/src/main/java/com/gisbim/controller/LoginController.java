package com.gisbim.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gisbim.common.LogicException;
import com.gisbim.common.UserInfo;
import com.gisbim.service.auth.LoginService;
import com.gisbim.vo.auth.User;



/*
 * @author jeff, juain farn, liu 劉君帆 (jeffliu@gisbim.com)
 * 
 *  登入
 *  與AD連線, 檢查是否有此使用者
 *  若有, 取出使用者所屬權限群組(Group), 及各群組可使用程式(Program)
 *  拋向前台, 讓前台動態產生左方功能選單
 *  
 *    
 */
@Controller
public class LoginController {
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    
    @Autowired LoginService loginService; 
    
    @RequestMapping(value = "preLogin", method = RequestMethod.GET)
    public String preLogin(HttpSession session) {
        logger.info("preLogin for user");        

        // chekc if the userInfo in the session, if no, do login
        Object userInfo = session.getAttribute("userInfo");
        if(userInfo == null ) { return "login"; }

        // if yes, direct to main screen
        return "main"; 	       
    }
    
    
    @RequestMapping(value = "postLogin", method = RequestMethod.POST)
    public String preMain(HttpServletRequest request,
			@RequestParam(value = "account", required=true) String employeeNo,
			@RequestParam(value = "passwd" , required=true) String password,
			HttpSession session) {
       
    	logger.info(String.format("user login with employeeNo(%s) and password(%s)", employeeNo, password));
    	
    	try {
    		User currentUser = loginService.findBy(employeeNo, password);
    		
    		UserInfo userInfo = loginService.createUserInfo(currentUser);
    		session.setAttribute("userInfo", userInfo);
    		
    		

    	} catch (LogicException le) {
    		request.setAttribute("msg", le.getMessage());
    		request.setAttribute("account", employeeNo);      		
    	 	return "login";    	 	    	 	
    	 	
    	} catch (Exception e) {
    		e.printStackTrace();
    		String msg = "系統　錯誤（"+e.getMessage()+"）請洽詢系統開發人員";
    	    logger.error(msg);
    		request.setAttribute("msg", msg);
    		request.setAttribute("account", employeeNo);    		
    	    return "login";
    	    
    	} finally {
    		
    	}
    	return "main";
    }
    
    @RequestMapping(value = "/preHome", method = RequestMethod.GET)
    public ModelAndView preHome(HttpSession session, Model model) {
        logger.info("user get into main menu");        
        
        // check if userInfo exists, if not, go to login view
        Object userInfo = session.getAttribute("userInfo");
        if(userInfo == null ) { 	return new ModelAndView("login"); }

        return new ModelAndView("home");	       
    }
    
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public String  logout(HttpSession session, Model model) {
        logger.info("user click the logout.");        

        session.removeAttribute("userInfo");
        // sent to login.jsp
        return "login";	       
    }
}
