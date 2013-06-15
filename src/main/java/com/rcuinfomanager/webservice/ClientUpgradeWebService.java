package com.rcuinfomanager.webservice;

import com.rcuinfomanager.webservice.model.UpgradeResponseData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/api/1")
public class ClientUpgradeWebService {

    @RequestMapping(value="/client/upgrade", method = RequestMethod.GET)
    public @ResponseBody UpgradeResponseData upgrade() {
        UpgradeResponseData upgradeResponseData = new UpgradeResponseData(1);

        return upgradeResponseData;
    }
}
