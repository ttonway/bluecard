package com.ttonway.bluecard.controller;

import com.ttonway.bluecard.pojo.AdminUserDetails;
import com.ttonway.bluecard.util.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class IndexController {

    @RequestMapping("/login")
    public ModelAndView login(String error, String logout) {
        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "用户名或密码错误。");
        }
        if (logout != null) {
            model.addObject("msg", "您已登出系统。");
        }
        model.setViewName("login");
        return model;
    }

    @RequestMapping("/index")
    public String main() {
        AdminUserDetails userDetails = (AdminUserDetails) SecurityContextHolder.getContext()
                .getAuthentication()
                .getPrincipal();
        if (AuthorityUtils.hasAuthority(userDetails, "ROLE_ADMIN")) {
            return "redirect:/admin/table";
        } else {
            return "redirect:/list1";
        }
    }




}
