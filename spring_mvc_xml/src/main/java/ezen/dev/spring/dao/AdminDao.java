package ezen.dev.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.MemberVo;

@Repository
public class AdminDao {

	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "ezen.dev.spring.admin";
	
	@Autowired
	public AdminDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int joinMember(MemberVo memberVo) {
		//sqlSession객체를 이용한 입력작업: insert("Mapper파일의 네임스페이스.id값", 입력값/입력객체)
		return sqlSession.insert(MAPPER+".joinMember", memberVo);
	}

	
	public HashMap<String,Long> loginMember(MemberVo memberVo) {
		HashMap<String, Long> resultMap = sqlSession.selectOne(MAPPER+".loginMember",memberVo);
		
		if(resultMap.get("member_auth") == 0) {
			resultMap.put("member_grade",0L);
		}
		
		return resultMap;
	}

	
	public MemberVo getMemberInfo(String member_id) {
		return sqlSession.selectOne(MAPPER+".getMemberInfo", member_id);
	}

	public int chckId(String id) {
		return sqlSession.selectOne(MAPPER+".chekId", id);
	}

	public List<MemberVo> getMemberList() {
		return sqlSession.selectList(MAPPER+".getMemberList");
		
	}

	
}
