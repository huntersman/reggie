package com.demo.reggie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.demo.reggie.entity.Dish;
import com.demo.reggie.mapper.DishMapper;
import com.demo.reggie.service.DishService;
import org.springframework.stereotype.Service;

/**
 * @author Hunter Chen
 * @date 2022/4/16
 */
@Service
public class DishServiceImpl extends ServiceImpl<DishMapper, Dish> implements DishService {
}
