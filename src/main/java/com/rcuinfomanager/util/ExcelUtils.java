package com.rcuinfomanager.util;

/*import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.OfficeXmlFileException;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;*/

public class ExcelUtils {

   /* *//**
     *
     * @param sheetIndex  start at 0
     * @param filePath
     * @return
     * @throws IOException
     *//*
    public static Sheet getSheet(int sheetIndex, String filePath) throws IOException {
        FileInputStream is = new FileInputStream(filePath);
        Sheet sheet = null;
        int nextSheetIndex = sheetIndex;
        try{
            POIFSFileSystem fs = new POIFSFileSystem(is);
            HSSFWorkbook workbook = new HSSFWorkbook(fs);
            sheet = workbook.getSheetAt(nextSheetIndex);
            if (sheet != null) {
                while (sheet.getSheetName().indexOf("Macro") > -1) {
                    nextSheetIndex++;
                    sheet = workbook.getSheetAt(nextSheetIndex);
                }
            }
        }catch(OfficeXmlFileException e){
            e.printStackTrace();
            is.close();
            is = new FileInputStream(filePath);
            XSSFWorkbook workbook = new XSSFWorkbook(is);
            sheet = workbook.getSheetAt(0);
        }catch (IOException e){
            e.printStackTrace();
            if(e.getMessage().indexOf("0x0010000200040009") != -1){
                is.close();
                is = new FileInputStream(filePath);
                HSSFWorkbook wb = BIFF2To8Converter.convert(is, "Sheet1");
                sheet = wb.getSheetAt(0);
            }
        }
        is.close();
        return sheet;
    }

    public static String getStringValue(Cell cell) {
        String value = null;
        if (cell == null) {
            return null;
        }

        if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
            value = cell.getStringCellValue();
        } else if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
            if (HSSFDateUtil.isCellDateFormatted(cell)) {
                Date date = HSSFDateUtil.getJavaDate(cell.getNumericCellValue());
                SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
                value = df.format(date);
            } else {
                BigDecimal numValue = BigDecimal.valueOf(cell.getNumericCellValue());
                value = numValue.toBigInteger().toString();
            }
        } else if (cell.getCellType() == Cell.CELL_TYPE_FORMULA) {
            if (HSSFDateUtil.isCellDateFormatted(cell)) {
                Date date = cell.getDateCellValue();
                SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
                value = df.format(date);
            }
        }
        return value;
    }

    public static int getIntValue(Cell cell) {
        int result = 0;
        if (cell == null) {
            return 0;
        }
        if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
            String value = cell.getStringCellValue();
            if (LocalStringUtils.isNumeric(value)) {
                double dValue = Double.parseDouble(value);
                return (int) Math.round(dValue);
            }
        } else if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
            double value = cell.getNumericCellValue();
            return (int) Math.round(value);
        }
        return result;
    }*/
}
