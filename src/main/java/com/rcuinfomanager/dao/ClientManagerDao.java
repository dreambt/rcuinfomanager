package com.rcuinfomanager.dao;

import com.rcuinfomanager.model.ClientManager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClientManagerDao {
    //保存客户端
    void saveClientInfo(@Param("appVerName")String appVerName,@Param("descb")String descb,
                        @Param("url")String url,@Param("isCoerce")int isCoerce,@Param("createTime")String createTime);

    List<ClientManager> queryAll();
}
