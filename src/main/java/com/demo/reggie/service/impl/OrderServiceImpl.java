package com.demo.reggie.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.demo.reggie.common.BaseContext;
import com.demo.reggie.common.CustomException;
import com.demo.reggie.entity.*;
import com.demo.reggie.mapper.OrderMapper;
import com.demo.reggie.service.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


@Service
@Slf4j
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Orders> implements OrderService {

@Autowired
private ShoppingCartService shoppingCartService;

    @Autowired
    private UserService userService;

    @Autowired
    private AddressBookService addressBookService;

    @Autowired
    private OrderDetailService orderDetailService;

    /**
     * 用户下单
     * @param orders
     */
    @Transactional
    @Override
    public void submit(Orders orders) {
        // 1.获得当前用户id
        Long userId = BaseContext.getCurrentId();

        // 2.查询当前用户的购物车数据
        LambdaQueryWrapper<ShoppingCart> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(ShoppingCart::getUserId,userId);
        List<ShoppingCart> shoppingCarts = shoppingCartService.list(wrapper);

        if(shoppingCarts == null || shoppingCarts.size() == 0){
            throw new CustomException("购物车为空，不能下单");
        }

        // 3.查询用户数据
        User user = userService.getById(userId);

        // 4.查询地址数据
        Long addressBookId = orders.getAddressBookId();
        AddressBook addressBook = addressBookService.getById(addressBookId);
        if(addressBook == null){
            throw new CustomException("用户地址信息有误，不能下单");
        }

        long orderId = IdWorker.getId();//订单号
        int orderPrice = 0;//订单总金额

        // 5.组装订单明细信息
        List<OrderDetail> orderDetails = new ArrayList<>();
        for (ShoppingCart shoppingCart : shoppingCarts) {
            OrderDetail orderDetail = new OrderDetail();
            BeanUtils.copyProperties(shoppingCart,orderDetail);
            orderDetail.setOrderId(orderId);
            orderDetails.add(orderDetail);
            //计算订单总金额
            orderPrice += (shoppingCart.getAmount().intValue() * shoppingCart.getNumber());
        }

        // 6.组装订单数据
        orders.setId(orderId);
        orders.setOrderTime(LocalDateTime.now());
        orders.setCheckoutTime(LocalDateTime.now());
        orders.setStatus(2);
        orders.setAmount(new BigDecimal(orderPrice));//总金额
        orders.setUserId(userId);
        orders.setNumber(String.valueOf(orderId));
        orders.setUserName(user.getName());
        orders.setConsignee(addressBook.getConsignee());
        orders.setPhone(addressBook.getPhone());
        orders.setAddress(addressBook.getDetail());

        // 7.向订单表插入数据，一条数据
        this.save(orders);

        // 8.向订单明细表插入数据，多条数据
        orderDetailService.saveBatch(orderDetails);

        // 9.清空购物车数据
        shoppingCartService.remove(wrapper);
    }
}
