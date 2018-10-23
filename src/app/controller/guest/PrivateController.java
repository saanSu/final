package app.controller.guest;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import app.model.EmployeeRepository;

@Controller
@RequestMapping("/private")
public class PrivateController {
	@Autowired
	EmployeeRepository employeeRepository;
	
	@GetMapping("/modify.do")
	public String modifyHandle(Map model) {
		model.put("uri", "modify");
		
		return "guest.modify";
	}
	
	
	@PostMapping("/modify.do")
	public String modifyPostHandle(@SessionAttribute Map user, @RequestParam Map map, ModelMap model) {
		System.out.println(user);
		String cp = (String)user.get("PASS");
		String op = (String)map.get("opass");
		if(op.equals(cp)) {
			map.put("id", user.get("ID"));
			int r = employeeRepository.updatePass(map);
			if(r>0) {
				return "redirect:/";
			}
		}
		model.put("err", "on");
		return "guest.modify";
	}
}
