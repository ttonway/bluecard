package com.ttonway.bluecard.controller;

import com.ttonway.bluecard.pojo.ApplyRecord;
import com.ttonway.bluecard.pojo.Bank;
import com.ttonway.bluecard.pojo.BankStatistics;
import com.ttonway.bluecard.service.AdminUserService;
import com.ttonway.bluecard.service.ApplyRecordService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/statistics")
public class StatisticsController {
    private static Logger logger = Logger.getLogger(StatisticsController.class);

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private ApplyRecordService applyRecordService;

    @RequestMapping("/table")
    public ModelAndView table() {
        ModelAndView model = new ModelAndView("statistics");

        List<BankStatistics> list = new ArrayList<>();
        for (Bank bank : adminUserService.queryAllBank()) {
            BankStatistics bs = new BankStatistics();
            bs.setBankId(bank.getBankId());
            bs.setArea(bank.getArea());
            bs.setBankName(bank.getBankName());

            list.add(bs);
        }

        List<Map<String, Object>> cntList = applyRecordService.queryRecordBankStatusCount();
        for (Map<String, Object> map : cntList) {
            Long bankId = (Long) map.get("bankId");
            String status = (String) map.get("status");
            Long cnt = (Long) map.get("cnt");

            for (BankStatistics bs : list) {
               if (bankId.equals(bs.getBankId())) {
                   if (status.equals(ApplyRecord.STATUS_INIT)) {
                       bs.initCount += cnt.longValue();
                   } else if (status.equals(ApplyRecord.STATUS_QUALIFIED)) {
                       bs.qualifiedCount += cnt.longValue();
                   } else if (status.equals(ApplyRecord.STATUS_UNQUALIFIED)) {
                       bs.unqualifiedCount += cnt.longValue();
                   } else if (status.equals(ApplyRecord.STATUS_CONTACTED)) {
                       bs.contactedCount += cnt.longValue();
                   } else if (status.equals(ApplyRecord.STATUS_UNCONTACTED)) {
                       bs.uncontactedCount += cnt.longValue();
                   } else if (status.equals(ApplyRecord.STATUS_APPLY_SUCCESS)) {
                       bs.successCount += cnt.longValue();
                   } else if (status.equals(ApplyRecord.STATUS_APPLY_FAIL)) {
                       bs.failCount += cnt.longValue();
                   }
                   break;
               }
            }

        }

        model.addObject("list", list);
        return model;
    }


}
