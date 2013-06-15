package com.rcuinfomanager.webservice.model;

public class UpgradeResponseData {

    private int status;

    private int force;

    private AppStatus app;

    public UpgradeResponseData(int status) {
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getForce() {
        return force;
    }

    public void setForce(int force) {
        this.force = force;
    }

    public AppStatus getApp() {
        return app;
    }

    public void setApp(AppStatus app) {
        this.app = app;
    }
}
