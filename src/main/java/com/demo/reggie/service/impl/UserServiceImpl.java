package com.demo.reggie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.demo.reggie.entity.User;
import com.demo.reggie.mapper.UserMapper;
import com.demo.reggie.service.UserService;
import org.springframework.stereotype.Service;

/**
 * @author Hunter Chen
 * @date 2022/4/20
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
}
