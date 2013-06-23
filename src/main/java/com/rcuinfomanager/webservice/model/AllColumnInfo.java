package com.rcuinfomanager.webservice.model;

import com.google.common.base.Strings;
import com.rcuinfomanager.model.*;

import java.io.Serializable;
import java.util.List;

public class AllColumnInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    private long recordId;
    private long assetsId;
    private String userName;
    private String village;
    private String customerName;
    private String cerNum;
    private int gender;
    private int isFarmer;
    private String cerType;
    private String custType;
    private String image;
    private String cerValidityFrom;
    private String cerValidityTo;
    private String birthday;
    private String nationality;
    private int isHavePassport;
    private String nation;
    private String poliLaspect;
    private String address;
    private String postcode;
    private String telephone;
    private String mbPhoneNum;
    private String areaCode;
    private String areaName;
    private String highestDegree;
    private String health;
    private String highestEdu;
    private String bankRelation;
    private String liveCondition;
    private String maritalStatus;
    private String socialSecurity;
    private String bankPartnership;
    private String profession;
    private String businessProj;
    private int businessYear;
    private String businessSite;
    private String industry;
    private String businessProp;
    private String moneySitu;
    private String inputMoney;
    private String ownMoney;
    private String yearIncome;
    private String workSitu;
    private String unitProp;
    private String unitIndustryId;
    private String unitIndustryName;
    private String department;
    private String unitType;
    private String duties;
    private String annualWageIncome;
    private String workYears;
    private String workTitle;

    private double fmAllIncome;
    private double fmExpenses;
    private String fmIncomeSrc;
    private double fmPerIncome;
    private double fmOtherMemberIn;
    private String fmExpensesProj;
    private String fmInOutRatio;

    private double fmAllAssets;
    private String mainAssets;


    private List<HouseInfo> houseInfos;

    private List<LandInfo> landInfos;

    private List<CarsInfo> carInfos;

    private String financialInfo;
    private String financialDepositOurBank;
    private String financialDepositOtherBank;

    private int fmIncurDebts;
    private int fmIncurOurBankDebts;
    private int fmIncurOtherBankDebts;
    private String fmIncurLoanPurpose;
    private String fmIncurLoanShap;

    private List<FamilyMember> familyMembers;

    private String finaServiceUsedProduct;
    private String finaServiceSatisfaction;
    private String finaServicesFmDepositTodo;
    private String finaServicesNeedServices;
    private String finaServicesNeedServicesElse;
    private String finaServicesHolpForServices;
    private String finaServicesSuggestion;
    private String finaServiceElectronBank;

    private int finaServiceIsMoneyNeed;
    private String finaServiceMoneyTodo;
    private int finaServiceMoneyCount;
    private int finaServiceTimeLimit;
    private String finaServiceGuarantee;
    private String finaServiceBankCard;
    private String finaServiceEleBankBusiness;
    private String finaServiceAgentPayBusiness;
    private String finaServiceAutoBusiness;
    private String finaServicePrivateLoan;
    private String finaServicePublicLoan;
    private String finaServiceNewRequirement;

    private String custManagerLoanSitu;
    private String custManagerCreditRecord;
    private String custManagerOtherBankRecord;
    private String custManagerHouseToMoney;

    private VillageManagerEva villageManagerEva;

    private int status;

    public long getRecordId() {
        return recordId;
    }

    public void setRecordId(long recordId) {
        this.recordId = recordId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getVillage() {
        return village;
    }

    public void setVillage(String village) {
        this.village = village;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCerNum() {
        return cerNum;
    }

    public void setCerNum(String cerNum) {
        this.cerNum = cerNum;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public int getIsFarmer() {
        return isFarmer;
    }

    public void setIsFarmer(int isFarmer) {
        this.isFarmer = isFarmer;
    }

    public String getCerType() {
        return cerType;
    }

    public void setCerType(String cerType) {
        this.cerType = cerType;
    }

    public String getCustType() {
        return custType;
    }

    public void setCustType(String custType) {
        this.custType = custType;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCerValidityFrom() {
        return cerValidityFrom;
    }

    public void setCerValidityFrom(String cerValidityFrom) {
        this.cerValidityFrom = cerValidityFrom;
    }

    public String getCerValidityTo() {
        return cerValidityTo;
    }

    public void setCerValidityTo(String cerValidityTo) {
        this.cerValidityTo = cerValidityTo;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public int getIsHavePassport() {
        return isHavePassport;
    }

    public void setIsHavePassport(int isHavePassport) {
        this.isHavePassport = isHavePassport;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getPoliLaspect() {
        return poliLaspect;
    }

    public void setPoliLaspect(String poliLaspect) {
        this.poliLaspect = poliLaspect;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getMbPhoneNum() {
        return mbPhoneNum;
    }

    public void setMbPhoneNum(String mbPhoneNum) {
        this.mbPhoneNum = mbPhoneNum;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getHighestDegree() {
        return highestDegree;
    }

    public void setHighestDegree(String highestDegree) {
        this.highestDegree = highestDegree;
    }

    public String getHealth() {
        return health;
    }

    public void setHealth(String health) {
        this.health = health;
    }

    public String getHighestEdu() {
        return highestEdu;
    }

    public void setHighestEdu(String highestEdu) {
        this.highestEdu = highestEdu;
    }

    public String getBankRelation() {
        return bankRelation;
    }

    public void setBankRelation(String bankRelation) {
        this.bankRelation = bankRelation;
    }

    public String getLiveCondition() {
        return liveCondition;
    }

    public void setLiveCondition(String liveCondition) {
        this.liveCondition = liveCondition;
    }

    public String getMaritalStatus() {
        return maritalStatus;
    }

    public void setMaritalStatus(String maritalStatus) {
        this.maritalStatus = maritalStatus;
    }

    public String getSocialSecurity() {
        return socialSecurity;
    }

    public void setSocialSecurity(String socialSecurity) {
        this.socialSecurity = socialSecurity;
    }

    public String getBankPartnership() {
        return bankPartnership;
    }

    public void setBankPartnership(String bankPartnership) {
        this.bankPartnership = bankPartnership;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getBusinessProj() {
        return businessProj;
    }

    public void setBusinessProj(String businessProj) {
        this.businessProj = businessProj;
    }

    public int getBusinessYear() {
        return businessYear;
    }

    public void setBusinessYear(int businessYear) {
        this.businessYear = businessYear;
    }

    public String getBusinessSite() {
        return businessSite;
    }

    public void setBusinessSite(String businessSite) {
        this.businessSite = businessSite;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public String getBusinessProp() {
        return businessProp;
    }

    public void setBusinessProp(String businessProp) {
        this.businessProp = businessProp;
    }

    public String getMoneySitu() {
        return moneySitu;
    }

    public void setMoneySitu(String moneySitu) {
        this.moneySitu = moneySitu;
    }

    public String getInputMoney() {
        return inputMoney;
    }

    public void setInputMoney(String inputMoney) {
        this.inputMoney = inputMoney;
    }

    public String getOwnMoney() {
        return ownMoney;
    }

    public void setOwnMoney(String ownMoney) {
        this.ownMoney = ownMoney;
    }

    public String getYearIncome() {
        return yearIncome;
    }

    public void setYearIncome(String yearIncome) {
        this.yearIncome = yearIncome;
    }

    public String getWorkSitu() {
        return workSitu;
    }

    public void setWorkSitu(String workSitu) {
        this.workSitu = workSitu;
    }

    public String getUnitProp() {
        return unitProp;
    }

    public void setUnitProp(String unitProp) {
        this.unitProp = unitProp;
    }

    public String getUnitIndustryId() {
        return unitIndustryId;
    }

    public void setUnitIndustryId(String unitIndustryId) {
        this.unitIndustryId = unitIndustryId;
    }

    public String getUnitIndustryName() {
        return unitIndustryName;
    }

    public void setUnitIndustryName(String unitIndustryName) {
        this.unitIndustryName = unitIndustryName;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getUnitType() {
        return unitType;
    }

    public void setUnitType(String unitType) {
        this.unitType = unitType;
    }

    public String getDuties() {
        return duties;
    }

    public void setDuties(String duties) {
        this.duties = duties;
    }

    public String getAnnualWageIncome() {
        return annualWageIncome;
    }

    public void setAnnualWageIncome(String annualWageIncome) {
        this.annualWageIncome = annualWageIncome;
    }

    public String getWorkYears() {
        return workYears;
    }

    public void setWorkYears(String workYears) {
        this.workYears = workYears;
    }

    public String getWorkTitle() {
        return workTitle;
    }

    public void setWorkTitle(String workTitle) {
        this.workTitle = workTitle;
    }

    public double getFmAllIncome() {
        return fmAllIncome;
    }

    public void setFmAllIncome(double fmAllIncome) {
        this.fmAllIncome = fmAllIncome;
    }

    public double getFmExpenses() {
        return fmExpenses;
    }

    public void setFmExpenses(double fmExpenses) {
        this.fmExpenses = fmExpenses;
    }

    public String getFmIncomeSrc() {
        return fmIncomeSrc;
    }

    public void setFmIncomeSrc(String fmIncomeSrc) {
        this.fmIncomeSrc = fmIncomeSrc;
    }

    public double getFmPerIncome() {
        return fmPerIncome;
    }

    public void setFmPerIncome(double fmPerIncome) {
        this.fmPerIncome = fmPerIncome;
    }

    public double getFmOtherMemberIn() {
        return fmOtherMemberIn;
    }

    public void setFmOtherMemberIn(double fmOtherMemberIn) {
        this.fmOtherMemberIn = fmOtherMemberIn;
    }

    public String getFmExpensesProj() {
        return fmExpensesProj;
    }

    public void setFmExpensesProj(String fmExpensesProj) {
        this.fmExpensesProj = fmExpensesProj;
    }

    public String getFmInOutRatio() {
        return fmInOutRatio;
    }

    public void setFmInOutRatio(String fmInOutRatio) {
        this.fmInOutRatio = fmInOutRatio;
    }

    public double getFmAllAssets() {
        return fmAllAssets;
    }

    public void setFmAllAssets(double fmAllAssets) {
        this.fmAllAssets = fmAllAssets;
    }

    public String getMainAssets() {
        return mainAssets;
    }

    public void setMainAssets(String mainAssets) {
        this.mainAssets = mainAssets;
    }

    public List<HouseInfo> getHouseInfos() {
        return houseInfos;
    }

    public void setHouseInfos(List<HouseInfo> houseInfos) {
        this.houseInfos = houseInfos;
    }

    public List<LandInfo> getLandInfos() {
        return landInfos;
    }

    public void setLandInfos(List<LandInfo> landInfos) {
        this.landInfos = landInfos;
    }

    public List<CarsInfo> getCarInfos() {
        return carInfos;
    }

    public void setCarInfos(List<CarsInfo> carInfos) {
        this.carInfos = carInfos;
    }

    public String getFinancialInfo() {
        return financialInfo;
    }

    public void setFinancialInfo(String financialInfo) {
        this.financialInfo = financialInfo;
    }

    public String getFinancialDepositOurBank() {
        return financialDepositOurBank;
    }

    public void setFinancialDepositOurBank(String financialDepositOurBank) {
        this.financialDepositOurBank = financialDepositOurBank;
    }

    public String getFinancialDepositOtherBank() {
        return financialDepositOtherBank;
    }

    public void setFinancialDepositOtherBank(String financialDepositOtherBank) {
        this.financialDepositOtherBank = financialDepositOtherBank;
    }

    public int getFmIncurDebts() {
        return fmIncurDebts;
    }

    public void setFmIncurDebts(int fmIncurDebts) {
        this.fmIncurDebts = fmIncurDebts;
    }

    public int getFmIncurOurBankDebts() {
        return fmIncurOurBankDebts;
    }

    public void setFmIncurOurBankDebts(int fmIncurOurBankDebts) {
        this.fmIncurOurBankDebts = fmIncurOurBankDebts;
    }

    public int getFmIncurOtherBankDebts() {
        return fmIncurOtherBankDebts;
    }

    public void setFmIncurOtherBankDebts(int fmIncurOtherBankDebts) {
        this.fmIncurOtherBankDebts = fmIncurOtherBankDebts;
    }

    public String getFmIncurLoanPurpose() {
        return fmIncurLoanPurpose;
    }

    public void setFmIncurLoanPurpose(String fmIncurLoanPurpose) {
        this.fmIncurLoanPurpose = fmIncurLoanPurpose;
    }

    public String getFmIncurLoanShap() {
        return fmIncurLoanShap;
    }

    public void setFmIncurLoanShap(String fmIncurLoanShap) {
        this.fmIncurLoanShap = fmIncurLoanShap;
    }

    public List<FamilyMember> getFamilyMembers() {
        return familyMembers;
    }

    public void setFamilyMembers(List<FamilyMember> familyMembers) {
        this.familyMembers = familyMembers;
    }

    public String getFinaServiceUsedProduct() {
        return finaServiceUsedProduct;
    }

    public void setFinaServiceUsedProduct(String finaServiceUsedProduct) {
        this.finaServiceUsedProduct = finaServiceUsedProduct;
    }

    public int getFinaServiceIsMoneyNeed() {
        return finaServiceIsMoneyNeed;
    }

    public void setFinaServiceIsMoneyNeed(int finaServiceIsMoneyNeed) {
        this.finaServiceIsMoneyNeed = finaServiceIsMoneyNeed;
    }

    public String getFinaServiceMoneyTodo() {
        return finaServiceMoneyTodo;
    }

    public void setFinaServiceMoneyTodo(String finaServiceMoneyTodo) {
        this.finaServiceMoneyTodo = finaServiceMoneyTodo;
    }

    public int getFinaServiceMoneyCount() {
        return finaServiceMoneyCount;
    }

    public void setFinaServiceMoneyCount(int finaServiceMoneyCount) {
        this.finaServiceMoneyCount = finaServiceMoneyCount;
    }

    public int getFinaServiceTimeLimit() {
        return finaServiceTimeLimit;
    }

    public void setFinaServiceTimeLimit(int finaServiceTimeLimit) {
        this.finaServiceTimeLimit = finaServiceTimeLimit;
    }

    public String getFinaServiceGuarantee() {
        return finaServiceGuarantee;
    }

    public void setFinaServiceGuarantee(String finaServiceGuarantee) {
        this.finaServiceGuarantee = finaServiceGuarantee;
    }

    public String getFinaServiceBankCard() {
        return finaServiceBankCard;
    }

    public void setFinaServiceBankCard(String finaServiceBankCard) {
        this.finaServiceBankCard = finaServiceBankCard;
    }

    public String getFinaServiceEleBankBusiness() {
        return finaServiceEleBankBusiness;
    }

    public void setFinaServiceEleBankBusiness(String finaServiceEleBankBusiness) {
        this.finaServiceEleBankBusiness = finaServiceEleBankBusiness;
    }

    public String getFinaServiceAgentPayBusiness() {
        return finaServiceAgentPayBusiness;
    }

    public void setFinaServiceAgentPayBusiness(String finaServiceAgentPayBusiness) {
        this.finaServiceAgentPayBusiness = finaServiceAgentPayBusiness;
    }

    public String getFinaServiceAutoBusiness() {
        return finaServiceAutoBusiness;
    }

    public void setFinaServiceAutoBusiness(String finaServiceAutoBusiness) {
        this.finaServiceAutoBusiness = finaServiceAutoBusiness;
    }

    public String getFinaServicePrivateLoan() {
        return finaServicePrivateLoan;
    }

    public void setFinaServicePrivateLoan(String finaServicePrivateLoan) {
        this.finaServicePrivateLoan = finaServicePrivateLoan;
    }

    public String getFinaServicePublicLoan() {
        return finaServicePublicLoan;
    }

    public void setFinaServicePublicLoan(String finaServicePublicLoan) {
        this.finaServicePublicLoan = finaServicePublicLoan;
    }

    public String getFinaServiceNewRequirement() {
        if (Strings.isNullOrEmpty(finaServiceNewRequirement)) {
            return "";
        }
        return finaServiceNewRequirement.trim();
    }

    public void setFinaServiceNewRequirement(String finaServiceNewRequirement) {
        this.finaServiceNewRequirement = finaServiceNewRequirement;
    }

    public String getCustManagerLoanSitu() {
        return custManagerLoanSitu;
    }

    public void setCustManagerLoanSitu(String custManagerLoanSitu) {
        this.custManagerLoanSitu = custManagerLoanSitu;
    }

    public String getCustManagerCreditRecord() {
        return custManagerCreditRecord;
    }

    public void setCustManagerCreditRecord(String custManagerCreditRecord) {
        this.custManagerCreditRecord = custManagerCreditRecord;
    }

    public String getCustManagerOtherBankRecord() {
        return custManagerOtherBankRecord;
    }

    public void setCustManagerOtherBankRecord(String custManagerOtherBankRecord) {
        this.custManagerOtherBankRecord = custManagerOtherBankRecord;
    }

    public String getCustManagerHouseToMoney() {
        return custManagerHouseToMoney;
    }

    public void setCustManagerHouseToMoney(String custManagerHouseToMoney) {
        this.custManagerHouseToMoney = custManagerHouseToMoney;
    }

    public long getAssetsId() {
        return assetsId;
    }

    public void setAssetsId(long assetsId) {
        this.assetsId = assetsId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public int getFarmer() {
        return isFarmer;
    }

    public void setFarmer(int farmer) {
        isFarmer = farmer;
    }

    public int getHavePassport() {
        return isHavePassport;
    }

    public void setHavePassport(int havePassport) {
        isHavePassport = havePassport;
    }

    public String getFinaServiceSatisfaction() {
        return finaServiceSatisfaction;
    }

    public void setFinaServiceSatisfaction(String finaServiceSatisfaction) {
        this.finaServiceSatisfaction = finaServiceSatisfaction;
    }

    public String getFinaServicesFmDepositTodo() {
        return finaServicesFmDepositTodo;
    }

    public void setFinaServicesFmDepositTodo(String finaServicesFmDepositTodo) {
        this.finaServicesFmDepositTodo = finaServicesFmDepositTodo;
    }

    public String getFinaServicesNeedServices() {
        return finaServicesNeedServices;
    }

    public void setFinaServicesNeedServices(String finaServicesNeedServices) {
        this.finaServicesNeedServices = finaServicesNeedServices;
    }

    public String getFinaServicesNeedServicesElse() {
        return finaServicesNeedServicesElse;
    }

    public void setFinaServicesNeedServicesElse(String finaServicesNeedServicesElse) {
        this.finaServicesNeedServicesElse = finaServicesNeedServicesElse;
    }

    public String getFinaServicesHolpForServices() {
        if (Strings.isNullOrEmpty(finaServicesHolpForServices)) {
            return "";
        }
        return finaServicesHolpForServices.trim();
    }

    public void setFinaServicesHolpForServices(String finaServicesHolpForServices) {
        this.finaServicesHolpForServices = finaServicesHolpForServices;
    }

    public String getFinaServicesSuggestion() {
        if (Strings.isNullOrEmpty(finaServicesSuggestion))  {
            return "";
        }
        return finaServicesSuggestion.trim();
    }

    public void setFinaServicesSuggestion(String finaServicesSuggestion) {
        this.finaServicesSuggestion = finaServicesSuggestion;
    }

    public String getFinaServiceElectronBank() {
        return finaServiceElectronBank;
    }

    public void setFinaServiceElectronBank(String finaServiceElectronBank) {
        this.finaServiceElectronBank = finaServiceElectronBank;
    }

    public VillageManagerEva getVillageManagerEva() {
        return villageManagerEva;
    }

    public void setVillageManagerEva(VillageManagerEva villageManagerEva) {
        this.villageManagerEva = villageManagerEva;
    }
}
