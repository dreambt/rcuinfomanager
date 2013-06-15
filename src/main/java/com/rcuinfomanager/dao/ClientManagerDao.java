package com.rcuinfomanager.dao;

import org.apache.ibatis.annotations.Param;

public interface ClientManagerDao {
    //保存客户端
    void saveClientInfo(@Param("appVerName")String appVerName,@Param("descb")String descb,
                        @Param("url")String url,@Param("isCoerce")int isCoerce,@Param("createTime")String createTime);

}
