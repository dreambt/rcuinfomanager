package com.rcuinfomanager.service;

import com.google.common.base.Strings;
import com.rcuinfomanager.dao.BaseInfoDao;
import com.rcuinfomanager.model.BaseInfo;
import com.rcuinfomanager.util.Files;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class ExportInfo2VillagerCommittee4Estimation {

    private final static String templateFileName = "template.xls";

    @Autowired
    private BaseInfoDao baseInfoDao;

    public void readTemplateAndExport(String recordIds, HttpServletResponse response,HttpServletRequest request) {
        List<BaseInfo> baseInfoList = new ArrayList<BaseInfo>();
        String[] recordIdList = recordIds.split(",");

        for (String recordId : recordIdList) {
            BaseInfo baseInfo = baseInfoDao.getBaseInfoByRecordId(Long.parseLong(recordId));
            if (baseInfo != null) {
                baseInfoList.add(baseInfo);
            }
        }
        if (!baseInfoList.isEmpty()) {
            readTemplateAndExport(baseInfoList, response,request);
        }
    }

    public void readTemplateAndExport(List<BaseInfo> baseInfoList,HttpServletResponse response,HttpServletRequest request) {
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
            String fileName = Files.encodeFilename("村委会评价表.xls",request);
            response.setContentType("application/vnd.ms-excel");
            response.addHeader("content-disposition",
                    "attachment;filename=" + fileName);
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

    public void readExport(InputStream is) {
        ServletOutputStream outputStream = null;
        try {
            POIFSFileSystem fs = new POIFSFileSystem(is);
            HSSFWorkbook wb = new HSSFWorkbook(fs);
            HSSFSheet sheet = wb.getSheetAt(0);

            Iterator rows = sheet.rowIterator();
            while (rows.hasNext()) {
                HSSFRow row = (HSSFRow) rows.next();
                Iterator cells = row.cellIterator();
                if (row.getRowNum() == 0) {
                    continue;
                }
                while (cells.hasNext()) {
                    HSSFCell cell = (HSSFCell) cells.next();
                    if (!Strings.isNullOrEmpty(cell.getStringCellValue())) {
                        System.out.println(cell.getStringCellValue());
                    }
                }

            }
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
