package com.ttonway.bluecard.controller;

import com.ttonway.bluecard.pojo.AdminUser;
import com.ttonway.bluecard.pojo.AdminUserDetails;
import com.ttonway.bluecard.pojo.ApplyRecord;
import com.ttonway.bluecard.service.ApplyRecordService;
import com.ttonway.bluecard.util.Utils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
    public Map<String, Object> list(String status, String searchValue, String minTime, String maxTime, Integer draw, Integer start, Integer length) {
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
            if (!StringUtils.isEmpty(searchValue)) {
                pmap.put("keyword", searchValue);
            }
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
            logger.error("get record list fail.", e);
            map.put("code", 1);
            map.put("msg", e.getLocalizedMessage());
        }
        return map;
    }

    @RequestMapping(value = "/view/{recordId}")
    public ModelAndView view(@PathVariable Long recordId) {
        AdminUserDetails userDetails = (AdminUserDetails) SecurityContextHolder.getContext()
                .getAuthentication()
                .getPrincipal();
        AdminUser adminUser = userDetails.getAdminUser();
        ApplyRecord record = applyRecordService.queryRecord(recordId);

        ModelAndView model = new ModelAndView("recordview");
        model.addObject("admin", adminUser);
        model.addObject("record", record);
        return model;
    }

    @RequestMapping("/update")
    public ModelAndView update(Long recordId, String status) {
        AdminUserDetails userDetails = (AdminUserDetails) SecurityContextHolder.getContext()
                .getAuthentication()
                .getPrincipal();
        AdminUser adminUser = userDetails.getAdminUser();
        ApplyRecord record = applyRecordService.queryRecord(recordId);

        ModelAndView model = new ModelAndView("recordview");
        model.addObject("admin", adminUser);
        model.addObject("record", record);
        if (!ApplyRecord.STATUS_NAME_MAP.containsKey(status)) {
            model.addObject("error", "Invalid parameter.");
            return model;
        }

        if (AdminUser.ROLE_ADMIN.equals(adminUser.getRole()) ||
                (AdminUser.ROLE_BRANCH_MARKETER.equals(adminUser.getRole()) && adminUser.getBank().equals(record.getBank()))) {
        } else {
            model.addObject("error", "You have no permission.");
            return model;
        }

        record.setRecordId(recordId);
        record.setStatus(status);
        record.setUpdateTime(Utils.currentTimeStr());
        applyRecordService.updateStatus(record);

        return model;
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
