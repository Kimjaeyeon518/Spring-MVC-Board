package com.spring.board.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.board.dto.LoginDto;
import com.spring.board.form.LoginForm;

@Repository
public class LoginDao {
	
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.spring.board.boardMapper";

	/** 게시판 - 목록 수 */
	public LoginDto getLoginInfo(LoginForm loginForm) throws Exception {

		return sqlSession.selectOne(NAMESPACE + ".getLoginInfo", loginForm);
	}
	
}
