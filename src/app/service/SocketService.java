package app.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;

@Service
public class SocketService {
	public List<WebSocketSession> list;

	@Autowired
	Gson gson;

	public SocketService() {
		list = new ArrayList<>();
	}
	
	public List<WebSocketSession> allList() {
		return list;
	}
	
	public int size() {
		return list.size();
	}

	public boolean addSocket(WebSocketSession target) {
		return list.add(target);
	}

	public boolean removeSocket(WebSocketSession target) {
		return list.remove(target);
	}

	public void sendAll(String txt) {
		TextMessage msg = new TextMessage(txt);
		for (int i = 0; i < list.size(); i++) {
			try {
				list.get(i).sendMessage(msg);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	public void sendAll(Map map) {
		sendAll(gson.toJson(map));
	}
	
	public void sendOne(String txt, String target) {
		TextMessage msg = new TextMessage(txt);
		for (int i = 0; i < list.size(); i++) {
			try {
				WebSocketSession ws =list.get(i);
				String userId = (String) ws.getAttributes().get("userId");
				// ws.getAttribute()  == HttpSession의 attribute 들
				if(userId.equals(target)) {
					ws.sendMessage(msg);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void sendOne(Map data, String target) {
		sendOne(gson.toJson(data), target);
	}
	
	public void sendIncludeGroup(String txt, String... targets) {
		sendIncludeGroup(txt, Arrays.asList(targets));
	}
	
	public void sendIncludeGroup(String txt,  List<String> group) {
		TextMessage msg = new TextMessage(txt);
		for (int i = 0; i < list.size(); i++) {
			try {
				WebSocketSession ws =list.get(i);
				String userId = (String) ws.getAttributes().get("userId");
				if(group.contains(userId)) {
					ws.sendMessage(msg);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void sendExcludeGroup(String txt, String... targets) {
		sendExcludeGroup(txt, Arrays.asList(targets));
	}
	
	public void sendExcludeGroup(String txt, List<String> group) {
		TextMessage msg = new TextMessage(txt);
		for (int i = 0; i < list.size(); i++) {
			try {
				WebSocketSession ws =list.get(i);
				String userId = (String) ws.getAttributes().get("userId");
				// ws.getAttribute()  == HttpSession의 attribute 들
				if(!group.contains(userId)) {
					ws.sendMessage(msg);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}


}
