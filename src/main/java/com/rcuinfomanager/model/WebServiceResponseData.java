package com.rcuinfomanager.model;

import java.util.List;

public class WebServiceResponseData {

    private List<AllColumnInfo> allColumnInfos;

    public List<AllColumnInfo> getAllColumnInfos() {

        return allColumnInfos;
    }

    public void setAllColumnInfos(List<AllColumnInfo> allColumnInfos) {
        this.allColumnInfos = allColumnInfos;
    }
}
