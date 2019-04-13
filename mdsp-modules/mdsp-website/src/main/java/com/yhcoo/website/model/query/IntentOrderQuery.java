package com.yhcoo.website.model.query;

import com.yhcoo.website.model.entity.IntentOrder;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;
import java.util.Date;


/**
 * @author kingkey
 */
@Data
public class IntentOrderQuery extends  Page<IntentOrder> {

    /**
     * 主键
     */
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
