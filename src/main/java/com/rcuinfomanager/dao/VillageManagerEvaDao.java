package com.rcuinfomanager.dao;

import com.rcuinfomanager.model.VillageManagerEva;

public interface VillageManagerEvaDao {

    void saveVillageManagerEva(VillageManagerEva villageManagerEva);

    VillageManagerEva getVillageManagerEvaList(long id);

    void updateVillageManagerEva(VillageManagerEva villageManagerEva);
}
