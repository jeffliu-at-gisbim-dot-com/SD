package com.gisbim.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



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
public class MainController {
    private static final Logger logger = LoggerFactory.getLogger(MainController.class);
    
    @RequestMapping(value = "/preMain", method = RequestMethod.GET)
    public ModelAndView  preMain(HttpSession session, Model model) {
        logger.info("user get into main menu");        

        // check if userInfo exists, if not, go to login view
        //Object userInfo = session.getAttribute("userInfo");
        //if(userInfo == null ) { 	return "login"; }
        
        // TODO: if user has logined, get UserInfo from session directly. no need for login again.             
        model.addAttribute("msg","Forward Handled");
        
        return new ModelAndView("main");	       
    }
    
    
}
