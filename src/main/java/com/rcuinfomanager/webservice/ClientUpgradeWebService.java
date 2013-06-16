package com.rcuinfomanager.webservice;

import com.rcuinfomanager.model.ClientManager;
import com.rcuinfomanager.service.ClientManagerService;
import com.rcuinfomanager.webservice.model.AppStatus;
import com.rcuinfomanager.webservice.model.UpgradeResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/api/1")
public class ClientUpgradeWebService {

    @Autowired
    private ClientManagerService clientManagerService;

    @RequestMapping(value="/upgrade/check/{version}", method = RequestMethod.GET)
    public @ResponseBody UpgradeResponseData checkUpgrade(@PathVariable String version) {

        UpgradeResponseData upgradeResponseData = new UpgradeResponseData(1);

        ClientManager clientManager = clientManagerService.getUpgradeVersion(version);
        if (clientManager != null) {
            AppStatus appStatus = new AppStatus();
            appStatus.setUrl(clientManager.getUrl());
            appStatus.setDesc(clientManager.getDescb());
            appStatus.setLatestVersion(clientManager.getAppVerName());
            upgradeResponseData.setStatus(0);
            upgradeResponseData.setForce(clientManager.getCoerce());
            upgradeResponseData.setApp(appStatus);
        }

        return upgradeResponseData;
    }
}
