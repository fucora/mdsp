package com.yhcoo.website.mapper;

import com.yhcoo.website.model.entity.IntentOrder;
import com.yhcoo.website.model.query.IntentOrderQuery;
import org.springframework.stereotype.Component;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.apache.ibatis.annotations.Param;


/**
 * @author kingkey
 */
@Component
public interface IntentOrderMapper extends BaseMapper<IntentOrder>{
  /**
   * 信息分页查询
   * @param query
   */
  IPage<IntentOrder> pageByQuery(IntentOrderQuery query);
}


