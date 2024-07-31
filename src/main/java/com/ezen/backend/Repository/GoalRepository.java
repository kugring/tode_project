package com.ezen.backend.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ezen.backend.VO.UserVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.ezen.backend.VO.GoalVO;


@Repository
public class GoalRepository {

    @Autowired
    JdbcTemplate template;

    /**
     * root-context.xml 에 bean으로 등록한 SqlSessionTemplate을
     * IOC컨테이너에서 꺼내온다.
     * SqlSessionTemplate은 MYBATIS를 사용하기 위해 설정 해 놓은 것이다.
     */

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    private final String NAME_SPACE = "GoalMapper";


//	public Page<BucketListVO> getAllData(Pageable pageable,String searchType,String keyword) {
//
//
//		pageable.getOffset();
//		pageable.getPageSize();
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("offset", pageable.getOffset());
//		map.put("limit", pageable.getPageSize());
//		map.put("searchType", searchType);
//		map.put("keyword", keyword);
//
//		int total = count(searchType, keyword);
//		List<BucketListVO> boards = sqlSessionTemplate.selectList(NAME_SPACE + ".getAll", map);
//		return new PageImpl<>(boards, pageable, total);
//
//	}

    //	public int count(String searchType, String keyword) {
//		Map<String, Object> map = new HashMap<>();
//		map.put("searchType", searchType);
//		map.put("keyword", keyword);
//
//		return sqlSessionTemplate.selectOne(NAME_SPACE + ".count", map);
//	}
    public List<GoalVO> getAllData(GoalVO gvo) {

        Map<String, Object> params = new HashMap<>();
        params.put("gvo", gvo.getEmail());
        params.put("gvo", gvo.getTodoTitleId());
        params.put("gvo", gvo.getColorId());
        params.put("gvo", gvo.getColorCode());
        params.put("gvo", gvo.getTodoTitle());
        params.put("gvo", gvo.getTitleTodoOpen());


        return sqlSessionTemplate.selectList(NAME_SPACE + ".getAll", params);

    }

    public List<GoalVO> getData(String email) {
        return sqlSessionTemplate.selectList(NAME_SPACE + ".getAll", email);
    }


    public List<GoalVO> getDataByEmailAndDate(String email, String edit_date) {
        Map<String, Object> map = new HashMap<>();
        map.put("email", email);
        map.put("edit_date", edit_date);

        return sqlSessionTemplate.selectList(NAME_SPACE + ".getDataByEmailAndDate", map);

    }


    public List<GoalVO> getList(String email) {

        return sqlSessionTemplate.selectList(NAME_SPACE + ".getList", email);

    }


    public int insertData(final GoalVO goalVo) {
        return sqlSessionTemplate.insert(NAME_SPACE + ".insertOne", goalVo);

    }


    public int update(GoalVO vo) {
        return sqlSessionTemplate.update(NAME_SPACE + ".update", vo);

    }

    public int delete(int vo) {
        return sqlSessionTemplate.delete(NAME_SPACE + ".delete", vo);

    }
}
