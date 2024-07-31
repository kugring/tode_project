package com.ezen.backend.Repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmojiRepository {


    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    private final  String NAME_SPACE = "FeedMapper";


}
