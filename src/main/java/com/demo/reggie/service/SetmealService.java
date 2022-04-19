package com.demo.reggie.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.demo.reggie.dto.SetmealDto;
import com.demo.reggie.entity.Setmeal;

/**
 * @author Hunter Chen
 * @date 2022/4/16
 */
public interface SetmealService extends IService<Setmeal> {
    public void saveWithDish(SetmealDto setmealDto);
}
