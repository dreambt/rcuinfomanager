package com.rcuinfomanager.web.controller;

import com.google.common.base.Strings;
import com.rcuinfomanager.util.ImageUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;

@Controller
public class ImageController {

    private  /*@Value("${images.store.dir}")*/ String imgStoreDir = "d:/tmp";

    @RequestMapping(value = "/img/{cerNum}/{imgName}")
    public void displayImage(HttpServletRequest request, HttpServletResponse response,@PathVariable String cerNum, @PathVariable String imgName) {

        if (Strings.isNullOrEmpty(cerNum) || Strings.isNullOrEmpty(imgName)) {
            return;
        }

        try {
            InputStream is = ImageUtils.getImageStream(cerNum, imgStoreDir, imgName);
            if (is != null) {
                response.setContentType("image/jpg");
                IOUtils.copy(is,response.getOutputStream());
                response.getOutputStream().flush();
                response.getOutputStream().close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
