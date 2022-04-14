package com.demo.reggie.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.time.LocalDateTime;

@Data
public class Employee implements Serializable {
    private static final long serialVersionUID = 1L;
    // 主键
    private Long id;
    // 账号 UNIQUE
    private String username;
    // 用户名
    private String name;
    // 密码
    private String password;
    // 手机号
    private String phone;
    // 性别
    private String sex;
    // 身份证号 驼峰命名法 ---> 映射的字段名为 id_number
    private String idNumber;
    // 状态：0 禁用 1 正常
    private Integer status;
    // 创建时间
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    // 修改时间
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;
    // 创建人
    @TableField(fill = FieldFill.INSERT)
    private Long createUser;
    // 修改人
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Long updateUser;
}
