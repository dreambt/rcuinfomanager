package com.rcuinfomanager.model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import java.io.Serializable;

/**
 * @author 王文庭(xorbytes@qq.com)
 *          功能说明：
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class BaseModel implements Serializable {

    protected int userId;

    protected String createTime;

    protected String updateTime;


    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }
}
