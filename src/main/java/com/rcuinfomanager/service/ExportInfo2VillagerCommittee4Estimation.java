package com.rcuinfomanager.service;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import java.io.File;
import java.io.FileInputStream;

public class ExportInfo2VillagerCommittee4Estimation {

    public void readTemplateAndExport(File templateFile) {
        try {

            POIFSFileSystem fs  =new POIFSFileSystem(new FileInputStream(templateFile));
            HSSFWorkbook wb = new HSSFWorkbook(fs);
            HSSFSheet sheet = wb.getSheetAt(0);

            //获取单元格内容
            HSSFRow row = sheet.getRow(1);
            HSSFCell cell = row.getCell(1);
            String str = cell.getStringCellValue();

            //替换单元格内容
            str = str.replace("value", "replace");

            //写入单元格内容
            cell.setCellType(HSSFCell.CELL_TYPE_STRING);
            cell.setCellValue(str);
            // 输出文件
            //FileOutputStream fileOut = new FileOutputStream();
            //wb.write(fileOut);
            //fileOut.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
