package com.rcuinfomanager.model;

import com.rcuinfomanager.util.DateUtils;

public class CustomerListInfo {
    private int recordId;
    private String customerName;
    private String telephone;
    private String submitTime;
    private String organizationName;
    private String displayUserName;
    private int state;

    // 显示时间
    public String getDisplaySubmitTime() {
        return DateUtils.toDisplayStr(submitTime, DateUtils.CN_DISPLAY_DATE);
    }

    public int getRecordId() {
        return recordId;
    }

    public void setRecordId(int recordId) {
        this.recordId = recordId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(String submitTime) {
        this.submitTime = submitTime;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    public String getDisplayUserName() {
        return displayUserName;
    }

    public void setDisplayUserName(String displayUserName) {
        this.displayUserName = displayUserName;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
}
