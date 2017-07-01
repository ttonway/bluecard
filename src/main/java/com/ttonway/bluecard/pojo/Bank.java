package com.ttonway.bluecard.pojo;

/**
 * Created by ttonway on 2017/6/29.
 */
public class Bank {
    private Long bankId;
    private String area;
    private String bankName;

    public Long getBankId() {
        return bankId;
    }

    public void setBankId(Long bankId) {
        this.bankId = bankId;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }
}
