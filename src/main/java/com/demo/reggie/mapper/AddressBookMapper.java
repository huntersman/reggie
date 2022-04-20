package com.demo.reggie.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.demo.reggie.entity.AddressBook;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Hunter Chen
 * @date 2022/4/20
 */
@Mapper
public interface AddressBookMapper extends BaseMapper<AddressBook> {
}
