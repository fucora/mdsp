package com.yhcoo.website.service.impl;


import com.yhcoo.website.model.entity.IntentOrder;
import com.yhcoo.website.mapper.IntentOrderMapper;
import com.yhcoo.website.model.query.IntentOrderQuery;
import com.yhcoo.website.service.IntentOrderService;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author kingkey
 */
@Service
public class IntentOrderServiceImpl extends ServiceImpl<IntentOrderMapper, IntentOrder> implements IntentOrderService {

  @Autowired
  private IntentOrderMapper intentOrderMapper;

  @Override
  public IntentOrderQuery pageByQuery(IntentOrderQuery query) {
    query.setDesc("create_time");
    intentOrderMapper.pageByQuery(query);
    return query;
  }

}