package com.rcuinfomanager.util;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
public class JsonParser {

    /**
     * 把对象转换成为Json字符串
     *
     * @param obj
     * @return
     */
    public static String obj2json(Object obj) {
        if (obj == null) {
            throw new IllegalArgumentException("对象参数不能为空。");
        }
        JSONObject jsonObject = JsonParser.getJsonObject(obj);
        return jsonObject.toString();
    }

    /**
     * JSON处理含有嵌套关系对象，避免出现异常：net.sf.json.JSONException: There is a cycle in the hierarchy的方法
     * 注意：这样获得到的字符串中，引起嵌套循环的属性会置为null
     *
     * @param obj
     * @return
     */
    public static JSONObject getJsonObject(Object obj) {

        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);

        return JSONObject.fromObject(obj, jsonConfig);
    }
}
