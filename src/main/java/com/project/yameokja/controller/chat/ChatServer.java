package com.project.yameokja.controller.chat;

import java.io.IOException;
import java.util.*;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chatserver/{chatRoom}")
public class ChatServer {
	// static 붙여야함!!
	private static Map<String, HashSet<Session>> chatRooms = new HashMap<String, HashSet<Session>>();
	
	@OnOpen
	public void onOpen(Session session, @PathParam("chatRoom") String chatRoom) {
		System.out.println(session.getId());
		HashSet<Session> sessions = new HashSet<Session>(); 
		if(chatRooms.get(chatRoom) != null) {
			sessions = chatRooms.get(chatRoom);
		}
		sessions.add(session);
		chatRooms.put(chatRoom, sessions);
	}
	
	@OnMessage
	public void onMessage(String msg, Session session, @PathParam("chatRoom") String chatRoom) {
		for(Session s : chatRooms.get(chatRoom)) {
			try {
				s.getBasicRemote().sendText(msg);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@OnClose
	public void onClose(Session session, @PathParam("chatRoom") String chatRoom) {
		chatRooms.get(chatRoom).remove(session);
	}
	
	@OnError
	public void onError(Throwable t) {
		
	}
}
