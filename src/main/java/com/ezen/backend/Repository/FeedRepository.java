package com.ezen.backend.Repository;

import com.ezen.backend.VO.FeedVO;
import com.ezen.backend.VO.GoalVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class FeedRepository {

    @Autowired
    JdbcTemplate template;


    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    private final  String NAME_SPACE = "FeedMapper";



    public List<FeedVO> getAllData(FeedVO vo){

        Map<String, Object> params = new HashMap<>();
        params.put("feedvo",vo.getEmail());
        params.put("feedvo",vo.getTodoCheck());
        params.put("feedvo",vo.getTodoAlarm());
        params.put("feedvo",vo.getTodoContent());
        params.put("feedvo",vo.getTodoId());
        params.put("feedvo",vo.getTodoImage());
        params.put("feedvo",vo.getTodoMemo());
        params.put("feedvo",vo.getTodoEditDate());
        params.put("feedvo",vo.getTodoCreateDate());



        return sqlSessionTemplate.selectList(NAME_SPACE + ".getAll", params);
    }



    public int selectedTodoAnotherDayMove(final FeedVO feedVO) {

        return sqlSessionTemplate.update(NAME_SPACE + ".selectedTodoAnotherDayMove", feedVO);
    }



    public int deleteTodo(final FeedVO feedVO) {

        return sqlSessionTemplate.update(NAME_SPACE + ".deleteTodo", feedVO);
    }

    public int editTodoContent(final FeedVO feedVO) {

        return sqlSessionTemplate.update(NAME_SPACE + ".editTodoContent", feedVO);
    }

    public int insertData(final FeedVO feedVO) {

        return sqlSessionTemplate.insert(NAME_SPACE + ".insertOne", feedVO);
    }

    public int checkBoxChange(FeedVO feedVO) {

        return sqlSessionTemplate.update(NAME_SPACE + ".checkBoxChange", feedVO);
    }


    public List<FeedVO> findByEmailAndToday(String email) {

        System.out.println("피드레파지토리_이메일: "+ email );

        // selectList를 사용하여 결과 목록을 반환
        return sqlSessionTemplate.selectList(NAME_SPACE + ".findByEmailAndToday", email);
    }

    public List<FeedVO> findByEmailAndEditDate(String email, String date) {
        Map<String, Object> params = new HashMap<>();
        params.put("email", email);
        params.put("date", date);

        return sqlSessionTemplate.selectList(NAME_SPACE + ".findByEmailAndEditDate", params);
    }


    public List<Map<String, Object>> findCompletedTodosPerDay(String email, int year, int month) {
        // 파라미터를 Map으로 준비
        Map<String, Object> params = new HashMap<>();
        params.put("email", email);
        params.put("year", year);
        params.put("month", month);

        // selectList를 사용하여 결과 목록을 반환
        return sqlSessionTemplate.selectList(NAME_SPACE + ".findCompletedTodosPerDay", params);
    }



    public FeedVO selectOne(int vo) {

        return sqlSessionTemplate.selectOne(NAME_SPACE + ".findByEmail" , vo);
    }



    public int insertOne(final FeedVO vo) {
        return sqlSessionTemplate.insert(NAME_SPACE + ".insert", vo);

    }

    public int update(FeedVO vo) {
        return sqlSessionTemplate.update(NAME_SPACE + ".update", vo);

    }

    public int delete(int vo) {
        return sqlSessionTemplate.delete(NAME_SPACE + ".delete", vo);

    }
}
