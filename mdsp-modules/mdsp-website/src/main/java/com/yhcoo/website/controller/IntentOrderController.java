package com.yhcoo.website.controller;


import lombok.extern.slf4j.Slf4j;
import com.yhcoo.common.annotation.SysLog;
import com.yhcoo.common.constants.MdspServiceNameConstants;
import com.yhcoo.common.util.ApiResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import com.yhcoo.common.util.Assert;

import com.yhcoo.website.model.entity.IntentOrder;
import com.yhcoo.website.model.query.IntentOrderQuery;
import com.yhcoo.website.service.IntentOrderService;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Collection;

/**
 * @author kingkey
 */
@Slf4j
@RestController
@RequestMapping("/intentOrder")
@Api(value = "意向客户表 Controller", tags = {"意向客户表操作接口"})
public class IntentOrderController {

  private static final String MODULE_NAME = "意向客户表模块";
  private static final String SERVICE_ID = MdspServiceNameConstants.MDSP_WEBSITE_SERVICE;

  @Autowired
  private IntentOrderService intentOrderService;


  @SysLog(serviceId = SERVICE_ID, moduleName = MODULE_NAME, actionName = "意向客户表添加")
  @ApiOperation(value = "添加", notes = "添加意向客户表信息", httpMethod = "POST")
  @ApiImplicitParam(name = "intentOrder", value = "查询条件intentOrder", required = true, dataType = "IntentOrder")
  @PostMapping("add")
  public ApiResult<Boolean> add(@RequestBody IntentOrder intentOrder){
    return new ApiResult<>(intentOrderService.save(intentOrder));
  }

  @SysLog(serviceId = SERVICE_ID, moduleName = MODULE_NAME, actionName = "意向客户表修改")
  @ApiOperation(value = "修改", notes = "修改意向客户表信息", httpMethod = "POST")
  @ApiImplicitParam(name = "id", value = "查询条件ID", required = true, dataType = "IntentOrder")
  @PostMapping("update")
  public ApiResult<Boolean> update(@RequestBody IntentOrder intentOrder){
    Assert.isBlank(intentOrder.getId(),"ID不能为空");
    return new ApiResult<>(intentOrderService.updateById(intentOrder));
  }


  @SysLog(serviceId = SERVICE_ID, moduleName = MODULE_NAME, actionName = "意向客户表主键删除")
  @ApiOperation(value = "主键删除", notes = "主键删除意向客户表信息", httpMethod = "POST")
  @ApiImplicitParam(name = "id", value = "查询条件ID", required = true, dataType = "Long")
  @PostMapping("delete")
  public ApiResult<Boolean> deleteById(Long id){
    Assert.isBlank( id,"ID不能为空");
    return new ApiResult<>(intentOrderService.removeById(id));
  }


  @SysLog(serviceId = SERVICE_ID, moduleName = MODULE_NAME, actionName = "意向客户表信息分页查询")
  @ApiOperation(value = "主键查询", notes = "主键查询意向客户表信息", httpMethod = "GET")
  @ApiImplicitParam(name = "id", value = "查询条件ID", required = true, dataType = "Long")
  @GetMapping("get")
  public ApiResult<IntentOrder> getById(Long id){
    Assert.isBlank( id,"ID不能为空");
    return new ApiResult(intentOrderService.getById(id));
  }


  @SysLog(serviceId = SERVICE_ID, moduleName = MODULE_NAME, actionName = "意向客户表信息分页查询")
  @ApiOperation(value = "获取意向客户表分页查询", notes = "意向客户表信息分页查询", httpMethod = "GET")
  @ApiImplicitParam(name = "query", value = "用户信息查询条件", required = false, dataType = "IntentOrderQuery")
  @GetMapping("/page")
  public ApiResult<IntentOrderQuery> pageByQuery(IntentOrderQuery query){
    return new ApiResult(intentOrderService.pageByQuery(query));
  }

  @SysLog(serviceId = SERVICE_ID, moduleName = MODULE_NAME, actionName = "意向客户表查询所有")
  @ApiOperation(value = "查询所有信息", notes = "查询所有信息", httpMethod = "GET")
  @GetMapping("all")
  public ApiResult<Collection> selectAll(){
    return new ApiResult<>(intentOrderService.listByMap(new HashMap<>()));
  }


}
