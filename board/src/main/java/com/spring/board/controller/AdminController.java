package com.spring.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.dto.AdminDto;
import com.spring.board.form.AdminForm;
import com.spring.board.service.AdminService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "/checkAdmin")
	@ResponseBody
	public AdminDto checkAdmin(HttpServletRequest request, HttpServletResponse response, AdminForm adminForm) throws Exception {

		AdminDto adminDto = adminService.checkAdmin(adminForm);

		return adminDto;
	}
	
	@RequestMapping(value = "/rootAdmin")
	@ResponseBody
	public AdminDto rootAdmin(HttpServletRequest request, HttpServletResponse response, AdminForm adminForm) throws Exception {

		AdminDto adminDto = adminService.rootAdmin(adminForm);

		return adminDto;
	}
	
	@RequestMapping(value = "/noAdmin")
	@ResponseBody
	public AdminDto noAdmin(HttpServletRequest request, HttpServletResponse response, AdminForm adminForm) throws Exception {

		AdminDto adminDto = adminService.noAdmin(adminForm);

		return adminDto;
	}
}
