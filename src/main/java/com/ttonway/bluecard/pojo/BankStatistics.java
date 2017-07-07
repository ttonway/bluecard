package com.ttonway.bluecard.pojo;

/**
 * Created by ttonway on 2017/6/29.
 */
public class BankStatistics extends Bank {
    public long initCount;
    public long qualifiedCount;
    public long unqualifiedCount;
    public long contactedCount;
    public long uncontactedCount;
    public long successCount;
    public long failCount;

    public long getInitCount() {
        return initCount;
    }

    public void setInitCount(long initCount) {
        this.initCount = initCount;
    }

    public long getQualifiedCount() {
        return qualifiedCount;
    }

    public void setQualifiedCount(long qualifiedCount) {
        this.qualifiedCount = qualifiedCount;
    }

    public long getUnqualifiedCount() {
        return unqualifiedCount;
    }

    public void setUnqualifiedCount(long unqualifiedCount) {
        this.unqualifiedCount = unqualifiedCount;
    }

    public long getContactedCount() {
        return contactedCount;
    }

    public void setContactedCount(long contactedCount) {
        this.contactedCount = contactedCount;
    }

    public long getUncontactedCount() {
        return uncontactedCount;
    }

    public void setUncontactedCount(long uncontactedCount) {
        this.uncontactedCount = uncontactedCount;
    }

    public long getSuccessCount() {
        return successCount;
    }

    public void setSuccessCount(long successCount) {
        this.successCount = successCount;
    }

    public long getFailCount() {
        return failCount;
    }

    public void setFailCount(long failCount) {
        this.failCount = failCount;
    }
}
