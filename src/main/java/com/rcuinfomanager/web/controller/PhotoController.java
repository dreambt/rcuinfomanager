package com.rcuinfomanager.web.controller;

import com.rcuinfomanager.session.SessionUser;
import com.rcuinfomanager.session.UserSessionContext;
import com.rcuinfomanager.session.UserSessionContextHolder;
import com.rcuinfomanager.util.ImageUtils;
import com.rcuinfomanager.util.ZipFileWithPwd;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/photo")
public class PhotoController {

    private  String imgStoreDir = "d:/rcuinfomanager_data";

    @RequestMapping("/home")
    public String photoUploadHome(HttpServletRequest request,Map map) {
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        map.put("needModifyPassword",sessionUser.isNeedModifyPassword());
        map.put("displayUserName", sessionUser.getDisplayUserName());
        map.put("userName", sessionUser.getUserName());
        map.put("status", request.getParameter("status"));
        return "/photo/index";
    }

    @RequestMapping("/upload")
    public String photoUpload(HttpServletRequest request, HttpServletResponse response, Map map) {
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> fileItems = new ServletFileUpload(new DiskFileItemFactory(1024 * 1024 * 30, new File("c:/tmp"))).parseRequest(request);
                for (FileItem item : fileItems) {
                    if (!item.isFormField()) {
                        String storeDir = getClass().getClassLoader().getResource("/").getPath().replaceAll("/WEB-INF/classes","")+"asserts/client";
                        try {
                            String fileName = item.getName();
                            String[] temp = fileName.split("\\\\");
                            if (temp.length > 1) {
                                fileName = temp[temp.length-1];
                            }
                            ImageUtils.storeFile(imgStoreDir,fileName,item.getInputStream());
                            ZipFileWithPwd.decryptZipFile(imgStoreDir,imgStoreDir,fileName);
                            map.put("status", "1");
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
        }
        return "redirect:/photo/home";
    }
}
