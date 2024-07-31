package com.ezen.backend.Repository;
import com.ezen.backend.VO.GoalVO;
import com.ezen.backend.VO.RoutineVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class RoutineRepository {
    @Autowired
    JdbcTemplate template;


    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    private final  String NAME_SPACE = "RoutineMapper";



    public List<RoutineVO> getAllData(RoutineVO vo) {

        Map<String, Object> params = new HashMap<>();
        params.put("vo",vo.getTodoRoutineId());
        params.put("vo",vo.getTodoTitleId());
        params.put("vo",vo.getStartDate());
        params.put("vo",vo.getEndDate());
        params.put("vo",vo.getEndDate());

        return sqlSessionTemplate.selectList(NAME_SPACE + ".getAll", params);
    }


    public RoutineVO selectOne(RoutineVO vo) {

        return sqlSessionTemplate.selectOne(NAME_SPACE + ".selectOne" , vo);
    }

    public int insertOne(final RoutineVO vo) {
        return sqlSessionTemplate.insert(NAME_SPACE + ".insert", vo);

    }

    public int update(RoutineVO vo) {
        return sqlSessionTemplate.update(NAME_SPACE + ".update", vo);

    }

    public int delete(int vo) {
        return sqlSessionTemplate.delete(NAME_SPACE + ".delete", vo);

    }
}
