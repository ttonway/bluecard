package com.ttonway.bluecard.controller;

import java.util.*;

import com.ttonway.bluecard.pojo.Bank;
import com.ttonway.bluecard.util.Utils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttonway.bluecard.pojo.AdminUser;
import com.ttonway.bluecard.service.AdminUserService;
import com.ttonway.bluecard.util.MD5Util;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private static Logger logger = Logger.getLogger(AdminController.class);

    @Autowired
    private AdminUserService adminUserService;

    @RequestMapping("/table")
    public String table() {
        return "/userlist";
    }

    @RequestMapping("/list")
    @ResponseBody
    public Map<String, Object> list(Integer draw, Integer start, Integer length) {

        Map<String, Integer> pmap = new HashMap<String, Integer>();
        pmap.put("start", start);
        pmap.put("length", length);
        int cnt = adminUserService.queryUserListCount();
        List<AdminUser> list = adminUserService.queryUserList(pmap);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("draw", draw);
        map.put("recordsTotal", cnt);
        map.put("recordsFiltered", cnt);
        map.put("data", list);
        map.put("code", 0);
        return map;
    }

    @RequestMapping("/create")
    public ModelAndView create() {
        ModelAndView model = new ModelAndView("usercreate");
        model.addObject("roleMap", AdminUser.ROLE_NAME_MAP);
        model.addObject("bankList", adminUserService.queryAllBank());
        return model;
    }

    @Transactional
    @RequestMapping("/save")
    public ModelAndView save(String name, String userCode, String password, Long bankId, String role) {
        ModelAndView model = new ModelAndView("usercreate");
        model.addObject("roleMap", AdminUser.ROLE_NAME_MAP);
        model.addObject("bankList", adminUserService.queryAllBank());

        if (StringUtils.isEmpty(name)) {
            model.addObject("error", "姓名不能为空");
            return model;
        }
        if (StringUtils.isEmpty(userCode)) {
            model.addObject("error", "工号不能为空");
            return model;
        }
        if (StringUtils.isEmpty(password)) {
            model.addObject("error", "密码不能为空");
            return model;
        }
        if (bankId == null || bankId.longValue() == 0L) {
            model.addObject("error", "请选择支行");
            return model;
        }
        if (!AdminUser.ROLE_NAME_MAP.containsKey(role)) {
            model.addObject("error", "请选择岗位");
            return model;
        }

        AdminUser adminUser = adminUserService.queryUserByCode(userCode);
        if (adminUser == null) {
            adminUser = new AdminUser();
            adminUser.setName(name);
            adminUser.setUserCode(userCode);
            adminUser.setPassword(MD5Util.getMD5(password));
            Bank bank = new Bank();
            bank.setBankId(bankId);
            adminUser.setBank(bank);
            adminUser.setRole(role);
            adminUser.setRoleName(AdminUser.ROLE_NAME_MAP.get(role));
            String time = Utils.currentTimeStr();
            adminUser.setCreateTime(time);
            adminUser.setUpdateTime(time);
            adminUserService.insertUser(adminUser);

            return new ModelAndView("redirect:table");
        } else {
            model.addObject("error", "工号已存在");
            return model;
        }
    }


    @RequestMapping("/resetPwd")
    @ResponseBody
    public Map<String, Object> resetPwd(Long userId, String password) {

        AdminUser adminUser;
        if (StringUtils.isEmpty(password)) {
            adminUser = adminUserService.queryUser(userId);
            adminUser.setPassword(MD5Util.getMD5(adminUser.getUserCode()));
        } else {
            adminUser = new AdminUser();
            adminUser.setUserId(userId);
            adminUser.setPassword(MD5Util.getMD5(password));
        }
        adminUserService.updatePassword(adminUser);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        return map;

    }

    @RequestMapping("/delete")
    @ResponseBody
    public Map<String, Object> delete(Long[] userIds) {
        adminUserService.deleteUsers(userIds);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        return map;

    }
}
