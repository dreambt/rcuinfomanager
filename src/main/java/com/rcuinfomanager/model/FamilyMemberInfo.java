package com.rcuinfomanager.model;

public class FamilyMemberInfo extends BaseModel {

    private int id;

    private int recordId;

    private String familyMemberCerNum;

    private String cerNum;

    private String familyMemberName;

    private float yearIncome;

    private String leaderRelation;

    private String profession;

    private String address;

    private String note1;

    private String note2;

    private String note3;

    private String note4;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRecordId() {
        return recordId;
    }

    public void setRecordId(int recordId) {
        this.recordId = recordId;
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

    public String getFamilyMemberName() {
        return familyMemberName;
    }

    public void setFamilyMemberName(String familyMemberName) {
        this.familyMemberName = familyMemberName;
    }

    public float getYearIncome() {
        return yearIncome;
    }

    public void setYearIncome(float yearIncome) {
        this.yearIncome = yearIncome;
    }

    public String getLeaderRelation() {
        return leaderRelation;
    }

    public void setLeaderRelation(String leaderRelation) {
        this.leaderRelation = leaderRelation;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote1() {
        return note1;
    }

    public void setNote1(String note1) {
        this.note1 = note1;
    }

    public String getNote4() {
        return note4;
    }

    public void setNote4(String note4) {
        this.note4 = note4;
    }

    public String getNote2() {
        return note2;
    }

    public void setNote2(String note2) {
        this.note2 = note2;
    }

    public String getNote3() {
        return note3;
    }

    public void setNote3(String note3) {
        this.note3 = note3;
    }
}
