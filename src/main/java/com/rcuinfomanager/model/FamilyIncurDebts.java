package com.rcuinfomanager.model;

public class FamilyIncurDebts {
    private Long id;
    private Long recordId;
    private String fmIncurDebts;
    private String ourBankDebts;
    private String otherBankDebts;
    private String loanPurpose;
    private String loanShap;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getRecordId() {
        return recordId;
    }

    public void setRecordId(Long recordId) {
        this.recordId = recordId;
    }

    public String getFmIncurDebts() {
        return fmIncurDebts;
    }

    public void setFmIncurDebts(String fmIncurDebts) {
        this.fmIncurDebts = fmIncurDebts;
    }

    public String getOurBankDebts() {
        return ourBankDebts;
    }

    public void setOurBankDebts(String ourBankDebts) {
        this.ourBankDebts = ourBankDebts;
    }

    public String getOtherBankDebts() {
        return otherBankDebts;
    }

    public void setOtherBankDebts(String otherBankDebts) {
        this.otherBankDebts = otherBankDebts;
    }

    public String getLoanPurpose() {
        return loanPurpose;
    }

    public void setLoanPurpose(String loanPurpose) {
        this.loanPurpose = loanPurpose;
    }

    public String getLoanShap() {
        return loanShap;
    }

    public void setLoanShap(String loanShap) {
        this.loanShap = loanShap;
    }
}
