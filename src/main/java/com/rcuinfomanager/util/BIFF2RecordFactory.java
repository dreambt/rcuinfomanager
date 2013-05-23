package com.rcuinfomanager.util;

/*import org.apache.poi.hssf.record.EOFRecord;
import org.apache.poi.hssf.record.Record;
import org.apache.poi.hssf.record.RecordInputStream;
import org.apache.poi.hssf.record.StandardRecord;
import org.apache.poi.util.*;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;*/

public class BIFF2RecordFactory {

    /*private BIFF2RecordFactory() {
        // no instances of this class
    }

    public static Record[] read(InputStream is) {
        RecordInputStream in = new RecordInputStream(is);
        List<Record> temp = new ArrayList<Record>();
        while (in.hasNextRecord()) {
            in.nextRecord();
            temp.add(createRecord(in));
        }

        Record[] result = new Record[temp.size()];
        temp.toArray(result);
        return result;
    }

    private static Record createRecord(RecordInputStream in) {
        int sid = in.getSid();
        switch (sid) {
            case DimensionRecord.sid: return new DimensionRecord(in);
            case NumberRecord.sid:    return new NumberRecord(in);
            case LabelRecord.sid:     return new LabelRecord(in);
            case BOFRecord.sid:       return new BOFRecord(in);
            case EOFRecord.sid:       return new EOFRecord(in);
        }
        throw new IllegalArgumentException("Unexpected sid ("
                + new String(HexDump.shortToHex(sid)) + ")");
    }

    public static final class CellAttributes {
        public static final int ENCODED_SIZE = 3;

        private static final BitField xfIndexMask          = bf(0x3F);
        private static final BitField cellLockedFlag       = bf(0x40);
        private static final BitField formulaHidden        = bf(0x80);

        private static final BitField formatIndexMask      = bf(0x3F);
        private static final BitField fontIndexMask        = bf(0xC0);

        private static final BitField horizontalAlignMask  = bf(0x07);
        private static final BitField leftBorderFlag       = bf(0x08);
        private static final BitField rightBorderFlag      = bf(0x10);
        private static final BitField topBorderFlag        = bf(0x20);
        private static final BitField bottomBorderFlag     = bf(0x40);
        private static final BitField shadedBackgroundFlag = bf(0x80);

        private static BitField bf(int i) {
            return BitFieldFactory.getInstance(i);
        }

        private int _protectionAndXF;
        private int _formatAndFont;
        private int _style;
        public CellAttributes(LittleEndianInput in) {
            _protectionAndXF = in.readUByte();
            _formatAndFont = in.readUByte();
            _style = in.readUByte();
        }
        public void serialize(LittleEndianOutput out) {
            out.writeByte(_protectionAndXF);
            out.writeByte(_formatAndFont);
            out.writeByte(_style);
        }

        public int getXFIndex() {
            return xfIndexMask.getValue(_protectionAndXF);
        }
        public boolean isCellLocked() {
            return cellLockedFlag.isSet(_protectionAndXF);
        }
        public boolean isFormulaHidden() {
            return formulaHidden.isSet(_protectionAndXF);
        }
        public int getFormatIndex() {
            return formatIndexMask.getValue(_formatAndFont);
        }
        public int getFontIndex() {
            return fontIndexMask.getValue(_formatAndFont);
        }
        public int getHorizontalAlignmentCode() {
            return horizontalAlignMask.getValue(_style);
        }
        public boolean isTopBorderSet() {
            return topBorderFlag.isSet(_style);
        }
        public boolean isBottomBorderSet() {
            return bottomBorderFlag.isSet(_style);
        }
        public boolean isLeftBorderSet() {
            return leftBorderFlag.isSet(_style);
        }
        public boolean isRightBorderSet() {
            return rightBorderFlag.isSet(_style);
        }
        public boolean isBackgroundShaded() {
            return shadedBackgroundFlag.isSet(_style);
        }
    }
    public static final class BOFRecord extends StandardRecord {
        public static final int sid = 0x0009;
        private int _version;
        private int _type;

        public BOFRecord(LittleEndianInput in) {
            _version = in.readUShort();
            _type = in.readUShort();
        }

        @Override
        protected void serialize(LittleEndianOutput out) {
            out.writeShort(_version);
            out.writeShort(_type);
        }

        @Override
        protected int getDataSize() {
            return 4;
        }

        @Override
        public short getSid() {
            return sid;
        }
    }


    public static final class DimensionRecord extends StandardRecord {
        public static final int sid = 0x0000;
        private int _firstRowIndex;
        private int _lastRowIndex;
        private int _firstColumnIndex;
        private int _lastColumnIndex;

        public DimensionRecord(LittleEndianInput in) {
            _firstRowIndex = in.readUShort();
            _lastRowIndex = in.readUShort()-1;
            _firstColumnIndex = in.readUShort();
            _lastColumnIndex = in.readUShort()-1;
        }

        @Override
        protected void serialize(LittleEndianOutput out) {
            out.writeShort(_firstRowIndex);
            out.writeShort(_lastRowIndex+1);
            out.writeShort(_firstColumnIndex);
            out.writeShort(_lastColumnIndex+1);
        }

        @Override
        protected int getDataSize() {
            return 8;
        }

        @Override
        public short getSid() {
            return sid;
        }
    }


    public static abstract class CellBaseRecord extends StandardRecord {
        private int _rowIndex;
        private int _columnIndex;
        private CellAttributes _cellAttributes;

        protected CellBaseRecord(LittleEndianInput in) {
            _rowIndex = in.readUShort();
            _columnIndex = in.readUShort();
            _cellAttributes = new CellAttributes(in);
        }

        @Override
        protected final void serialize(LittleEndianOutput out) {
            out.writeShort(_rowIndex);
            out.writeShort(_columnIndex);
            _cellAttributes.serialize(out);
            serializeSpecificData(out);
        }

        protected abstract void serializeSpecificData(LittleEndianOutput out);

        @Override
        protected final int getDataSize() {
            return 2 + 2 + CellAttributes.ENCODED_SIZE
                    + getSpecificDataSize();
        }

        protected abstract int getSpecificDataSize();
        public final int getRowIndex() {
            return _rowIndex;
        }
        public final int getColumnIndex() {
            return _columnIndex;
        }

        public final CellAttributes getCellAttributes() {
            return _cellAttributes;
        }
    }
    public static final class NumberRecord extends CellBaseRecord {
        public static final int sid = 0x0003;
        private Double _value;

        public NumberRecord(LittleEndianInput in) {
            super(in);
            _value = in.readDouble();
        }

        @Override
        protected void serializeSpecificData(LittleEndianOutput out) {
            out.writeDouble(_value);
        }

        @Override
        protected int getSpecificDataSize() {
            return 8;
        }

        @Override
        public short getSid() {
            return sid;
        }

        public double getValue() {
            return _value;
        }
    }
    public static final class LabelRecord extends CellBaseRecord {
        public static final int sid = 0x0004;
        private String _text;

        public LabelRecord(LittleEndianInput in) {
            super(in);
            int nChars = in.readUByte();
            _text = StringUtil.readCompressedUnicode(in, nChars);
            try {
                _text = new String(_text.getBytes("ISO-8859-1"), "GBK");
            } catch (UnsupportedEncodingException e) {
                _text = "";
            }
        }

        @Override
        protected void serializeSpecificData(LittleEndianOutput out) {
            out.writeByte(_text.length());
            StringUtil.putCompressedUnicode(_text, out);
        }

        @Override
        protected int getSpecificDataSize() {
            return 1 + _text.length();
        }
        public String getText() {
            return _text;
        }

        @Override
        public short getSid() {
            return sid;
        }
    }*/
}
