package com.rcuinfomanager.service;

import com.rcuinfomanager.model.BaseInfo;
import com.sun.deploy.net.HttpResponse;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.core.io.ClassPathResource;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

public class ExportInfo2VillagerCommittee4Estimation {

    private final static String templateFileName = "template.xls";

    public void readTemplateAndExport(List<BaseInfo> baseInfoList,HttpServletResponse response) {
        ServletOutputStream outputStream = null;
        try {
            ClassPathResource cpr = new ClassPathResource(templateFileName);
            POIFSFileSystem fs = new POIFSFileSystem(cpr.getInputStream());
            HSSFWorkbook wb = new HSSFWorkbook(fs);
            HSSFSheet sheet = wb.getSheetAt(0);

            for (int i = 1; i <= baseInfoList.size(); i++) {
                BaseInfo baseInfo = baseInfoList.get(i-1);
                HSSFRow row = sheet.getRow(i);
                HSSFCell cell1 = row.createCell(0);
                cell1.setCellType(HSSFCell.CELL_TYPE_STRING);
                cell1.setCellValue(baseInfo.getCustomerName());
                HSSFCell cell2 = row.createCell(1);
                cell2.setCellType(HSSFCell.CELL_TYPE_STRING);
                cell2.setCellValue(baseInfo.getCerNum());
                HSSFCell cell3 = row.createCell(2);
                cell3.setCellType(HSSFCell.CELL_TYPE_STRING);
                cell3.setCellValue(baseInfo.getAddress());
            }

            outputStream = response.getOutputStream();
            response.setContentType("application/vnd.ms-excel");
            response.addHeader("content-disposition",
                    "attachment; filename=" + "村委会评价表.xls");
            wb.write(outputStream);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    //just ignored.
                }
            }
        }
    }
}
