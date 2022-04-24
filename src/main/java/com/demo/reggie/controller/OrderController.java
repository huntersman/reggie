package com.demo.reggie.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.demo.reggie.common.BaseContext;
import com.demo.reggie.common.R;
import com.demo.reggie.entity.Orders;
import com.demo.reggie.service.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;



/**
 * 订单
 */
@Slf4j
@RestController
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    /**
     * 用户下单
     * @param orders
     * @return
     */
    @PostMapping("/submit")
    public R<String> submit(@RequestBody Orders orders){
        log.info("订单数据：{}",orders);
        orderService.submit(orders);
        return R.success("下单成功");
    }

    @GetMapping("/userPage")
    public R<Page> page(int page, int pageSize) {
        // 1.获得当前用户id
        Long userId = BaseContext.getCurrentId();

        // 2.构造分页构造器对象
        Page<Orders> pageInfo = new Page<>(page,pageSize);

        // 3.查询当前用户的订单数据
        LambdaQueryWrapper<Orders> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(userId != null,Orders::getUserId,userId);

        // 4.执行分页查询
        orderService.page(pageInfo,wrapper);

        return R.success(pageInfo);

    }
}