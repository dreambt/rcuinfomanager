package com.rcuinfomanager.service;

import com.rcuinfomanager.dao.ClientManagerDao;
import com.rcuinfomanager.model.ClientManager;
import com.rcuinfomanager.util.AppVersion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClientManagerService {

    @Autowired
    ClientManagerDao clientManagerDao;
    //保存客户端
    public void saveClientInfo(String appVerName,String descb,String url,int isCoerce,String createTime){
        clientManagerDao.saveClientInfo(appVerName,descb,url,isCoerce,createTime);
    }

    public ClientManager getUpgradeVersion(String currentVersion) {
        List<ClientManager> clientManagerList = clientManagerDao.queryAll();
        if (clientManagerList != null) {
            for (ClientManager clientManager : clientManagerList) {
                AppVersion appVersion = new AppVersion(clientManager.getAppVerName());
                if (appVersion.needUpgrade(currentVersion)) {
                    return clientManager;
                }
            }
        }

        return null;
    }
}
