package com.a.ezn;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.a.ezn.repo.UserRepository;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserRepository UserVO;
	
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
		return "join";
	}
	
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String joinOk(UserVO vo) {
		int result = UserVO.join(vo);
		
		if(result > 0) {
			return "redirect:/user/login.do";
		}else {
			return "redirect:/user/join.do";
		}
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login(HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");
		if(user != null) {
			return "redirect:/user/join.do";
		}
		
		return "login";
	}
	
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String loginOk(@ModelAttribute UserVO vo,HttpSession session) {
		
		UserVO user = UserVO.login(vo);
		
		session.setAttribute("user", user);
		
		return "redirect:/user/join.do";
	}
	
	@ResponseBody
	@RequestMapping(value="/emailCheck.do", method=RequestMethod.POST)
	public Map<String, String> emailCheck(@RequestParam("email") String email) {
		
		int count = UserVO.emailCheck(email);
		
		Map<String, String> map = new HashMap<String, String>();
		
		if(count > 0) {
			//아이디 중복 값이 있다.
			map.put("result", "failed");
		}else {
			//아이디 중복 값이 없다.
			map.put("result", "success");
		}
		
		return map;
	}
	
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/user/login.do";
	}
	
	
}
