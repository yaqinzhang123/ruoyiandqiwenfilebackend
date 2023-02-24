//package com.ruoyi.webgis.interceptor;
//
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//
//@Configuration
//public class UserInterceptorConfig implements WebMvcConfigurer {
//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(new UserInterceptor())
//                .addPathPatterns("/baseinfo/v1/**","/recruitment/v1/**")
//                .addPathPatterns("/resource/**","/project/**","/uploadResource/fileRecord/**","/config/**")
//                //通知
//                .excludePathPatterns("/login/**")
//                .excludePathPatterns("/notify/**")
//                .excludePathPatterns("/swagger-ui/**");
//        WebMvcConfigurer.super.addInterceptors(registry);
//    }
//
//}
