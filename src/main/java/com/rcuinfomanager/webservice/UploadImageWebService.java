package com.rcuinfomanager.webservice;

import com.rcuinfomanager.util.ImageUtils;
import com.rcuinfomanager.webservice.model.WebResponseData;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/api/1")
public class UploadImageWebService {

    private  @Value("${images.store.dir}") String imgStoreDir;


    @RequestMapping(value = "/img/{cerNum}", method = RequestMethod.POST)
    public @ResponseBody WebResponseData uploadImg(HttpServletRequest request,
                              HttpServletResponse response, @PathVariable String cerNum) {

        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> fileItems = new ServletFileUpload(new DiskFileItemFactory(1024 * 1024, new File("c:/tmp"))).
                        parseRequest(request);
                for (FileItem item : fileItems) {
                    if (!item.isFormField()) {
                        ImageUtils.storeImage(cerNum, imgStoreDir, item.getName(), item.getInputStream());
                    }
                }
            } catch (FileUploadException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }


        }
        return new WebResponseData(1);
    }
}
