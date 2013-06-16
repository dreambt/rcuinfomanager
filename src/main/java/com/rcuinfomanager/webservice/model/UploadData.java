package com.rcuinfomanager.webservice.model;

import com.rcuinfomanager.model.LocationInfo;

import java.util.List;

public class UploadData {

    private String userName;
    private String customerName;
    private String cerNum;

    private List<LocationInfo> locationInfo;
    private AllColumnInfo allColumnInfo;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCerNum() {
        return cerNum;
    }

    public void setCerNum(String cerNum) {
        this.cerNum = cerNum;
    }

    public List<LocationInfo> getLocationInfo() {
        return locationInfo;
    }

    public void setLocationInfo(List<LocationInfo> locationInfo) {
        this.locationInfo = locationInfo;
    }

    public AllColumnInfo getAllColumnInfo() {
        return allColumnInfo;
    }

    public void setAllColumnInfo(AllColumnInfo allColumnInfo) {
        this.allColumnInfo = allColumnInfo;
    }
}
