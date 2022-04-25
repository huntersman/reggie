package com.demo.reggie.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.demo.reggie.common.R;
import com.demo.reggie.dto.SetmealDto;
import com.demo.reggie.entity.Category;
import com.demo.reggie.entity.Employee;
import com.demo.reggie.entity.Setmeal;
import com.demo.reggie.service.CategoryService;
import com.demo.reggie.service.SetmealDishService;
import com.demo.reggie.service.SetmealService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Hunter Chen
 * @date 2022/4/19
 * 套餐管理
 */
@RestController
@RequestMapping("/setmeal")
@Slf4j
public class SetmealController {
    @Autowired
    private SetmealService setmealService;
    @Autowired
    private CategoryService categoryService;

    @PostMapping
    @CacheEvict(value = "setmealCache", allEntries = true)
    public R<String> save(@RequestBody SetmealDto setmealDto) {
        setmealService.saveWithDish(setmealDto);
        return R.success("添加成功");
    }

    @GetMapping("/page")
    public R<Page> page(int page, int pageSize, String name) {
        Page<Setmeal> pageInfo = new Page<>(page, pageSize);
        Page<SetmealDto> setmealDtoPage = new Page<>();
        LambdaQueryWrapper<Setmeal> lambdaQueryWrapper = new LambdaQueryWrapper();
        lambdaQueryWrapper.like(name != null, Setmeal::getName, name);
        lambdaQueryWrapper.orderByDesc(Setmeal::getUpdateTime);
        setmealService.page(pageInfo, lambdaQueryWrapper);
        BeanUtils.copyProperties(pageInfo, setmealDtoPage);
        List<Setmeal> records = pageInfo.getRecords();
        List<SetmealDto> list = setmealDtoPage.getRecords();
        list = records.stream().map((item) -> {
            SetmealDto setmealDto = new SetmealDto();
            BeanUtils.copyProperties(item, setmealDto);
            Long categoryId = item.getCategoryId();
            Category category = categoryService.getById(categoryId);
            if (category != null) {
                setmealDto.setCategoryName(category.getName());
            }
            return setmealDto;
        }).collect(Collectors.toList());
        setmealDtoPage.setRecords(list);
        return R.success(setmealDtoPage);
    }

    @DeleteMapping
    @CacheEvict(value = "setmealCache", allEntries = true)
    public R<String> delete(@RequestParam List<Long> ids) {
        setmealService.deleteWithDish(ids);
        return R.success("删除成功");
    }

    @PostMapping("/status/0")
    public R<String> toStop(@RequestParam List<Long> ids) {
        LambdaQueryWrapper<Setmeal> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.in(Setmeal::getId, ids);
        List<Setmeal> list = setmealService.list(lambdaQueryWrapper);
        list = list.stream().map((item) -> {
            item.setStatus(0);
            return item;
        }).collect(Collectors.toList());
        setmealService.updateBatchById(list);
        return R.success("停售成功");
    }

    @PostMapping("/status/1")
    public R<String> toStart(@RequestParam List<Long> ids) {
        LambdaQueryWrapper<Setmeal> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.in(Setmeal::getId, ids);
        List<Setmeal> list = setmealService.list(lambdaQueryWrapper);
        list = list.stream().map((item) -> {
            item.setStatus(1);
            return item;
        }).collect(Collectors.toList());
        setmealService.updateBatchById(list);
        return R.success("起售成功");
    }

    @GetMapping("/{id}")
    public R<SetmealDto> getById(@PathVariable Long id) {
        SetmealDto setmeal = setmealService.getWithMeal(id);
        return R.success(setmeal);
    }

    @PutMapping
    public R<String> update(@RequestBody SetmealDto setmealDto) {
        setmealService.updateWithMeal(setmealDto);
        return R.success("修改成功");
    }

    /**
     * 根据条件查询套餐数据
     *
     * @param setmeal
     * @return
     */
    @GetMapping("/list")
    @Cacheable(cacheNames = "setmealCache", key = "#setmeal.categoryId + '_' + #setmeal.status", unless = "#result == null")
    //  在 R 中 implements Serializable
    public R<List<Setmeal>> list(Setmeal setmeal) {
        LambdaQueryWrapper<Setmeal> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(setmeal.getCategoryId() != null, Setmeal::getCategoryId, setmeal.getCategoryId());
        queryWrapper.eq(setmeal.getStatus() != null, Setmeal::getStatus, setmeal.getStatus());
        queryWrapper.orderByDesc(Setmeal::getUpdateTime);

        List<Setmeal> list = setmealService.list(queryWrapper);
        return R.success(list);
    }
}
