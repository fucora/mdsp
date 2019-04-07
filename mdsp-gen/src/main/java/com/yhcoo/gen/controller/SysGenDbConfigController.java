package com.yhcoo.gen.controller;

import com.yhcoo.common.base.controller.BaseController;
import com.yhcoo.gen.model.entity.SysGenDbConfig;
import com.yhcoo.gen.service.SysGenDbConfigService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author kingkey
 */
@RestController
@RequestMapping("/sysGenDbConfig")
public class SysGenDbConfigController extends BaseController<SysGenDbConfigService, SysGenDbConfig, Integer> {
}
