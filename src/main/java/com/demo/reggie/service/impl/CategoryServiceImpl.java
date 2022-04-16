package com.demo.reggie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.demo.reggie.entity.Category;
import com.demo.reggie.mapper.CategoryMapper;
import com.demo.reggie.service.CategoryService;
import org.springframework.stereotype.Service;

/**
 * @author Hunter Chen
 * @date 2022/4/16
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {
}
