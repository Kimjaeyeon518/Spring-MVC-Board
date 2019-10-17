package com.spring.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.board.dto.DataDto;
import com.spring.board.dto.DataFileDto;
import com.spring.board.form.DataFileForm;
import com.spring.board.form.DataForm;



@Repository
public class DataDao {

	
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.spring.board.boardMapper";
	
	public int getDataCnt(DataForm dataForm) {
		return sqlSession.selectOne(NAMESPACE + ".getDataCnt", dataForm);
	}

	public int updateDataHits(DataForm dataForm) {
		return sqlSession.update(NAMESPACE + ".updateDataHits", dataForm);
	}

	public DataDto getDataDetail(DataForm dataForm) {
		return sqlSession.selectOne(NAMESPACE + ".getDataDetail", dataForm);
	}

	public int insertData(DataForm dataForm) {
		return sqlSession.insert(NAMESPACE + ".insertData", dataForm);
	}

	public int insertDataFile(DataFileForm dataFileForm) {
		return sqlSession.insert(NAMESPACE + ".insertDataFile", dataFileForm);
		
	}

	public int updateData(DataForm dataForm) {

		return sqlSession.update(NAMESPACE + ".updateData", dataForm);
	}
	
	public int updateDataFile(DataFileForm dataFileForm) {

		return sqlSession.update(NAMESPACE + ".updateDataFile", dataFileForm);
	}


	public DataDto getDataPw(DataForm dataForm) {
		return sqlSession.selectOne(NAMESPACE + ".getDataPw", dataForm);
	}

	public int deleteData(DataForm dataForm) {
		return sqlSession.delete(NAMESPACE + ".deleteData", dataForm);
	}

	public List<DataDto> getDataList(DataForm dataForm) {
		return sqlSession.selectList(NAMESPACE + ".getDataList", dataForm);
	}

	public List<DataFileDto> getDataFileList(DataFileForm dataFileForm) throws Exception  {
		return sqlSession.selectList(NAMESPACE + ".getDataFileList", dataFileForm);
	}

	

}
