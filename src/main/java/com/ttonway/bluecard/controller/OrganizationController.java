package com.ttonway.bluecard.controller;

import com.ttonway.bluecard.pojo.AdminUser;
import com.ttonway.bluecard.pojo.Bank;
import com.ttonway.bluecard.pojo.Organization;
import com.ttonway.bluecard.service.AdminUserService;
import com.ttonway.bluecard.service.OrganizationService;
import com.ttonway.bluecard.util.MD5Util;
import com.ttonway.bluecard.util.Utils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
@RequestMapping("/org")
public class OrganizationController {
    private static Logger logger = Logger.getLogger(OrganizationController.class);

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private OrganizationService organizationService;

    @RequestMapping("/table")
    public String table() {
        return "/orglist";
    }

    @RequestMapping("/list")
    @ResponseBody
    public Map<String, Object> list(Integer draw, Integer start, Integer length) {

        Map<String, Integer> pmap = new HashMap<String, Integer>();
        pmap.put("start", start);
        pmap.put("length", length);
        int cnt = organizationService.queryOrgListCount();
        List<Organization> list = organizationService.queryOrgList(pmap);

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
        ModelAndView model = new ModelAndView("orgcreate");
        model.addObject("areaList", adminUserService.queryAllArea());
        return model;
    }

    @Transactional
    @RequestMapping("/save")
    public ModelAndView save(String area, String orgName) {
        ModelAndView model = new ModelAndView("orgcreate");
        model.addObject("areaList", adminUserService.queryAllArea());

        if (StringUtils.isEmpty(area)) {
            model.addObject("error", "地区不能为空");
            return model;
        }
        if (StringUtils.isEmpty(orgName)) {
            model.addObject("error", "机构名称不能为空");
            return model;
        }

        Organization org = new Organization();
        org.setArea(area);
        org.setOrgName(orgName);
        organizationService.insertOrg(org);
        return new ModelAndView("redirect:table");
    }


    @RequestMapping("/delete")
    @ResponseBody
    public Map<String, Object> delete(Long[] orgIds) {
        organizationService.deleteOrgs(orgIds);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        return map;

    }

}
