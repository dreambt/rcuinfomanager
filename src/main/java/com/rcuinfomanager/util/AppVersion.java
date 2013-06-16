package com.rcuinfomanager.util;

import com.google.common.base.Strings;

public class AppVersion {

    private String versionNum;

    public AppVersion(String versionNum) {
        this.versionNum = versionNum;
    }

    public String getVersionNum() {
        return versionNum;
    }

    public void setVersionNum(String versionNum) {
        this.versionNum = versionNum;
    }

    public boolean needUpgrade(String currVersion) {
        if (Strings.isNullOrEmpty(currVersion)) {
            return true;
        }

        String[] currentVersionArray = currVersion.split("\\.");
        if (currentVersionArray != null) {
            if (currentVersionArray.length > 0) {
                String[] newVersionArray = versionNum.split("\\.");
                for (int i = 0; i < newVersionArray.length; i++) {
                    if (i < currentVersionArray.length) {
                        if (Integer.parseInt(newVersionArray[i]) > Integer.parseInt(currentVersionArray[i])) {
                            return true;
                        }
                    } else {
                        return true;
                    }
                }
            } else {
                String[] newVersionArray = versionNum.split("\\.");
                if (newVersionArray != null) {
                    if (newVersionArray.length > 0) {
                        if (Integer.parseInt(newVersionArray[0]) >= Integer.parseInt(currVersion)) {
                            return true;
                        }
                    } else {
                        if (Integer.parseInt(versionNum) > Integer.parseInt(currVersion)) {
                            return true;
                        }
                    }
                }
            }

        }
        return false;
    }
}
