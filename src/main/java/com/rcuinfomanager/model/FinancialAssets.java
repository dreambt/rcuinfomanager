package com.rcuinfomanager.model;

public class FinancialAssets {
    private Long assetsId;
    private long id;
    private String financialInfo;
    private String depositOurBank;
    private String depositOtherBank;

    public Long getAssetsId() {
        return assetsId;
    }

    public void setAssetsId(Long assetsId) {
        this.assetsId = assetsId;
    }

    public String getFinancialInfo() {
        return financialInfo;
    }

    public void setFinancialInfo(String financialInfo) {
        this.financialInfo = financialInfo;
    }

    public String getDepositOurBank() {
        return depositOurBank;
    }

    public void setDepositOurBank(String depositOurBank) {
        this.depositOurBank = depositOurBank;
    }

    public String getDepositOtherBank() {
        return depositOtherBank;
    }

    public void setDepositOtherBank(String depositOtherBank) {
        this.depositOtherBank = depositOtherBank;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
}
