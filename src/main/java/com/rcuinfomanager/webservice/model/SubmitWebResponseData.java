package com.rcuinfomanager.webservice.model;

import java.util.List;

public class SubmitWebResponseData {
    private int status;
    private List<SubmitItem> submitList;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public List<SubmitItem> getSubmitList() {
        return submitList;
    }

    public void setSubmitList(List<SubmitItem> submitList) {
        this.submitList = submitList;
    }
}
