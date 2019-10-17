package com.spring.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.AdminDao;
import com.spring.board.dto.AdminDto;
import com.spring.board.form.AdminForm;

@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;

	public AdminDto checkAdmin(AdminForm adminForm) throws Exception {

		AdminDto adminDto = new AdminDto();
		
		adminDto = adminDao.checkAdmin(adminForm);
		
		return adminDto;
		
	}

	public AdminDto rootAdmin(AdminForm adminForm) throws Exception {
		
		AdminDto adminDto = new AdminDto();
		
		int deleteCnt = adminDao.rootAdmin(adminForm);

		if (deleteCnt > 0) {
			adminDto.setResult("SUCCESS");
		} else {
			adminDto.setResult("FAIL");
		}
		
		return adminDto;
	}
	
public AdminDto noAdmin(AdminForm adminForm) throws Exception {
		
		AdminDto adminDto = new AdminDto();
		
		int deleteCnt = adminDao.noAdmin(adminForm);

		if (deleteCnt > 0) {
			adminDto.setResult("SUCCESS");
		} else {
			adminDto.setResult("FAIL");
		}
		
		return adminDto;
	}

}
