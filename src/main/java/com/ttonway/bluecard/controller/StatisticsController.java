package com.ttonway.bluecard.controller;

import com.ttonway.bluecard.pojo.ApplyRecord;
import com.ttonway.bluecard.pojo.Bank;
import com.ttonway.bluecard.pojo.ApplyRecordStatistics;
import com.ttonway.bluecard.service.AdminUserService;
import com.ttonway.bluecard.service.ApplyRecordService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
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

    @RequestMapping("/list")
    @ResponseBody
    public Map<String, Object> list(String stype, String minTime, String maxTime, Integer draw) {

        Map<String, Object> pmap = new HashMap<String, Object>();
        if (!StringUtils.isEmpty(minTime)) {
            pmap.put("minTime", minTime);
        }
        if (!StringUtils.isEmpty(maxTime)) {
            pmap.put("maxTime", maxTime);
        }

        Map<String, Object> resultMap = new HashMap<String, Object>();
        if (stype == null) {
            resultMap.put("code", 1);
        } else if (stype.equals(ApplyRecordStatistics.TYPE_BANK)) {
            List<ApplyRecordStatistics> list = new ArrayList<>();
            for (Bank bank : adminUserService.queryAllBank()) {
                ApplyRecordStatistics bs = new ApplyRecordStatistics();
                bs.setId(bank.getBankId());
                bs.setName(bank.getBankName());

                list.add(bs);
            }

            List<Map<String, Object>> cntList = applyRecordService.queryRecordBankStatusCount(pmap);
            for (Map<String, Object> map : cntList) {
                Long bankId = (Long) map.get("bankId");
                String status = (String) map.get("status");
                Long cnt = (Long) map.get("cnt");

                for (ApplyRecordStatistics bs : list) {
                    if (bankId.equals(bs.getId())) {
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

            resultMap.put("draw", draw);
            resultMap.put("recordsTotal", list.size());
            resultMap.put("recordsFiltered", list.size());
            resultMap.put("data", list);
            resultMap.put("code", 0);
        } else if (stype.equals(ApplyRecordStatistics.TYPE_REFEREE)) {

            List<ApplyRecordStatistics> list = new ArrayList<>();
            List<Map<String, Object>> cntList = applyRecordService.queryRecordRefereeStatusCount(pmap);
            for (Map<String, Object> map : cntList) {
                String refereePhone = (String) map.get("refereePhone");
                String status = (String) map.get("status");
                Long cnt = (Long) map.get("cnt");
                if (StringUtils.isEmpty(refereePhone)) {
                    continue;
                }


                ApplyRecordStatistics bs = null;
                for (ApplyRecordStatistics s : list) {
                    if (refereePhone.equals(s.getName())) {
                        bs = s;
                        break;
                    }
                }
                if (bs == null) {
                    bs = new ApplyRecordStatistics();
                    bs.setName(refereePhone);
                    list.add(bs);
                }

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
            }

            resultMap.put("draw", draw);
            resultMap.put("recordsTotal", list.size());
            resultMap.put("recordsFiltered", list.size());
            resultMap.put("data", list);
            resultMap.put("code", 0);
        }

        return resultMap;
    }

    @RequestMapping("/bank")
    public ModelAndView tableBank() {
        ModelAndView model = new ModelAndView("statistics");
        model.addObject("stype", ApplyRecordStatistics.TYPE_BANK);
        return model;
    }

    @RequestMapping("/referee")
    public ModelAndView tableReferee(String minTime, String maxTime) {
        ModelAndView model = new ModelAndView("statistics");
        model.addObject("stype", ApplyRecordStatistics.TYPE_REFEREE);
        return model;
    }

}
