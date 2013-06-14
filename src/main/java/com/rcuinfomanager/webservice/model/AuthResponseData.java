package com.rcuinfomanager.webservice.model;

public class AuthResponseData {

    private int status;

    public AuthResponseData(int status) {
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
