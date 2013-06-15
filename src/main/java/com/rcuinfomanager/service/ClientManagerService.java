package com.rcuinfomanager.service;

import com.rcuinfomanager.dao.ClientManagerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClientManagerService {

    @Autowired
    ClientManagerDao clientManagerDao;
    //保存客户端
    public void saveClientInfo(String appVerName,String descb,String url,int isCoerce,String createTime){
        clientManagerDao.saveClientInfo(appVerName,descb,url,isCoerce,createTime);
    }
}
