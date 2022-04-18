package com.demo.reggie.dto;

import com.demo.reggie.entity.Dish;
import com.demo.reggie.entity.DishFlavor;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;
//用来封装菜品，对菜品的属性做增强

@Data
public class DishDto extends Dish {
    private List<DishFlavor> flavors = new ArrayList<>();
    //菜品类别
    private String categoryName;
    private Integer copies;
}