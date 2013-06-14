package com.rcuinfomanager.webservice.model;

import java.util.List;

public class WebServiceResponseData {

    private int status;

    private String data;

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
