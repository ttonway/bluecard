package com.ttonway.bluecard.pojo;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

public class AdminUser {

    public static final String ROLE_CENTER_MANAGER = "ROLE_CENTER_MANAGER";
    public static final String ROLE_BRANCH_MARKETER = "ROLE_BRANCH_MARKETER";
    public static final String ROLE_BACK_MANAGER = "ROLE_BACK_MANAGER";
    public static final Map<String, String> ROLE_NAME_MAP;

    static {
        Map<String, String> map = new LinkedHashMap<>();
        map.put(ROLE_CENTER_MANAGER, "市分行管理岗");
        map.put(ROLE_BRANCH_MARKETER, "支行营销岗");
        map.put(ROLE_BACK_MANAGER, "后台管理岗");
        ROLE_NAME_MAP = Collections.unmodifiableMap(map);
    }

    private Long userId;

    private String name;

    private String userCode;
    private String password;

    private Bank bank;
    private String role;
    private String roleName;

    private String createTime;
    private String updateTime;

    @Override
    public String toString() {
        return "AdminUser{" +
                "userId=" + userId +
                ", name='" + name + '\'' +
                ", userCode='" + userCode + '\'' +
                ", password='" + password + '\'' +
                ", bank='" + bank + '\'' +
                ", role='" + role + '\'' +
                ", roleName='" + roleName + '\'' +
                ", createTime='" + createTime + '\'' +
                ", updateTime='" + updateTime + '\'' +
                '}';
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Bank getBank() {
        return bank;
    }

    public void setBank(Bank bank) {
        this.bank = bank;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }
}