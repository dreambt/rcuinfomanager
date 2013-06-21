package com.rcuinfomanager.web.controller;

import com.rcuinfomanager.model.ClientManager;
import com.rcuinfomanager.service.ClientManagerService;
import com.rcuinfomanager.util.ImageUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/client")
public class ClientManagerController {
    @Autowired
    private ClientManagerService clientManagerService;

    @RequestMapping(value = "/uploadFile")
    public String uploadFile(HttpServletRequest request, HttpServletResponse response, Map map) {
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> fileItems = new ServletFileUpload(new DiskFileItemFactory(1024 * 1024, new File("c:/tmp"))).
                        parseRequest(request);
                for (FileItem item : fileItems) {
                    if (!item.isFormField()) {
                        String storeDir = getClass().getClassLoader().getResource("/").getPath().replaceAll("/WEB-INF/classes","")+"asserts/client";
                        try {
                            ImageUtils.storeFile(storeDir, item.getName(), item.getInputStream());
                            map.put("fileName", item.getName());
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            } catch (FileUploadException e) {
                e.printStackTrace();
            }


        }
        return "device/clientVersion";
    }

    @RequestMapping(value ="/saveClient")
    public String saveClient(@ModelAttribute("clientManager") ClientManager clientManager) {

        //clientManagerService.saveClientInfo(appVerName,descb,url,isCoerce,new Date().toString());

        return "device/clientVersion";

    }
}
