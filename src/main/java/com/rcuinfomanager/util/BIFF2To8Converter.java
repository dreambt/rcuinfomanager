package com.rcuinfomanager.util;

/*import com.rcuinfomanager.exception.SystemException;
import org.apache.poi.hssf.record.EOFRecord;
import org.apache.poi.hssf.record.Record;
import org.apache.poi.hssf.record.RecordFormatException;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.CellStyle;*/

import java.io.InputStream;

public class BIFF2To8Converter {

   /* private BIFF2To8Converter() {
        // no instances of this class
    }
    public static HSSFWorkbook convert(InputStream biff2stream, String sheetName) {
        return convert(BIFF2RecordFactory.read(biff2stream), sheetName);
    }

    public static HSSFWorkbook convert(Record[] biff2Records, String sheetName) {
        HSSFWorkbook result = new HSSFWorkbook();
        HSSFSheet sheet = result.createSheet(sheetName);
        if (!(biff2Records[0] instanceof BIFF2RecordFactory.BOFRecord)) {
            throw new RecordFormatException("Expected BOF record");
        }
        int lastRecIx = biff2Records.length-1;
        if (!(biff2Records[lastRecIx] instanceof EOFRecord)) {
            throw new RecordFormatException("Expected EOF record");
        }
        for (int i=1; i<lastRecIx; i++) {
            convertRecord(sheet, biff2Records[i]);
        }
        return result;
    }

    private static void convertRecord(HSSFSheet sheet, Record record) {
        if (record instanceof BIFF2RecordFactory.CellBaseRecord) {
            convertCellRecord(sheet, (BIFF2RecordFactory.CellBaseRecord)record);
            return;
        }
        switch (record.getSid()) {
            case BIFF2RecordFactory.DimensionRecord.sid:
                return;
        }
        throw new SystemException("Unexpected record (" + record.getClass().getName() + ")");
    }

    private static void convertCellRecord(HSSFSheet sheet, BIFF2RecordFactory.CellBaseRecord cr) {

        HSSFRow row = sheet.getRow(cr.getRowIndex());
        if (row == null) {
            row = sheet.createRow(cr.getRowIndex());
        }
        HSSFCell cell = row.getCell(cr.getColumnIndex());
        if (cell == null) {
            cell = row.createCell(cr.getColumnIndex());
        }
        convertCellFormat(cell, cr.getCellAttributes());
        convertCellValue(cell, cr);
    }

    private static void convertCellFormat(HSSFCell cell, BIFF2RecordFactory.CellAttributes ca) {
        HSSFCellStyle cs = cell.getCellStyle();
        if (ca.isTopBorderSet()) {
            cs.setBorderTop(CellStyle.BORDER_THICK);
        }
        if (ca.isBottomBorderSet()) {
            cs.setBorderBottom(CellStyle.BORDER_THICK);
        }
        if (ca.isLeftBorderSet()) {
            cs.setBorderLeft(CellStyle.BORDER_THICK);
        }
        if (ca.isRightBorderSet()) {
            cs.setBorderRight(CellStyle.BORDER_THICK);
        }
        if (ca.getHorizontalAlignmentCode() != 0 || ca.isBackgroundShaded()) {
            throw new SystemException("Incomplete code - style not supported yet");
        }
        if (ca.getFormatIndex() != 0 || ca.getFontIndex() != 0) {
            throw new SystemException("Incomplete code - style not supported yet");
        }
        if (ca.getXFIndex() != 0 || ca.isCellLocked() || ca.isFormulaHidden()) {
            throw new SystemException("Incomplete code - style not supported yet");
        }
    }
    private static void convertCellValue(HSSFCell cell, BIFF2RecordFactory.CellBaseRecord cr) {
        if (cr instanceof BIFF2RecordFactory.NumberRecord) {
            BIFF2RecordFactory.NumberRecord nr = (BIFF2RecordFactory.NumberRecord) cr;
            cell.setCellValue(nr.getValue());
            return;
        }
        if (cr instanceof BIFF2RecordFactory.LabelRecord) {
            BIFF2RecordFactory.LabelRecord lr = (BIFF2RecordFactory.LabelRecord) cr;
            cell.setCellValue(new HSSFRichTextString(lr.getText()));
            return;
        }
        throw new SystemException("Unexpected record (" + cr.getClass().getName() + ")");
    }*/
}
