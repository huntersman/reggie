package com.demo.reggie.dto;

import com.demo.reggie.entity.User;
import lombok.Data;

/**
 * @author Hunter Chen
 * @date 2022/4/20
 */
@Data
public class UserDto extends User {
    private String code;
}
