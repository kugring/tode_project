package com.ezen.backend.Repository;

import com.ezen.backend.VO.DiaryListVO;
import com.ezen.backend.VO.FeedVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DiaryRepository {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    private final  String NAME_SPACE = "DiaryMapper";

    public List<DiaryListVO> selectList(String email) {
        return sqlSessionTemplate.selectList(NAME_SPACE + ".selectList", email);
    }

}
