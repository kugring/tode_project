package com.ezen.backend.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import com.ezen.backend.VO.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.backend.Repository.UserRepository;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserRepository userRepository;

	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
		return "join";
	}
	
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String joinOk(UserVO vo) {
		int result = userRepository.join(vo);
		
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

		// 레파지토리틀 통해서 user_type, email에 대한 값을 반환 받는다.
		UserVO user = userRepository.login(vo);
		System.out.println("VO임:"+vo.getEmail());
		System.out.println("VO임:"+vo.getPassword());
		System.out.println("VO임:"+vo.getUserType());
		System.out.println("User임:"+user);

		// 반환 받은 email과 user_type을 session에 기입하고
		// feed페이지로 접근시 해당 피드의 email정보와 같은 경우 crud가 가능한 권한을 준다.
		session.setAttribute("user", user);
		
		//return "redirect:/user/join.do";
		return "redirect:/todo/feed.do";
	}

	@ResponseBody
	@RequestMapping(value="/emailCheck.do", method=RequestMethod.POST)
	public Map<String, String> emailCheck(@RequestParam("email") String email) {
		
		int count = userRepository.emailCheck(email);
		
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
	
	@RequestMapping(value="/logOut.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/user/login.do";
	}

	
}
