package com.rcuinfomanager.model;

public class FamilyMember {
    private Long id;
    private long recordId;
    private String familyMemberName;
    private String yearIncome;
    private String leaderRelation;
    private String address;
    private String profession;
    private String familyMemberCerNum;
    private String cerNum;

    public String getFamilyMemberName() {
        return familyMemberName;
    }

    public void setFamilyMemberName(String familyMemberName) {
        this.familyMemberName = familyMemberName;
    }

    public String getYearIncome() {
        return yearIncome;
    }

    public void setYearIncome(String yearIncome) {
        this.yearIncome = yearIncome;
    }

    public String getLeaderRelation() {
        return leaderRelation;
    }

    public void setLeaderRelation(String leaderRelation) {
        this.leaderRelation = leaderRelation;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getFamilyMemberCerNum() {
        return familyMemberCerNum;
    }

    public void setFamilyMemberCerNum(String familyMemberCerNum) {
        this.familyMemberCerNum = familyMemberCerNum;
    }

    public String getCerNum() {
        return cerNum;
    }

    public void setCerNum(String cerNum) {
        this.cerNum = cerNum;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public long getRecordId() {
        return recordId;
    }

    public void setRecordId(long recordId) {
        this.recordId = recordId;
    }
}
