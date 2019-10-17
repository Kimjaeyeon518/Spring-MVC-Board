package com.spring.board.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.board.dto.AdminDto;
import com.spring.board.form.AdminForm;

@Repository
public class AdminDao {
	
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.spring.board.boardMapper";

	public AdminDto checkAdmin(AdminForm adminForm) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE + ".checkAdmin", adminForm);
	}
	

	public int rootAdmin(AdminForm adminForm) throws Exception {

		return sqlSession.update(NAMESPACE + ".rootAdmin", adminForm);
	}
	
	public int noAdmin(AdminForm adminForm) throws Exception {

		return sqlSession.update(NAMESPACE + ".noAdmin", adminForm);
	}
}
