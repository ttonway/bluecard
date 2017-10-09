package com.ttonway.bluecard.controller;

import com.ttonway.bluecard.pojo.AdminUser;
import com.ttonway.bluecard.pojo.AdminUserDetails;
import com.ttonway.bluecard.pojo.ApplyRecord;
import com.ttonway.bluecard.service.ApplyRecordService;
import com.ttonway.bluecard.util.Utils;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.NumberFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

    Map<String, Object> buildParaMap(HttpServletRequest request, String status, String searchValue, String minTime, String maxTime) {
        AdminUserDetails userDetails = (AdminUserDetails) SecurityContextHolder.getContext()
                .getAuthentication()
                .getPrincipal();
        AdminUser adminUser = userDetails.getAdminUser();
        String role = adminUser.getRole();

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

        int columtCount = 8;
        for (int i = 0; i <= columtCount; i++) {
            String coldata = "columns[" + i + "][data]";
            String colval = "columns[" + i + "][search][value]";
            String data = request.getParameter(coldata);
            String val = request.getParameter(colval);
            if (!StringUtils.isEmpty(data) && !StringUtils.isEmpty(val)) {
                pmap.put(data.replaceAll("\\.", ""), val);
            }
        }

        return pmap;
    }

    @RequestMapping("/list")
    @ResponseBody
    public Map<String, Object> list(HttpServletRequest request, String status, String searchValue, String minTime, String maxTime, Integer draw, Integer start, Integer length) {

        Map<String, Object> map = new HashMap<String, Object>();
        try {
            Map<String, Object> pmap = buildParaMap(request, status, searchValue, minTime, maxTime);

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
    public ModelAndView update(Long recordId, String status, String remark) {
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
        if (ApplyRecord.STATUS_UNQUALIFIED.equals(status)) {
            record.setRemark(remark);
        }
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

    @RequestMapping("/export")
    public void export(HttpServletRequest request, HttpServletResponse response, String status, String searchValue, String minTime, String maxTime) {

        Map<String, Object> pmap = buildParaMap(request, status, searchValue, minTime, maxTime);
        List<ApplyRecord> list = applyRecordService.queryRecordList(pmap);

        // 定义response类型
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=\"export.xls\"");

        // 定义输出流
        OutputStream excelStream = null;
        try {
            excelStream = new BufferedOutputStream(response.getOutputStream());
            writeExcel("下载", list, excelStream);
        } catch (Exception e) {
            logger.error("export fail.", e);
        } finally {
            IOUtils.closeQuietly(excelStream);
        }

    }

    void writeExcel(String title, List<ApplyRecord> records, OutputStream out) throws IOException {
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet(title);
        sheet.setDefaultColumnWidth(15);
        // 生成表头样式
        HSSFCellStyle style = workbook.createCellStyle();
        // 设置这些样式
        style.setFillForegroundColor(HSSFColor.WHITE.index);
        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFFont font = workbook.createFont();
        font.setFontName("微软雅黑");
        font.setColor(HSSFColor.BLACK.index);
        font.setFontHeightInPoints((short) 12);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        style.setFont(font);
        // 生成并设置数据样式
        HSSFCellStyle style2 = workbook.createCellStyle();
        style2.setFillForegroundColor(HSSFColor.WHITE.index);
        style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFFont font2 = workbook.createFont();
        font2.setFontName("微软雅黑");
        font2.setColor(HSSFColor.BLACK.index);
        font2.setFontHeightInPoints((short) 12);
        font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        style2.setFont(font2);

        int index = 0;
        HSSFRow row = sheet.createRow(index++);
        String[] headers = new String[]{"姓名", "联系方式", "行业信息", "是否有公积金或社保", "推荐机构", "推荐人手机号", "市县",
                "经办支行", "申请时间", "当前状态"};
        for (int i = 0; i < headers.length; i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellStyle(style);
            HSSFRichTextString text = new HSSFRichTextString(headers[i]);
            cell.setCellValue(text);
        }

        for (ApplyRecord record : records) {
            row = sheet.createRow(index++);

            int i = 0;
            createCell(row, i++, style2, record.getUserName());
            createCell(row, i++, style2, record.getPhoneNumber());
            createCell(row, i++, style2, record.getProfession());
            createCell(row, i++, style2, record.getAccumulationFund());
            createCell(row, i++, style2, record.getOrganization() == null ? "" :
                    record.getOrganization().getArea() + " - " + record.getOrganization().getOrgName());
            createCell(row, i++, style2, record.getRefereePhone());
            createCell(row, i++, style2, record.getBank() == null ? "" : record.getBank().getArea());
            createCell(row, i++, style2, record.getBank() == null ? "" : record.getBank().getBankName());
            createCell(row, i++, style2, record.getCreateTime());
            createCell(row, i++, style2, record.getStatusName());
        }

        workbook.write(out);
    }

    void createCell(HSSFRow row, int column, HSSFCellStyle style, String value) {
        HSSFCell cell = row.createCell(column);
        cell.setCellStyle(style);
        cell.setCellValue(new HSSFRichTextString(value));
    }
}
