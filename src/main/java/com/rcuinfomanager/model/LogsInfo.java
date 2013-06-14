package com.rcuinfomanager.model;

public class LogsInfo {
    private String operatedTime;
    private long userId;
    private String operation;
    private String userName;

    public LogsInfo(){

    }

    public LogsInfo(String operatedTime,long userId,String operation){
        this.operatedTime=operatedTime;
        this.userId=userId;
        this.operation=operation;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public String getOperatedTime() {
        return operatedTime;
    }

    public void setOperatedTime(String operatedTime) {
        this.operatedTime = operatedTime;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
