package com.ttonway.bluecard.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.ttonway.bluecard.dao.AdminUserMapper;
import com.ttonway.bluecard.pojo.AdminUser;
import com.ttonway.bluecard.pojo.Bank;
import com.ttonway.bluecard.service.AdminUserService;
import org.springframework.stereotype.Service;


@Service
public class AdminUserServiceImpl implements AdminUserService {

    @Resource
    private AdminUserMapper adminUserMapper;

    @Override
    public AdminUser queryUser(Long userId) {
        return adminUserMapper.queryUser(userId);
    }

    @Override
    public AdminUser queryUserByCode(String userCode) {
        return adminUserMapper.queryUserByCode(userCode);
    }

    @Override
    public List<AdminUser> queryUserList(Map<String, Integer> map) {
        return adminUserMapper.queryUserList(map);
    }

    @Override
    public int queryUserListCount() {
        return adminUserMapper.queryUserListCount();
    }

    @Override
    public int insertUser(AdminUser adminUser) {
        return adminUserMapper.insertUser(adminUser);
    }

    @Override
    public int updatePassword(AdminUser adminUser) {
        return adminUserMapper.updatePassword(adminUser);
    }

    @Override
    public int deleteUsers(Long[] userIds) {
        return adminUserMapper.deleteUsers(userIds);
    }

    @Override
    public List<Bank> queryAllBank() {
        return adminUserMapper.queryAllBank();
    }

    @Override
    public List<String> queryAllArea() {
        return adminUserMapper.queryAllArea();
    }
}
