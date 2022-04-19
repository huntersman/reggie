package com.demo.reggie.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.demo.reggie.dto.DishDto;
import com.demo.reggie.entity.Dish;

/**
 * @author Hunter Chen
 * @date 2022/4/16
 */
public interface DishService extends IService<Dish> {
    public void saveWithFlavor(DishDto dishDto);

    public DishDto getWithFlavor(Long id);

    public void updateWithFlavor(DishDto dishDto);
}
