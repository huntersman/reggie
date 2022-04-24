package com.demo.reggie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.demo.reggie.entity.ShoppingCart;
import com.demo.reggie.mapper.ShoppingCartMapper;
import com.demo.reggie.service.ShoppingCartService;
import org.springframework.stereotype.Service;

/**
 * @author Hunter Chen
 * @date 2022/4/24
 */
@Service
public class ShoppingCartServiceImpl extends ServiceImpl<ShoppingCartMapper, ShoppingCart> implements ShoppingCartService {
}
