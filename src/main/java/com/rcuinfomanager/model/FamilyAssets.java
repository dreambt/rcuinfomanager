package com.rcuinfomanager.model;

public class FamilyAssets {

    private long assetsId;
    private long recordId;
    private Double fmAllAssets;
    private String mainAssets;

    public Double getFmAllAssets() {
        return fmAllAssets;
    }

    public void setFmAllAssets(Double fmAllAssets) {
        this.fmAllAssets = fmAllAssets;
    }

    public String getMainAssets() {
        return mainAssets;
    }

    public void setMainAssets(String mainAssets) {
        this.mainAssets = mainAssets;
    }

    public long getAssetsId() {
        return assetsId;
    }

    public void setAssetsId(long assetsId) {
        this.assetsId = assetsId;
    }

    public long getRecordId() {
        return recordId;
    }

    public void setRecordId(long recordId) {
        this.recordId = recordId;
    }
}
