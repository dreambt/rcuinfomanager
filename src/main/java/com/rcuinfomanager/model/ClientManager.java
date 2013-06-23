package com.rcuinfomanager.model;

public class ClientManager {
    private long id;
    private String appVerName;
    private String descb;
    private String url;
    private int isCoerce;
    private String createTime;

    public ClientManager(){

    }
    public ClientManager(String appVerName,String descb,String url,int isCoerce,String createTime){
        this.appVerName=appVerName;
        this.descb=descb;
        this.url=url;
        this.isCoerce=isCoerce;
        this.createTime=createTime;
    }

    public String getAppVerName() {
        return appVerName;
    }

    public void setAppVerName(String appVerName) {
        this.appVerName = appVerName;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public int getIsCoerce() {
        return isCoerce;
    }

    public void setIsCoerce(int coerce) {
        isCoerce = coerce;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDescb() {
        return descb;
    }

    public void setDescb(String descb) {
        this.descb = descb;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
}
