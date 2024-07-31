package com.ezen.backend.Repository;

import com.ezen.backend.VO.FollowVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class FollowRepository {

    @Autowired
    JdbcTemplate template;

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    private final  String NAME_SPACE = "FollowMapper";

    public List<FollowVO> getAllData(String email){

        return sqlSessionTemplate.selectOne(NAME_SPACE + ".getAll", email);
    }


    public List<FollowVO> getFollower(String email){

        return sqlSessionTemplate.selectList(NAME_SPACE + ".getFollower", email);
    }

    public List<FollowVO> getFollowing(String email){

        return sqlSessionTemplate.selectList(NAME_SPACE + ".getFollowing", email);
    }

}
