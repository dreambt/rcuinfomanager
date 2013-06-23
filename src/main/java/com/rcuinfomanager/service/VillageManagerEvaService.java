package com.rcuinfomanager.service;

import com.rcuinfomanager.dao.VillageManagerEvaDao;
import com.rcuinfomanager.model.VillageManagerEva;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VillageManagerEvaService {

    @Autowired
    private VillageManagerEvaDao villageManagerEvaDao;

    public VillageManagerEva getVillageManagerEvaList(long id){
        return villageManagerEvaDao.getVillageManagerEvaList(id);
    }

    public void updateVillageManagerEva(VillageManagerEva villageManagerEva) {
        villageManagerEvaDao.updateVillageManagerEva(villageManagerEva);
    }
}
