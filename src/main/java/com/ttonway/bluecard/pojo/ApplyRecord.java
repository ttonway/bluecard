package com.ttonway.bluecard.pojo;

public class ApplyRecord {
    public static final String STATUS_INIT = "INIT";
    public static final String STATUS_QUALIFIED = "QUALIFIED";//符合
    public static final String STATUS_UNQUALIFIED = "UNQUALIFIED";//不符合
    public static final String STATUS_UNCONTACTED = "UNCONTACTED";//未联系
    public static final String STATUS_CONTACTED = "CONTACTED";//已联系
    public static final String STATUS_APPLY_SUCCESS = "APPLY_SUCCESS";//申请进件成功
    public static final String STATUS_APPLY_FAIL = "APPLY_FAIL";//申请进件失败

    private Long recordId;

    private String userName;
    private String phoneNumber;
    private String profession;
    private String accumulationFund;

    private Organization organization;
    private Bank bank;
    private String status;

    private String createTime;
    private String updateTime;


    public Long getRecordId() {
        return recordId;
    }

    public void setRecordId(Long recordId) {
        this.recordId = recordId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getAccumulationFund() {
        return accumulationFund;
    }

    public void setAccumulationFund(String accumulationFund) {
        this.accumulationFund = accumulationFund;
    }

    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public Bank getBank() {
        return bank;
    }

    public void setBank(Bank bank) {
        this.bank = bank;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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