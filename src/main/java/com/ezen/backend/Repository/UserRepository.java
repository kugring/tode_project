package com.ezen.backend.Repository;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.backend.VO.UserVO;

@Repository
public class 	UserRepository {
	
	@Autowired
	SqlSessionTemplate template;
	
	public int join(UserVO vo) {
		return template.insert("UserMapper.insert", vo);
		
	}

	public UserVO login(UserVO vo) {

		// 파라미터로 email과 password를 UserVO타입으로 받아온 다음 Mapper로 전달
		// 이후에 확인된 email 값과 user_type을 반환 받아서 돌아옴.
		return template.selectOne("UserMapper.login", vo);
	}

	public UserVO getFollowingUser(UserVO vo) {

		// 파라미터로 email과 password를 UserVO타입으로 받아온 다음 Mapper로 전달
		// 이후에 확인된 email 값과 user_type을 반환 받아서 돌아옴.
		return template.selectOne("UserMapper.login", vo);
	}
	
	
	public int emailCheck(String email) {
		return template.selectOne("UserMapper.emailCheck", email);
	}
	
}
