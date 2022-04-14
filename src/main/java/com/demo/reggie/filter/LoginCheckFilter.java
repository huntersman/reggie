package com.demo.reggie.filter;


import com.alibaba.fastjson.JSON;
import com.demo.reggie.common.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.AntPathMatcher;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Hunter Chen
 * @date 2022/4/14
 * 检查用户是否完成登录
 */
@WebFilter(filterName = "LoginCheckFilter", urlPatterns = "/*")
@Slf4j
public class LoginCheckFilter implements Filter {

    private static final AntPathMatcher ANT_PATH_MATCHER = new AntPathMatcher();

    /**
     * 过滤器
     *
     * @param request
     * @param response
     * @param chain
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        String requestURI = httpServletRequest.getRequestURI();
        String[] urls = {
                "/employee/login",
                "/employee/logout",
                "/backend/**",
                "/front/**"
        };
        if (check(urls, requestURI)) {
            chain.doFilter(httpServletRequest, httpServletResponse);
            return;
        }
        if (httpServletRequest.getSession().getAttribute("employee") != null) {
            chain.doFilter(httpServletRequest, httpServletResponse);
            return;
        }
        httpServletResponse.getWriter().write(JSON.toJSONString(R.error("NOTLOGIN")));
    }

    /**
     * 比较是否符合不需要拦截的路径
     *
     * @param urls
     * @param requestURI
     * @return
     */
    private boolean check(String[] urls, String requestURI) {
        for (String url : urls) {
            if (ANT_PATH_MATCHER.match(url, requestURI)) {
                return true;
            }
        }
        return false;
    }
}
