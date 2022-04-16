package com.demo.reggie.common;

/**
 * @author Hunter Chen
 * @date 2022/4/16
 */
public class CustomException extends RuntimeException {
    public CustomException(String message) {
        super(message);
    }
}
