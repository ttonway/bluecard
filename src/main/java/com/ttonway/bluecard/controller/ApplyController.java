package com.ttonway.bluecard.controller;

import com.ttonway.bluecard.pojo.*;
import com.ttonway.bluecard.service.AdminUserService;
import com.ttonway.bluecard.service.ApplyRecordService;
import com.ttonway.bluecard.service.OrganizationService;
import com.ttonway.bluecard.util.Utils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
@RequestMapping("/apply")
public class ApplyController {
    private static Logger logger = Logger.getLogger(ApplyController.class);

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private OrganizationService organizationService;

    @Autowired
    private ApplyRecordService applyRecordService;

    @RequestMapping("/index")
    public String index() {
        return "/apply/index";
    }

    @RequestMapping("/cardlist")
    public String cardlist() {
        return "/apply/cardlist";
    }

    @RequestMapping("/index2")
    public String index2() {
        return "/apply/index2";
    }

    @RequestMapping("/form")
    public ModelAndView form() {
        ModelAndView model = new ModelAndView("/apply/form");

//        List<Organization> organizations = organizationService.queryOrgList(new HashMap<>());
//        Map<String, List<Organization>> orgMap = new LinkedHashMap<>();
//        for (Organization org : organizations) {
//            List<Organization> list = orgMap.get(org.getArea());
//            if (list == null) {
//                list = new ArrayList<>();
//                orgMap.put(org.getArea(), list);
//            }
//            list.add(org);
//        }
//        model.addObject("orgMapList", orgMap);
        model.addObject("bankList", adminUserService.queryAllBank());
        return model;
    }

    @RequestMapping("/submit")
    @ResponseBody
    public Map<String, Object> submit(String name, String phone, String profession, String fund, Integer income, Integer creditLine, Long bankId) {

        ApplyRecord record = new ApplyRecord();
        record.setUserName(name);
        record.setPhoneNumber(phone);
        record.setProfession(profession);
        record.setAccumulationFund(fund);
        record.setIncome(income);
        record.setCreditLine(creditLine);
        Organization org = new Organization();
//        org.setOrgId(orgId == null ? Long.valueOf(0) : orgId);
        org.setOrgId(Long.valueOf(0));
        record.setOrganization(org);

        Bank bank = new Bank();
        bank.setBankId(bankId);
        record.setBank(bank);

        record.setStatus(ApplyRecord.STATUS_INIT);
        String time = Utils.currentTimeStr();
        record.setCreateTime(time);
        record.setUpdateTime(time);

        Map<String, Object> map = new HashMap<String, Object>();
        try {
            applyRecordService.insertRecord(record);

            map.put("code", 0);
            map.put("msg", "success");
        } catch (Exception e) {
            logger.error("insert apply record fail.", e);
            map.put("code", 1);
            map.put("msg", e.getLocalizedMessage());
        }
        return map;
    }

}
