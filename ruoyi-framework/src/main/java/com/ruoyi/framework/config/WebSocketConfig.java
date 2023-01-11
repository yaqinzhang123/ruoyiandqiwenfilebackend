package com.ruoyi.framework.config;

import com.ruoyi.framework.handler.MyWebSocketHandler;
import com.ruoyi.framework.interceptor.MyWebSocketInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import javax.annotation.Resource;

@EnableWebSocket
@Configuration
public class WebSocketConfig implements WebSocketConfigurer {

    @Resource
    WebSocketHandler myWebSocketHandler;

    @Resource
    MyWebSocketInterceptor myWebSocketInterceptor;

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry
                .addHandler(myWebSocketHandler, "ws")
                .addInterceptors(myWebSocketInterceptor)
                .setAllowedOrigins("*");
    }

}
