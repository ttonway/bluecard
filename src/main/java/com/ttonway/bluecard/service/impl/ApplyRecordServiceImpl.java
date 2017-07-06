package com.ttonway.bluecard.service.impl;

import com.ttonway.bluecard.dao.ApplyRecordMapper;
import com.ttonway.bluecard.pojo.ApplyRecord;
import com.ttonway.bluecard.service.ApplyRecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Service
public class ApplyRecordServiceImpl implements ApplyRecordService {

    @Resource
    private ApplyRecordMapper applyRecordMapper;

    @Override
    public ApplyRecord queryRecord(Long recordId) {
        return applyRecordMapper.queryRecord(recordId);
    }

    @Override
    public List<ApplyRecord> queryRecordList(Map<String, Object> map) {
        return applyRecordMapper.queryRecordList(map);
    }

    @Override
    public int queryRecordListCount(Map<String, Object> map) {
        return applyRecordMapper.queryRecordListCount(map);
    }

    @Override
    public List<Map<String, Object>> queryRecordStatusCount(Map<String, Object> map) {
        return applyRecordMapper.queryRecordStatusCount(map);
    }

    @Override
    public int insertRecord(ApplyRecord record) {
        return applyRecordMapper.insertRecord(record);
    }

    @Override
    public int updateStatus(ApplyRecord record) {
        return applyRecordMapper.updateStatus(record);
    }

    @Override
    public int deleteRecords(Long[] recordIds) {
        return applyRecordMapper.deleteRecords(recordIds);
    }
}
