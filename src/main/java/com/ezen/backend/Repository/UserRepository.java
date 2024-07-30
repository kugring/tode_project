package com.a.ezn.repo;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.a.ezn.MemberVO;
import com.a.ezn.UserVO;

@Repository
public class UserRepository {
	
	@Autowired
	SqlSessionTemplate template;
	
	public int join(UserVO vo) {
		return template.insert("UserMapper.insert", vo);
		
	}
	
	public UserVO login(UserVO vo) {
		return template.selectOne("UserMapper.login", vo);
	}
	
	
	public int emailCheck(String email) {
		return template.selectOne("UserMapper.emailCheck", email);
	}
	
}
