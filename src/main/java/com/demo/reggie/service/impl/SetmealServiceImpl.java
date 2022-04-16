package com.demo.reggie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.demo.reggie.entity.Setmeal;
import com.demo.reggie.mapper.SetmealMapper;
import com.demo.reggie.service.SetmealService;
import org.springframework.stereotype.Service;

/**
 * @author Hunter Chen
 * @date 2022/4/16
 */
@Service
public class SetmealServiceImpl extends ServiceImpl<SetmealMapper, Setmeal> implements SetmealService {
}
