package com.spring.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.common.PagingUtil;
import com.spring.board.common.ResultUtil;
import com.spring.board.dao.BoardDao;
import com.spring.board.dao.LoginDao;
import com.spring.board.dto.BoardDto;
import com.spring.board.dto.CommonDto;
import com.spring.board.dto.LoginDto;
import com.spring.board.form.BoardForm;
import com.spring.board.form.CommonForm;
import com.spring.board.form.LoginForm;

@Service
public class BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private LoginDao loginDao;

	/** 게시판 - 목록 조회 */
	public ResultUtil getBoardList(BoardForm boardForm) throws Exception {

		ResultUtil resultUtil = new ResultUtil();

		CommonDto commonDto = new CommonDto();

		int totalCount = boardDao.getBoardCnt(boardForm);
		if (totalCount != 0) {
			CommonForm commonForm = new CommonForm();
			commonForm.setFunction_name(boardForm.getFunction_name());
			commonForm.setCurrent_page_no(boardForm.getCurrent_page_no());
			commonForm.setCount_per_page(10);
			commonForm.setCount_per_list(10);
			commonForm.setTatal_list_count(totalCount);
			commonDto = PagingUtil.setPageUtil(commonForm);
		}

		boardForm.setLimit(commonDto.getLimit());
		boardForm.setOffset(commonDto.getOffset());

		List<BoardDto> list = boardDao.getBoardList(boardForm);

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("totalCount", totalCount);
		resultMap.put("pagination", commonDto.getPagination());

		resultUtil.setData(resultMap);
		resultUtil.setState("SUCCESS");
		return resultUtil;
	}

	/** 게시판 - 상세 조회 */
	public BoardDto getBoardDetail(BoardForm boardForm) throws Exception {

		BoardDto boardDto = new BoardDto();

		String searchType = boardForm.getSearch_type();

		if ("S".equals(searchType)) {

			boardDao.updateBoardHits(boardForm);
		}

		boardDto = boardDao.getBoardDetail(boardForm);
		
		return boardDto;
	}

	/** 게시판 - 등록 */
	public BoardDto insertBoard(BoardForm boardForm) throws Exception {

		BoardDto boardDto = new BoardDto();

		int insertCnt = 0;

		int boardReRef = boardDao.getBoardReRef(boardForm);
		boardForm.setBoard_re_ref(boardReRef);
		
		insertCnt = boardDao.insertBoard(boardForm);

		

		if (insertCnt > 0) {
			boardDto.setResult("SUCCESS");
		} else {
			boardDto.setResult("FAIL");
		}

		return boardDto;
	}

	

	/** 게시판 - 삭제 */
	public BoardDto deleteBoard(BoardForm boardForm) throws Exception {

		BoardDto boardDto = new BoardDto();

		int deleteCnt = boardDao.deleteBoard(boardForm);

		if (deleteCnt > 0) {
			boardDto.setResult("SUCCESS");
		} else {
			boardDto.setResult("FAIL");
		}

		return boardDto;
	}

	/** 게시판 - 수정 */
	public BoardDto updateBoard(BoardForm boardForm) throws Exception {

		BoardDto boardDto = new BoardDto();

		int deleteCnt = boardDao.updateBoard(boardForm);

		if (deleteCnt > 0) {
			boardDto.setResult("SUCCESS");
		} else {
			boardDto.setResult("FAIL");
		}

		return boardDto;
	}

	/** 게시판 - 답글 등록 */
	public BoardDto insertBoardReply(BoardForm boardForm) throws Exception {

		BoardDto boardDto = new BoardDto();

		BoardDto boardReplyInfo = boardDao.getBoardReplyInfo(boardForm);

		boardForm.setBoard_seq(boardReplyInfo.getBoard_seq());
		boardForm.setBoard_re_lev(boardReplyInfo.getBoard_re_lev());
		boardForm.setBoard_re_ref(boardReplyInfo.getBoard_re_ref());
		boardForm.setBoard_re_seq(boardReplyInfo.getBoard_re_seq());

		int insertCnt = 0;

		insertCnt += boardDao.updateBoardReSeq(boardForm);

		insertCnt += boardDao.insertBoardReply(boardForm);

		if (insertCnt > 0) {
			boardDto.setResult("SUCCESS");
		} else {
			boardDto.setResult("FAIL");
		}

		return boardDto;
	}

	/** 32글자의 랜덤한 문자열(숫자포함) 생성 */
	public static String getRandomString() {

		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	public LoginDto rootLogin(LoginForm loginForm) throws Exception {
		
		LoginDto loginDto = new LoginDto();
		
		loginDto = loginDao.getLoginInfo(loginForm);
		
				
	
		return loginDto;
	}
	
	public BoardDto getBoardPw(BoardForm boardForm) throws Exception {

		BoardDto boardDto = new BoardDto();

		boardDto = boardDao.getBoardPw(boardForm);
		
		return boardDto;
	}


}
