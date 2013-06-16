package com.rcuinfomanager.model;

public class FamilyAssets {

    private long assetsId;
    private String fmAllAssets;
    private String mainAssets;

    public String getFmAllAssets() {
        return fmAllAssets;
    }

    public void setFmAllAssets(String fmAllAssets) {
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
}
