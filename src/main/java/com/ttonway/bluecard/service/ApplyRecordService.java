package com.ttonway.bluecard.service;

import com.ttonway.bluecard.pojo.ApplyRecord;

import java.util.List;
import java.util.Map;

public interface ApplyRecordService {

    ApplyRecord queryRecord(Long recordId);

    List<ApplyRecord> queryRecordList(Map<String, Object> map);

    int queryRecordListCount(Map<String, Object> map);

    List<Map<String,Object>> queryRecordStatusCount(Map<String,Object> map);

    List<Map<String,Object>> queryRecordBankStatusCount();

    int insertRecord(ApplyRecord record);

    int updateStatus(ApplyRecord record);

    int deleteRecords(Long[] recordIds);
}