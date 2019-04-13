package com.yhcoo.website.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;
import lombok.experimental.Accessors;
import java.io.Serializable;
import java.util.Date;


/**
 * 意向客户表
 *
 * @author kingkey
 * @date 2019-04-12 17:28:11
 */
@Data
@Accessors(chain = true)
public class IntentOrder implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @JsonSerialize(using= ToStringSerializer.class)
    @TableId(value = "id", type = IdType.ID_WORKER)
    private Long id;

                            /**
     * 姓名
     */
    private String name;
                        /**
     * 手机
     */
    private String phone;
                        /**
     * 备注
     */
    private String remark;
                        /**
     * 创建时间
     */
    private Date createTime;
                        /**
     * 更新时间
     */
    private Date modifyTime;
                        /**
     * 是否删除 1-删除，0-未删除
     */
    private String delFlag;
            
}