package com.ruoyi.framework.handler;

import com.ruoyi.framework.web.domain.server.Sys;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.*;
import org.springframework.web.socket.config.annotation.EnableWebSocket;

import java.util.HashSet;
import java.util.Set;

@Component
public class MyWebSocketHandler implements WebSocketHandler {


    public static Set<WebSocketSession> sessions = new HashSet<>();
    /**
     * 建立连接
     * @param session
     * @throws Exception
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        // 缓存用户信息: userInfo
        sessions.add(session);
        System.out.println("当前会话人数: " + sessions.size());
    }

    /**
     * 接收消息
     * @param session
     * @param message
     * @throws Exception
     */
    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        System.out.println("收到消息: " + message.getPayload());
//        session.sendMessage(new TextMessage("后端已经收到： " + message.getPayload()));
        for (WebSocketSession ss:sessions
             ) {
            ss.sendMessage(new TextMessage("后端已经收到： " + message.getPayload()));
        }
    }

    /**
     * 发生错误
     * @param session
     * @param exception
     * @throws Exception
     */
    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        // 清除用户缓存信息
        sessions.remove(session);
    }

    /**
     * 关闭连接
     * @param session
     * @param closeStatus
     * @throws Exception
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        // 清除用户缓存信息
        sessions.remove(session);
        System.out.print("清除session，Id："+session.getId());
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }
}
