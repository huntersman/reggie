package com.demo.reggie.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.demo.reggie.entity.Dish;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Hunter Chen
 * @date 2022/4/16
 */
@Mapper
public interface DishMapper extends BaseMapper<Dish> {
}
