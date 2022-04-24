package com.demo.reggie.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.demo.reggie.entity.ShoppingCart;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Hunter Chen
 * @date 2022/4/24
 */
@Mapper
public interface ShoppingCartMapper extends BaseMapper<ShoppingCart> {
}
