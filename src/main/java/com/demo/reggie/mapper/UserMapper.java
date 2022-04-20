package com.demo.reggie.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.demo.reggie.entity.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Hunter Chen
 * @date 2022/4/20
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {
}
