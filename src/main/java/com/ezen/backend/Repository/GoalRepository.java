package com.ezen.backend.Repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.ezen.backend.VO.GoalVO;


@Repository
public class TodoTitleRepository implements GoalRepository {
	
	@Autowired
	JdbcTemplate template;
	
	/**
	 * root-context.xml 에 bean으로 등록한 SqlSessionTemplate을
	 * IOC컨테이너에서 꺼내온다.
	 * SqlSessionTemplate은 MYBATIS를 사용하기 위해 설정 해 놓은 것이다.
	 */
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate; 
	
	private final  String NAME_SPACE = "GoalMapper";
	
	
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
	public List<GoalVO> getAllData() {
		 return sqlSessionTemplate.selectList(NAME_SPACE + ".getAll");
		

	}
	
	public GoalVO selectOne(int vo) {
		return sqlSessionTemplate.selectOne(NAME_SPACE + ".findByEmail" , vo);
	}
	
	
	/*
	 *  SqlSessionTemplate이 가지고 있는 INSERT 메서드를 이용해
	 *  mybatis mapper를 찾아, BaoardVO 타입의 파라미터를 넘겨준다.
	 *  아래 메서드는 mapper.xml중에 namespace가"BoardMapper"이거,
	 *  id가"insert"인 xml을 찾아 파라미터로 BaoardVO넘겨준다.
	 * */
	public int insertOne(final GoalVO vo) {
		return sqlSessionTemplate.insert(NAME_SPACE + ".insert", vo);
		
	}
	
	public int update(GoalVO vo) {
		return sqlSessionTemplate.update(NAME_SPACE + ".update", vo);
		
	}
	
	public int delete(int vo) {
		return sqlSessionTemplate.delete(NAME_SPACE + ".delete", vo);
		
	}
}
