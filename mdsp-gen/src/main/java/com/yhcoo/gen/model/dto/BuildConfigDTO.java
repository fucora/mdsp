package com.yhcoo.gen.model.dto;

import lombok.Data;

import java.util.List;


@Data
public class BuildConfigDTO {

    private String genType;

    private List<String> tableName;

    /**
     * 包名
     */
    private String packageName;

    /**
     * 模块名
     */
    private String moduleName;

    /**
     * 包名
     */
    private String entityPackageName;

    /**
     * query类的包名
     */
    private String queryPackageName;

    /**
     * service类包名
     */
    private String servicePackageName;

    /**
     * serviceApi类包名
     */
    private String serviceApiPackageName;

    /**
     * dao的包名
     */
    private String daoPackageName;

    /**
     * mapper类包名
     */
    private String mapperPackageName;

    /**
     * controller类包名
     */
    private String controllerPackageName;

    /**
     * 作者名称
     */
    private String authorName;


    public String getEntityPackageName() {
        return getPackageName() + "." + getModuleName() + ".model.entity";
    }

    public String getQueryPackageName() {
        return getPackageName() + "." + getModuleName() + ".model.query";
    }

    public String getServicePackageName() {
        return getPackageName() + "." + getModuleName() + ".service";
    }

    public String getServiceApiPackageName() {
        return getPackageName() + "." + getModuleName() + ".api";
    }

    public String getDaoPackageName() {
        return getPackageName() + "." + getModuleName() + ".dao";
    }

    public String getMapperPackageName() {
        return getPackageName() + "." + getModuleName() + ".mapper";
    }

    public String getControllerPackageName() {
        return getPackageName() + "." + getModuleName() + ".controller";
    }
}
