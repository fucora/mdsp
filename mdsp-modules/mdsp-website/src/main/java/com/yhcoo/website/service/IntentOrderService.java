package com.yhcoo.website.service;


import com.yhcoo.website.model.entity.IntentOrder;
import com.yhcoo.website.model.query.IntentOrderQuery;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author kingkey
 */
public interface IntentOrderService extends IService<IntentOrder> {

  /**
   * 分页条件查询
   * @param query
   * @return
   */
    IntentOrderQuery pageByQuery(IntentOrderQuery query);

}