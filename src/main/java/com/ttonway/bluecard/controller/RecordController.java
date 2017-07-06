package com.ttonway.bluecard.controller;

import com.ttonway.bluecard.pojo.AdminUser;
import com.ttonway.bluecard.pojo.AdminUserDetails;
import com.ttonway.bluecard.pojo.ApplyRecord;
import com.ttonway.bluecard.service.ApplyRecordService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/record")
public class RecordController {
    private static Logger logger = Logger.getLogger(RecordController.class);

    @Autowired
    private ApplyRecordService applyRecordService;

    @RequestMapping("/table")
    public String table() {
        return "/recordlist";
    }

    @RequestMapping("/list")
    @ResponseBody
    public Map<String, Object> list(String status, String minTime, String maxTime, Integer draw, Integer start, Integer length) {
        AdminUserDetails userDetails = (AdminUserDetails) SecurityContextHolder.getContext()
                .getAuthentication()
                .getPrincipal();
        AdminUser adminUser = userDetails.getAdminUser();
        String role = adminUser.getRole();

        Map<String, Object> map = new HashMap<String, Object>();
        try {
            Map<String, Object> pmap = new HashMap<String, Object>();

            if (AdminUser.ROLE_BRANCH_MARKETER.equals(role) || AdminUser.ROLE_BACK_MANAGER.equals(role)) {
                pmap.put("bankId", adminUser.getBank().getBankId());
            }
            pmap.put("status", status);
            if (!StringUtils.isEmpty(minTime)) {
                pmap.put("minTime", minTime);
            }
            if (!StringUtils.isEmpty(maxTime)) {
                pmap.put("maxTime", maxTime);
            }
            pmap.put("start", start);
            pmap.put("length", length);
            List<Map<String, Object>> cntlist = applyRecordService.queryRecordStatusCount(pmap);
            map.put("cntlist", cntlist);
            int cnt = applyRecordService.queryRecordListCount(pmap);
            List<ApplyRecord> list = applyRecordService.queryRecordList(pmap);

            map.put("draw", draw);
            map.put("recordsTotal", cnt);
            map.put("recordsFiltered", cnt);
            map.put("data", list);
            map.put("code", 0);
        } catch (Exception e) {
            logger.error("getLoanList fail.", e);
            map.put("code", 1);
            map.put("msg", e.getLocalizedMessage());
        }
        return map;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Map<String, Object> delete(Long[] recordIds) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            applyRecordService.deleteRecords(recordIds);
            map.put("code", 0);
        } catch (Exception e) {
            logger.error("delete apply record fail.", e);
            map.put("code", 1);
            map.put("msg", e.getLocalizedMessage());
        }
        return map;
    }
}
