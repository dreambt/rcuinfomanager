package com.rcuinfomanager.webservice.model;

public class WebResponseData {

    private int status;

    public WebResponseData(int status) {
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
