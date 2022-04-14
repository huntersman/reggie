package com.demo.reggie.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.demo.reggie.entity.Employee;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Hunter Chen
 * @date 2022/4/14
 */
@Mapper
public interface EmployeeMapper extends BaseMapper<Employee> {

}
