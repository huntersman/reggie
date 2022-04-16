package com.demo.reggie.common;

/**
 * @author Hunter Chen
 * @date 2022/4/15
 */
public class BaseContext {
    private static ThreadLocal<Long> threadLocal=new ThreadLocal<>();

    public static void setEmpId(Long id){
        threadLocal.set(id);
    }

    public static Long getEmpId() {
        return threadLocal.get();
    }
}
