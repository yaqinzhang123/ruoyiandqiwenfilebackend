package com.ruoyi.framework.interceptor;

import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import java.util.Map;

@Component
public class DefaultInterceptor implements HandshakeInterceptor {
    @Override
    public boolean beforeHandshake(org.springframework.http.server.ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
        System.out.print("hand shake success");
        return true;
    }

    @Override
    public void afterHandshake(org.springframework.http.server.ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception exception) {

    }
}
