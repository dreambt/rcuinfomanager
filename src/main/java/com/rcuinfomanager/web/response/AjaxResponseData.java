package com.rcuinfomanager.web.response;

public class AjaxResponseData {

    private String errMsg;
    private int status;

    public AjaxResponseData() {

    }

    public AjaxResponseData(String errMsg) {
        this.errMsg = errMsg;
    }

    public String getErrMsg() {
        return errMsg;
    }

    public void setErrMsg(String errMsg) {
        this.errMsg = errMsg;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
