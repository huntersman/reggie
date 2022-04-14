package com.demo.reggie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.demo.reggie.entity.Employee;
import com.demo.reggie.mapper.EmployeeMapper;
import com.demo.reggie.service.EmployeeService;
import org.springframework.stereotype.Service;

/**
 * @author Hunter Chen
 * @date 2022/4/14
 */
@Service
public class EmployeeServiceImpl extends ServiceImpl<EmployeeMapper, Employee> implements EmployeeService {

}
