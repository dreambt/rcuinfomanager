package com.rcuinfomanager.web.controller;

import com.rcuinfomanager.model.ClientManager;
import com.rcuinfomanager.service.ClientManagerService;
import com.rcuinfomanager.session.SessionUser;
import com.rcuinfomanager.session.UserSessionContext;
import com.rcuinfomanager.session.UserSessionContextHolder;
import com.rcuinfomanager.util.DateUtils;
import com.rcuinfomanager.util.ImageUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
                List<FileItem> fileItems = new ServletFileUpload(new DiskFileItemFactory(1024 * 1024 * 10, new File("c:/tmp"))).
                        parseRequest(request);
                for (FileItem item : fileItems) {
                    if (!item.isFormField()) {
                        String storeDir = getClass().getClassLoader().getResource("/").getPath().replaceAll("/WEB-INF/classes","")+"asserts/client";
                        try {
                            String fileName = item.getName();
                            String[] temp = fileName.split("\\\\");
                            if (temp.length > 1) {
                                fileName = temp[temp.length-1];
                            }
                            ImageUtils.storeFile(storeDir, fileName, item.getInputStream());
                            map.put("fileName", fileName);
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
        }

        int offset = 10;
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        map.put("displayUserName", sessionUser.getDisplayUserName());

        long totalCount = clientManagerService.getAllClientManagerCount();
        map.put("pageCount", totalCount % offset == 0 ? totalCount / offset : totalCount / offset + 1);
        map.put("clientManagers", clientManagerService.getAllClientManagerByPage(1, offset));
        map.put("currentPage", 1);
        return "device/clientVersion";
    }

    @RequestMapping(value ="/saveClient")
    public String saveClient(@ModelAttribute("clientManager") ClientManager clientManager, @RequestParam(required = false) String coerce) {

        clientManager.setCreateTime(DateUtils.getDateCurrStrOfStoreFormat());
        if ("on".equals(coerce)) {
            clientManager.setIsCoerce(1);
        }
        clientManager.setUrl("/asserts/client/"+clientManager.getUrl());
        clientManagerService.saveClientInfo(clientManager);

        return "redirect:/clientManager";

    }

    @RequestMapping(value = "/deleteClientVersion/{id}")
    public String deleteClientVersion(@PathVariable long id) {
        clientManagerService.deleteClientManager(id);
        return "redirect:/clientManager";
    }


}
