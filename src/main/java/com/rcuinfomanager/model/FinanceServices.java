package com.rcuinfomanager.model;

public class FinanceServices {
    private Long recordId;
    private String usedProduct;
    private String satisfaction;
    private int isMoneyNeed;
    private String moneyTodo;
    private int moneyCount;
    private int timeLimit;
    private String guarantee;
    private String fmDepositTodo;
    private String needServices;
    private String needServicesElse;
    private String holpForServices;
    private String suggestion;
    private String bankCard;
    private String electronBank;
    private String agentPay;
    private String auto;
    private String newRequirement;
    private String publicLoan;
    private String privateLoan;
    private String note1;

    public Long getRecordId() {
        return recordId;
    }

    public void setRecordId(Long recordId) {
        this.recordId = recordId;
    }

    public String getUsedProduct() {
        return usedProduct;
    }

    public void setUsedProduct(String usedProduct) {
        this.usedProduct = usedProduct;
    }

    public String getSatisfaction() {
        return satisfaction;
    }

    public void setSatisfaction(String satisfaction) {
        this.satisfaction = satisfaction;
    }

    public int getMoneyNeed() {
        return isMoneyNeed;
    }

    public String getMoneyNeedReadable() {
        if (isMoneyNeed == 0) {
            return "否";
        } else {
            return "是";
        }
    }

    public void setMoneyNeed(int moneyNeed) {
        isMoneyNeed = moneyNeed;
    }

    public String getMoneyTodo() {
        return moneyTodo;
    }

    public void setMoneyTodo(String moneyTodo) {
        this.moneyTodo = moneyTodo;
    }

    public int getMoneyCount() {
        return moneyCount;
    }

    public void setMoneyCount(int moneyCount) {
        this.moneyCount = moneyCount;
    }

    public int getTimeLimit() {
        return timeLimit;
    }

    public void setTimeLimit(int timeLimit) {
        this.timeLimit = timeLimit;
    }

    public String getGuarantee() {
        return guarantee;
    }

    public void setGuarantee(String guarantee) {
        this.guarantee = guarantee;
    }

    public String getFmDepositTodo() {
        return fmDepositTodo;
    }

    public void setFmDepositTodo(String fmDepositTodo) {
        this.fmDepositTodo = fmDepositTodo;
    }

    public String getNeedServices() {
        return needServices;
    }

    public void setNeedServices(String needServices) {
        this.needServices = needServices;
    }

    public String getNeedServicesElse() {
        return needServicesElse;
    }

    public void setNeedServicesElse(String needServicesElse) {
        this.needServicesElse = needServicesElse;
    }

    public String getHolpForServices() {
        return holpForServices;
    }

    public void setHolpForServices(String holpForServices) {
        this.holpForServices = holpForServices;
    }

    public String getSuggestion() {
        return suggestion;
    }

    public void setSuggestion(String suggestion) {
        this.suggestion = suggestion;
    }

    public String getBankCard() {
        return bankCard;
    }

    public void setBankCard(String bankCard) {
        this.bankCard = bankCard;
    }

    public String getElectronBank() {
        return electronBank;
    }

    public void setElectronBank(String electronBank) {
        this.electronBank = electronBank;
    }

    public String getAgentPay() {
        return agentPay;
    }

    public void setAgentPay(String agentPay) {
        this.agentPay = agentPay;
    }

    public String getAuto() {
        return auto;
    }

    public void setAuto(String auto) {
        this.auto = auto;
    }

    public String getNewRequirement() {
        return newRequirement;
    }

    public void setNewRequirement(String newRequirement) {
        this.newRequirement = newRequirement;
    }

    public String getPublicLoan() {
        return publicLoan;
    }

    public void setPublicLoan(String publicLoan) {
        this.publicLoan = publicLoan;
    }

    public String getPrivateLoan() {
        return privateLoan;
    }

    public void setPrivateLoan(String privateLoan) {
        this.privateLoan = privateLoan;
    }

    public String getNote1() {
        return note1;
    }

    public void setNote1(String note1) {
        this.note1 = note1;
    }
}
