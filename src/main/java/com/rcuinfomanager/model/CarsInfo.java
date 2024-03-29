package com.rcuinfomanager.model;

public class CarsInfo {
    private int id;
    private long recordId;
    private long assetsId;
    private String carsInfo;
    private String carsWorth;
    private String carsIsInstallment;
    private String carsUsingInfo;

    public String getCarsInfo() {
        return carsInfo;
    }

    public void setCarsInfo(String carsInfo) {
        this.carsInfo = carsInfo;
    }

    public String getCarsWorth() {
        return carsWorth;
    }

    public void setCarsWorth(String carsWorth) {
        this.carsWorth = carsWorth;
    }

    public String getCarsIsInstallment() {
        return carsIsInstallment;
    }

    public void setCarsIsInstallment(String carsIsInstallment) {
        this.carsIsInstallment = carsIsInstallment;
    }

    public String getCarsUsingInfo() {
        return carsUsingInfo;
    }

    public void setCarsUsingInfo(String carsUsingInfo) {
        this.carsUsingInfo = carsUsingInfo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
