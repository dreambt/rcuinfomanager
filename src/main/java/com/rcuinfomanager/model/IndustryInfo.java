package com.rcuinfomanager.model;

public class IndustryInfo {
    private Long industryId;
    private String industryName;
    private  String industryAlias;
    private Long fatherId;
    private String infoId;
    private  String infoManageId;

    public Long getIndustryId() {
        return industryId;
    }

    public void setIndustryId(Long industryId) {
        this.industryId = industryId;
    }

    public String getIndustryName() {
        return industryName;
    }

    public void setIndustryName(String industryName) {
        this.industryName = industryName;
    }

    public String getIndustryAlias() {
        return industryAlias;
    }

    public void setIndustryAlias(String industryAlias) {
        this.industryAlias = industryAlias;
    }

    public Long getFatherId() {
        return fatherId;
    }

    public void setFatherId(Long fatherId) {
        this.fatherId = fatherId;
    }

    public String getInfoId() {
        return infoId;
    }

    public void setInfoId(String infoId) {
        this.infoId = infoId;
    }

    public String getInfoManageId() {
        return infoManageId;
    }

    public void setInfoManageId(String infoManageId) {
        this.infoManageId = infoManageId;
    }
}
