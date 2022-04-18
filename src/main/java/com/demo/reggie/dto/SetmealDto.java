package com.demo.reggie.dto;

import com.demo.reggie.entity.Setmeal;
import com.demo.reggie.entity.SetmealDish;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/*
    套餐的基本信息,包含套餐关联的菜品集合
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class SetmealDto extends Setmeal {

    private List<SetmealDish> setmealDishes; //套餐关联的菜品集合

    private String categoryName; //分类名称
}
