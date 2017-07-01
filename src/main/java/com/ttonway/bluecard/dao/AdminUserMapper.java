package com.ttonway.bluecard.dao;

import java.util.List;
import java.util.Map;

import com.ttonway.bluecard.pojo.AdminUser;
import com.ttonway.bluecard.pojo.Bank;

public interface AdminUserMapper {

    AdminUser queryUser(Long userId);

    AdminUser queryUserByCode(String userCode);

    List<AdminUser> queryUserList(Map<String, Integer> map);

    int queryUserListCount();

    int insertUser(AdminUser adminUser);

    int updatePassword(AdminUser adminUser);

    int deleteUsers(Long[] userIds);

    List<Bank> queryAllBank();

    List<String> queryAllArea();

}