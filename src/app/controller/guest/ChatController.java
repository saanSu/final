package app.controller.guest;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat")
public class ChatController {

	@RequestMapping("/room.do")
	public String chatRoomHandle(Map map) {
		map.put("uri", "chat");
		return "guest.chat";
	}
	
}
