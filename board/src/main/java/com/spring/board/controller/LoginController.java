package com.spring.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.dto.LoginDto;
import com.spring.board.form.LoginForm;
import com.spring.board.service.BoardService;

@Controller
public class LoginController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="")
	public String login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "main/index";
	}
	
	@RequestMapping(value="/rootLogin")
	@ResponseBody
	public LoginDto rootLogin(HttpServletRequest request, HttpServletResponse response, LoginForm loginForm) throws Exception {
		
		LoginDto loginDto = boardService.rootLogin(loginForm);
		
		return loginDto;
	}
	
	@RequestMapping(value="/goLogin")
	public String normalLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "main/login";
	}
	
	
}
