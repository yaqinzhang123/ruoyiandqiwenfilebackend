package com.ruoyi.framework.web.service;


import com.ruoyi.framework.handler.MyWebSocketHandler;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import java.io.IOException;

@Service
public class WebSocketService {

    public void sendAllMessages(String text) throws IOException {
        for (WebSocketSession session : MyWebSocketHandler.sessions) {
            session.sendMessage(new TextMessage(text));
        }
    }
}
