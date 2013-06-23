package com.rcuinfomanager.dao;

import com.rcuinfomanager.model.ClientManager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClientManagerDao {
    //保存客户端
    void saveClientInfo(ClientManager clientManager);

    List<ClientManager> queryAll();

    List<ClientManager> queryAllByPage(@Param("beginPageNum")int beginPageNum, @Param("endPageNum")int endPageNum);

    long getAllClientManagerCount();

    void deleteById(long id);
}
