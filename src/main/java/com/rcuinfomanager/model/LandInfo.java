package com.rcuinfomanager.model;

public class LandInfo {
    private int id;
    private long recordId;
    private long assetsId;
    private String area;
    private String worth;
    private String property;
    private String type;
    private String usedSitu;
    private String isMoneyClear;

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getWorth() {
        return worth;
    }

    public void setWorth(String worth) {
        this.worth = worth;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUsedSitu() {
        return usedSitu;
    }

    public void setUsedSitu(String usedSitu) {
        this.usedSitu = usedSitu;
    }

    public String getMoneyClear() {
        return isMoneyClear;
    }

    public void setMoneyClear(String moneyClear) {
        isMoneyClear = moneyClear;
    }

    public long getAssetsId() {
        return assetsId;
    }

    public void setAssetsId(long assetsId) {
        this.assetsId = assetsId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getRecordId() {
        return recordId;
    }

    public void setRecordId(long recordId) {
        this.recordId = recordId;
    }
}
