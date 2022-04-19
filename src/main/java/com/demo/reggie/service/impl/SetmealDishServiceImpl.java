package com.demo.reggie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.demo.reggie.dto.SetmealDto;
import com.demo.reggie.entity.SetmealDish;
import com.demo.reggie.mapper.SetmealDishmapper;
import com.demo.reggie.service.DishService;
import com.demo.reggie.service.SetmealDishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Hunter Chen
 * @date 2022/4/19
 */
@Service
public class SetmealDishServiceImpl extends ServiceImpl<SetmealDishmapper, SetmealDish> implements SetmealDishService {

}
